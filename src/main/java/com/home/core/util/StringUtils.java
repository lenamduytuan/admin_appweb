package com.home.core.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.StringReader;
import java.util.zip.GZIPInputStream;
import java.util.zip.GZIPOutputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

import org.xml.sax.InputSource;

public class StringUtils {
	static final int BUFFER = 1024;
	
	public static String unzip(InputStream is) throws Exception {
        ZipInputStream zis=new ZipInputStream(is);
        zis.getNextEntry();
	    ByteArrayOutputStream baos=new ByteArrayOutputStream();
	    BufferedOutputStream  bos=new BufferedOutputStream(baos);
	    int len;
	    byte[] buf=new byte[1024];
	    while ((len=zis.read(buf))>0) {
	        bos.write(buf,0,len);
	    }
	    bos.flush();
	    bos.close();
	    zis.closeEntry();
	    zis.close();
	    return baos.toString("UTF-8");
	}
    
    public static byte[] zip(String source, String name) throws Exception {
    	byte data[] = new byte[BUFFER];
    	BufferedInputStream origin = null;
    	ByteArrayOutputStream baos=new ByteArrayOutputStream();
    	ZipOutputStream out = new ZipOutputStream(new BufferedOutputStream(baos));
    	try {
//    		out.setMethod(ZipOutputStream.DEFLATED);
 
    		ByteArrayInputStream sourceStream = new ByteArrayInputStream(source.getBytes());
    		origin = new BufferedInputStream(sourceStream, BUFFER);
    		
    		ZipEntry entry = new ZipEntry(name);
    		out.putNextEntry(entry);
    		int count;
    		while((count = origin.read(data, 0, BUFFER)) != -1) {
    			out.write(data, 0, count);
    		}    		
        } catch(Exception e) {
//        	e.printStackTrace();
        	throw e;
        }finally{
        	if(origin != null)
        		origin.close();             
    		out.close();
        }
        return baos.toByteArray();
    }
    
    public static byte[] compress(String source) throws Exception {
//        System.out.println("String length : " + str.length());
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        GZIPOutputStream gzip = new GZIPOutputStream(out);
        gzip.write(source.getBytes());
        gzip.close();
//        String outStr = out.toString("UTF-8");
//        System.out.println("Output String lenght : " + outStr.length());
        return out.toByteArray();
    }
    
    public static String decompress(InputStream is) throws Exception {
        GZIPInputStream gis = new GZIPInputStream(is);
        BufferedReader bf = new BufferedReader(new InputStreamReader(gis, "UTF-8"));
        String outStr = "";
        String line;
        while ((line=bf.readLine())!=null) {
          outStr += line;
        }
//        System.out.println("Output String lenght : " + outStr.length());
        return outStr;
    }
    
    public static boolean isNumeric(String str){  
    	try{  
    		double d = Double.parseDouble(str);  
    	}catch(NumberFormatException nfe){  
    		return false;  
    	}  
    	return true;  
    }
    
    public static String getStringFromInputStream(InputStream is) {
		BufferedReader br = null;
		StringBuilder sb = new StringBuilder();

		String line;
		try {

			br = new BufferedReader(new InputStreamReader(is, "UTF-8"));
			while ((line = br.readLine()) != null) {
				sb.append(line);
			}

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (br != null) {
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

		return sb.toString();

	}
    
    public static void main (String args[]) {
    	try {
			String s = "Nguyễn Hải Nam - 46 Hàng Cót - Hoàn Kiếm - Hà Nội";
			s = "NGUYEN HAI NAM";
			s = s.toLowerCase(); 
			byte data[] = compress(s);
			ByteArrayInputStream in = new ByteArrayInputStream(data);
			s = decompress(in);
			System.out.println(s);
			
			data = zip(s,"myZip");
			in = new ByteArrayInputStream(data);
			s = unzip(in);
			System.out.println(s);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
    	
    }

}
