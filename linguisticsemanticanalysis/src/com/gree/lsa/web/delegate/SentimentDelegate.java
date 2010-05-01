package com.gree.lsa.web.delegate;

import com.gree.lsa.services.SentimentServices;

public class SentimentDelegate {

	private SentimentServices sentimentServices = null;

	public SentimentServices getSentimentServices() {
		return sentimentServices;
	}

	public void setSentimentServices(SentimentServices sentimentServices) {
		this.sentimentServices = sentimentServices;
	}
	
}
