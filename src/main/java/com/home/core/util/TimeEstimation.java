package com.home.core.util;

import java.util.Map;

public class TimeEstimation {

private final static Map m=new java.util.HashMap();
  
  public  final static void beginEstimate(String method_name)
  {
    long start_time=System.currentTimeMillis();
    m.put(method_name,new Long(start_time));
  }
  public  final static void endEstimate(String method_name)
  {
    long end_time=System.currentTimeMillis();
    Long s_time=(Long)m.get(method_name);
    if(s_time!=null)
    {
      long start_time=s_time.longValue();
      System.out.println("\n<<<<<<<   Time to execute method "+method_name+" is : "+(end_time-start_time)+" milliseconds    >>>>>>>");
    }else
    {
      System.err.println("\n********* Not yet invoke beginEstimate for method *******"+method_name);
    }
    m.remove(method_name);
  }
}