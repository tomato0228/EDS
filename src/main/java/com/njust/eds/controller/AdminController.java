package com.njust.eds.controller;

import com.njust.eds.model.Admin;
import com.njust.eds.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * @author tomato
 * @create 2017-09-09 下午9:53
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @ResponseBody
    @RequestMapping("/checkUserName")
    public String checkUserName(HttpServletRequest request) {
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

    @ResponseBody
    @RequestMapping("/login")
    public Map<String, Object> userLogin(ModelMap map, HttpServletRequest request) throws Exception {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        Admin admin = new Admin();
        admin.setAdminName(request.getParameter("userName"));
        admin.setAdminPassword(request.getParameter("password"));
        Admin currentAdmin = adminService.queryAdmin(admin);
        if (currentAdmin != null) {
            resultMap.put("id", currentAdmin.getAdminId());
            resultMap.put("res", "yes");
        } else {
            resultMap.put("res", "no");
        }
        return resultMap;
    }

    @RequestMapping("/index/{id}")
    public String index(ModelMap map, @PathVariable Integer id) {
        System.out.println(adminService.getAdminById(id));
        map.put("loginAmin", adminService.getAdminById(id));
        return "admin/index";
    }
}
