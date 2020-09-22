package com.home.ktdn.client;

import java.io.BufferedReader;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.charset.StandardCharsets;

public class NetClientPost {

	public static void main(String[] args) {

		try {
			String urlParameters  = "{\"agent_id\":15}";
			urlParameters         = "{\"maTk\":\"111\",\"tenTk\":\"Tiền Mặt\"}";
			byte[] postData       = urlParameters.getBytes( StandardCharsets.UTF_8 );
			int    postDataLength = postData.length;
			String request        = "http://localhost:8080/KtdnApiService/dmkt/addNewDmTK";
			URL    url            = new URL( request );
			
			HttpURLConnection conn= (HttpURLConnection) url.openConnection(); 
			
			String basicAuth = "3b845c9dc8457ad82089771f554bc6be";
//			conn.setRequestProperty ("authorization", basicAuth);
			
			conn.setDoOutput( true );
			conn.setInstanceFollowRedirects( false );
			conn.setRequestMethod( "POST" );
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty( "charset", "utf-8");
			conn.setRequestProperty( "Content-Length", Integer.toString( postDataLength ));
			conn.setUseCaches( true );
			
			OutputStream os = conn.getOutputStream();
			os.write(postData);
			os.flush();

			BufferedReader br = null;
			String output;
			int rescode = conn.getResponseCode();
			if (rescode!=HttpURLConnection.HTTP_CREATED && rescode!=HttpURLConnection.HTTP_OK) {
				//throw new RuntimeException("Failed : HTTP error code : " + conn.getResponseCode());
				System.err.println("Failed : HTTP error code : "+conn.getResponseCode()+"\n");
				br = new BufferedReader(new InputStreamReader((conn.getErrorStream())));
				
				System.out.println("Output from Server .... \n");
				while ((output = br.readLine()) != null) {
					System.out.println(output);
				}	
			}else{
				br = new BufferedReader(new InputStreamReader((conn.getInputStream())));

				System.out.println("Output from Server .... \n");
				while ((output = br.readLine()) != null) {
					System.out.println(output);
				}				
			}
			conn.disconnect();

		} catch (MalformedURLException e) {

			e.printStackTrace();
		} catch (IOException e) {

			e.printStackTrace();

		}

	}

}