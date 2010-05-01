package com.gree.lsa.services;

import java.io.IOException;

import com.aliasi.classify.Classification;
import com.gree.lsa.common.beans.MovieReviewBean;
import com.gree.lsa.dao.SentimentDAO;
import com.gree.lsa.utils.SentimentUtils;

public class SentimentServices {

	private SentimentDAO sentimentDAO = null;

	public SentimentDAO getSentimentDAO() {
		return sentimentDAO;
	}

	public void setSentimentDAO(SentimentDAO sentimentDAO) {
		this.sentimentDAO = sentimentDAO;
	}
	
	public MovieReviewBean singleMovieEvaluate(MovieReviewBean bean) throws IOException, ClassNotFoundException{
		Classification classification = SentimentUtils.classifier.classify(bean.getReviewContent());
		bean.setSentiment(classification.bestCategory());
		bean = sentimentDAO.addNewMovieReview(bean);
		return bean;
	}

}
