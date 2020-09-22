package com.home.core.security;

import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

//import com.sun.mail.util.BASE64DecoderStream;
//import com.sun.mail.util.BASE64EncoderStream;

public class EncryptDecryptStringWithDES {
	private static Cipher ecipher;
	private static Cipher dcipher;
	private static SecretKey key;
	private static String skey;
	private static String transformation;
	
	static{
		skey = "A!B@C#D$E%F^G&H*"; // 128 bit key
		transformation = "AES";
		key = new SecretKeySpec(skey.getBytes(), transformation);
		
		// generate secret key using DES algorithm
//		key = KeyGenerator.getInstance("DES").generateKey();

		try {
			ecipher = Cipher.getInstance(transformation);
			dcipher = Cipher.getInstance(transformation);

			// initialize the ciphers with the given key
			ecipher.init(Cipher.ENCRYPT_MODE, key);
			dcipher.init(Cipher.DECRYPT_MODE, key);
			
		}catch (NoSuchAlgorithmException e) {
			System.out.println("No Such Algorithm:" + e.getMessage());
		}catch (NoSuchPaddingException e) {
			System.out.println("No Such Padding:" + e.getMessage());
		}catch (InvalidKeyException e) {
			System.out.println("Invalid Key:" + e.getMessage());
		}
	}
	
	public static void main(String[] args) {
		try {
			String temp_src = "This is nhnam-nhnam-2016/09/09!";
			String encrypted = encrypt(temp_src);
			System.out.println("Encrypted: " + encrypted);
		
			String decrypted = decrypt(encrypted);		
			System.out.println("Decrypted: " + decrypted);
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			return;
		}
	}

	public static String encrypt(String str) {
		try {
			// encode the string into a sequence of bytes using the named charset
			// storing the result into a new byte array. 

			byte[] utf8 = str.getBytes("UTF8");
			byte[] enc = ecipher.doFinal(utf8);

			// encode to base64
			enc = Base64.getEncoder().encode(enc);

			return new String(enc);
			
		}catch (Exception e) {
			System.out.println("No Such Algorithm:" + e.getMessage());
		}
		
		return null;
    }

	public static String decrypt(String str) {
		try {
			// decode with base64 to get bytes
			byte[] dec = Base64.getDecoder().decode(str.getBytes());
			byte[] utf8 = dcipher.doFinal(dec);

			// create new string based on the specified charset
			return new String(utf8, "UTF8");
			
		}catch (Exception e) {
			System.out.println("No Such Algorithm:" + e.getMessage());
		}
		
		return null;
    }
}