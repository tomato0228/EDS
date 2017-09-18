package com.njust.eds.controller;

import com.njust.eds.model.*;
import com.njust.eds.service.*;
import com.njust.eds.utils.MD5Util;
import org.hibernate.annotations.SourceType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.njust.eds.utils.AESUtil.aesDecryptByBytes;
import static com.njust.eds.utils.AESUtil.base64Decode;

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
         map.addAttribute("Userfiles",List);
         map.addAttribute("Namelist",namelist);
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

    @RequestMapping("/SecretLeveControl")
    public String SecretLeveControl() {
        return "admin/secretLeveControl";
    }

    @RequestMapping("/AdminControl")
    public String AdminControl() {
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
    @RequestMapping("/login")
    public Map<String, Object> admin(ModelMap map, HttpServletRequest request) throws Exception {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        Admin admin = new Admin();
        String password = MD5Util.getMD5(request.getParameter("password"));
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
            System.out.println("1");
            File file = fileService.getFileById(filedata.getFileId());
            String key = file.getFileSecretKey();
            System.out.println();
            byte[] UNAESFILE = base64Decode(aesDecryptByBytes(filedata.getFileData(), key));
            System.out.println("2");
            String filename = file.getFileName();
            HttpHeaders headers = new HttpHeaders();
            //下载显示的文件名，解决中文名称乱码问题
            String downloadFielName = new String(filename.getBytes("UTF-8"), "iso-8859-1");
            //通知浏览器以attachment（下载方式）打开图片
            headers.setContentDispositionFormData("attachment", downloadFielName);
            System.out.println("3");
            //application/octet-stream ： 二进制流数据（最常见的文件下载）。
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            return new ResponseEntity<byte[]>(UNAESFILE, headers, HttpStatus.CREATED);
        }
        return null;
    }

}
