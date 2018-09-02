package com.thinkgem.jeesite.common.utils;

import com.thinkgem.jeesite.modules.zntx.entity.CzzZntx;
import com.thinkgem.jeesite.modules.zntx.service.CzzZntxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by swayer on 2018/7/20.
 */
@Component
public class SMSService  implements  Runnable {

    @Autowired
    private CzzZntxService czzZntxService;

    @Override
    public void run() {
        System.out.println("当前时间："+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())+"，执行定时智能提醒任务");

        List<CzzZntx> list = czzZntxService.getYesObjects(null);

        for(CzzZntx zntx : list){

            System.out.println("+++++++++++++++++++++++++++");
            System.out.println("内容："+zntx.getContent() );
            System.out.println("接收电话："+zntx.getPhone());

            String intervaltime = zntx.getIntervaltime();

            switch (zntx.getIntervalType()){
                case "0":           //年
                    if(intervaltime.equals("3")){
                        if(zntx.getLastDate()!=null){
                            Date startDate = zntx.getLastDate();
                            Format f = new SimpleDateFormat("yyyy-MM-dd");
                            System.out.println("最近发送日期:" + f.format(startDate));
                            Calendar c = Calendar.getInstance();
                            c.setTime(startDate);
                            c.add(Calendar.DAY_OF_MONTH, 15);// +15天   有最近发送时间，间隔15天再次提醒

                            Date sendDate = c.getTime();
                            System.out.println("本次发送日期:" + f.format(sendDate));

                            if(f.format(sendDate).equals(f.format(new Date()))){
                                System.out.println("发送信息 ， 更新最后发送时间");

//                                SMSUtils.singleSend("【企视云】您的验证码是1234",zntx.getPhone());
                                czzZntxService.updateLastDateById(zntx);
                            }
                        }else{
                            Date startDate = zntx.getStartDate();
                            Format f = new SimpleDateFormat("yyyy-MM-dd");
                            System.out.println("开始日期:" + f.format(startDate));
                            Calendar c = Calendar.getInstance();
                            c.setTime(startDate);
                            c.add(Calendar.MONTH, +33);// 3年 首次提醒时间实际为33个月后的今天

                            Date sendDate = c.getTime();
                            System.out.println("发送日期:" + f.format(sendDate));

                            if(f.format(sendDate).equals(f.format(new Date()))){
                                System.out.println("发送信息 ， 更新最后发送时间");

//                                SMSUtils.singleSend("【企视云】您的验证码是1234",zntx.getPhone());
                                czzZntxService.updateLastDateById(zntx);
                            }

                        }
                    }else  if(intervaltime.equals("1")){
                        if(zntx.getLastDate()!=null){
                            Date startDate = zntx.getLastDate();
                            Format f = new SimpleDateFormat("yyyy-MM-dd");
                            System.out.println("最近发送日期:" + f.format(startDate));
                            Calendar c = Calendar.getInstance();
                            c.setTime(startDate);
                            c.add(Calendar.DAY_OF_MONTH, 15);// +15天   有最近发送时间，间隔15天再次提醒

                            Date sendDate = c.getTime();
                            System.out.println("本次发送日期:" + f.format(sendDate));

                            if(f.format(sendDate).equals(f.format(new Date()))){

                                System.out.println("发送信息 ， 更新最后发送时间");

//                                SMSUtils.singleSend("【企视云】您的验证码是1234",zntx.getPhone());
                                czzZntxService.updateLastDateById(zntx);
                            }
                        }else{
                            Date startDate = zntx.getStartDate();
                            Format f = new SimpleDateFormat("yyyy-MM-dd");
                            System.out.println("开始日期:" + f.format(startDate));
                            Calendar c = Calendar.getInstance();
                            c.setTime(startDate);
                            c.add(Calendar.MONTH, +11);// 1年的 首次提醒时间为11个月后的今天

                            Date sendDate = c.getTime();
                            System.out.println("发送日期:" + f.format(sendDate));

                            if(f.format(sendDate).equals(f.format(new Date()))){
                                System.out.println("发送信息 ， 更新最后发送时间");

//                                SMSUtils.singleSend("【企视云】您的验证码是1234",zntx.getPhone());

                                czzZntxService.updateLastDateById(zntx);
                            }

                        }
                    }
                    break;
                case "1":           //月
                        if (zntx.getLastDate() != null) {

                            System.out.println("发送信息 ， 更新最后发送时间");          //有了最近发送时间之后，每天提醒

//                            SMSUtils.singleSend("【企视云】您的验证码是1234",zntx.getPhone());
                            czzZntxService.updateLastDateById(zntx);

                        } else {
                            Date startDate = zntx.getStartDate();
                            Format f = new SimpleDateFormat("yyyy-MM-dd");
                            System.out.println("开始日期:" + f.format(startDate));
                            Calendar c = Calendar.getInstance();
                            c.setTime(startDate);
                            c.add(Calendar.MONTH, Integer.valueOf(intervaltime));
                            c.add(Calendar.DAY_OF_MONTH, -3);      //首次发送时间为1个月之后的今天提前3天发送

                            Date sendDate = c.getTime();
                            System.out.println("发送日期:" + f.format(sendDate));

                            if (f.format(sendDate).equals(f.format(new Date()))) {

                                System.out.println("发送信息 ， 更新最后发送时间");

//                                SMSUtils.singleSend("【企视云】您的验证码是1234",zntx.getPhone());
                                czzZntxService.updateLastDateById(zntx);
                            }

                        }
                    break;
                case "2":
                    if (zntx.getLastDate() != null) {

                        Date startDate = zntx.getLastDate();
                        Format f = new SimpleDateFormat("yyyy-MM-dd");
                        System.out.println("最近发送日期:" + f.format(startDate));
                        Calendar c = Calendar.getInstance();
                        c.setTime(startDate);
                        c.add(Calendar.DAY_OF_MONTH, Integer.valueOf(intervaltime));

                        Date sendDate = c.getTime();
                        System.out.println("发送日期:" + f.format(sendDate));

                        if (f.format(sendDate).equals(f.format(new Date()))) {
                            System.out.println("发送信息 ， 更新最后发送时间");
//                            SMSUtils.singleSend("【企视云】您的验证码是1234",zntx.getPhone());
                            czzZntxService.updateLastDateById(zntx);
                        }

                    } else {
                        Date startDate = zntx.getStartDate();
                        Format f = new SimpleDateFormat("yyyy-MM-dd");
                        System.out.println("开始日期:" + f.format(startDate));
                        Calendar c = Calendar.getInstance();
                        c.setTime(startDate);
                        c.add(Calendar.DAY_OF_MONTH, Integer.valueOf(intervaltime));

                        Date sendDate = c.getTime();
                        System.out.println("发送日期:" + f.format(sendDate));

                        if (f.format(sendDate).equals(f.format(new Date()))) {
                            System.out.println("发送信息 ， 更新最后发送时间");
//                            SMSUtils.singleSend("【企视云】您的验证码是1234",zntx.getPhone());
                            czzZntxService.updateLastDateById(zntx);
                        }
                    }

                    break;
            }
            System.out.println("+++++++++++++++++++++++++++");
        }
    }


}
