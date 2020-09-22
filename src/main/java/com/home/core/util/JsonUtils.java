package com.home.core.util;

import java.io.ByteArrayOutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.fasterxml.jackson.databind.node.TextNode;

public class JsonUtils {
	public static String convertStringToJsonString(String s){
		JSONObject jsonObj = new JSONObject(s);
		
		return jsonObj.toString();
	}
	
	public static String convertObjectToJsonString(Object obj){
		String jsonInString = "";
		try {
			ObjectMapper mapper = new ObjectMapper();
//			mapper.setSerializationInclusion(Include.NON_NULL);
			jsonInString = mapper.writeValueAsString(obj);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return jsonInString;
	}
	
	public static Object convertJsonStringtoObject(String jsonInString, Object obj){
		try {
			ObjectMapper mapper = new ObjectMapper();
			obj = mapper.readValue(jsonInString, Object.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return obj;
	}
	
	@SuppressWarnings("rawtypes")
	public static String convertListToJsonArray(List list){
		String jsonInString = "";
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		ObjectMapper mapper = new ObjectMapper();
		mapper.setSerializationInclusion(Include.NON_NULL);
		
		try{
			mapper.writeValue(out, list);
			byte[] data = out.toByteArray();
			jsonInString = new String(data, "UTF-8");
		}catch(Exception e){
			e.printStackTrace();
		}
		return jsonInString;
	}
	
	public static String removeJsonNode(String jsonInString, String fieldName) throws Exception{
		ObjectMapper mapper = new ObjectMapper();
        JsonNode actualObj = mapper.readTree(jsonInString);
	    for (JsonNode personNode : actualObj) {	    	
	        if (personNode instanceof ObjectNode) {	        	
	        	ObjectNode object = (ObjectNode) personNode;
	            object.remove(fieldName);
	        }
	    }
	    return actualObj.toString();
	}
	
	public static String removeJsonNodeInParents(String jsonInString, String fieldName) throws Exception{
		ObjectMapper mapper = new ObjectMapper();
        JsonNode actualObj = mapper.readTree(jsonInString);
	    for (JsonNode personNode : actualObj) {	    	
	        if (personNode instanceof ObjectNode) {	        	
	        	ObjectNode object = (ObjectNode) personNode;
	        	List<JsonNode> list = object.findParents(fieldName);
	            for (JsonNode jsonNode : list) {
					if(jsonNode instanceof ObjectNode){
						ObjectNode obj = (ObjectNode) jsonNode;
						obj.remove(fieldName);
					}
				}
	        }
	    }
	    return actualObj.toString();
	}
	
	public static String renameJsonNode(String jsonInString, String oldFieldName, String newFieldName) throws Exception{
		ObjectMapper mapper = new ObjectMapper();
        JsonNode actualObj = mapper.readTree(jsonInString);
	    for (JsonNode personNode : actualObj) {
	        if (personNode instanceof ObjectNode) {
	            ObjectNode object = (ObjectNode) personNode;
	            List<JsonNode> list = object.findParents(oldFieldName);
	            for (JsonNode jsonNode : list) {
					if(jsonNode instanceof ObjectNode){
						ObjectNode obj = (ObjectNode) jsonNode;
						obj.set(newFieldName, new TextNode(obj.get(oldFieldName).asText()));
//						obj.put(newFieldName, (obj.get(oldFieldName).asText()));
						obj.remove(oldFieldName);
					}
				}
	        }
	    }
	    return actualObj.toString();
	}
	
	public static String getJsonNodeValue(String jsonInString, String key) throws Exception{
		String val = "";
		ObjectMapper mapper = new ObjectMapper();
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map = mapper.readValue(jsonInString, new TypeReference<Map<String, String>>(){});
			val = (String)map.get(key);
		} catch (Exception e) {
			val = jsonInString;
		}
	    
	    return val;
	}

	public static String convertMapToJsonString(Map<String, String> inputMap) throws Exception{
		String val = "";
		ObjectMapper mapper = new ObjectMapper();
		try {
			val = mapper.writeValueAsString(inputMap);
            System.out.println(val);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
 
	    return val;
	}
}
