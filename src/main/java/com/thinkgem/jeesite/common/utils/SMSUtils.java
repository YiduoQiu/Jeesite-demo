package com.thinkgem.jeesite.common.utils;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by swayer on 2018/7/19.
 */
public class SMSUtils {

    public static String singleSend(String text , String mobile) {
        Map<String, String> params = new HashMap<String, String>();
        params.put("apikey", "d0255816ab26c047cba48129104f29e3");
        params.put("text", text);
        params.put("mobile", mobile);
        return HttpClientUtils.doPost("https://sms.yunpian.com/v2/sms/single_send.json", params);
    }
}
