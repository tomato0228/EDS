package com.njust.eds.utils;

import com.njust.eds.model.File;
import com.njust.eds.model.Message;
import com.njust.eds.model.User;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.njust.eds.service.FileService;
import com.njust.eds.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

public class SearchUtils {


    public static List search_user_name(String name, List list){
        List results = new ArrayList();
        Pattern pattern = Pattern.compile(name);
        for(int i=0; i < list.size(); i++){
            Matcher matcher = pattern.matcher(((User)list.get(i)).getUserName());
            if(matcher.find()){
                results.add(list.get(i));
            }
        }
        return results;
    }

    public static List search_user_tel(String name, List list){
        List results = new ArrayList();
        Pattern pattern = Pattern.compile(name);
        for(int i=0; i < list.size(); i++){
            Matcher matcher = pattern.matcher(((User)list.get(i)).getUserTel());
            if(matcher.find()){
                results.add(list.get(i));
            }
        }

        return results;
    }
    public static List<List<File>> search_file_name(String name, List<List<File>> list){

        List<List<File>> results = new ArrayList<List<File>>();

        Pattern pattern = Pattern.compile(name);

        for(int i=0; i < list.size(); i++) {
            System.out.println("外");
            List<File> result=new ArrayList<File>();

            for (int j =0; j< list.get(i).size();j++) {
                System.out.println("内");
                Matcher matcher = pattern.matcher( list.get(i).get(j).getFileName());
                if (matcher.find()) {
                    System.out.println(j);
                   result.add(list.get(i).get(j));
                }
            }
            results.add(result);
        }
        System.out.println(results);
        System.out.println("over");
        return results;
    }
    public static List<List<File>> search_file_type(String name, List<List<File>> list){
        List<List<File>> results = new ArrayList<List<File>>();

        Pattern pattern = Pattern.compile(name);

        for(int i=0; i < list.size(); i++) {
            System.out.println("外");
            List<File> result=new ArrayList<File>();

            for (int j =0; j< list.get(i).size();j++) {
                System.out.println("内");
                Matcher matcher = pattern.matcher( list.get(i).get(j).getFileType());
                if (matcher.find()) {
                    System.out.println(j);
                    result.add(list.get(i).get(j));
                }
            }
            results.add(result);
        }
        System.out.println(results);
        System.out.println("over");
        return results;
    }


    public static List search_msg_data(String name, List list){
        List results = new ArrayList();
        Pattern pattern = Pattern.compile(name);
        for(int i=0; i < list.size(); i++){
            Matcher matcher = pattern.matcher(((Message)list.get(i)).getMsgData());
            if(matcher.find()){
                results.add(list.get(i));
            }
        }
        return results;
    }
}
