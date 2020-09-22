package com.home.ktdn.client;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

public class NetClientGet {

	public static void main(String[] args) {

		try {
			String request        = "http://omm.savvycom.vn:8088/OmmApiServices1/agent/agentInfo?agent_id=33";
			request        = "http://omm.savvycom.vn:8088/OmmApiServices/agent/agentMembersRanking?agent_id=246&gender=male&filter=new&page=1&per_page=3";
			URL    url            = new URL( request );
			
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Accept", "application/json");
			
			String basicAuth = "7a6d0e940e95edb107f858179b6ba01f";
			basicAuth = "676ccd4ad30b6d14d30fb1a275c8e781";
			conn.setRequestProperty ("Authorization", basicAuth);

			int rescode = conn.getResponseCode();
			if (rescode!=HttpURLConnection.HTTP_CREATED && rescode!=HttpURLConnection.HTTP_OK) {
				//throw new RuntimeException("Failed : HTTP error code : " + conn.getResponseCode());
			}

			BufferedReader br = new BufferedReader(new InputStreamReader(
					(conn.getInputStream())));

			String output;
			System.out.println("Output from Server .... \n");
			while ((output = br.readLine()) != null) {
				System.out.println(output);
			}
			
			conn.disconnect();

		} catch (MalformedURLException e) {

			e.printStackTrace();
		} catch (IOException e) {

			e.printStackTrace();
			
		}

	}

}