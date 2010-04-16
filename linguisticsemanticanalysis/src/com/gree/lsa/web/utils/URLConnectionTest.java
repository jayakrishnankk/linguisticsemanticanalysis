package com.gree.lsa.web.utils;
import java.io.BufferedReader;
import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.w3c.dom.Node;
import org.w3c.dom.NodeList;


public class URLConnectionTest {

	public static void main(String[] args) {
		try {
			String content = getText("http://api.nytimes.com/svc/movies/v2/reviews/search.xml?query=avatar&api-key=96450337676c2144e8616e2948ef099e:9:60181737");
			System.out.println("****************start****************");
			System.out.println(content);
			System.out.println("****************end****************");
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static String getText(String url) throws MalformedURLException, IOException {
		final HttpURLConnection connection = (HttpURLConnection) new URL(url.replaceAll(" ", "%20")).openConnection();			
		final InputStream inStream = connection.getInputStream();
		// Read in the web page
		String page = toString(inStream);

		return page;
	}
	
	public static void walkTheNode(Node node) {
		NodeList list = node.getChildNodes();
		Node childNode = null;
		for (int i = 0; i < list.getLength(); i++) {
			childNode = list.item(i);
			System.out.println(childNode.getTextContent());
			if (childNode.hasChildNodes()) walkTheNode(childNode);
		}
	}

	private static String toString(InputStream inputStream) {
		InputStreamReader reader;
		try {
			reader = new InputStreamReader(inputStream, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			reader = new InputStreamReader(inputStream);
		}
		return toString(reader);
	}

	private static String toString(Reader reader) throws RuntimeException {
		try {
			// Buffer if not already buffered
			reader = reader instanceof BufferedReader ? (BufferedReader) reader : new BufferedReader(reader);
			StringBuilder output = new StringBuilder();
			while (true) {
				int c = reader.read();
				if (c == -1)
					break;
				output.append((char) c);
			}
			return output.toString();
		} catch (IOException ex) {
			throw new RuntimeException(ex);
		} finally {
			close(reader);
		}
	}
	
	private static void close(Closeable input) {
		if (input == null) return;
		// Flush (annoying that this is not part of Closeable)
		try {
			Method m = input.getClass().getMethod("flush");
			m.invoke(input);
		} catch (Exception e) {
			// Ignore
		}
		// Close
		try {
			input.close();
		} catch (IOException e) {
			// Ignore
		}
	}


}
