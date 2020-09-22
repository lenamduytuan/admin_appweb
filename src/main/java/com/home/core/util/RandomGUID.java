package com.home.core.util;
import java.net.*;
import java.util.*;
import java.security.*;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;
import org.w3c.dom.Document;


public class RandomGUID extends Object {

    public String valueBeforeMD5 = "";
    public String valueAfterMD5 = "";
    private static Random myRand;
    private static SecureRandom mySecureRand;

    private static String s_id;

    static {
        mySecureRand = new SecureRandom();
        long secureInitializer = mySecureRand.nextLong();
        myRand = new Random(secureInitializer);
        try {
            s_id = InetAddress.getLocalHost().toString();
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }

    }

    public RandomGUID() {
        getRandomGUID(false);
    }

    public RandomGUID(boolean secure) {
        getRandomGUID(secure);
    }

    private void getRandomGUID(boolean secure) {
        MessageDigest md5 = null;
        StringBuffer sbValueBeforeMD5 = new StringBuffer();

        try {
            md5 = MessageDigest.getInstance("MD5");
        } catch (NoSuchAlgorithmException e) {
            System.out.println("Error: " + e);
        }

        try {
            long time = System.currentTimeMillis();
            long rand = 0;

            if (secure) {
                rand = mySecureRand.nextLong();
            } else {
                rand = myRand.nextLong();
            }

            sbValueBeforeMD5.append(s_id);
            sbValueBeforeMD5.append(":");
            sbValueBeforeMD5.append(Long.toString(time));
            sbValueBeforeMD5.append(":");
            sbValueBeforeMD5.append(Long.toString(rand));

            valueBeforeMD5 = sbValueBeforeMD5.toString();
            md5.update(valueBeforeMD5.getBytes());

            byte[] array = md5.digest();
            StringBuffer sb = new StringBuffer();
            for (int j = 0; j < array.length; ++j) {
                int b = array[j] & 0xFF;
                if (b < 0x10) sb.append('0');
                sb.append(Integer.toHexString(b));
            }

            valueAfterMD5 = sb.toString();

        } catch (Exception e) {
            System.out.println("Error:" + e);
        }
    }

    public String toString() {
        String raw = valueAfterMD5.toUpperCase();
        StringBuffer sb = new StringBuffer();
        sb.append(raw.substring(0, 8));
        sb.append("-");
        sb.append(raw.substring(8, 12));
        sb.append("-");
        sb.append(raw.substring(12, 16));
        sb.append("-");
        sb.append(raw.substring(16, 20));
        sb.append("-");
        sb.append(raw.substring(20));

        return sb.toString();
    }
    
    public String toString1() {
        String raw = valueAfterMD5.toUpperCase();
        StringBuffer sb = new StringBuffer();
        sb.append(raw.substring(0, 8));
        //sb.append("-");
        sb.append(raw.substring(8, 12));
       // sb.append("-");
        sb.append(raw.substring(12, 16));
        //sb.append("-");
        sb.append(raw.substring(16, 20));
       // sb.append("-");
        sb.append(raw.substring(20));

        return sb.toString();
    }

    public static void main(String args[]) throws Exception{
    	int PRETTY_PRINT_INDENT_FACTOR = 4;
    	String xmlError = "<?xml version=\"1.0\" ?><error></error>";

    	Document doc = XmlUtils.convertStringToDocument(xmlError);
    	XmlUtils.appendChildNode(doc, "error", "code", "validation_error");
		XmlUtils.appendChildNode(doc, "error", "description", "Validation failed");
		xmlError = XmlUtils.convertDocumentToString(doc);
    	
		JSONObject xmlJSONObj = XML.toJSONObject(xmlError);
		
		JSONObject warn = new JSONObject();
		warn.append("user_id", "The user id field is required.");
		
		JSONObject meta = new JSONObject();
		meta.put("validation_error", warn);
		
		xmlJSONObj.put("meta", meta);
		
		
		String jsonPrettyPrintString = xmlJSONObj.toString(PRETTY_PRINT_INDENT_FACTOR);

        System.out.println(jsonPrettyPrintString);
        
    	
    	/*String val = "a:5:{s:5:\"token\";s:32:\"13e1bc5a817c174bc1ef00de6e1b3568\";s:7:\"user_id\";i:39;s:16:\"token_expiration\";i:604800;s:13:\"refresh_token\";s:32:\"4aa653b053e102b4139386b2093daaea\";s:24:\"refresh_token_expiration\";i:2419200;}";
        String[] arr = val.split(";");
        
        String param = "token";        
        if(param == "token"){
        	val = arr[1].split(":")[2];
        }else if(param == "user_id"){
        	val = arr[3].split(":")[1];
        }        
        System.out.println("Value:" + val);*/
    	
    	/*for (int i=0; i< 100; i++) {
		    RandomGUID myGUID = new RandomGUID();
		    System.out.println("Seeding String=" + myGUID.valueBeforeMD5);
		    System.out.println("rawGUID=" + myGUID.valueAfterMD5);
		    System.out.println("RandomGUID=" + myGUID.toString());
        }*/
    }
}

