package com.ads.yelp;

import java.util.Iterator;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class YelpML {
	
	public static String apiurl;
    public static String apikey;
    
    // Calling collaborative filtering recommendation
    public String collaborativeFiltering(String json) {
    	System.out.println("calling collaborative filtering: ");
    	
    	apiurl = "https://ussouthcentral.services.azureml.net/workspaces/4b54602ea43446c29c5950caa5563f70/services/079075b188df473e82fe361ac250e907/execute?api-version=2.0&details=true";
    	apikey = "mC/c2fbEdgYxa5po7LWdbCBhF03iKVOWkug+UK8cEHAM8TNaaIj/q9eD5r3Hwc149bAQjcPgmA1InClFVYOYEw==";
    		    	
    	String result = rrsHttpPost(json);
    	//System.out.println(result);
    	return retrieveOutput(result);
    }
    
    // Calling content filtering recommendation
    public String contentFiltering(String json) {
    	System.out.println("calling content filtering: ");
    	
    	apiurl = "https://ussouthcentral.services.azureml.net/workspaces/4b54602ea43446c29c5950caa5563f70/services/415f884a011b4f519f374287848878a4/execute?api-version=2.0&details=true";
    	apikey = "EmkbmtCnF8DGo3sgfhn/FnedAIy58y1+3Bek0A+5oQNYykdrpaQqUUPegRMH+zcgrGUYLqF/S9nyb9t4jVio2w==";
    		    	
    	String result = rrsHttpPost(json);
    	//System.out.println(result);
    	return retrieveOutput(result);
    }
    
    // Calling Decision Boost Regression
    public String callDecisionBoostRating(String json) {
    	System.out.println("calling Decision Boost Regression model: ");
    	
    	apiurl = "https://ussouthcentral.services.azureml.net/workspaces/253767f4788549c1baaad7723c456e77/services/faafe08c8a794a81a4e42455cbb4e005/execute?api-version=2.0&details=true";
    	apikey = "eMAFHP8tZWwcBWBeTGjxsQJ20o1EDXx8PAX8Ze9mlk61Ycz0odpnXxlvsIaT8C+KfzBjuHiFLXN8WqfiRCXVkA==";
    		    	
    	String result = rrsHttpPost(json);
    	//System.out.println(result);
    	return retrieveOutput(result);
    }
    
   
    /**
     * Call REST API for retrieving prediction from Azure ML 
     * @return response from the REST API
     */	
    public String rrsHttpPost(String jsonBody) {
        
        HttpPost post;
        HttpClient client;
        StringEntity entity;
        
        try {
        	
            // create HttpPost and HttpClient object
            post = new HttpPost(apiurl);
            client = HttpClientBuilder.create().build();
            
            // setup output message by copying JSON body into 
            // apache StringEntity object along with content type
            entity = new StringEntity(jsonBody, HTTP.UTF_8);
            entity.setContentEncoding(HTTP.UTF_8);
            entity.setContentType("text/json");

            // add HTTP headers
            post.setHeader("Accept", "text/json");
            post.setHeader("Accept-Charset", "UTF-8");
        
            // set Authorization header based on the API key
            post.setHeader("Authorization", ("Bearer "+apikey));
            post.setEntity(entity);

            // Call REST API and retrieve response content
            HttpResponse authResponse = client.execute(post);
            
            return EntityUtils.toString(authResponse.getEntity());
            
        }
        catch (Exception e) {   
            System.out.println("Error occurred while calling the service!!");
            return e.toString();
        }
    }	 
    
    public String retrieveOutput(String input) {
		
    	try {
	    	JSONParser parser = new JSONParser();	    	
	    	Object obj = parser.parse(input);	 
	    	
			JSONObject json = (JSONObject) obj;
							
		   JSONObject result = (JSONObject) json.get("Results");
		   System.out.println(json.get("Results"));
			
	       JSONObject output1 = (JSONObject)result.get("output1");
	       System.out.println(result.get("output1"));	
	       
	       JSONObject value = (JSONObject)output1.get("value");
	       System.out.println(output1.get("value"));
	        
	       String res = null; 
	       JSONArray strArray = (JSONArray)value.get("Values");				
	       Iterator<Object> itr = strArray.iterator();
		
			
			while(itr.hasNext()) {
				res = itr.next().toString();
				break;
			}
			
			StringBuilder sb = new StringBuilder();
			sb.append(res);
			
			String s = res.substring(2,sb.indexOf("]"));				
			
			String output =	s.substring(0,s.lastIndexOf('"'));
		 
			System.out.println(output);
			return output;
    	}
    	catch(Exception e) {
    		System.out.println("Error while parsing output!!");
    		e.printStackTrace();;
    	}
    	
    	return null;
    }
    
    public String createRecJSON(String username) {
		try {
			/*creating json from form values */
			
			JSONObject obj = new JSONObject();
			JSONObject inputs = new JSONObject();
			JSONObject input = new JSONObject();
			
			JSONArray columnName = new JSONArray();
			columnName.add("userid");
			
			JSONArray allValues = new JSONArray();
			JSONArray value = new JSONArray();
			value.add(username);
			allValues.add(value);
						
			input.put("ColumnNames", columnName);
			input.put("Values", allValues);
			inputs.put("input1", input);
			obj.put("Inputs", inputs);
	
			System.out.println("print the value of json "+ obj);
			
			//converting json to string
			return obj.toString(); 
		}
		catch(Exception e) {
			System.out.println("Error occurred while create json!!" + e);
		}		
		return null;
	}

}
