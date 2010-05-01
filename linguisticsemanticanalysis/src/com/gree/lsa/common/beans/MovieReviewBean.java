package com.gree.lsa.common.beans;

import java.sql.Timestamp;

public class MovieReviewBean {
	private String id = "";
	private String movieName = "";
	private String sentiment = "";
	private String reviewContent = "";
	private boolean isTrainingRecord = false;
	private Timestamp timeAdded = null;

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public String getSentiment() {
		return sentiment;
	}
	public void setSentiment(String sentiment) {
		this.sentiment = sentiment;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public boolean isTrainingRecord() {
		return isTrainingRecord;
	}
	public void setTrainingRecord(boolean isTrainingRecord) {
		this.isTrainingRecord = isTrainingRecord;
	}
	public Timestamp getTimeAdded() {
		return timeAdded;
	}
	public void setTimeAdded(Timestamp timeAdded) {
		this.timeAdded = timeAdded;
	}
}
