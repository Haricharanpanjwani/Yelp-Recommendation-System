package com.ads.yelp;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */		
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);	
    public static String jsonBody;	

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "index";
	}	
	
	@RequestMapping(value = "/contentrec.htm", method = RequestMethod.POST)
	public ModelAndView contentRec(HttpServletRequest request, HttpServletResponse response) {		
		
		ModelAndView mv= new ModelAndView();		
		mv.setViewName("resultContent");
		
		jsonBody = null;
		String res = null;
		try {
			//Creating instance of azure class
			YelpML am = new YelpML();	
			
			jsonBody = am.createRecJSON(request.getParameter("username"));
														
			res = am.contentFiltering(jsonBody);		
			System.out.println("Content Based Filtering Result :" + res);
					 
			mv.addObject("output",res);
		}
		catch(Exception e) {
			System.out.println("Something went wrong while processing the request");
			e.printStackTrace();
		}								
		return mv;
	}
	
	@RequestMapping(value = "/collabrec.htm", method = RequestMethod.POST)
	public ModelAndView collabRec(HttpServletRequest request, HttpServletResponse response) {		
		
		ModelAndView mv= new ModelAndView();		
		mv.setViewName("resultCollaborative");
		
		jsonBody = null;
		String res = null;
		try {
			//Creating instance of azure class
			YelpML am = new YelpML();	
			
			jsonBody = am.createRecJSON(request.getParameter("username"));
														
			res = am.collaborativeFiltering(jsonBody);		
			System.out.println("Collaborative Based Filtering Result :" + res);
					 
			mv.addObject("output",res);
		}
		catch(Exception e) {
			System.out.println("Something went wrong while processing the request");
			e.printStackTrace();
		}								
		return mv;
	}
	
	@RequestMapping(value = "/rating.htm", method = RequestMethod.POST)
	public ModelAndView service(HttpServletRequest request, HttpServletResponse response) {		
		
		ModelAndView mv= new ModelAndView();
		mv.setViewName("resultPrediction"); 
		
		String category   	 = request.getParameter("category");
		String country    	 = request.getParameter("country");
		String state   	  	 = request.getParameter("state");
		String checkInStr 	 = request.getParameter("checkin");
		String reviewStr     = request.getParameter("review");
		String latitude      = request.getParameter("latitude");
		String longitude     = request.getParameter("longitude");
		int price      = Integer.parseInt(request.getParameter("price"));
		int credit     = Integer.parseInt(request.getParameter("creditcard"));
		int delivery   = Integer.parseInt(request.getParameter("delivery"));
		int wifi       = Integer.parseInt(request.getParameter("wifi"));
		int tv         = Integer.parseInt(request.getParameter("tv"));
		int parking    = Integer.parseInt(request.getParameter("parking"));
		int takeout    = Integer.parseInt(request.getParameter("takeout"));
		
		if(checkInStr == "" || reviewStr == "" || latitude == "" || longitude == "") {
			System.out.println("Empty!");
				mv.addObject("error", "no_value");
				mv.setViewName("resultPrediction");
				return mv;
		}
		
		int checkin	= Integer.parseInt(checkInStr);
		int review	= Integer.parseInt(checkInStr);
		double lat  = Double.parseDouble(latitude);
		double lon  = Double.parseDouble(longitude);
		
		if(checkin < 0 || review < 0) {
			mv.addObject("error", "hour");
			return mv;
		}
					
		
		try {
			/*creating json from form values */
			
			JSONObject obj = new JSONObject();
			JSONObject inputs = new JSONObject();
			JSONObject input = new JSONObject();
			
			JSONArray columnName = new JSONArray();
			//columnName.add("business_name");
			columnName.add("business_category");
			columnName.add("business_country");
			columnName.add("business_state");
			columnName.add("checkin_count");
			columnName.add("review_count");
			columnName.add("latitude");
			columnName.add("longitude");
			columnName.add("price_range");
			columnName.add("credit_card_accepted");
			columnName.add("delivery");
			columnName.add("free_wifi");
			columnName.add("has_tv");
			columnName.add("parking");
			columnName.add("take_out");
			
			JSONArray allValues = new JSONArray();
			JSONArray value = new JSONArray();
			//value.add("Sinclair");
			value.add(category);
			value.add(country);
			value.add(state);
			value.add(checkin);
			value.add(review);
			value.add(lat);
			value.add(lon);
			value.add(price);
			value.add(credit);
			value.add(delivery);
			value.add(wifi);
			value.add(tv);
//			value.add(1);
			value.add(parking);
			value.add(takeout);
			allValues.add(value);
	
					
			input.put("ColumnNames", columnName);
			input.put("Values", allValues);
			inputs.put("input1", input);
			obj.put("Inputs", inputs);
	
			System.out.println("print the value of json "+obj);
			
			//converting json to string
			jsonBody = obj.toString(); 
		}
		catch(Exception e) {
			System.out.println("Error occurred!!" + e);
		}		
		
		//Creating instance of azure class
		YelpML am = new YelpML();			
		String res = null;
		
		res = am.callDecisionBoostRating(jsonBody);
		System.out.println("Result :" + res);
					
		mv.addObject("output", res);
		
		return mv;
	}
	
}
