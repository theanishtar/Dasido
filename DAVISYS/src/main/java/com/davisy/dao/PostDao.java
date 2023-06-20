package com.davisy.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.davisy.entity.Post;

public interface PostDao extends JpaRepository<Post, Integer> {

	@Query(value = " SELECT * FROM POST  WHERE ID=(SELECT MAX(ID) FROM POST )", nativeQuery = true)
	public Post maxId();

	@Query(value = "SELECT * FROM POST  WHERE ID =:id", nativeQuery = true)
	public Post findByIdPost(int id);

	@Query(value = "SELECT * FROM POST  WHERE userId= :id1", nativeQuery = true)
	public List<Post> findByListPostById(int id1);
	
	@Query(value = "SELECT * FROM POST  WHERE POST.ID= :id", nativeQuery = true)
	public List<Post> findByListPostByIdPost(int id);

	@Query(value = "SELECT p.id, p.link_image, u.fullname, COUNT(i.postID) AS interestedCount "
			+ "FROM POST p INNER JOIN INTERESTED i ON p.ID = i.postID "
			+ "INNER JOIN USERS u ON p.userid = u.id GROUP BY p.id, p.link_image, u.fullname "
			+ "ORDER BY COUNT(i.postid) DESC", nativeQuery = true)
	public List<Object[]> getReportPost();
	
	@Query(value = "SELECT POST.ID, POST.LINK_IMAGE, POST.POST, USERS.USERNAME, POST.GET_REPORT FROM POST\r\n"
			+ "INNER JOIN USERS ON POST.USERID = USERS.ID\r\n"
			+ "WHERE POST.GET_REPORT !=0", nativeQuery = true)
	public List<Object[]> getReportPostHaveReport();

	@Query(value = "SELECT COUNT(POST.ID) FROM POST WHERE MONTH(POST.DATE_POST)=:id", nativeQuery = true)
	public int totalPostMonth(int id);

	@Query(value = "SELECT ((SELECT COUNT(POST.ID) * 100 FROM POST WHERE POST.SEND_STATUSID = '1') / (SELECT COUNT(POST.ID) FROM POST))", nativeQuery = true)
	public int percentPostSend();

	@Query(value = "SELECT COUNT(POST.GET_REPORT) FROM POST WHERE DAY(POST.DATE_POST) =:id", nativeQuery = true)
	public int totalReportPostToday(int id);

	@Query(value = "SELECT MONTH(DATE_POST) AS MONTH, COUNT(*) FROM POST GROUP BY MONTH(DATE_POST) ORDER BY MONTH(DATE_POST) ASC", nativeQuery = true)
	public List<Object[]> totalPostAllMonth();

	@Query(value = "SELECT TOP 3 POST.PRODUCT, COUNT(*) AS AMOUNT FROM POST GROUP BY POST.PRODUCT ORDER BY AMOUNT DESC", nativeQuery = true)
	public List<Object[]> top3Product();

	@Query(value = "select a.ID,a.userID,a.post,a.date_Post,a.hash_Tag,a.address_Product,a.link_Image,a.link_Image,\r\n"
			+ "a.send_StatusID,a.post_Status,a.product,a.get_report\r\n"
			+ "from POST a, USERS b, provinces c where \r\n" + "a.userID = b.ID and\r\n"
			+ "b.user_AddressID = c.code and c.code =:idAddress", nativeQuery = true)
	public List<Post> findPostAddress(String idAddress);
	
	@Query(value = "SELECT TOP 2 POST.POST, POST.date_Post, USERS.AVATAR, USERS.USERNAME, POST.ID, COUNT(INTERESTED.POSTID) \r\n"
			+ "	FROM POST \r\n"
			+ "	INNER JOIN INTERESTED \r\n"
			+ "	ON POST.ID = INTERESTED.POSTID\r\n"
			+ "	INNER JOIN USERS\r\n"
			+ "	ON POST.USERID = USERS.ID\r\n"
			+ "	WHERE MONTH(POST.DATE_POST)=:month\r\n"
			+ "	GROUP BY POST.POST, POST.date_Post, USERS.AVATAR, USERS.USERNAME, POST.ID\r\n"
			+ "	ORDER BY COUNT(INTERESTED.POSTID) DESC", nativeQuery = true)
	public List<Object[]> top2Post(int month);

}
