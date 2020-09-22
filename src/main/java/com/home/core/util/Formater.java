package com.home.core.util;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Locale;

public class Formater {
	private SimpleDateFormat sdf = null;
	private SimpleDateFormat sdfTime = null;
	private NumberFormat nf = null;
	
	private String thousand_sep = " ";
	private String comma_sep = ","; // Ngan cach phan nguyen cua so VD: 123,456,789	
	private String dot_sep = ".";       // Ngan cach phan thap phan cua so VD: 123,456,789.12
	private String precision = "0";
	
	public Formater() throws Exception {
		try {
			Locale lo = Locale.ENGLISH;
		
//			sdf = new SimpleDateFormat(date_format);
//			sdfTime = new SimpleDateFormat(this.date_format + " HH:mm");
			nf = NumberFormat.getNumberInstance(lo);
//			nf9 = NumberFormat.getNumberInstance(lo);
//			nf9.setMaximumFractionDigits(9);
			//nf.setMaximumFractionDigits(2);
			//nf.setMinimumFractionDigits(2);
		} catch (Exception e) {
			throw new Exception(e.toString());
		}
	}
	
	//Ham lam tron so : int precision do chinh xac
	public static double round(double val, int precision) {
		double powprecision = Math.pow(10, precision);
		return Math.floor((val * powprecision) + 0.5) / powprecision;
	}
	
	//Kiem tra 1 chuoi la null or rong
	public static boolean isNull(String str) {
		return str == null || str.equals("") || str.trim().length() == 0;
	}
	
	//Kiem tra 1 collection 
	public static boolean isNull(Collection c) {
		return c == null || c.isEmpty();
	}
	
	//Convert double to str
	public String num2str(double number) {
		String so  = nf.format(number);
		so = so.replace(",", "");
		return so;
	}
	
	public String num2str(long number) {
		String so  = nf.format(number);
		so = so.replace(",", "");
		return so;
	}

	public Number str2num(String str) throws Exception {
		if (isNull(str))
			return null;
		Number result = null;
		try {
			result = nf.parse(str);
		} catch (Exception e) {
			throw new Exception(e.toString());
		}
		return result;
	}
	
	public String number2String(double num) throws Exception{
		int x = (int)Math.pow(10, Integer.parseInt(this.precision));
		int intSo=0; 
		int cents=0;
		String formatStr = "";		
		intSo = (int)Math.floor(num *x+0.50000000001);
		cents = intSo % x;
		if(cents < 0)
			cents = cents * -1;

		DecimalFormatSymbols dfs = new DecimalFormatSymbols();
		dfs.setGroupingSeparator(this.thousand_sep.charAt(0));
		dfs.setDecimalSeparator(this.dot_sep.charAt(0));

		DecimalFormat df = new DecimalFormat();
		df.setDecimalFormatSymbols(dfs);
		df.setMaximumFractionDigits(Integer.parseInt(this.precision));
		if (cents!=0){
			df.setMinimumFractionDigits(Integer.parseInt(this.precision));
		}
		formatStr = df.format(num).replace(" ", "");
		//System.out.println(formatStr);
		return formatStr;
	}
	
	public static void main(String[] args) {
		double d = 1801.91;
		String so = "";
		try {
			Formater f = new Formater();
			so = f.num2str(d);
			System.out.println("So: "+so);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			e.getMessage();
		}
		
	}
}
