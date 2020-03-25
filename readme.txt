public class RestfulClient {
	CloseableHttpClient httpclient;
	HttpGet httpGet;
	HttpPost httpPost;
	CloseableHttpResponse httpResponse;
	int responseCode;
	JSONObject responseBody;
	HashMap<String,String> responseHeads;
	
	public void getResponse(String url) throws ClientProtocolException, IOException{
		httpclient=HttpClients.createDefault();
		httpGet=new HttpGet(url);
		httpResponse=httpclient.execute(httpGet);
	}
	
	public JSONObject getBodyInJSON() throws ParseException, IOException {
		HttpEntity entity;
        String entityToString;
        entity = httpResponse.getEntity();
        entityToString = EntityUtils.toString(entity);
        responseBody = JSON.parseObject(entityToString);
        
        System.out.println("This is your response body" + responseBody);
		return responseBody;
	}
	
	 public HashMap<String, String> getHeaderInHash(){
	        Header[] headers;
	        headers = httpResponse.getAllHeaders();
	        
	        responseHeads = new HashMap<String, String>();
	        
	        for(Header header:headers){
	            responseHeads.put(header.getName(), header.getValue());
	        }
	        
	        System.out.println("This is your response header" + responseHeads);
	        
	        return    responseHeads;
	    }
	
	 public int getCodeInNumber(){
	        responseCode = httpResponse.getStatusLine().getStatusCode();
	        
	        System.out.println("This is your response code" + responseCode);
	        
	        return responseCode;
	    }
	 public void sendPost(String url,List<NameValuePair> parems,HashMap<String,String> headers) throws ClientProtocolException, IOException {
		
		 httpclient=HttpClients.createDefault();
		 //创建post请求对象
		 httpPost=new HttpPost(url);
		 //设置请求主题格式
		 httpPost.setEntity(new UrlEncodedFormEntity(parems,"UTF-8"));
		//设置头部信息
		 Set<String> set=headers.keySet();
		 
		 for(Iterator<String> iterator = set.iterator();iterator.hasNext();) {
			 String key = iterator.next();
	            String value = headers.get(key);
	            httpPost.addHeader(key, value);
	        }
	        
				httpResponse = httpclient.execute(httpPost);
			 
		 }
		 
		 
	 }
