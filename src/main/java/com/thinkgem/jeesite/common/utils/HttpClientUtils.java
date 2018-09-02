package com.thinkgem.jeesite.common.utils;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


public class HttpClientUtils {

    public static final Logger logger = LoggerFactory.getLogger(HttpClientUtils.class);

    public static final String DEFAULT_CHARSET = "UTF-8";


    public static String doPost(String url, Map<String, String> paramsMap) {
        HttpClient client = new DefaultHttpClient();

        String responseText = "";
        HttpResponse response = null;
        try {
            HttpPost method = new HttpPost(url);
            if (paramsMap != null) {
                List<NameValuePair> paramList = new ArrayList<NameValuePair>();
                for (Map.Entry<String, String> param : paramsMap.entrySet()) {
                    NameValuePair pair = new BasicNameValuePair(param.getKey(), param.getValue());
                    paramList.add(pair);
                }
                method.setEntity(new UrlEncodedFormEntity(paramList, DEFAULT_CHARSET));
            }
            response = client.execute(method);
            HttpEntity entity = response.getEntity();
            if (entity != null) {
                responseText = EntityUtils.toString(entity, DEFAULT_CHARSET);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            client.getConnectionManager().shutdown();
        }
        return responseText;
    }

}
