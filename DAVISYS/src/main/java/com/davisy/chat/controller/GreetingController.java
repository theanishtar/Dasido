package com.davisy.chat.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.util.HtmlUtils;

import com.davisy.chat.model.Chat;
import com.davisy.chat.model.Greeting;
import com.davisy.chat.model.HelloMessage;

@Controller
public class GreetingController {

  @MessageMapping("/hello")
  @SendTo("/topic/greetings")
  public Greeting greeting(HelloMessage message) throws Exception {
	  System.out.println(message.getToken());
    Thread.sleep(1000); // simulated delay
    Greeting gr = new Greeting();
    gr.setContent("Hello, " + HtmlUtils.htmlEscape(message.getName()) + "!");
    gr.setToken(message.getToken());
    return gr;
  }
  
  @RequestMapping("/")
  String Chat1(Model m) {
	  return "index";
  }
  
  @RequestMapping("/chat")
  String Chat(Model m) {
	  return "chat";
  }
  
  @RequestMapping("/token-12e544f")
  String Chat2(Model m) {
	  return "token";
  }
  
  
  // chat message
  @MessageMapping("/message")
  @SendTo("/topic/mess")
  public Chat greeting2(Chat chat) throws Exception {
	System.out.println("From: "+chat.getFrom()+" - To: "+chat.getTo());
    Thread.sleep(1000); // simulated delay
    Chat send = new Chat();
//    Greeting gr = new Greeting();
//    gr.setContent(HtmlUtils.htmlEscape(chat.getMessage()));
    return chat;
  }

}