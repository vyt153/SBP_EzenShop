package com.shop.ctrl;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.svc.QnASvc;

@Controller
public class QnAController {
	
	QnASvc qnaSvc;
	@Autowired
	public QnAController(QnASvc qnaSvc) {
		this.qnaSvc = qnaSvc;
	}
	
	@RequestMapping("qna")
	public String qna(Model model) {
		model.addAttribute("qnaList", qnaSvc.qnaList());
		return "Q&A/qna";
	}
	
	@RequestMapping("qnaWritePage")
	public String writePage() {
		return "Q&A/write";
	}
	
	@RequestMapping("qnaWrite")
	public String write(HttpServletRequest req) throws IOException {
		if(qnaSvc.write(req)) return "redirect:qna";
		else return "write";
	}
	
	@RequestMapping("qnaRead")
	public String read(Model model, int num) throws IOException {
		model.addAttribute("qna", qnaSvc.read(num));
		return "Q&A/read";
	}
	
	@RequestMapping("qnaModPage")
	public String modPage(int num, Model model) {
		model.addAttribute("qna", qnaSvc.read(num));
		return "Q&A/modify";
	}
	
	@RequestMapping("qnaMod")
	public String modify(HttpServletRequest req) throws IOException {
		qnaSvc.modify(req);
		return "redirect:qna";
	}
	
	@RequestMapping("qnaDelete")
	public String delete(int num) throws IOException {
		qnaSvc.delete(num);
		return "redirect:qna";
	}
	
	@RequestMapping("replyPage")
	public String replyPage(int num, Model model) throws IOException {
		model.addAttribute("qna", qnaSvc.read(num));
		return "Q&A/reply";
	}
	
	@RequestMapping("reply")
	public String reply(HttpServletRequest req) throws IOException {
		qnaSvc.reply(req);
		return "redirect:qna";
	}
	
}
