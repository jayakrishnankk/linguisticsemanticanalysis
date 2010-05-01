package com.gree.lsa.web.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.aliasi.classify.Classification;
import com.gree.lsa.utils.SentimentUtils;
import com.gree.lsa.web.delegate.SentimentDelegate;

public class SingleMovieSentimentController implements Controller {

	private SentimentDelegate sentimentDelegate = null;
	
	public SentimentDelegate getSentimentDelegate() {
		return sentimentDelegate;
	}

	public void setSentimentDelegate(SentimentDelegate sentimentDelegate) {
		this.sentimentDelegate = sentimentDelegate;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String movieName = request.getParameter("txtMovieName");
		String reviewContent = request.getParameter("txtReviewContent");
		System.out.println(movieName);
		System.out.println(reviewContent);
		String sentiment = evaluate(reviewContent);
		response.getWriter().write(sentiment);
		return null;
	}
	
	private String evaluate(String reviewContent) throws IOException, ClassNotFoundException{
		Classification classification = SentimentUtils.classifier.classify(reviewContent);
		return classification.bestCategory();
	}

}
