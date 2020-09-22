package com.home.core.util.rpn;

import java.util.*;

public class Calculator  {  

	public static double compute(String expr) throws ArithmeticException, EmptyStackException {
		java.util.Stack<Double> stack = new java.util.Stack<Double>();

//		System.out.println(expr);
//		System.out.println("Input\tOperation\tStack after");
		double val = 0d;
		for (String token : expr.split("\\s+")) {
//		    System.out.print(token + "\t");
		    switch (token) {
		        case "+":
//		            System.out.print("Operate\t\t");
		            val = Math.floor((stack.pop() + stack.pop()) * 100) / 100;
		            stack.push(val);
		            break;
		        case "-":
//		            System.out.print("Operate\t\t");
		            stack.push(-stack.pop() + stack.pop());
		            break;
		        case "*":
//		            System.out.print("Operate\t\t");
		            stack.push(stack.pop() * stack.pop());
		            break;
		        case "/":
//		            System.out.print("Operate\t\t");
		            double divisor = stack.pop();
		            stack.push(stack.pop() / divisor);
		            break;
		        case "^":
//		            System.out.print("Operate\t\t");
		            double exponent = stack.pop();
		            stack.push(Math.pow(stack.pop(), exponent));
		            break;
		        default:
//		            System.out.print("Push\t\t");
		            stack.push(Double.parseDouble(token));
		            break;
		    }
		
//		    System.out.println(stack);
		}
		
		val = stack.pop();
//		System.out.println("Final Answer: " + val);
		return val;
	}

	/**
	* Runs the calculation for the RPN expression in args[0].
	*/
	public static void main(String[] args) {
		try {
			String input = "(3.5 + 5) * 4";
			   String output;
			   InToPost theTrans = new InToPost(input);
			   output = theTrans.doTrans(); 
		    compute(output);
		} catch (Exception err) {
			err.getStackTrace();
		}
	}
} 

