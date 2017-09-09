package com.njust.eds.utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 日期工具类
 * @author 钟林森
 *
 */
public class DateUtils {

    /**
     * 获取当前日期
     * @return
     */
    public static Date getCurrentDate(){
        return new Date();
    }

    /**
     * 当前日期与指定的日期进行比较:前则true,后则false
     * @param currentDate
     * @param speciDate
     * @return
     */
    public static boolean isBeforeSpeciDate(Date currentDate,Date speciDate){
        return (currentDate.getTime()-speciDate.getTime()<0?true:false);
    }

    /**
     * 获取相对当前日期往后day天的日期
     * @param day
     * @return
     */
    public static Date getDateAfter(int day){
        Calendar now=Calendar.getInstance();
        now.setTime(new Date());
        now.set(Calendar.DATE,now.get(Calendar.DATE)+day);
        return now.getTime();
    }

    /**
     * 字符串转日期
     * @param str
     * @param format
     * @return
     */
    public static Date strToDate(String str,String format){
        Date resultDate=null;
        if (str==null || format==null) {
            return null;
        }
        try {
            SimpleDateFormat sdf=new SimpleDateFormat(format);
            resultDate=sdf.parse(str);
        } catch (Exception e) {}

        return resultDate;
    }

    /**
     * 日期转字符串
     * @param date
     * @param format
     * @return
     */
    public static String dateToStr(Date date,String format){
        String resultStr=null;
        if (date==null || format==null) {
            return null;
        }
        try {
            SimpleDateFormat sdf=new SimpleDateFormat(format);
            resultStr=sdf.format(date);
        } catch (Exception e) {}

        return resultStr;
    }

}