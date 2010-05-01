package com.gree.lsa.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.ObjectInputStream;

import com.aliasi.classify.Classifier;
import com.aliasi.classify.JointClassification;

public class SentimentUtils {

	public static Classifier<CharSequence, JointClassification> classifier = null;
	static {
		try {
			setClassifier();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	private static void setClassifier() throws IOException, ClassNotFoundException {
		File file = new File("polarity.model");
		FileInputStream in = new FileInputStream(file);
		ObjectInputStream oin = new ObjectInputStream(in);
		@SuppressWarnings("unchecked")
		Classifier<CharSequence, JointClassification> _classifier = (Classifier<CharSequence, JointClassification>) oin.readObject();
		SentimentUtils.classifier = _classifier;
	}
	
}
