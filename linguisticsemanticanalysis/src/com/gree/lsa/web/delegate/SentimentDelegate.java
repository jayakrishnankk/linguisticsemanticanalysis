package com.gree.lsa.web.delegate;

import java.io.IOException;

import com.gree.lsa.common.beans.MovieReviewBean;
import com.gree.lsa.services.SentimentServices;

public class SentimentDelegate {

	private SentimentServices sentimentServices = null;

	public SentimentServices getSentimentServices() {
		return sentimentServices;
	}

	public void setSentimentServices(SentimentServices sentimentServices) {
		this.sentimentServices = sentimentServices;
	}
	
	public MovieReviewBean singleMovieEvaluate(MovieReviewBean bean) throws IOException, ClassNotFoundException{
		return sentimentServices.singleMovieEvaluate(bean);
	}

}
