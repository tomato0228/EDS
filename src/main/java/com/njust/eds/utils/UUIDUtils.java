package com.njust.eds.utils;

import java.util.UUID;

/**
 * 序列号生成工具类
 * @author 钟林森
 *
 */
public class UUIDUtils {

    /**
     * 比较普通的序列号生成方法
     * @return
     */
    public static String getUUID(){
        return UUID.randomUUID().toString().replace("-", "");
    }
}
