package com.njust.eds.controller;

import com.njust.eds.model.*;
import com.njust.eds.service.*;
import com.njust.eds.utils.DateUtils;
import com.njust.eds.utils.MD5Util;
import com.njust.eds.utils.SearchUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static com.njust.eds.utils.AESUtil.*;
import static com.njust.eds.utils.MD5Util.getMD5;

/**
 * @author tomato
 * @create 2017-09-09 下午9:53
 */
@Controller
@RequestMapping("/admin")
//@SessionAttributes("LoginAdminID")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private UserService userService;

    @Autowired
    private FileService fileService;
    @Autowired
    private MessageService messageService;
    @Autowired
    private FiledataService filedataService;
    @Autowired
    private  FilelimitService filelimitService;

    @ResponseBody
    @RequestMapping("/checkAdminName")
    public String checkAdminName(HttpServletRequest request) {
        String adminName = request.getParameter("adminName");
        Admin admin = adminService.findAdminByAdminName(adminName);
        if (admin != null) {
            return "isExist";
        }
        return "isOK";
    }

    @RequestMapping("/tologin")
    public String tologin() {
        load();
        return "admin/login";
    }

    @RequestMapping("/logout")
    public String tologout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute("loginAdmin");
        return "admin/login";
    }

    @RequestMapping("/FileControl")
    public String FileControl(ModelMap map) {

        List<List<File>> list = fileService.findUserFiles();
        List<String> namelist=new ArrayList<String>();
       int size=0;
         for(List<File> filelist:list)
         {
             if(filelist.size()!=0)
                 namelist.add(userService.findUsernameBuId(filelist.get(0).getFileUserId()));
                else
                    continue;
         }

        List<List<File>> List=new ArrayList<List<File>>();
         for(List<File> filelist:list)
         {
             if(filelist.size()!=0)
             List.add(filelist);
             else
                 continue;
         }
         for(List<File> filelist:list)
         {
             for(File file:filelist)
             {
                 size++;
             }
         }
         map.addAttribute("Userfiles",List);
         map.addAttribute("Namelist",namelist);
         map.addAttribute("size",size);
        return "admin/fileControl";
    }

    @RequestMapping("/UserControl")
    public String UserControl(ModelMap map) {
        List<User> list = userService.getAllUser();
        map.addAttribute("UserList", list);
        return "admin/userControl";
    }

    @RequestMapping("/MessageControl")
    public String MessageControl(ModelMap map, HttpServletRequest request) {
        HttpSession session = request.getSession();
        int id=((Admin)session.getAttribute("loginAdmin")).getAdminId();
        List<Message> messagelist=messageService.findMessagesByRecevierId(id);
        List<String> name=new ArrayList<String>();
        for (Message message:messagelist)
        { int senderid=message.getMsgSender();
            if (senderid<10000)
                name.add(adminService.findAdminnameById(senderid));
            else
                name.add(userService.findUsernameBuId(senderid));
        }
        map.addAttribute("Namelist",name);
        map.addAttribute("Messagelist",messagelist);
        return "admin/messageControl";
    }

    @RequestMapping("/PersonalSettings")
    public String PersonalSettings() {
        return "admin/personalSettings";
    }

    @RequestMapping("/SystemInfo")
    public String SystemInfo() {
        return "admin/systemInfo";
    }

    @RequestMapping("/LogControl")
    public String SecretLeveControl() {
        return "admin/LogControl";
    }

    @RequestMapping("/AdminControl")
    public String AdminControl(ModelMap map) {
        List<Admin> list = adminService.getAllAdmin();
        map.addAttribute("AdminList", list);
        return "admin/adminControl";
    }


    @ResponseBody
    @RequestMapping(value = "/DeleteUser")
    public Map<String,String> DeleteUser(HttpServletRequest request) throws  Exception{
        userService.deletUser(userService.getUserById(Integer.parseInt(request.getParameter("userid"))));
        Map<String, String> resultMap = new HashMap<String, String>();
        resultMap.put("res","userControl");
        return resultMap;
    }

    @ResponseBody
    @RequestMapping(value = "/DeleteUsers")
    public Map<String,String> DeleteUsers(HttpServletRequest request) throws  Exception{
        String Users[]=request.getParameterValues("ids");

        for(int i=0;i<Users.length;i++)
        {
            int user=Integer.parseInt(Users[i]);
            System.out.println(user);
            userService.deletUser(userService.getUserById(user));
        }
        Map<String, String> resultMap = new HashMap<String, String>();
        resultMap.put("res","userControl");
        return resultMap;
    }

    @ResponseBody
    @RequestMapping(value = "/DeleteAdmin")
    public Map<String,String> DeleteAdmin(HttpServletRequest request) throws  Exception{
        adminService.deletAdmin(adminService.getAdminById(Integer.parseInt(request.getParameter("adminid"))));
        Map<String, String> resultMap = new HashMap<String, String>();
        resultMap.put("res","adminControl");
        return resultMap;
    }





    @ResponseBody
    @RequestMapping(value = "/DeleteFile")
    public Map<String,String> DeleteFile(HttpServletRequest request) throws  Exception{
        fileService.deletFile(fileService.getFileById(Integer.parseInt(request.getParameter("fileid"))));
        filedataService.deletFiledata(filedataService.getFiledataById(Integer.parseInt(request.getParameter("fileid"))));
        Map<String, String> resultMap = new HashMap<String, String>();
        resultMap.put("res","fileControl");
        return resultMap;
    }

    @ResponseBody
    @RequestMapping(value = "/DeleteFiles")
    public Map<String,String> DeleteFiles(HttpServletRequest request) throws  Exception{
        String Files[]=request.getParameterValues("ids");

        for(int i=0;i<Files.length;i++)
        {
            int file=Integer.parseInt(Files[i]);
            System.out.println(file);
            fileService.deletFile(fileService.getFileById(file));


        }
        Map<String, String> resultMap = new HashMap<String, String>();
        resultMap.put("res","fileControl");
        return resultMap;
    }

    @ResponseBody
    @RequestMapping(value = "/StartUser")
    public void StartUser(HttpServletRequest request) throws  Exception {
        System.out.println(request.getParameter("userid"));
        userService.start(Integer.parseInt(request.getParameter("userid")));
    }

    @ResponseBody
    @RequestMapping(value = "/StopUser")
    public void StopUser(HttpServletRequest request) throws  Exception {
        System.out.println(request.getParameter("userid"));
        userService.stop(Integer.parseInt(request.getParameter("userid")));
    }

    @ResponseBody
    @RequestMapping(value = "/user_secretlevel_edit")
    public String user_secretlevel_edit(HttpServletRequest request) throws Exception{

        int id=Integer.parseInt(request.getParameter("userid"));
        int secretlevel =Integer.parseInt(request.getParameter("SecretLevel"));
        userService.user_secretlevel_edit(id,secretlevel);
         return "Done";
    }

    @ResponseBody
    @RequestMapping(value = "/admin_power")
    public String admin_power(HttpServletRequest request) throws Exception{

        int id=Integer.parseInt(request.getParameter("adminid"));
        int power =Integer.parseInt(request.getParameter("power"));
        adminService.admin_power(id,power);
        return "Done";
    }
    @ResponseBody
    @RequestMapping(value = "/file_edit")
    public String file_edit(HttpServletRequest request) throws Exception{

        String fileAbstrcat=request.getParameter("fileAbstrcat");
        int fileid=Integer.parseInt(request.getParameter("fileid"));
        File file=fileService.getFileById(fileid);
        file.setFileAbstrcat(fileAbstrcat);
        fileService.updateFile(file);
        return "Done";
    }



    @ResponseBody
    @RequestMapping(value = "/password_check")
    public String password_check(HttpServletRequest request) throws Exception{
        String oldpw=request.getParameter("oldpw");
        String password=request.getParameter("password");
        System.out.println(oldpw);
        System.out.println(password);
        System.out.println(MD5Util.getMD5(oldpw));

        if(MD5Util.getMD5(oldpw).equals(password))
        return "yes";

        else
            return "no";
    }

    @ResponseBody
    @RequestMapping(value = "/admin_edit")
    public Map<String,Object> admin_edit(HttpServletRequest request) throws Exception {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        String password = request.getParameter("newpw");
        int id = Integer.parseInt(request.getParameter("adminid"));
        Admin admin = adminService.getAdminById(id);
        admin.setAdminPassword(MD5Util.getMD5(password));
        adminService.updateAdmin(admin);

        Admin currentAdmin = adminService.queryAdmin(admin);
        if (currentAdmin != null) {
            resultMap.put("LoginAdminID", currentAdmin.getAdminId());
            resultMap.put("res", "yes");
            HttpSession session = request.getSession();
            session.setAttribute("loginAdmin", currentAdmin);
        } else {
            resultMap.put("res", "no");
        }
            return resultMap;

    }

    @ResponseBody
    @RequestMapping(value = "/admin_edit2")
    public Map<String,Object> admin_edit2(HttpServletRequest request) throws Exception {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        String tel = request.getParameter("tel");
        String email=request.getParameter("email");
        int id=Integer.parseInt(request.getParameter("id"));
        Admin admin = adminService.getAdminById(id);
        if(tel!="")
        {
            admin.setAdminTel(tel);
        }
        if(email!="")
        {
            admin.setAdminEmail(email);
        }
        adminService.updateAdmin(admin);

        Admin currentAdmin = adminService.queryAdmin(admin);
        if (currentAdmin != null) {
            resultMap.put("LoginAdminID", currentAdmin.getAdminId());
            resultMap.put("res", "yes");
            HttpSession session = request.getSession();
            session.setAttribute("loginAdmin", currentAdmin);
        } else {
            resultMap.put("res", "no");
        }
        return resultMap;

    }


    @ResponseBody
    @RequestMapping("/login")
    public Map<String, Object> admin(ModelMap map, HttpServletRequest request) throws Exception {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        Admin admin = new Admin();
        String password = getMD5(request.getParameter("password"));
        admin.setAdminName(request.getParameter("adminName"));
        admin.setAdminPassword(password);
        Admin currentAdmin = adminService.queryAdmin(admin);
        if (currentAdmin != null) {
            resultMap.put("LoginAdminID", currentAdmin.getAdminId());
            resultMap.put("res", "yes");
            HttpSession session = request.getSession();
            session.setAttribute("loginAdmin", currentAdmin);

        } else {
            resultMap.put("res", "no");
        }
        return resultMap;
    }

    @RequestMapping(value = "/download", method = RequestMethod.POST)
    public ResponseEntity<byte[]> download(HttpServletRequest request) throws Exception {
        int fileId= Integer.parseInt(request.getParameter("fileid"));
        System.out.println(fileId);
        Filedata filedata = filedataService.getFiledataById(fileId);

        if (filedata != null) {

            File file = fileService.getFileById(fileId);
            String key = file.getFileSecretKey();
            System.out.println(filedata);
            System.out.println(key);
            byte[] UNAESFILE = base64Decode(aesDecryptByBytes(filedata.getFileData(), key));
            System.out.println("1");
            String filename = file.getFileName();
            HttpHeaders headers = new HttpHeaders();
            //下载显示的文件名，解决中文名称乱码问题
            String downloadFielName = new String(filename.getBytes("UTF-8"), "iso-8859-1");
            //通知浏览器以attachment（下载方式）打开图片
            headers.setContentDispositionFormData("attachment", downloadFielName);

            //application/octet-stream ： 二进制流数据（最常见的文件下载）。
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            return new ResponseEntity<byte[]>(UNAESFILE, headers, HttpStatus.CREATED);
        }
        return null;
    }

    @ResponseBody
    @RequestMapping("/search_user")
    public Map<String,Object> search_user(HttpServletRequest request) throws Exception{
        Map<String, Object> resultMap = new HashMap<String, Object>();
        String name=request.getParameter("name");
        int type=Integer.parseInt(request.getParameter("type"));
        List<User> list = userService.getAllUser();
        List<User> userlist=new ArrayList<User>();
        if(type==0){
      userlist=SearchUtils.search_user_name(name,list);}
        else{

            userlist=SearchUtils.search_user_tel(name,list);
        }
        request.getSession().setAttribute("userlist",userlist);
       resultMap.put("userlist",userlist);
       return resultMap;
     }


    @ResponseBody
    @RequestMapping("/search_file")
    public Map<String,Object> search_file(HttpServletRequest request) throws Exception{

        Map<String, Object> resultMap = new HashMap<String, Object>();
        String name=request.getParameter("name");
        int type=Integer.parseInt(request.getParameter("type"));
        System.out.println(name+type);
        List<List<File>> list = fileService.findUserFiles();
        List<List<File>> filelist=new ArrayList<List<File>>();
        List<String> namelist=new ArrayList<String>();
        if(type==0){

           filelist=SearchUtils.search_file_name(name,list);
        }
        else if (type==1)
        {
            List<List<File>> results = new ArrayList<List<File>>();

            Pattern pattern = Pattern.compile(name);

            for(int i=0; i < list.size(); i++) {
                System.out.println("外");
                List<File> result=new ArrayList<File>();

                for (int j =0; j< list.get(i).size();j++) {
                    System.out.println("内");
                    Matcher matcher = pattern.matcher( userService.findUsernameBuId(list.get(i).get(j).getFileUserId()));
                    if (matcher.find()) {
                        System.out.println(j);
                        result.add(list.get(i).get(j));
                    }
                }
                results.add(result);
            }
            filelist=results;
        }
        else
        {
            filelist=SearchUtils.search_file_type(name,list);
        }

        int size=0;
        for(List<File> Filelist:filelist)
        {
            if(Filelist.size()!=0)
                namelist.add(userService.findUsernameBuId(Filelist.get(0).getFileUserId()));
            else
                continue;
        }

        List<List<File>> List=new ArrayList<List<File>>();
        for(List<File> Filelist:filelist)
        {
            if(Filelist.size()!=0)
                List.add(Filelist);
            else
                continue;
        }
        for(List<File> Filelist:filelist)
        {
            for(File file:Filelist)
            {
                size++;
            }
        }
        System.out.println(List);
        System.out.println(namelist);
        System.out.println(size);
        request.getSession().setAttribute("Userfiles",List);
        request.getSession().setAttribute("Namelist",namelist);
        request.getSession().setAttribute("size",size);
        resultMap.put("Userfiles",list);
        return resultMap;
    }

    @ResponseBody
    @RequestMapping("/search_msg")
    public Map<String,Object> search_msg(HttpServletRequest request) throws Exception{
        int id=((Admin)request.getSession().getAttribute("loginAdmin")).getAdminId();
        System.out.println(id);
        Map<String, Object> resultMap = new HashMap<String, Object>();
        String name=request.getParameter("name");
        int type=Integer.parseInt(request.getParameter("type"));
        System.out.println(name+type);
        List<Message> list = messageService.findMessagesByRecevierId(id);
        System.out.println(list);
        List<Message> msglist=new ArrayList<Message>();
        List<String> namelist=new ArrayList<String>();
        if(type==0){

            List results = new ArrayList();
            Pattern pattern = Pattern.compile(name);
            for(int i=0; i < list.size(); i++){
                 int senderid=list.get(i).getMsgSender();
                 if(senderid>10000){
                Matcher matcher = pattern.matcher(userService.findUsernameBuId(senderid));

                if(matcher.find()){
                    results.add(list.get(i));
                }
                }
                else{
                     Matcher matcher = pattern.matcher(adminService.findAdminnameById(senderid));
                     if(matcher.find()){
                         results.add(list.get(i));
                     }
                 }
            }
            msglist=results;

           }
        else{
            msglist=SearchUtils.search_msg_data(name,list);
        }


        for (Message message:msglist)
        { int senderid=message.getMsgSender();
            if (senderid<10000)
                namelist.add(adminService.findAdminnameById(senderid));
            else
                namelist.add(userService.findUsernameBuId(senderid));
        }
        System.out.println(msglist.get(0).getMsgData());
        request.getSession().setAttribute("Messagelist",msglist);
        request.getSession().setAttribute("Namelist",namelist);
        resultMap.put("msglist",msglist);
        resultMap.put("res","yes");
        return resultMap;
    }
    @ResponseBody
    @RequestMapping(value = "/msg_edit")
    public void msg_edit(HttpServletRequest request) throws  Exception {
        System.out.println(request.getParameter("msgid"));

        messageService.msg_edit(Integer.parseInt(request.getParameter("msgid")),Integer.parseInt(request.getParameter("isread")));
    }

    private void load() {
        Date date = DateUtils.getCurrentDate();
        List<Filelimit> filelimits=filelimitService.getAll();
        List<Filelimit> del=new ArrayList<Filelimit>();
        for(Filelimit filelimit:filelimits){
            if(DateUtils.isBeforeSpeciDate(filelimit.getFileLifeCycle(),date))
            {
                filelimitService.delete(filelimit);
                fileService.share(filelimit.getFileId());
            }
        }
    }
}
