package com.njust.eds.controller;

import com.njust.eds.model.Admin;
import com.njust.eds.model.User;
import com.njust.eds.service.AdminService;
import com.njust.eds.service.UserService;
import com.njust.eds.utils.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public String FileControl() {
        return "admin/fileControl";
    }

    @RequestMapping("/UserControl")
    public String  UserControl(ModelMap map) {
        List<User> list=userService.getAllUser();
        map.addAttribute("UserList",list);
        return "admin/userControl";
    }

    @RequestMapping("/MessageControl")
    public String MessageControl() {
        return "admin/messageControl";
    }

    @RequestMapping("/PersonalSettings")
    public String PersonalSettings() {
        return "admin/personalSettings";
    }

    @RequestMapping("/SystemInfo")
    public String SystemInfo() {
        return "admin/index";
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
//
//    @RequestMapping("/index/{id}")
//    public String index(ModelMap map, @PathVariable Integer id) {
//        System.out.println(adminService.getAdminById(id));
//        map.put("loginAdmin", adminService.getAdminById(id));
//        return "admin/index";
//    }
}
