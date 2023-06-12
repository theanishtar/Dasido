package com.davisy.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.davisy.dao.CommentDao;
import com.davisy.dao.PostDao;
import com.davisy.entity.Comment;
import com.davisy.entity.Post;
import com.davisy.entity.PostEntity;
import com.davisy.entity.User;
import com.davisy.service.SessionService;

@RestController
@CrossOrigin
public class CommentController {
	long millis = System.currentTimeMillis();
	java.sql.Date day = new java.sql.Date(millis);
	@Autowired
	SessionService sessionService;
	@Autowired
	CommentDao commentDao;
	@Autowired
	PostDao postDao;
	@Autowired
	HttpServletResponse response;
	@Autowired
	HttpServletRequest request;

	@GetMapping("/PostComment/{idPost}")
	public String comment(@PathVariable String idPost, @RequestParam("commentContent") String comment,
			@RequestParam("repCommentIdUser") String replyComment) {
		User userSession = sessionService.get("user");
		if(userSession == null) {
			return "error";
		}
		try {
			int id = Integer.valueOf(idPost);
			int idReply = 0;
			User user = sessionService.get("user");
			Post post = postDao.findByIdPost(id);
			Comment cm = new Comment();
			cm.setContent(comment);
			cm.setPost(post);
			cm.setUser(user);
			cm.setDateComment(day());
			if ("".equals(replyComment)) {
				cm.setCommentParent(null);
			} else {
				idReply = Integer.valueOf(replyComment);
				Comment cmt = commentDao.findByIdComment(idReply);
				cm.setCommentParent(cmt);

			}
			commentDao.save(cm);
			return "jsp/main";
		} catch (Exception e) {
			System.out.println("error: " + e);
			throw e;
		}

	}

	@GetMapping("/loadReplyComment")
	public void loadReplyComment(@RequestParam("idComment") String idComment) {
		
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			int id = Integer.valueOf(idComment);
			List<Comment> comList = commentDao.findAllByIdComment(id);
			PrintWriter out = response.getWriter();
			for (Comment cmt : comList) {
				out.println("<div class=\"comment__container\" dataset=\"first-comment\"\r\n"
						+ "																id=\"first-reply\">\r\n"
						+ "																<div class=\"comment__card\">\r\n"
						+ "																	<div class=\"box-top\">\r\n"
						+ "																		<div class=\"Profile\">\r\n"
						+ "																			<div class=\"profile-image\">\r\n"
						+ "																				<img src=\""
						+ cmt.getUser().getAvatar() + "\">\r\n"
						+ "																			</div>\r\n"
						+ "																			<div class=\"Name\">\r\n"
						+ "																				<strong>"
						+ cmt.getUser().getFullname() + "</strong> <span>@" + cmt.getUser().getUsername()
						+ "</span>\r\n"
						+ "																			</div>\r\n"
						+ "																		</div>\r\n"
						+ "																	</div>\r\n"
						+ "																	<p>" + cmt.getContent()
						+ "</p>\r\n" + "																</div>\r\n"
						+ "															</div>");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public java.sql.Date day() {
		return day;
	}
}
