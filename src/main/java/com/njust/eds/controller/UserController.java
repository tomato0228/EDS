package com.njust.eds.controller;


import com.alibaba.fastjson.JSONObject;
import com.njust.eds.model.*;
import com.njust.eds.service.*;
import com.njust.eds.utils.*;
import net.coobird.thumbnailator.Thumbnails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static com.njust.eds.utils.AESUtil.*;

/**
 * @author tomato
 * @create 2017-09-05 下午6:07
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private FileService fileService;

    @Autowired
    private FiledataService filedataService;

    @Autowired
    private CommentService commentService;

    @Autowired
    private MessageService messageService;

    @Autowired
    private FilelimitService filelimitService;

    @Autowired
    private LogService logService;

    @Autowired
    private AdminService adminService;

    @ResponseBody
    @RequestMapping("/checkUserName")
    public String checkUserName(HttpServletRequest request) {
        String userName = request.getParameter("userName");
        User user = userService.findUserByUserName(userName);
        if (user != null) {
            return "isExist";
        }
        return "isOK";
    }

    @RequestMapping("/donate")
    public String donate() {
        return "EDS/donate";
    }

    @RequestMapping("/toRegister")
    public String toRegister() {
        return "user/register";
    }

    @RequestMapping("/tologin")
    public String tologin() {
        return "user/login";
    }

    @RequestMapping("/userPicture")
    public String userPicture() {
        return "user/userPicture";
    }

    @RequestMapping("/changeUserInfo")
    public String changeUserInfo() {
        return "user/changeUserInfo";
    }

    @RequestMapping("/userInfo")
    public String userInfo(HttpServletRequest request) {
        FindNotReadFileComments(request, false);
        FindNotReadUserMessages(request, false);
        return "user/userInfo";
    }

    @RequestMapping("/newFile")
    public String newFile() {
        return "user/newFile";
    }

    @RequestMapping("/recentFile")
    public String recentFile(HttpServletRequest request) {
        FindRecentFile(request);
        return "user/recentFile";
    }

    @RequestMapping("/fileInfo-{fileId}")
    public String viewFileInfo(ModelMap map, HttpServletRequest request, @PathVariable Integer fileId) {
        File file = fileService.getFileById(fileId);
        if (file != null) {
            if (file.getFileShare() - 1 == 0) {
                map.addAttribute("fileInfoLimit", filelimitService.getFilelimitById(fileId));
            }
            map.addAttribute("fileInfo", file);
            map.addAttribute("fileUser", userService.getUserById(file.getFileUserId()));
            if (((User) request.getSession().getAttribute("loginUser")).getUserId() != file.getFileUserId()) {
                file.setFileViewtimes(file.getFileViewtimes() + 1);
                fileService.updateFile(file);
                Log log = new Log();
                log.setLogUserId(((User) request.getSession().getAttribute("loginUser")).getUserId());
                log.setLogFileId(fileId);
                log.setLogOptype(3);
                log.setLogTime(DateUtils.getCurrentDate());
                log.setLogSignature(MD5Util.getMD5(log.toString()) + file.toString());
                logService.addLog(log);
            }
            FindaFileComments(request, fileId);
            return "user/fileInfo";
        } else return "error/404";
    }

    @RequestMapping("/fileInfoComment-{fileId}")
    public String fileInfoComment(ModelMap map, HttpServletRequest request, @PathVariable Integer fileId) {
        File file = fileService.getFileById(fileId);
        String fileInfoComment = request.getParameter("fileInfoComment");
        if (fileInfoComment != null && !"".equals(fileInfoComment)) {
            Comment comment = new Comment();
            comment.setComSender(((User) request.getSession().getAttribute("loginUser")).getUserId());
            comment.setComRecevier(fileId);
            comment.setComData(fileInfoComment);
            commentService.addComment(comment);
        }
        return viewFileInfo(map, request, fileId);
    }

    @RequestMapping("/updateFileAbstrcat-{fileId}")
    public String updateFileAbstrcat(ModelMap map, HttpServletRequest request, @PathVariable Integer fileId) {
        File file = fileService.getFileById(fileId);
        System.out.println("111的值是：---"+ 111 + "，当前方法=UserController.updateFileAbstrcat()");
        if (file != null && request.getParameter("fileAbstrcat") != null) {
            System.out.println("222的值是：---"+ 222 + "，当前方法=UserController.updateFileAbstrcat()");
            if (file.getFileShare() == 0 && file.getFileUserId() == ((User) request.getSession().getAttribute("loginUser")).getUserId()){
                file.setFileAbstrcat(request.getParameter("fileAbstrcat"));
                fileService.updateFile(file);
                Log log = new Log();
                log.setLogUserId(((User) request.getSession().getAttribute("loginUser")).getUserId());
                log.setLogOptype(5);
                log.setLogFileId(fileId);
                log.setLogTime(DateUtils.getCurrentDate());
                log.setLogSignature(MD5Util.getMD5(log.toString()) + file.toString());
                logService.addLog(log);
            }
            else if (file.getFileShare() == 1 ) {
                Filelimit filelimit = filelimitService.getFilelimitById(fileId);
                if (filelimit.getFileWrite()==1 && ((User) request.getSession().getAttribute("loginUser")).getUserSecretLevel() >= file.getFileSecretLevel()){
                    file.setFileAbstrcat(request.getParameter("fileAbstrcat"));
                    fileService.updateFile(file);
                    Log log = new Log();
                    log.setLogUserId(((User) request.getSession().getAttribute("loginUser")).getUserId());
                    log.setLogFileId(fileId);
                    log.setLogOptype(5);
                    log.setLogTime(DateUtils.getCurrentDate());
                    log.setLogSignature(MD5Util.getMD5(log.toString()) + file.toString());
                    logService.addLog(log);
                }
            }
            return viewFileInfo(map,request,fileId);
        } else return "error/404";
    }

    @RequestMapping("/deleteFile-{fileId}")
    public String deleteFile(HttpServletRequest request, @PathVariable Integer fileId) {
        File file = fileService.getFileById(fileId);
        if (file != null && file.getFileUserId() == ((User) request.getSession().getAttribute("loginUser")).getUserId()) {
            Log log = new Log();
            log.setLogUserId(((User) request.getSession().getAttribute("loginUser")).getUserId());
            log.setLogFileId(fileId);
            log.setLogOptype(2);
            log.setLogTime(DateUtils.getCurrentDate());
            log.setLogSignature(MD5Util.getMD5(log.toString()) + file.toString());
            logService.addLog(log);
            fileService.deletFile(file);
            return index(request);
        } else return "error/404";
    }

    @RequestMapping("/enjoyFile")
    public String enjoyFile(HttpServletRequest request) {
        FindEnjoyFile(request);
        return "user/enjoyFile";
    }

    @RequestMapping("/privateFile")
    public String privateFile(HttpServletRequest request) {
        FindPrivateFile(request);
        return "user/privateFile";
    }

    @RequestMapping("/webRecentFile")
    public String webRecentFile(HttpServletRequest request) {
        FindwebRecentFile(request);
        return "user/webRecentFile";
    }

    @RequestMapping("/webEnjoyFile")
    public String webEnjoyFile(HttpServletRequest request) {
        FindwebEnjoyFile(request);
        return "user/recentFile";
    }

    @RequestMapping("/findMyFile")
    public String findFile(HttpServletRequest request) {
        //FindwebEnjoyFile(request);
        return "user/findMyFile";
    }

    @RequestMapping("/findWebFile")
    public String findWebFile(HttpServletRequest request) {
        //FindwebEnjoyFile(request);
        return "user/findFile";
    }

    @RequestMapping("/findMessage")
    public String findMessage(HttpServletRequest request) {
        return "user/findMessage";
    }

    @RequestMapping("/findComment")
    public String findComment(HttpServletRequest request) {
        return "user/findComment";
    }

    @RequestMapping("/notReadFileComment")
    public String notReadFileComment(HttpServletRequest request) {
        FindNotReadFileComments(request, false);
        return "user/notReadFileComment";
    }

    @RequestMapping("/readComment-{comId}")
    public String readComment(ModelMap map, HttpServletRequest request, @PathVariable Integer comId) {
        Comment comment = commentService.findCommentById(comId);
        if (comment != null) {
            File file = fileService.getFileById(comment.getComRecevier());
            User user = userService.getUserById(comment.getComSender());
            if (file != null && user != null) {
                comment.setIsRead(1);
                commentService.updateComment(comment);
                if (file.getFileShare() - 1 == 0) {
                    map.addAttribute("fileInfoLimit", filelimitService.getFilelimitById(file.getFileId()));
                }
                map.addAttribute("ThisComment", comment);
                map.addAttribute("ThisFile", file);
                map.addAttribute("ThisUser", user);
                comment.setIsRead(1);
                commentService.updateComment(comment);
                return "user/readComment";
            } else return "error/404";
        } else return "error/404";
    }

    @RequestMapping("/aboutUser-{userId}")
    public String aboutUser(ModelMap map, HttpServletRequest request, @PathVariable Integer userId) {
        User user = userService.getUserById(userId);
        if (user != null) {
            FindaUserMessage(request, userId);
            if (user.getUserId() == ((User) request.getSession().getAttribute("loginUser")).getUserId())
                return userInfo(request);
            else {
                map.addAttribute("ThisUser", user);
                return "user/aboutUser";
            }
        } else return "error/404";
    }

    @RequestMapping("/userMessage-{userId}")
    public String userMessage(ModelMap map, HttpServletRequest request, @PathVariable Integer userId) {
        User user = userService.getUserById(userId);
        if (user != null) {
            FindaUserMessage(request, userId);
            if (user.getUserId() == ((User) request.getSession().getAttribute("loginUser")).getUserId())
                return userInfo(request);
            else {
                map.addAttribute("ThisUser", user);
                return "user/userMessage";
            }
        } else return "error/404";
    }

    @RequestMapping("/allFileComment")
    public String allNotReadFileComment(HttpServletRequest request) {
        FindNotReadFileComments(request, true);
        return "user/allFileComment";
    }

    @RequestMapping("/notReadMessages")
    public String notReadUserMessages(HttpServletRequest request) {
        FindNotReadUserMessages(request, false);
        return "user/notReadMessages";
    }

    @RequestMapping("/allMessages")
    public String allUserMessages(HttpServletRequest request) {
        FindNotReadUserMessages(request, true);
        return "user/allMessages";
    }

    @ResponseBody
    @RequestMapping("/register")
    public String register(ModelMap map, HttpServletRequest request) throws Exception {
        String userName = request.getParameter("userName");
        String password = MD5Util.getMD5(request.getParameter("password"));
        String email = request.getParameter("email");
        Date time = new java.sql.Date(new java.util.Date().getTime());
        User user = new User();
        user.setUserName(userName);
        user.setUserPassword(password);
        user.setUserEmail(email);
        user.setUserCreateTime(time);

        //生成序列码、过期日期、用户名字节编码串、未验证:更新currUser
        String serialCode = UUIDUtils.getUUID();
        Date overDate = DateUtils.getDateAfter(7);
        byte[] userNameEncodes = userName.getBytes("UTF-8");

        user.setUserValidateSerCode(serialCode);
        user.setUserValidateOverDate(overDate);
        user.setUserUserNameEncodes(String.valueOf(userNameEncodes));
        user.setUserIsEmailValidated(0);

        userService.saveUser(user);

        //生成URL查询串
        String validateStr = SystemUtils.getProjectURLPath(request) + "/user/validateInfo?email=" + email +
                "&validateSerCode=" + serialCode + "&userNameEncodes=" + String.valueOf(userNameEncodes) + "&type=register";

        //发送邮件
        JavaMailUtils.sendEmail("smtp.qq.com", "1036758468@qq.com", "qxukduhrlyxfbbbi", "1036758468@qq.com",
                new String[]{
                        email
                }, "验证信息-用于注册成功时候的验证", "请点击下面的安全链接,用于验证个人信息<br><a href='" + validateStr + "'>验证信息</a>", "text/html;charset=utf-8");

        return "user/index";
    }

    @ResponseBody
    @RequestMapping("/updateUserPassword/{id}")
    public Map<String, Object> updateUserPassword(ModelMap map, @PathVariable Integer id, HttpServletRequest request) {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        User user = userService.getUserById(id);
        if (user == null) {
            resultMap.put("updateRes", "no");
        } else {
            String password = MD5Util.getMD5(request.getParameter("password"));
            user.setUserPassword(password);
            userService.updateUser(user);
            resultMap.put("updateRes", "ok");
        }

        return resultMap;
    }

    @RequestMapping("/changePasswordTwo")
    public String changePasswordTwo(HttpServletRequest request) {
        return "user/changePasswordTwo";
    }

    @ResponseBody
    @RequestMapping("/updateUserPasswordTwo")
    public Map<String, Object> updateUserPasswordTwo(ModelMap map, HttpServletRequest request) {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        User user = (User)request.getSession().getAttribute("loginUser");
        if (user == null) {
            resultMap.put("updatepwd", "no");
        } else if (!MD5Util.getMD5(request.getParameter("oldpassword")).equals(user.getUserPassword())){
            resultMap.put("updatepwd", "not");
        } else {
            String password = MD5Util.getMD5(request.getParameter("password"));
            user.setUserPassword(password);
            userService.updateUser(user);
            resultMap.put("updatepwd", "ok");
        }
        return resultMap;
    }

    @RequestMapping("/validateInfo")
    public String validateUserInfo(ModelMap map, HttpServletRequest request) throws Exception {

        String email = request.getParameter("email");
        String validateSerCode = request.getParameter("validateSerCode");
        String userNameEncodes = request.getParameter("userNameEncodes");

        //验证的类型 type=register 表示是注册时候的验证
        String type = request.getParameter("type");

        System.out.println("验证信息: " + " -- " + email + " -- " + validateSerCode + " -- " + userNameEncodes);

        String validateRes = null;
        if (userNameEncodes == null || email == null || validateSerCode == null) {
            validateRes = "链接无效";
        } else {
            Map<String, Object> queryMap = new HashMap<String, Object>();
            queryMap.put("userEmail", email);
            queryMap.put("userValidateSerCode", validateSerCode);
            queryMap.put("userUserNameEncodes", userNameEncodes);

            List<User> userList = userService.findUsers(queryMap);
            if (userList != null && userList.size() > 0) {
                User valiUser = userList.get(0);

                //判断是否已经验证过了!
                if (valiUser.getUserIsEmailValidated() == 1) {
                    validateRes = "该链接已经验证过了!";
                } else {

                    valiUser.setUserIsEmailValidated(1);
                    userService.updateUser(valiUser);

                    if (valiUser.getUserValidateOverDate() != null) {
                        //获取记录,查看链接是否过期
                        if (DateUtils.isBeforeSpeciDate(DateUtils.getCurrentDate(), valiUser.getUserValidateOverDate())) {
                            map.put("valiUser", valiUser);

                            validateRes = "验证成功";
                        } else {
                            validateRes = "链接已失效!";
                        }
                    } else {
                        throw new RuntimeException("系统异常!!!!");
                    }
                }
            } else {
                validateRes = "链接无效";
            }
        }

        map.put("validateRes", validateRes);

        if (type != null && "register".equals(type)) {
            return "user/validateRegister1";
        }
        return "user/changePasswordOne";
    }

    @ResponseBody
    @RequestMapping("/findPassword")
    public Map<String, Object> findPassword(ModelMap map, HttpServletRequest request) throws Exception {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        User currUser = userService.findUserPassword(request.getParameter("userName"), request.getParameter("email"));
        if (currUser != null) {
            //生成序列码、过期日期、用户名字节编码串、未验证:更新currUser
            String serialCode = UUIDUtils.getUUID();
            Date overDate = DateUtils.getDateAfter(7);
            byte[] userNameEncodes = currUser.getUserName().getBytes("UTF-8");

            currUser.setUserValidateSerCode(serialCode);
            currUser.setUserValidateOverDate(overDate);
            currUser.setUserUserNameEncodes(String.valueOf(userNameEncodes));
            currUser.setUserIsEmailValidated(0);

            userService.updateUser(currUser);

            //生成URL查询串
            String validateStr =
                    SystemUtils.getProjectURLPath(request) + "/user/validateInfo?email=" + currUser.getUserEmail() + "&validateSerCode=" + serialCode + "&userNameEncodes=" + String.valueOf(userNameEncodes) + "";

            //发送邮件
            JavaMailUtils.sendEmail("smtp.qq.com", "1036758468@qq.com", "qxukduhrlyxfbbbi", "1036758468@qq.com",
                    new String[]{
                            currUser.getUserEmail()
                    }, "验证信息-用于找回密码", "请点击下面的安全链接,用于找回密码<br><a href='" + validateStr + "'>找回密码</a>", "text/html;charset=utf-8");

            resultMap.put("res", "yes");
        } else {
            resultMap.put("res", "no");
        }
        return resultMap;
    }

    @RequestMapping("/forgetPassword")
    public String forgetPassword(ModelMap map) {
        return "user/forgetPassword";
    }

    @RequestMapping("/index")
    public String index(HttpServletRequest request) {
        removeSession(request);
        indexSession(request);
        FindNotReadFileComments(request, false);
        FindNotReadUserMessages(request, false);
        return "user/index";
    }

    @ResponseBody
    @RequestMapping("/login")
    public Map<String, Object> userLogin(ModelMap map, HttpServletRequest request) throws Exception {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        String password = MD5Util.getMD5(request.getParameter("password"));
        User user = new User();
        user.setUserName(request.getParameter("userName"));
        user.setUserPassword(password);
        User currentUser = userService.queryUser(user);
        if (currentUser != null) {
            request.getSession().setAttribute("loginUser", currentUser);
            resultMap.put("res", "yes");
        } else {
            resultMap.put("res", "no");
        }
        return resultMap;
    }

    @RequestMapping("/logout")
    public String tologout(HttpServletRequest request) {
        removeSession(request);
        request.getSession().removeAttribute("loginUser");
        return "user/login";
    }

    @RequestMapping(value = "uploadFile", method = RequestMethod.POST)
    public String uploadFile(@RequestPart(value = "file", required = false)
                                     MultipartFile file, HttpServletRequest request, ModelMap model) throws Exception {
        if (!file.isEmpty()) {
            File newfile = new File();
            Filedata filedata = new Filedata();
            //获取文件后缀名
            String filename = file.getOriginalFilename();
            String prefix = filename.substring(filename.lastIndexOf(".") + 1);
            //修改后的文件名
            String fileUUIDname = filename.substring(0, filename.lastIndexOf(".")) + UUIDUtils.getUUID();
            //修改后的文件名(带后缀)
            String NewFileName = fileUUIDname + "." + prefix;
            newfile.setFileName(NewFileName);
            newfile.setFileSize(FileSizeUtils.getFjSize(String.valueOf(file.getSize())));
            newfile.setFileLoadTime(new java.sql.Date(new java.util.Date().getTime()));
            newfile.setFileUserId(((User) request.getSession().getAttribute("loginUser")).getUserId());
            if (request.getParameter("fileSecretLevel") != null) {
                if (request.getParameter("fileSecretLevel").equals("内部"))
                    newfile.setFileSecretLevel(2);
                else if (request.getParameter("fileSecretLevel").equals("C"))
                    newfile.setFileSecretLevel(3);
                else if (request.getParameter("fileSecretLevel").equals("B"))
                    newfile.setFileSecretLevel(4);
                else if (request.getParameter("fileSecretLevel").equals("A"))
                    newfile.setFileSecretLevel(5);
                else newfile.setFileSecretLevel(1);
            }
            newfile.setFileAbstrcat((request.getParameter("abstrcat") != null) ?
                    request.getParameter("abstrcat") : "");
            newfile.setFileShare((request.getParameter("Share") != null) ? 1 : 0);
            String isPng[] = {"7Z", "ACCDB", "AVI", "BMP", "CSS", "CSV", "DLL", "DOC", "DOCX", "DWG", "EML", "EPS", "FILE",
                    "FLA", "FON", "GIF", "HLP", "HTML", "IND", "INI", "JPEG", "JPG", "JSF", "MDB", "MIDI", "MOV", "MP3", "MP4",
                    "MPG", "MPEG", "ODBC", "OGG", "PDF", "PHP", "PNG", "PPS", "PPSX", "PPT", "PPTX", "PROJ",
                    "PSD", "PST", "PUB", "RAR", "REG", "RTF", "SEF", "SQL", "SWF", "SYS", "TAR", "TIF", "TIFF",
                    "TTF", "TXT", "URL", "VSD", "WAV", "WMA", "WMV", "XLS", "XLSX", "XML", "ZIP"};
            int i = 0;
            prefix = prefix.toUpperCase();
            for (i = 0; i < isPng.length; i++) {
                if (isPng[i].equals(prefix))
                    break;
            }
            if (i == isPng.length)
                prefix = "README";
            newfile.setFileType(prefix);
            String key = KeyCreate(16);
            newfile.setFileSecretKey(key);
            fileService.addFile(newfile);
            newfile = fileService.findFileByFileName(newfile.getFileName());
            filedata.setFileId(newfile.getFileId());
            filedata.setFileData(aesEncryptToBytes(base64Encode(file.getBytes()), key));
            filedataService.saveFiledata(filedata);
            if (newfile.getFileShare().equals(1)) {
                Filelimit filelimit = new Filelimit();
                filelimit.setFileId(newfile.getFileId());
                filelimit.setFileRead((request.getParameter("fileRead") != null) ? 1 : 0);
                filelimit.setFileWrite((request.getParameter("fileWrite") != null) ? 1 : 0);
                filelimit.setFilePrint((request.getParameter("filePrint") != null) ? 1 : 0);
                filelimit.setFileReadTimes(Integer.parseInt((request.getParameter("fileReadTimes") != null &&
                        !("".equals(request.getParameter("fileReadTimes")))) ?
                        request.getParameter("fileReadTimes") : "-1"));
                if (request.getParameter("fileLifeCycle") == null || request.getParameter("fileLifeCycle").equals("")) {
                    filelimit.setFileLifeCycle(DateUtils.getDateAfter(356));
                } else {
                    filelimit.setFileLifeCycle(DateUtils.strToDate(request.getParameter("fileLifeCycle"), "yyyy-MM-dd"));
                }
                filelimitService.saveFilelimit(filelimit);
            }
            Log log = new Log();
            log.setLogUserId(((User) request.getSession().getAttribute("loginUser")).getUserId());
            log.setLogFileId(newfile.getFileId());
            log.setLogOptype(1);
            log.setLogTime(DateUtils.getCurrentDate());
            log.setLogSignature(MD5Util.getMD5(log.toString()) + file.toString());
            logService.addLog(log);
        }
        return "user/newFile";
    }

    @RequestMapping(value = "/download-{fileId}")
    public ResponseEntity<byte[]> download(HttpServletRequest request, @PathVariable("fileId") int fileId) throws Exception {
        Filedata filedata = filedataService.getFiledataById(fileId);
        if (filedata != null) {
            File file = fileService.getFileById(filedata.getFileId());
            if (((User) request.getSession().getAttribute("loginUser")).getUserSecretLevel() >= file.getFileSecretLevel()) {
                String key = file.getFileSecretKey();
                byte[] UNAESFILE = base64Decode(aesDecryptByBytes(filedata.getFileData(), key));
                String filename = file.getFileName();
                HttpHeaders headers = new HttpHeaders();
                //下载显示的文件名，解决中文名称乱码问题
                String downloadFielName = new String(filename.getBytes("UTF-8"), "iso-8859-1");
                //通知浏览器以attachment（下载方式）打开图片
                headers.setContentDispositionFormData("attachment", downloadFielName);
                //application/octet-stream ： 二进制流数据（最常见的文件下载）。
                headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
                file.setFileDownloadtimes(file.getFileDownloadtimes() + 1);
                file.setFilePrinttimes(file.getFilePrinttimes() + 1);
                fileService.updateFile(file);
                Log log = new Log();
                log.setLogUserId(((User) request.getSession().getAttribute("loginUser")).getUserId());
                log.setLogFileId(fileId);
                log.setLogOptype(4);
                log.setLogTime(DateUtils.getCurrentDate());
                log.setLogSignature(MD5Util.getMD5(log.toString()) + file.toString());
                logService.addLog(log);
                return new ResponseEntity<byte[]>(UNAESFILE, headers, HttpStatus.CREATED);
            }
            return null;
        }
        return null;
    }

    @ResponseBody
    @RequestMapping("uploadUserImg")
    public AjaxResult uploadUserImg(@RequestParam(value = "avatar_file", required = false) MultipartFile file,
                                    @RequestParam("avatar_data") String avatar_data, HttpServletRequest request) throws IOException {
        //获得裁剪数据
        GraphicData graphicData = JSONObject.parseObject(avatar_data, GraphicData.class);
        //获得文件名
        String fileName = file.getOriginalFilename();
        //获取扩展名
        String extension = fileName.substring(fileName.lastIndexOf("."));
        //检测允许上传的文件类型
        if (!Pattern.matches("\\.(jpg|jpeg|png|gif)$", extension)) {
            return new AjaxResult(false, "文件类型不允许");
        }
        //根据日期生成保存路径
        String folderPath = "/resources/img/userPicture/";// + CommonUtils.getDateStr() + "/";
        String realFolderPath = request.getServletContext().getRealPath(folderPath);
        java.io.File savedPath = new java.io.File(realFolderPath);
        //路径不存在则创建
        if (!savedPath.exists()) {
            savedPath.mkdir();
        }
        //设置裁剪后的突破大小
        int width = 360;
        int height = 360;
        User user = (User) request.getSession().getAttribute("loginUser");
        String savedFileName = user.getUserId() + ".png";
        java.io.File savedFile = new java.io.File(realFolderPath, savedFileName);
        //裁剪图片并保存
        Thumbnails.of(file.getInputStream()).sourceRegion(graphicData.getX(), graphicData.getY(), graphicData.getW(),
                graphicData.getH()).size(width, height).outputFormat("png").toFile(savedFile);
        //保存新的url到session
        request.getSession().setAttribute("url", folderPath + savedFileName);
        user.setUserPictureUrl(folderPath + savedFileName);
        userService.updateUser(user);
        return new AjaxResult(true, "图片上传成功", folderPath + savedFileName);
    }

    //该用户文件评论 all--true所有评论，all--false未读评论
    private void FindNotReadFileComments(HttpServletRequest request, boolean all) {
        int id = ((User) request.getSession().getAttribute("loginUser")).getUserId();
        List<Comment> commentList;
        if (all)
            commentList = commentService.findComment(new HashMap<String, Object>());
        else
            commentList = commentService.findCommentByisRead(0);
        List<File> fileList = new ArrayList<File>();
        List<Comment> comments = new ArrayList<Comment>();
        List<User> users = new ArrayList<User>();
        for (Comment c : commentList) {
            File file = fileService.getFileById(c.getComRecevier());
            if (file.getFileUserId() == id && c.getComSender() != id) {
                comments.add(c);
                fileList.add(file);
                users.add(userService.getUserById(c.getComSender()));
            }
        }
        if (all)
            request.getSession().setAttribute("commentsSize", comments.size());
        request.getSession().setAttribute("notReadFileComments", comments);
        request.getSession().setAttribute("notReadFileCommentsSender", users);
        request.getSession().setAttribute("notReadFileCommentFiles", fileList);
    }

    //该用户消息 all--true所有消息，all--false未读消息
    private void FindNotReadUserMessages(HttpServletRequest request, boolean all) {
        int id = ((User) request.getSession().getAttribute("loginUser")).getUserId();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("msgReceiver", id);
        map.put("isRead", 0);
        List<Message> messages;
        if (all)
            messages = messageService.findMessagesByRecevierId(id);
        else
            messages = messageService.findMessage(map);
        List<Message> messageList = new ArrayList<Message>();
        List<User> users = new ArrayList<User>();
        for (Message message : messages) {
            if (message.getMsgSender() != id) {
                users.add(userService.getUserById(message.getMsgSender()));
                messageList.add(message);
            }
        }
        request.getSession().setAttribute("notReadMessages", messageList);
        request.getSession().setAttribute("notReadMessagesSender", users);
    }

    //该用户近期文件
    private void FindRecentFile(HttpServletRequest request) {
        List<File> files = fileService.findFileByUserId(((User) request.getSession().getAttribute("loginUser")).getUserId());
        List<User> users = new ArrayList<User>();
        List<File> fileList = new ArrayList<File>();
        Date date = DateUtils.getDateAfter(-5);
        for (File file : files) {
            if (DateUtils.isBeforeSpeciDate(date, file.getFileLoadTime())) {
                fileList.add(file);
                users.add(userService.getUserById(file.getFileUserId()));
            }
        }
        request.getSession().setAttribute("RecentFiles", fileList);
        request.getSession().setAttribute("RecentFileUsers", users);
    }

    //该用户共享文件
    private void FindEnjoyFile(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("fileUserId", ((User) request.getSession().getAttribute("loginUser")).getUserId());
        map.put("fileShare", 1);
        List<File> files = fileService.findFiles(map);
        List<Integer> EnjoyFileComment = new ArrayList<Integer>();
        int count = 0;
        for (File f : files) {
            count += f.getFileViewtimes();
            EnjoyFileComment.add(commentService.findCommentByRecevierId(f.getFileId()).size());
        }
        request.getSession().setAttribute("EnjoyFilesViewtimes", count);
        request.getSession().setAttribute("EnjoyFiles", files);
        request.getSession().setAttribute("EnjoyFileComment", EnjoyFileComment);
    }

    //该用户私人文件
    private void FindPrivateFile(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("fileUserId", ((User) request.getSession().getAttribute("loginUser")).getUserId());
        map.put("fileShare", 0);
        List<File> files = fileService.findFiles(map);
        request.getSession().setAttribute("PrivateFile", files);
    }

    //近期共享文件
    private void FindwebRecentFile(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("fileShare", 1);
        List<File> files = fileService.findFiles(map);
        List<User> users = new ArrayList<User>();
        List<File> fileList = new ArrayList<File>();
        Date date = DateUtils.getDateAfter(-1);
        for (File file : files) {
            if (DateUtils.isBeforeSpeciDate(date, file.getFileLoadTime())) {
                fileList.add(file);
                users.add(userService.getUserById(file.getFileUserId()));
            }
        }
        request.getSession().setAttribute("WebRecentFiles", fileList);
        request.getSession().setAttribute("WebRecentFileUsers", users);
    }

    //共享文件
    private void FindwebEnjoyFile(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("fileShare", 1);
        List<File> files = fileService.findFiles(map);
        List<User> users = new ArrayList<User>();
        for (File file : files) {
            users.add(userService.getUserById(file.getFileUserId()));
        }
        request.getSession().setAttribute("WebEnjoyFile", files);
        request.getSession().setAttribute("WebEnjoyFileUsers", users);
    }

    //和某个用户的聊天记录
    private void FindaUserMessage(HttpServletRequest request, Integer id) {
        List<Message> messages = messageService.queryMessage(id, ((User) request.getSession().getAttribute("loginUser")).getUserId());
        for (Message m : messages) {
            if (m.getMsgSender() == id) {
                m.setIsRead(1);
                messageService.updateMessage(m);
            }
        }
        request.getSession().setAttribute("aUserMessage", messages);
    }

    //某个文件的评论
    private void FindaFileComments(HttpServletRequest request, Integer id) {
        List<Comment> commentList = commentService.findCommentByRecevierId(id);
        List<User> userList = new ArrayList<User>();
        for (Comment c : commentList) {
            userList.add(userService.getUserById(c.getComSender()));
        }
        request.getSession().setAttribute("aFileCommentUsers", userList);
        request.getSession().setAttribute("aFileComments", commentList);
    }

    //index
    private void indexSession(HttpServletRequest request) {
        FindNotReadFileComments(request, true);
        FindPrivateFile(request);
        FindEnjoyFile(request);
    }

    //removeSession
    private void removeSession(HttpServletRequest request) {
        request.getSession().removeAttribute("commentsSize");
        request.getSession().removeAttribute("notReadFileComments");
        request.getSession().removeAttribute("notReadFileCommentsSender");
        request.getSession().removeAttribute("notReadFileCommentFiles");
        request.getSession().removeAttribute("notReadMessages");
        request.getSession().removeAttribute("notReadMessagesSender");
        request.getSession().removeAttribute("RecentFiles");
        request.getSession().removeAttribute("RecentFileUsers");
        request.getSession().removeAttribute("EnjoyFilesViewtimes");
        request.getSession().removeAttribute("EnjoyFiles");
        request.getSession().removeAttribute("EnjoyFileComment");
        request.getSession().removeAttribute("PrivateFile");
        request.getSession().removeAttribute("WebRecentFiles");
        request.getSession().removeAttribute("WebRecentFileUsers");
        request.getSession().removeAttribute("WebEnjoyFile");
        request.getSession().removeAttribute("WebEnjoyFileUsers");
        request.getSession().removeAttribute("aUserMessage");
        request.getSession().removeAttribute("aFileCommentUsers");
        request.getSession().removeAttribute("aFileComments");
        request.getSession().removeAttribute("Comlist");
        request.getSession().removeAttribute("Senderlist");
        request.getSession().removeAttribute("Filelist");
        request.getSession().removeAttribute("Messagelist");
        request.getSession().removeAttribute("Senderlist");
        request.getSession().removeAttribute("Receiverlist");
        request.getSession().removeAttribute("Userfiles");
        request.getSession().removeAttribute("Namelist");
        request.getSession().removeAttribute("size");
    }

    @ResponseBody
    @RequestMapping(value = "/Msg_send")
    public String Msg_send(HttpServletRequest request, ModelMap map) throws Exception {
        int userId = Integer.parseInt(request.getParameter("userId"));
        String msg = request.getParameter("msg");
        User user = userService.getUserById(userId);
        if (user != null) {
            Message message = new Message();
            Date time = new java.sql.Date(new java.util.Date().getTime());
            message.setIsRead(0);
            message.setMsgData(msg);
            message.setMsgReceiver(userId);
            message.setMsgSender(((User) request.getSession().getAttribute("loginUser")).getUserId());
            message.setMsgSendtime(time);
            messageService.addMessage(message);
            FindaUserMessage(request, userId);
            if (user.getUserId() == ((User) request.getSession().getAttribute("loginUser")).getUserId())
                return userInfo(request);
            else {
                map.addAttribute("ThisUser", user);
                return "user/aboutUser";
            }
        } else return "error/404";
    }

    @RequestMapping("/myLog")
    public String myLog(HttpServletRequest request, ModelMap map) throws Exception {
        int id = ((User) request.getSession().getAttribute("loginUser")).getUserId();
        List<String> file = new ArrayList<String>();
        List<Log> loglist = logService.findLogByUserID(id);
        for (Log log : loglist) {
            file.add(fileService.getFileById(log.getLogFileId()).getFileName());
        }
        map.addAttribute("loglist", loglist);
        map.addAttribute("filelist", file);
        return "user/myLog";
    }

    @RequestMapping("/myFileLog")
    public String myFileLog(HttpServletRequest request, ModelMap map) throws Exception {
        int id = ((User) request.getSession().getAttribute("loginUser")).getUserId();
        List<File> Files = fileService.findFileByUserId(id);
        List<Log> loglist = logService.findLogByFileIds(Files);
        List<String> file = new ArrayList<String>();
        for (Log log : loglist) {
            file.add(fileService.getFileById(log.getLogFileId()).getFileName());
        }
        map.addAttribute("loglist", loglist);
        map.addAttribute("filelist", file);
        return "user/myFileLog";
    }

    @ResponseBody
    @RequestMapping("/Log_delete")
    public void Log_delete(HttpServletRequest request) throws Exception {
        int id = Integer.parseInt(request.getParameter("logid"));
        Log log = logService.getLogById(id);
        logService.deleteLog(log);
        return;
    }

    @RequestMapping("/search_Commonfile")
    public String search_Commonfile(HttpServletRequest request) throws Exception {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        String name = request.getParameter("name");
        int type = Integer.parseInt(request.getParameter("type"));
        System.out.println(name + type);
        List<List<File>> list = fileService.findUserFiles();
        List<List<File>> filelist = new ArrayList<List<File>>();
        List<String> namelist = new ArrayList<String>();

        if (type == 0) {
            filelist = SearchUtils.search_file_name(name, list);
        } else if (type == 1) {
            List<List<File>> results = new ArrayList<List<File>>();
            Pattern pattern = Pattern.compile(name);
            for (int i = 0; i < list.size(); i++) {
                System.out.println("外");
                List<File> result = new ArrayList<File>();
                for (int j = 0; j < list.get(i).size(); j++) {
                    System.out.println("内");
                    Matcher matcher = pattern.matcher(userService.findUsernameBuId(list.get(i).get(j).getFileUserId()));
                    if (matcher.find()) {
                        System.out.println(j);
                        result.add(list.get(i).get(j));
                    }
                }
                results.add(result);
            }
            filelist = results;
        } else {
            filelist = SearchUtils.search_file_type(name, list);
        }


        for (List<File> Filelist : filelist) {
            List<File> dellist = new ArrayList<File>();
            for (File File : Filelist) {
                if (File.getFileShare() == 0) {
                    dellist.add(File);
                }
            }
            Filelist.removeAll(dellist);
        }
        int size = 0;
        for (List<File> Filelist : filelist) {
            if (Filelist.size() != 0)
                namelist.add(userService.findUsernameBuId(Filelist.get(0).getFileUserId()));
            else
                continue;
        }
        List<List<File>> List = new ArrayList<List<File>>();
        for (List<File> Filelist : filelist) {
            if (Filelist.size() != 0)
                List.add(Filelist);
            else
                continue;
        }
        for (List<File> Filelist : filelist) {
            for (File file : Filelist) {
                size++;
            }
        }
        System.out.println(List);
        System.out.println(namelist);
        System.out.println(size);
        request.getSession().setAttribute("Userfiles", List);
        request.getSession().setAttribute("Namelist", namelist);
        request.getSession().setAttribute("size", size);
        resultMap.put("Userfiles", list);
        return "user/findWebfile_result";
    }

    @RequestMapping("/search_Myfile")
    public String search_Myfile(HttpServletRequest request) throws Exception {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        String name = request.getParameter("name");
        int type = Integer.parseInt(request.getParameter("type"));
        int id = ((User) request.getSession().getAttribute("loginUser")).getUserId();
        List<File> list = fileService.findFileByUserId(id);
        List<File> filelist = new ArrayList<File>();
        if (type == 0) {
            filelist = SearchUtils.search_myfile_name(name, list);
        } else if (type == 1) {

            filelist = SearchUtils.search_myfile_data(name, list);
        } else {
            filelist = SearchUtils.search_myfile_type(name, list);
        }
        request.getSession().setAttribute("filelist", filelist);
        resultMap.put("filelist", filelist);
        return "user/findMyFile_result";
    }

    @RequestMapping("/search_mymsg")
    public String search_msg(HttpServletRequest request) throws Exception {
        int id = ((User) request.getSession().getAttribute("loginUser")).getUserId();
        System.out.println(id);
        Map<String, Object> resultMap = new HashMap<String, Object>();
        String name = request.getParameter("name");
        int type = Integer.parseInt(request.getParameter("type"));
        System.out.println(name + type);
        List<Message> list = messageService.findMessagesById(id);
        System.out.println(list);
        List<Message> msglist = new ArrayList<Message>();
        List<User> senderlist = new ArrayList<User>();
        List<User> receicerlist = new ArrayList<User>();
        if (type == 0) {
            List results = new ArrayList();
            Pattern pattern = Pattern.compile(name);
            for (int i = 0; i < list.size(); i++) {
                int senderid = list.get(i).getMsgSender();
                if (senderid > 10000) {
                    Matcher matcher = pattern.matcher(userService.findUsernameBuId(senderid));
                    if (matcher.find()) {
                        results.add(list.get(i));
                    }
                } else {
                    Matcher matcher = pattern.matcher(adminService.findAdminnameById(senderid));
                    if (matcher.find()) {
                        results.add(list.get(i));
                    }
                }
            }
            msglist = results;
        } else if (type == 1) {
            List results = new ArrayList();
            Pattern pattern = Pattern.compile(name);
            for (int i = 0; i < list.size(); i++) {
                int receiverid = list.get(i).getMsgReceiver();
                if (receiverid > 10000) {
                    Matcher matcher = pattern.matcher(userService.findUsernameBuId(receiverid));
                    if (matcher.find()) {
                        results.add(list.get(i));
                    }
                } else {
                    Matcher matcher = pattern.matcher(adminService.findAdminnameById(receiverid));
                    if (matcher.find()) {
                        results.add(list.get(i));
                    }
                }
            }
            msglist = results;
        } else {
            msglist = SearchUtils.search_msg_data(name, list);
        }
        for (Message message : msglist) {
            int senderid = message.getMsgSender();

            senderlist.add(userService.getUserById(senderid));
        }
        for (Message message : msglist) {
            int receiverid = message.getMsgReceiver();

            receicerlist.add(userService.getUserById(receiverid));
        }
        request.getSession().setAttribute("Messagelist", msglist);
        request.getSession().setAttribute("Senderlist", senderlist);
        request.getSession().setAttribute("Receiverlist", receicerlist);

        resultMap.put("msglist", msglist);
        resultMap.put("res", "yes");
        return "user/findMessage_result";
    }

    @RequestMapping("/search_Mycomment")
    public String search_Mycomment(HttpServletRequest request) throws Exception {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        String name = request.getParameter("name");
        int id = ((User) request.getSession().getAttribute("loginUser")).getUserId();
        List<File> files = fileService.findFileByUserId(id);
        List<Comment> comlist = new ArrayList<Comment>();
        List<Comment> list = commentService.findCommentByfiles(files);
        List<User> senderlist = new ArrayList<User>();
        List<File> filelist = new ArrayList<File>();
        List results = new ArrayList();
        Pattern pattern = Pattern.compile(name);
        for (int i = 0; i < list.size(); i++) {
            int receiverid = list.get(i).getComRecevier();
            Matcher matcher = pattern.matcher(fileService.getFileById(receiverid).getFileName());
            if (matcher.find()) {
                results.add(list.get(i));
            }
        }
        comlist = results;
        for (Comment comment : comlist) {
            filelist.add(fileService.getFileById(comment.getComRecevier()));
            senderlist.add(userService.getUserById(comment.getComSender()));
        }

        request.getSession().setAttribute("Comlist", comlist);
        request.getSession().setAttribute("Senderlist", senderlist);
        request.getSession().setAttribute("Filelist", filelist);

        return "user/findComment_result";
    }

    @ResponseBody
    @RequestMapping("/User_edit")
    public  Map<String,Object> User_edit(HttpServletRequest request) throws Exception{
        Map<String, Object> resultMap = new HashMap<String, Object>();
        String Email=request.getParameter("Email");
        String Tel=request.getParameter("Tel");
        String Profile=request.getParameter("Profile");
        String realName=request.getParameter("realName");
        String company=request.getParameter("company");
        int sex=Integer.parseInt(request.getParameter("sex"));
        Date Birthday=DateUtils.strToDate(request.getParameter("Birthday"), "yyyy-MM-dd");

        User user=userService.getUserById(((User) request.getSession().getAttribute("loginUser")).getUserId());
        user.setUserEmail(Email);
        user.setUserTel(Tel);
        if (Profile!=null&&!"".equals(Profile))
            user.setUserProfile(Profile);
        user.setUserRealname(realName);
        user.setUserSex(sex);
        user.setUserBirthday(Birthday);
        user.setUserCompany(company);
        userService.updateUser(user);

        User currentUser = userService.queryUser(user);
        if (currentUser != null) {
            resultMap.put("LoginUserId", currentUser.getUserId());
            resultMap.put("res", "yes");
            HttpSession session = request.getSession();
            session.setAttribute("loginUser", currentUser);
        } else {
            resultMap.put("res", "no");
        }
        return resultMap;
    }



}