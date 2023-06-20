package com.davisy.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.FilenameUtils;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.davisy.dao.CommentDao;
import com.davisy.dao.DistrictsDao;
import com.davisy.dao.FollowerDao;
import com.davisy.dao.PostDao;
import com.davisy.dao.ProvinceDao;
import com.davisy.dao.UserDao;
import com.davisy.dao.WardsDao;
import com.davisy.entity.Comment;
import com.davisy.entity.CommentEntity;
import com.davisy.entity.Follower;
import com.davisy.entity.Post;
import com.davisy.entity.PostEntity;
import com.davisy.entity.User;
import com.davisy.entity.Wards;
import com.davisy.service.SessionService;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

@Controller
public class PostController {
	long millis = System.currentTimeMillis();
	java.sql.Date day = new java.sql.Date(millis);
	@Autowired
	ServletContext app;
	@Autowired
	SessionService sessionService;
	@Autowired
	PostDao postDao;
	@Autowired
	UserDao userDao;
	@Autowired
	WardsDao wardsDao;
	@Autowired
	DistrictsDao districtsDao;
	@Autowired
	ProvinceDao provinceDao;
	@Autowired
	HttpServletRequest request;
	@Autowired
	FollowerDao followerDAO;
	@Autowired
	CommentDao commentDao;
	
	@RequestMapping("/report/{id}")
	public String getReportByUser(@PathVariable String id, Model model) {
		try {
			Post updatepost = postDao.findByIdPost(Integer.valueOf(id));
			updatepost.setGet_report(updatepost.getGet_report()+1);
			postDao.saveAndFlush(updatepost);
			return "redirect:/main";
		} catch (Exception e) {
			System.out.println(e+("getReport"));
		}
		return "redirect:/main";
	}
	
	@RequestMapping("/lockpost/{id}")
	public String getLockPost(@PathVariable String id, Model model) {
		try {
			Post updatepost = postDao.findByIdPost(Integer.valueOf(id));
			updatepost.setPost_Status(false);
			postDao.saveAndFlush(updatepost);
			return "redirect:/admin/report";
		} catch (Exception e) {
			System.out.println(e+("getReport"));
		}
		return "redirect:/admin/report";
	}
	
	@RequestMapping("/post/{id}")
	public String getDetailPost(@PathVariable String id, Model model) {
		User userSession = sessionService.get("user");
		if (userSession == null) {
			return "error";
		}
		try {
			List<Post> posts = postDao.findByListPostByIdPost(Integer.valueOf(id));
			List<PostEntity> postEntity = loopImg(posts);

			List<Comment> comments = commentDao.findAll();
			List<CommentEntity> commentEntity = new ArrayList<>();
			int dem = 0;
			for (Comment cm : comments) {
				if (cm.getCommentParent() == null) {
					dem = commentDao.findAllByIdComment(cm.getID()).size();
				}
				commentEntity.add(new CommentEntity(cm, dem));
				dem = 0;
			}
			List<PostEntity> postEntityFollows = new ArrayList<>();
			for (User us : follow()) {
				for (PostEntity pe : postEntity) {
					if (us.getID() == pe.getPost().getUser().getID()) {
						postEntityFollows.add(pe);
					}
				}
			}
			model.addAttribute("posts", postEntity);
			Date now = new Date();
			List<Object[]> listTop2 = postDao.top2Post(now.getMonth()+1);
			model.addAttribute("listTop2", listTop2);
			model.addAttribute("comments", commentEntity);
		} catch (Exception e) {
			System.out.println("Error loadPost: " + e);
		}
		return "jsp/main";
	}
	
	public List<PostEntity> loopImg(List<Post> posts) {
		List<PostEntity> postEntity = new ArrayList<>();
		for (Post p : posts) {
			List<String> images = new ArrayList<>();
			String image = p.getLink_Image();
			for (String img : image.split(",")) {
				images.add(img);
			}
			postEntity.add(new PostEntity(p, images));
		}
		return postEntity;
	}
	
	public List<User> follow() {
		User userSession = sessionService.get("user");
		List<Follower> fls = followerDAO.findAllFollower(userSession.getID());
		List<User> users = new ArrayList<>();
		for (Follower f : fls) {
			Follower.Pk pk = f.getPk();
			users.add(userDao.findIdUser(pk.getUserID()));
		}
		return users;
	}
	

	@PostMapping("/uploadImg")
	public String post(Model model, @RequestParam("image_file") List<MultipartFile> files,
			@RequestParam("content") String content, @RequestParam("product") String product,
			@RequestParam("radioPost") String radio) {
		try {
			String ward = request.getParameter("nameWards");
			String district = request.getParameter("nameDistrict");
			String province = request.getParameter("nameProvinces");
			int i = 0;
			String pc = "";
			User user = sessionService.get("user");
			if (user == null) {
				return "error";
			}
			String address = wardsDao.findByIdWards(ward).getFull_name() + ", "
					+ districtsDao.findAllByIdDistrict(district).getFull_name() + ", "
					+ provinceDao.findIdProvince(province).getFull_name();
			Post post = new Post();
			String nameImg = "";
			String uploadRootPath = app.getRealPath("/views/images/posts");
			File uploadRootDir = new File(uploadRootPath);
			if (uploadRootDir.exists()) {
				uploadRootDir.mkdirs();
			}
//			 if (!files.isEmpty()) {
			for (MultipartFile file : files) {
				if (i > 0) {
					pc = ",";
				}
				String fileName = file.getOriginalFilename();
				int idPost = postDao.maxId().getID();
				String newName = user.getUsername() + user.getID() + idPost + i;
				nameImg = nameImg + pc + "/views/images/posts/" + newName + ".png";
				File serverFile = new File(uploadRootDir.getAbsoluteFile() + File.separator
						+ PostController.renameFile(fileName, newName));
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(file.getBytes());
				stream.close();
				i++;
			}
			String hash = " " + content + " ";
			boolean status = Boolean.valueOf(radio);
			post.setUser(user);
			post.setPost(content);
			post.setHashTag(hashTag(hash));
			post.setProduct(product);
			post.setDate_Post(day());
			post.setLink_Image(nameImg);
			post.setPost_Status(status);
			post.setAddress_Product(address);
			postDao.save(post);

//	            }
		} catch (Exception e) {
			System.out.println("Error: " + e);
		}

		return "redirect:/main";
	}

	@PostMapping("/updatePost/{id}")
	public String loadDataPost(@PathVariable String id, MultipartHttpServletRequest multipartHttpServletRequest) {
		User user = sessionService.get("user");
		try {
			String content = request.getParameter("content" + id);
			String product = request.getParameter("product" + id);
			boolean send_status = Boolean.valueOf(request.getParameter("complete" + id));
			boolean radio = Boolean.valueOf(request.getParameter("radioPost" + id));
			String ward = request.getParameter("nameWards" + id);
			String district = request.getParameter("nameDistrict" + id);
			String province = request.getParameter("nameProvinces" + id);
			List<MultipartFile> files = multipartHttpServletRequest.getFiles("image_file" + id);
			int i = 0;
			int idPostUpdate = Integer.valueOf(id);
			String pc = "";
			String address = wardsDao.findByIdWards(ward).getFull_name() + ", "
					+ districtsDao.findAllByIdDistrict(district).getFull_name() + ", "
					+ provinceDao.findIdProvince(province).getFull_name();

			Post post = postDao.findByIdPost(idPostUpdate);
			String nameImg = "";
			if (files.size() > 0 && !"".equals(files.get(0).getOriginalFilename())) {
				String uploadRootPath = app.getRealPath("/views/images/posts");
				File uploadRootDir = new File(uploadRootPath);
				if (uploadRootDir.exists()) {
					uploadRootDir.mkdirs();
				}
				for (MultipartFile file : files) {
					if (i > 0) {
						pc = ",";
					}
					String fileName = file.getOriginalFilename();
					int idPost = postDao.maxId().getID();
					String newName = user.getUsername() + user.getID() + idPost + i;
					nameImg = nameImg + pc + "/views/images/posts/" + newName + ".png";
					File serverFile = new File(uploadRootDir.getAbsoluteFile() + File.separator
							+ PostController.renameFile(fileName, newName));
					BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
					stream.write(file.getBytes());
					stream.close();
					i++;
				}
			}
			String hash = " " + content + " ";
			boolean status = Boolean.valueOf(radio);
			post.setUser(user);
			post.setPost(content);
			post.setHashTag(hashTag(hash));
			post.setProduct(product);
			post.setDate_Post(day());
			if (files.size() > 0 && !"".equals(files.get(0).getOriginalFilename())) {
				post.setLink_Image(nameImg);
			} else {
				post.setLink_Image(postDao.findByIdPost(idPostUpdate).getLink_Image());
			}
			post.setPost_Status(status);
			post.setAddress_Product(address);
			post.setSend_StatusID(send_status);
			postDao.saveAndFlush(post);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("Error: " + e);
		}
		return "redirect:/profile/" + user.getID();
	}

	public String hashTag(String hash) {
		String hashTag = "";
		String check = "";
		int dem = 0;
		if (hash.contains("#")) {
			for (dem = 0; dem < hash.length(); dem++) {
				if (hash.charAt(dem) == '#' && hash.substring(dem - 1, dem + 1).equals(" #")) {
					for (int j = dem; j < hash.length(); j++) {
						if (hash.charAt(j) == ' ') {
							if (hash.substring(dem + 1, j).contains("#") == false) {
								if (hashTag != "") {
									check = " ";
								}
								hashTag = hashTag + check + hash.substring(dem, j);
								hash = hash.substring(j, hash.length());
								dem = 0;
								break;
							}

						}
					}
				}
			}
			System.out.println(hashTag);
		} else {
			hashTag = null;
		}
		return hashTag;
	}

	public static String renameFile(String fileName, String id) {
		return FilenameUtils.getBaseName(id) + ".png";
	}

	public java.sql.Date day() {
		return day;
	}
}
