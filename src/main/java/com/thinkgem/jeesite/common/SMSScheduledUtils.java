package com.thinkgem.jeesite.common;

import com.thinkgem.jeesite.common.utils.SMSService;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

@Component
public class SMSScheduledUtils implements ApplicationListener<ContextRefreshedEvent> {

    @Autowired
    private SMSService smsService;

    @Override
    public void onApplicationEvent(ContextRefreshedEvent contextRefreshedEvent) {

        ScheduledExecutorService executor = Executors.newScheduledThreadPool(1);
        long oneDay = 24 * 60 * 60 * 1000;

        long initDelay =    SMSScheduledUtils.getTimeMillis("09:00:00")
                - System.currentTimeMillis();
        initDelay   =   initDelay   >   0   ?   initDelay   :   oneDay  +   initDelay;
        executor.scheduleWithFixedDelay(
                new SMSService(),
                initDelay,
                oneDay,
                TimeUnit.MILLISECONDS
        );
//        executor.scheduleWithFixedDelay(
//                smsService,
//                10,
//                60,
//                TimeUnit.SECONDS
//        );

    }

    /**
     * 获取指定时间对应的毫秒数
     * @param time "HH:mm:ss"
     * @return
     */
    private static long getTimeMillis(String time)	{
        try {
            DateFormat dateFormat =	new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            DateFormat	dayFormat =	new	SimpleDateFormat("yyyy-MM-dd");
            Date	curDate	= dateFormat.parse(dayFormat.format(new Date())+ " " + time);
            return	curDate.getTime();
        }	catch (ParseException e){
            e.printStackTrace();
        }
        return	0;
    }

}
