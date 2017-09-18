package com.njust.eds.utils;

import java.text.DecimalFormat;

public class FileSizeUtils {
    public static String getFjSize(String size){
        String str = "0";
        DecimalFormat df2  = new DecimalFormat("###.0");
        if(null!=size && size.length()>0){
            int s1 = Integer.parseInt(size);
            if(s1/1024<1024){//如果小于1M
                str = df2.format(((double)s1/(double)1024))+"Kb";
                //System.out.println(df2.format(((double)s1/(double)1024))+"kb");
            }else if(s1/1024>=1024){//如果大于1M
                str = df2.format((s1/(1024*1024)))+"MB";
                //System.out.println(df2.format(((double)s1/(double)(1024*1024)))+"MB");
            }else if(s1/1024>=1024*1024){//如果大于1024MB
                str = df2.format((s1/(1024*1024*1024)))+"G";
                //System.out.println(df2.format(((double)s1/(double)(1024*1024*1024)))+"G");
            }
        }
        return str;
    }
}
