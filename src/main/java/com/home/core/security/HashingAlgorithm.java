package com.home.core.security;

import java.io.FileInputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class HashingAlgorithm {
	public static final String MD5_HASHING = "MD5";
	public static final String SHA256_HASHING = "SHA-256";
	
	@SuppressWarnings("resource")
	public static String fileChecksum(String algorithm, String filePath){
		String result = "";
		try {
			MessageDigest md = MessageDigest.getInstance(algorithm);
	        FileInputStream fis = new FileInputStream(filePath);

	        byte[] dataBytes = new byte[1024];

	        int nread = 0;
	        while ((nread = fis.read(dataBytes)) != -1) {
	          md.update(dataBytes, 0, nread);
	        }
	        byte[] mdbytes = md.digest();

	        //convert the byte to hex format method 1
	        StringBuffer sb = new StringBuffer();
	        for (int i=0; i<mdbytes.length; i++) {
	        	sb.append(Integer.toString((mdbytes[i] & 0xff) + 0x100, 16).substring(1));
	        }
	        System.out.println("Digest(in hex format):: " + sb.toString());

	        //convert the byte to hex format method 2
	        StringBuffer hexString = new StringBuffer();
	    	for (int i=0; i<mdbytes.length; i++) {
	    		String hex=Integer.toHexString(0xff & mdbytes[i]);
	   	     	if(hex.length()==1) hexString.append('0');
	   	     	hexString.append(hex);
	    	}
	    	System.out.println("Digest(in hex format):: " + hexString.toString());
	    	
			result = sb.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public static String hashingString(String algorithm, String source){
		String result = "";
        try {
        	MessageDigest md = MessageDigest.getInstance(algorithm);
            md.update(source.getBytes());

            byte byteData[] = md.digest();

            //convert the byte to hex format method 1
            StringBuffer sb = new StringBuffer();
            for (int i=0; i<byteData.length; i++) {
             sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
            }
            System.out.println("Digest(in hex format):: " + sb.toString());

            //convert the byte to hex format method 2
            StringBuffer hexString = new StringBuffer();
        	for (int i=0; i<byteData.length; i++) {
        		String hex=Integer.toHexString(0xff & byteData[i]);
       	     	if(hex.length()==1) hexString.append('0');
       	     	hexString.append(hex);
        	}
        	System.out.println("Digest(in hex format):: " + hexString.toString());
			
			result = sb.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
