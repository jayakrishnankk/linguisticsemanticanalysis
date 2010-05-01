package com.gree.lsa.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.gree.lsa.common.beans.MovieReviewBean;
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
		MovieReviewBean bean = new MovieReviewBean();
		bean.setMovieName(request.getParameter("txtMovieName"));
		bean.setReviewContent(request.getParameter("txtReviewContent"));
		
		bean = sentimentDelegate.singleMovieEvaluate(bean);
		response.getWriter().write(bean.getSentiment());
		return null;
	}
	
}
