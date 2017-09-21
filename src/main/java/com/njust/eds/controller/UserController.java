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
            map.addAttribute("fileInfo", file);
            return "user/fileInfo";
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

    @RequestMapping("/findFile")
    public String findFile(HttpServletRequest request) {
        //FindwebEnjoyFile(request);
        return "user/findFile";
    }

    @RequestMapping("/notReadFileComment")
    public String notReadFileComment(HttpServletRequest request) {
        FindNotReadFileComment(request);
        return "user/notReadFileComment";
    }

    @RequestMapping("/readComment-{comId}")
    public String readComment(ModelMap map, HttpServletRequest request, @PathVariable Integer comId) {
        Comment comment = commentService.findCommentById(comId);
        if (comment != null) {
            File file = fileService.getFileById(comment.getComRecevier());
            User user = userService.getUserById(comment.getComSender());
            if (file != null && user != null) {
                map.addAttribute("ThisComment", comment);
                map.addAttribute("ThisFile", file);
                map.addAttribute("ThisUser", user);
                return "user/readComment";
            } else return "error/404";
        } else return "error/404";
    }

    @RequestMapping("/aboutUser-{userId}")
    public String aboutUser(ModelMap map, HttpServletRequest request, @PathVariable Integer userId) {
        User user = userService.getUserById(userId);
        int myid=((User) request.getSession().getAttribute("loginUser")).getUserId();
        System.out.println(userId);
        List<Message> usermessage= messageService.Messagelist(myid,userId);
        if (user != null) {
           map.addAttribute("aUserMessage",usermessage);
            System.out.println(usermessage.get(0).getMsgData());
            System.out.println(usermessage.get(1).getMsgData());

            if (user.getUserId() == ((User) request.getSession().getAttribute("loginUser")).getUserId())
                return "user/userInfo";
            map.addAttribute("ThisUser", user);

            return "user/newMessage";
        } else return "error/404";
    }

    @RequestMapping("/allNotReadFileComment")
    public String allNotReadFileComment(HttpServletRequest request) {
        FindAllNotReadFileComment(request);
        return "user/allNotReadFileComment";
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
        return "user/validateInfo";
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
        FindNotReadFileComments(request);
        FindNotReadMessages(request);
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
        HttpSession session = request.getSession();
        session.removeAttribute("loginUser");
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
            String fileUUIDname = filename.substring(0, filename.lastIndexOf(".") - 1) + UUIDUtils.getUUID();
            //修改后的文件名(带后缀)
            String NewFileName = fileUUIDname + "." + prefix;
            newfile.setFileName(NewFileName);
            newfile.setFileSize(FileSizeUtils.getFjSize(String.valueOf(file.getSize())));
            newfile.setFileLoadTime(new java.sql.Date(new java.util.Date().getTime()));
            newfile.setFileUserId(((User) request.getSession().getAttribute("loginUser")).getUserId());
            newfile.setFileSecretLevel(Integer.parseInt((request.getParameter("fileSecretLevel") != null) ?
                    request.getParameter("fileSecretLevel") : "1"));
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
                filelimit.setFileRead((request.getParameter("fileRead") != null) ? 1 : 0);
                filelimit.setFileWrite((request.getParameter("fileWrite") != null) ? 1 : 0);
                filelimit.setFilePrint((request.getParameter("filePrint") != null) ? 1 : 0);
                filelimit.setFileReadTimes(Integer.parseInt((request.getParameter("fileReadTimes") != null) ?
                        request.getParameter("fileReadTimes") : "-1"));
                if (request.getParameter("fileLifeCycle") == null) {
                    filelimit.setFileLifeCycle(DateUtils.getDateAfter(356));
                } else {
                    filelimit.setFileLifeCycle(DateUtils.strToDate(request.getParameter("fileLifeCycle"), "yyyy-MM-dd"));
                }
                filelimitService.saveFilelimit(filelimit);
            }
        }
        return "user/newFile";
    }

    @RequestMapping(value = "/download/{fileId}", method = RequestMethod.POST)
    public ResponseEntity<byte[]> download(HttpServletRequest request,
                                           @PathVariable("fileId") int fileId) throws Exception {
        Filedata filedata = filedataService.getFiledataById(fileId);
        if (filedata != null) {
            File file = fileService.getFileById(filedata.getFileId());
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
            return new ResponseEntity<byte[]>(UNAESFILE, headers, HttpStatus.CREATED);
        }
        return null;
    }

    @ResponseBody
    @RequestMapping("uploadUserImg")
    public AjaxResult uploadUserImg(@RequestParam(value = "avatar_file", required = false) MultipartFile file,
                                    @RequestParam("avatar_data") String avatar_data, HttpServletRequest request)
            throws IOException {
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

    //该用户未读文件评论
    private void FindNotReadFileComments(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        //commentService.findComment()
        List<File> files = fileService.findFileByUserId(((User) request.getSession().getAttribute("loginUser")).getUserId());
        List<Comment> comments = new ArrayList<Comment>();
        List<Comment> commentList = new ArrayList<Comment>();
        List<User> users = new ArrayList<User>();
        for (File f : files) {
            map.put("comRecevier", f.getFileId());
            commentList = commentService.findComment(map);
            for (Comment c : commentList) {
                if (c.getIsRead() == 0) {
                    users.add(userService.getUserById(c.getComSender()));
                    comments.add(c);
                }
            }
        }
        request.getSession().setAttribute("notReadFileComments", comments);
        request.getSession().setAttribute("notReadFileCommentsSender", users);
    }

    //该用户未读消息
    private void FindNotReadMessages(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        List<Message> messages = messageService.findMessagesByRecevierId(((User) request.getSession().getAttribute("loginUser")).getUserId());
        List<Message> messageList = new ArrayList<Message>();
        List<User> users = new ArrayList<User>();
        for (Message message : messages) {
            if (message.getIsRead() == 0) {
                users.add(userService.getUserById(message.getMsgSender()));
                messageList.add(message);
            }
        }
        request.getSession().setAttribute("notReadMessages", messageList);
        request.getSession().setAttribute("notReadMessagesSender", users);
    }

    //该用户近期文件
    private void FindRecentFile(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
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
        List<Comment> comments = new ArrayList<Comment>();
        map.put("fileShare", 1);
        List<File> files = fileService.findFiles(map);
        List<Integer> EnjoyFileComment = new ArrayList<Integer>();
        for (File f : files) {
            EnjoyFileComment.add(commentService.findCommentByRecevierId(f.getFileId()).size());
        }
        request.getSession().setAttribute("EnjoyFiles", files);
        request.getSession().setAttribute("EnjoyFileComment", EnjoyFileComment);
    }

    //该用户私人文件
    private void FindPrivateFile(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("fileUserId", ((User) request.getSession().getAttribute("loginUser")).getUserId());
        map.put("fileShare", 0);
        List<File> files = fileService.findFiles(map);
//        List<User> users = new ArrayList<User>();
//        List<File> fileList = new ArrayList<File>();
//        for (File file : files) {
//            if (file.getFileShare()-1==0) {
//                fileList.add(file);
//                users.add(userService.getUserById(file.getFileUserId()));
//            }
//        }
        request.getSession().setAttribute("PrivateFile", files);
        //request.getSession().setAttribute("EnjoyFileUsers", users);
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

    //未读评论
    private void FindNotReadFileComment(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("isRead", 0);
        List<Comment> comments = commentService.findCommentByisRead(0);
        List<File> files = fileService.findFileByUserId(((User) request.getSession().getAttribute("loginUser")).getUserId());
        List<Comment> commentList = new ArrayList<Comment>();
        List<File> fileList = new ArrayList<File>();
        for (Comment c : comments) {
            for (File f : files) {
                if (f.getFileId() == c.getComRecevier()) {
                    commentList.add(c);
                    fileList.add(f);
                    break;
                }
            }
        }
        List<User> users = new ArrayList<User>();
        for (Comment comment : commentList) {
            users.add(userService.getUserById(comment.getComSender()));
        }
        request.getSession().setAttribute("NotReadFileComment", commentList);
        request.getSession().setAttribute("NotReadFileCommentUsers", users);
        request.getSession().setAttribute("NotReadFileCommentFiles", fileList);
    }

    //所有评论
    private void FindAllNotReadFileComment(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        List<Comment> comments = commentService.findComment(map);
        List<File> files = fileService.findFileByUserId(((User) request.getSession().getAttribute("loginUser")).getUserId());
        List<Comment> commentList = new ArrayList<Comment>();
        List<File> fileList = new ArrayList<File>();
        for (Comment c : comments) {
            for (File f : files)
                if (f.getFileId() == c.getComRecevier()) {
                    commentList.add(c);
                    fileList.add(f);
                    break;
                }
        }
        List<User> users = new ArrayList<User>();
        for (Comment comment : commentList) {
            users.add(userService.getUserById(comment.getComSender()));
        }
        request.getSession().setAttribute("NotReadFileComment", commentList);
        request.getSession().setAttribute("NotReadFileCommentUsers", users);
        request.getSession().setAttribute("NotReadFileCommentFiles", fileList);
    }

    //和某个用户的聊天记录
    private void FindaUserMessage(HttpServletRequest request, Integer id) {
        List<Message> messages = messageService.queryMessage(id, ((User) request.getSession().getAttribute("loginUser")).getUserId());
        List<Message> messageList = messageService.queryMessage(((User) request.getSession().getAttribute("loginUser")).getUserId(), id);
        List<Message> messagesdesc = new ArrayList<Message>();
        int i = 0;
        int j = 0;
        for (i = 0, j = 0; i < messageList.size() && j < messages.size(); ) {
            if (DateUtils.isBeforeSpeciDate(messageList.get(i).getMsgSendtime(), messages.get(j).getMsgSendtime())) {
                messagesdesc.add(messages.get(j));
                j++;
            } else {
                messagesdesc.add(messageList.get(i));
                i++;
            }
        }
        if (i < messageList.size())
            for (; i < messageList.size(); i++)
                messagesdesc.add(messageList.get(i));
        if (j < messages.size())
            for (; j < messages.size(); j++)
                messagesdesc.add(messages.get(j));
        request.getSession().setAttribute("aUserMessage", messagesdesc);
        System.out.println(messageList.get(0).getMsgData());
        System.out.println(messageList.get(1).getMsgData());
    }

}