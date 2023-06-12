package com.davisy.controller;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.davidy.controller.UserGoogleCloud;
import com.davisy.dao.CommentDao;
import com.davisy.dao.FollowerDao;
import com.davisy.dao.PostDao;
import com.davisy.dao.UserDao;
import com.davisy.entity.Comment;
import com.davisy.entity.CommentEntity;
import com.davisy.entity.Follower;
import com.davisy.entity.Post;
import com.davisy.entity.PostEntity;
import com.davisy.entity.User;
import com.davisy.service.CookieService;
import com.davisy.service.ParamService;
import com.davisy.service.SessionService;
import com.google.gson.Gson;



@Controller
public class LoginController {
	@Autowired
	UserDao userdao;

	@Autowired
	FollowerDao followerDAO;

	@Autowired
	PostDao pdao;
	
	@Autowired
	CommentDao commentDao;
	
	@Autowired
	HttpServletRequest request;

	@Autowired
	ParamService paramService;

	@Autowired
	CookieService cookieService;

	@Autowired
	SessionService sessionService;


	@PostMapping("/home")
	String home(HttpServletRequest req, HttpServletResponse res, Model m) {
		try {
			String token = req.getParameter("credential");
			String[] chunks = token.split("\\.");

			Base64.Decoder decoder = Base64.getUrlDecoder();

			String header = new String(decoder.decode(chunks[0]));
			String payload = new String(decoder.decode(chunks[1]));

			UserGoogleCloud ugc = new Gson().fromJson(payload, UserGoogleCloud.class);
			if(userdao.findByEmail(ugc.getEmail())!= null){
				sessionService.set("user", userdao.findByEmail(ugc.getEmail()));
				return "redirect:/main";
			}
			else if(userdao.findSub(ugc.getSub()) != null) {
				sessionService.set("user", userdao.findSub(ugc.getSub()));
				return "redirect:/main";
			}
			else{
				User user = new User();
				user.setSub(ugc.getSub());
				user.setUsername(ugc.getSub());
				user.setPassword(ugc.getSub());
				user.setFullname(ugc.getName());
				user.setEmail(ugc.getEmail());
				user.setAvatar(ugc.getPicture());
				user.setBirthday(null);
				user.setBan(false);
				user.setGender(null);
				user.setProvince(null);
				user.setUser_Status(true);
				user.setUser_Role(false);
				userdao.saveAndFlush(user);
				sessionService.set("user", user);
				return "jsp/main";
			}

			
			
		} catch (Exception e) {
			System.out.println(e);
			throw e;
		}

	}
	@GetMapping("/login")
	public String log(Model model) {
		String user = cookieService.getValue("usernames");
		if (user != null) {
			String pass = cookieService.getValue("passwords");
			model.addAttribute("usernames", user);
			model.addAttribute("passwords", pass);
		}
		return "login";
	}

	@PostMapping("/login")
	public String log2(Model model) {
		String usernametemp = "";
		String passtemp = "";
		String username = paramService.getString("usernamelg", "");
		String password = paramService.getString("passwordlg", "");
		boolean remember = paramService.getBoolean("remember", false);
		User user = userdao.findByUsername(username);

		if (user == null) {
			model.addAttribute("message", "Tên đăng nhập hoặc mật khẩu không đúng!");

		}else if (user.isBan() == true) {
			model.addAttribute("message", "Tài khoản của bạn đã bị khóa vui lòng liên hệ với chúng tôi để được hỗ trợ!");
		}
		else {
			if (!user.getPassword().equals(password)) {
				model.addAttribute("message", "Tên đăng nhập hoạc mật khẩu không đúng!");

			} else {
				sessionService.set("user", user);
				
				User userSession = sessionService.get("user");
				List<Follower> fls = followerDAO.findAllFollower(userSession.getID());
				List<User> users = new ArrayList<>();
				for (Follower f : fls) {
					Follower.Pk pk = f.getPk();
					users.add(userdao.findIdUser(pk.getUserID()));
				}
				sessionService.set("follower", users);
				List<User> listSuggestedFriend = userdao.findAllByIdUser(userSession.getID());
				
				loadPost(model);
				
				List<User> listFriends = new ArrayList<>();
				for (int i = 0; i < 4; i++) {
					int ran = (int) Math.floor(Math.random() * listSuggestedFriend.size());
					listFriends.add(listSuggestedFriend.get(ran));
					listSuggestedFriend.remove(ran);
				}
				model.addAttribute("listFriends", listFriends);
				
				if (remember) {
					cookieService.add("user", username, 10);
					cookieService.add("pass", password, 10);
				} else {
					cookieService.delete("user");
					cookieService.delete("pass");
				}
				System.out.println();
				return "redirect:/main";
			}

		}

		return "login";
	}
	
	@GetMapping("/main")
	public String loadPost(Model model) {
		User userSession = sessionService.get("user");
		if(userSession == null) {
			return "error";
		}
		try {
			List<Post> posts = pdao.findAll();
			List<PostEntity> postEntity = new ArrayList<>();
			List<Comment> comments = commentDao.findAll();
			List<CommentEntity> commentEntity = new ArrayList<>();
			int dem = 0;
			for (Post p : posts) {
				List<String> images = new ArrayList<>();
				String image = p.getLink_Image();
				for (String img : image.split(",")) {
					images.add(img);
				}
				postEntity.add(new PostEntity(p, images));
			}
			for (Comment cm : comments) {
				if (cm.getCommentParent() == null) {
					dem = commentDao.findAllByIdComment(cm.getID()).size();
				}
				commentEntity.add(new CommentEntity(cm, dem));
				dem = 0;
			}
			model.addAttribute("posts", postEntity);
			model.addAttribute("comments", commentEntity);
			System.out.println("cmt: "+commentEntity.size());
		} catch (Exception e) {
			System.out.println("Error loadPost: " + e);
		}
		return "jsp/main";

	}
	
	
	@GetMapping("/profile/{idUser}")
	public String loadPostProfile(@PathVariable String idUser, Model model) {
		System.out.println("IdUser: "+idUser);
		User userSession = sessionService.get("user");
		if(userSession == null) {
			return "error";
		}
		try {
			int userId = Integer.valueOf(idUser);
			System.out.println(userId);
			User userProfile = userdao.findIdUser(userId);
			System.out.println(userProfile.getFullname()+" alooo");
			List<Post> posts = pdao.findByListPostById(userId);
			List<PostEntity> postEntity = new ArrayList<>();
			List<Comment> comments = commentDao.findAll();
			List<CommentEntity> commentEntity = new ArrayList<>();
			int dem = 0;
			for (Post p : posts) {
				List<String> images = new ArrayList<>();
				System.out.println("test: "+p.getPost());
				String image = p.getLink_Image();
				for (String img : image.split(",")) {
					images.add(img);
				}
				postEntity.add(new PostEntity(p, images));
			}
			for (Comment cm : comments) {
				if (cm.getCommentParent() == null) {
					dem = commentDao.findAllByIdComment(cm.getID()).size();
				}
				commentEntity.add(new CommentEntity(cm, dem));
				dem = 0;
			}
			model.addAttribute("usersProfile", userProfile);
			model.addAttribute("listPost", postEntity);
			model.addAttribute("commentsProfile", commentEntity);
		} catch (Exception e) {
			System.out.println("Error loadPost: " + e);
		}
		return "jsp/profile";

	}
	@RequestMapping("/logout")
public String logout(Model m) {
		sessionService.set("user", null);
		return "index";
	}
}