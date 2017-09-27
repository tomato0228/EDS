
/*获取顶部选项卡总长度*/

function tabNavallwidth(){
	var taballwidth=0,
		$tabNav = $(".acrossTab"),
		$tabNavWp = $(".Hui-tabNav-wp"),
		$tabNavitem = $(".acrossTab li"),
		$tabNavmore =$(".Hui-tabNav-more");
	if (!$tabNav[0]){return;}
	$tabNavitem.each(function(index, element) {
        taballwidth+=Number(parseFloat($(this).width()+60));
    });
	$tabNav.width(taballwidth+25);
	var w = $tabNavWp.width();
	if(taballwidth+25>w){
		$tabNavmore.show();
	}
	else{
		$tabNavmore.hide();
		$tabNav.css({left:0});
	}
}

/*全选*/
$("table thead th input:checkbox").on("click" , function(){
	var that = this;
	$(this).closest("table").find("tr > td:first-child input:checkbox").each(function(){
		this.checked = that.checked;
		$(this).closest("tr").toggleClass("selected");
	});
});
/*批量删除*/
function datadel(){
    var chckBox = document.getElementsByName("chckBox");
    var num = chckBox.length;
    var ids =new Array();
    for(var index =0 ,i=0; index<num ; index++){
        if(chckBox[index].checked){
            ids[i]=chckBox[index].value;
            i++;
        }
    }
    if(ids!=""){

        if(window.confirm("确定删除所选记录？")){
            $.ajax( {
                type : "post",
                traditional: true,
                url : '/admin/DeleteUsers', //要自行删除的action
				data:{"ids": ids},
                success:function(data){
						window.location.reload();
                },
                error : function(data) {
                    alert("系统错误，删除失败");
                }
            });

        }
    }else{
        alert("请选择要删除的记录");
    }
}

function datadel_file(){
    var chckBox = document.getElementsByName("chckBox");
    var num = chckBox.length;
    var ids =new Array();
    for(var index =0 ,i=0; index<num ; index++){
        if(chckBox[index].checked){
            ids[i]=chckBox[index].value;
            i++;
        }
    }
    if(ids!=""){

        if(window.confirm("确定删除所选记录？")){
            $.ajax( {
                type : "post",
                traditional: true,
                url : '/admin/DeleteFiles', //要自行删除的action
                data:{"ids": ids},
                success:function(data){
                    window.location.reload();
                },
                error : function(data) {
                    alert("系统错误，删除失败");
                }
            });

        }
    }else{
        alert("请选择要删除的记录");
    }
}

function datadel_log(){
    var chckBox = document.getElementsByName("chckBox");
    var num = chckBox.length;
    var ids =new Array();
    for(var index =0 ,i=0; index<num ; index++){
        if(chckBox[index].checked){
            ids[i]=chckBox[index].value;
            i++;
        }
    }
    if(ids!=""){

        if(window.confirm("确定删除所选记录？")){
            $.ajax( {
                type : "post",
                traditional: true,
                url : '/admin/Deletelogs', //要自行删除的action
                data:{"ids": ids},
                success:function(data){
                    window.location.reload();
                },
                error : function(data) {
                    alert("系统错误，删除失败");
                }
            });

        }
    }else{
        alert("请选择要删除的记录");
    }
}



/*弹出层*/
function layer_show_usersecretlevel_edit(id,secretlevel,w,h,title,url){
	if (w == null || w == '') {
		w=800;
	};
	if (h == null || h == '') {
		h=($(window).height() - 50);
	};
	if (title == null || title == '') {
		title=false;
	};
	if (url == null || url == '') {
		url="404.html";
	};
	$.layer({
    	type: 2,
    	shadeClose: true,
    	title: title,
		maxmin:false,
		shadeClose: true,
    	closeBtn: [0, true],
    	shade: [0.8, '#000'],
    	border: [0],
    	offset: ['20px',''],
    	area: [w+'px', h +'px'],
    	iframe: {src: url+'?userid='+id+'&usersecretlevel='+secretlevel}
	});
}

function layer_show_adminpower_edit(id,w,h,title,url){
    if (w == null || w == '') {
        w=800;
    };
    if (h == null || h == '') {
        h=($(window).height() - 50);
    };
    if (title == null || title == '') {
        title=false;
    };
    if (url == null || url == '') {
        url="404.html";
    };
    $.layer({
        type: 2,
        shadeClose: true,
        title: title,
        maxmin:false,
        shadeClose: true,
        closeBtn: [0, true],
        shade: [0.8, '#000'],
        border: [0],
        offset: ['20px',''],
        area: [w+'px', h +'px'],
        iframe: {src: url+'?adminid='+id}
    });
}

function layer_show_file_edit(id,w,h,title,url){
    if (w == null || w == '') {
        w=800;
    };
    if (h == null || h == '') {
        h=($(window).height() - 50);
    };
    if (title == null || title == '') {
        title=false;
    };
    if (url == null || url == '') {
        url="404.html";
    };
    $.layer({
        type: 2,
        shadeClose: true,
        title: title,
        maxmin:false,
        shadeClose: true,
        closeBtn: [0, true],
        shade: [0.8, '#000'],
        border: [0],
        offset: ['20px',''],
        area: [w+'px', h +'px'],
        iframe: {src: url+'?fileid='+id}
    });
}

function layer_show_search_user(type,name,url){


    $.post('/admin/search_user',
        {
            name:name,
            type:type
        },function (result) {
           var userlist=result.userlist;

            $.layer({
                type: 2,
                shadeClose: true,
                title: '搜索结果',
                maxmin:false,
                shadeClose: true,
                closeBtn: [0, true],
                shade: [0.8, '#000'],
                border: [0],
                offset: ['20px',''],
                area: ['1000px', '1000px'],
                iframe:{src:url},

            });
        }
    );

}


function layer_show_search_file(type,name,url){


    $.post('/admin/search_file',
        {
            name:name,
            type:type
        },function (result) {

            $.layer({
                type: 2,
                shadeClose: true,
                title: '搜索结果',
                maxmin:false,
                shadeClose: true,
                closeBtn: [0, true],
                shade: [0.8, '#000'],
                border: [0],
                offset: ['20px',''],
                area: ['1000px', '1000px'],
                iframe:{src:url},

            });
        }
    );

}

function layer_show_search_msg(type,name,url) {


    $.post('/admin/search_msg',
        {
            name:name,
            type:type
        },function (result) {

            $.layer({
                type: 2,
                shadeClose: true,
                title: '搜索结果',
                maxmin:false,
                shadeClose: true,
                closeBtn: [0, true],
                shade: [0.8, '#000'],
                border: [0],
                offset: ['20px',''],
                area: ['1000px', '1000px'],
                iframe:{src:url},

            });
        }
    );

}

function layer_show_search_log(type,name,url) {


    $.post('/admin/search_log',
        {
            name:name,
            type:type
        },function (result) {

            $.layer({
                type: 2,
                shadeClose: true,
                title: '搜索结果',
                maxmin:false,
                shadeClose: true,
                closeBtn: [0, true],
                shade: [0.8, '#000'],
                border: [0],
                offset: ['20px',''],
                area: ['1000px', '1000px'],
                iframe:{src:url},

            });
        }
    );

}
/*----------用户管理------------------*/
/*用户-添加*/
function user_add(w,h,title,url){
	layer_show(w,h,title,url);
}
/*用户-查看*/
function user_show(id,w,h,title,url){
	layer_show(w,h,title,url);
}
/*用户-密码-修改*/
function user_secretlevel_edit(id,secretlevel,w,h,title,url){
	layer_show_usersecretlevel_edit(id,secretlevel,w,h,title,url);
}

/*用户-编辑*/
function user_edit(id,w,h,title,url){
	layer_show(w,h,title,url);
}
/*用户-编辑-保存*/
function user_edit_save(obj,id){
	var i = parent.layer.getFrameIndex();
	parent.layer.close(i);
}
/*搜索用户
 */
function search_user(url){
    var name=document.getElementById("name").value;
    var type=document.getElementById("type").value;
    layer_show_search_user(type,name,url);
}

function  search_file(url) {
    var name=document.getElementById("name").value;
    var type=document.getElementById("type").value;
    layer_show_search_file(type,name,url);
}
function  search_msg(url) {
    var name=document.getElementById("name").value;
    var type=document.getElementById("type").value;
    layer_show_search_msg(type,name,url);
}

function  search_log(url) {
    var name=document.getElementById("name").value;
    var type=document.getElementById("type").value;
    layer_show_search_log(type,name,url);
}









/*用户-停用*/
function user_stop(obj,userid){
    layer.confirm('确认要停用吗？',function(index){
        $(obj).parents("tr").find(".user-manage").prepend('<a style="text-decoration:none" onClick="" href="javascript:;" title="停用"><i class="icon-hand-down"></i></a>');
        $(obj).parents("tr").find(".user-status").html('<span class="label label-default">已停用</span>');
        $(obj).remove();
        layer.msg('已停用!',1);
        $.post('/admin/StopUser',
            {
                userid:userid
            },function (requestdata) {


            }
        );
    });
}
/*用户-启用*/
function user_start(obj,userid){
	layer.confirm('确认要启用吗？',function(index){
		$(obj).parents("tr").find(".user-manage").prepend('<a style="text-decoration:none" onClick="" href="javascript:;" title="停用"><i class="icon-hand-down"></i></a>');
		$(obj).parents("tr").find(".user-status").html('<span class="label label-success">已启用</span>');
		$(obj).remove();
		layer.msg('已启用!',1);
        $.post('/admin/StartUser',
            {
                userid:userid
            },function (requestdata) {


            }
        );
	});
}
/*文件-下载*/
function file_download(obj,fileid){
    layer.confirm('确认要下载此文件吗？',function(index){
        $(obj).parents("tr").find(".user-status").html('<span class="label">已下载</span>');
        layer.msg('已下载!',1);
        $.post('/admin/download',
            {
                fileid:fileid
            },function (requestdata) {

            }
        );
    });
}
/*用户-删除*/
function user_del(obj,userid){
	layer.confirm('确认要删除吗？',function(index){
		$(obj).parents("tr").remove();
		layer.msg('已删除!',1);
		$.post('/admin/DeleteUser',
			{
				userid:userid
			},function (requestdata) {

            }
		);

	});
}

/*日志删除*/
function log_del(obj,logid){
    layer.confirm('确认要删除吗？',function(index){
        $(obj).parents("tr").remove();
        layer.msg('已删除!',1);
        $.post('/admin/DeleteLog',
            {
                logid:logid
            },function (requestdata) {

            }
        );

    });
}

/*文件摘要编辑*/
function file_edit(id,w,h,title,url){
    layer_show_file_edit(id,w,h,title,url);
}

function file_del(obj,fileid){
    layer.confirm('确认要删除吗？',function(index){
        $(obj).parents("tr").remove();
        layer.msg('已删除!',1);
        $.post('/admin/DeleteFile',
            {
                fileid:fileid
            },function (requestdata) {


            }
        );

    });
}

function msg_edit(obj,msgisread,msgid){
if(msgisread==1) {
    $(obj).parents("tr").find(".user-manage").prepend('<a style="text-decoration:none" onClick="" href="javascript:;" title="标记为已读"><i class="icon-hand-down"></i></a>');
    $(obj).parents("tr").find(".user-status").html('<span class="label label-default">未读</span>');
    $(obj).remove();
}
else{
    $(obj).parents("tr").find(".user-manage").prepend('<a style="text-decoration:none" onClick="" href="javascript:;" title="标记为未读"><i class="icon-hand-down"></i></a>');
    $(obj).parents("tr").find(".user-status").html('<span class="label label-success">已读</span>');
    $(obj).remove();
}
        $.post('/admin/msg_edit',
            {
                msgid:msgid,
                isread:msgisread
            },function (requestdata) {

            }
        );
}
/*管理员修改密码*/
function admin_edit(password,adminid) {

    var oldpw=document.getElementById("oldpw").value;
    var newpw1=document.getElementById("newpw1").value;
    var newpw2=document.getElementById("newpw2").value;
    var pwcheck;
    $.ajax( {
        type : "post",
        url : '/admin/password_check',
        data:{"oldpw": oldpw,
		"password":password},
        success:function(data){

             if(data=="yes")
             	pwcheck=1;
             else
             	pwcheck=0;

            if(oldpw==""||newpw1==""||newpw2=="")
            {
                swal('请完整填写密码！')
            }
            else if(pwcheck==0){
                swal('原始密码错误，请重新输入！')

            }
            else{
            	if(newpw1==newpw2) {
                    if (!pswRule(newpw1, newpw2)) {

                        swal(
                            '密码格式错误!',
                            '密码必须为6—16位的数字和字母组合!',
                            'error'
                        )

                    }
                    else {
                        $.post('/admin/admin_edit',
                            {
                                "newpw": newpw2,
                                "adminid": adminid
                            }, function (requestdata) {
                                window.location.reload();
                            }
                        );
                    }
                }
				else
				{
                    swal('两次输入不一致!')
				}
            }

        },
        error : function(data) {
            alert("系统错误");
        }
    });

/*管理员邮箱电话*/
 function admin_edit2(adminid) {

 }


}
/*------------资讯管理----------------*/
/*获取分类值*/
function SetSubID(obj) {
	$("#hid_ccid").val($(obj).val());
}
/*资讯-分类-添加*/
function article_class_add(obj){
	var v = $("#article-class-val").val();
	if(v==""||v==null){
		return false;
	}else{
		//ajax请求 添加分类
	}
}

/*资讯-分类-编辑*/
function article_class_edit(id,w,h,title,url){
	layer_show(w,h,title,url);
}
/*资讯-添加*/
function article_add(w,h,title,url){
	layer_show(w,h,title,url);
}
/*资讯-编辑*/
function article_edit(id,w,h,title,url){
	layer_show(w,h,title,url);
}
/*资讯-下架*/
function article_xiajia(obj,id){
	$(obj).parents("tr").find(".article-manage").prepend('<a style="text-decoration:none" onClick="article_fabu(this,\'10001\')" href="javascript:;" title="发布"><i class="icon-hand-up"></i></a>');
	$(obj).parents("tr").find(".article-status").html('<span class="label">已下架</span>');
	$(obj).remove();
}
/*资讯-发布*/
function article_fabu(obj,id){
	$(obj).parents("tr").find(".article-manage").prepend('<a style="text-decoration:none" onClick="article_xiajia(this,\'10001\')" href="javascript:;" title="下架"><i class="icon-hand-down"></i></a>');
	$(obj).parents("tr").find(".article-status").html('<span class="label label-success">已发布</span>');
	$(obj).remove();
}
/*管理员-删除*/
function article_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$(obj).parents("tr").remove();
		layer.msg('已删除!',1);
	});
}
/*------------图片库--------------*/
/*图片库-分类-添加*/
function picture_class_add(obj){
	var v = $("#picture-class-val").val();
	if(v==""||v==null){
		return false;
	}else{
		//ajax请求 添加分类
	}
}

/*图片库-分类-编辑*/
function picture_class_edit(id,w,h,title,url){
	layer_show(w,h,title,url);
}
/*图片库-添加*/
function picture_add(w,h,title,url){
	layer_show(w,h,title,url);
}
/*图片库-编辑*/
function picture_edit(id,w,h,title,url){
	layer_show(w,h,title,url);
}
/*图片库-下架*/
function picture_xiajia(obj,id){
	$(obj).parents("tr").find(".picture-manage").prepend('<a style="text-decoration:none" onClick="picture_fabu(this,\'10001\')" href="javascript:;" title="发布"><i class="icon-hand-up"></i></a>');
	$(obj).parents("tr").find(".picture-status").html('<span class="label">已下架</span>');
	$(obj).remove();
}
/*图片库-发布*/
function picture_fabu(obj,id){
	$(obj).parents("tr").find(".picture-manage").prepend('<a style="text-decoration:none" onClick="picture_xiajia(this,\'10001\')" href="javascript:;" title="下架"><i class="icon-hand-down"></i></a>');
	$(obj).parents("tr").find(".picture-status").html('<span class="label label-success">已发布</span>');
	$(obj).remove();
}
/*管理员-删除*/
function picture_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$(obj).parents("tr").remove();
		layer.msg('已删除!',1);
	});
}
/*------------管理员管理--------------*/
/*管理员-角色-添加*/
function admin_role_add(w,h,title,url){
	layer_show(w,h,title,url);
}
/*管理员-角色-编辑*/
function admin_role_edit(id,w,h,title,url){
	layer_show(w,h,title,url);
}
/*管理员-角色-删除*/
function admin_role_del(obj,id){
	layer.confirm('角色删除须谨慎，确认要删除吗？',function(index){
		$(obj).parents("tr").remove();
		layer.msg('已删除!',1);
	});
}

/*管理员-权限-添加*/
function admin_permission_add(){
	
}
/*管理员-权限-编辑*/
function admin_permission_edit(id,w,h,title,url){
	layer_show(w,h,title,url);
}

/*管理员-权限-删除*/
function admin_permission_del(obj,id){
	layer.confirm('角色删除须谨慎，确认要删除吗？',function(index){
		$(obj).parents("tr").remove();
		layer.msg('已删除!',1);
	});
}

/*管理员-编辑-保存*/
function admin_edit_save100(adminid){
    var tel=document.getElementById("tel").value;
    var email=document.getElementById("email").value;
    if(tel==""&&email=="")
    {
        swal('请至少修改一项')
    }
    else if(!emailRule(email))
    {
        swal(
            '邮箱格式错误!',
            '',
            'error'
        )
    }
    else{ $.post('/admin/admin_edit2',
        {
            "tel":tel,
            "email":email,
            "id":adminid
        },function (requestdata) {
            window.location.reload();
        }
    );
    }

}
function trim(str) {
    return str.replace(/(^\s+)|(\s+$)/g, "");
}

function pswRule(password, password2) {
    if ( password == null || password2 == null ||trim(password) == "" || trim(password2) == "" )
        return false;
    var pwdrule = /^[a-zA-Z]\w{5,17}$/;

    if (password != password2)
        return false;
    if (!pwdrule.test(password))
        return false;
    return true;
}

function emailRule(email) {

    if (email == null ||trim(email) == "")
        return false;
    var emailrule = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;

    if (!emailrule.test(email))
        return false;
    return true;
}
/*管理员-删除*/
function admin_del(obj,id,power){
	if(power==1||power==2)
	{
		alert("没有删除权限！")
	}
	else {
        layer.confirm('确认要删除吗？', function (index) {
            $(obj).parents("tr").remove();
            layer.msg('已删除!',1);
            $.post('/admin/DeleteAdmin',
                {
                    adminid:id
                },function (requestdata) {

                    window.location.reload();
                }
            );
        });
    }
}
function admin_power_edit(id,w,h,title,url) {
    layer_show_adminpower_edit(id,w,h,title,url);
    }

    /*管理员-停用*/
    function admin_stop(obj, id) {
        $(obj).parents("tr").find(".admin-manage").prepend('<a style="text-decoration:none" onClick="admin_start(this,\'10001\')" href="javascript:;" title="启用"><i class="icon-hand-up"></i></a>');
        $(obj).parents("tr").find(".admin-status").html('<span class="label">已停用</span>');
        $(obj).remove();
    }

    /*管理员-启用*/
    function admin_start(obj, id) {
        $(obj).parents("tr").find(".admin-manage").prepend('<a style="text-decoration:none" onClick="admin_stop(this,\'10001\')" href="javascript:;" title="停用"><i class="icon-hand-down"></i></a>');
        $(obj).parents("tr").find(".admin-status").html('<span class="label label-success">已启用</span>');
        $(obj).remove();
    }

    /*------------系统管理--------------*/

    /*系统管理-日志-删除*/
    function system_log_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            $(obj).parents("tr").remove();
            layer.msg('已删除!', 1);
        });
    }

    /*=======================================================*/
    $(function () {
        /*菜单处于当前状态*/
        var webSite = "";
        var loc = location.href;
        var url = loc.replace(webSite, "");
        $(".menu_dropdown ul li").each(function () {
            var current = $(this).find("a");
            $(this).removeClass("current");
            if (url == $(current[0]).attr("href")) {
                $(this).addClass("current");
            }
        });

        $("#nav-toggle").click(function () {
            $(".Hui-aside").slideToggle();
        });
        $(".menu_dropdown dd li a").click(function () {
            if ($(window).width() < 768) {
                $(".Hui-aside").slideToggle();
            }
        });

        $(".dislpayArrow a").click(function () {
            if ($(".Hui-aside").is(":hidden")) {
                $(".Hui-aside").show();
                $(this).removeClass("open");
                $(".Hui-article,.dislpayArrow").css({"left": "200px"});
            } else {
                $(this).addClass("open");
                $(".Hui-aside").hide();
                $(".Hui-article,.dislpayArrow").css({"left": "0"});
            }
        });

        /*选项卡导航*/
        var topWindow = $(window.parent.document);
        $(".Hui-aside .menu_dropdown a").click(function () {
            var bStop = false;
            var bStopIndex = 0;
            var _href = $(this).attr('_href');
            var _titleName = $(this).html();
            var show_navLi = topWindow.find("#min_title_list li");
            show_navLi.each(function () {
                if ($(this).find('span').attr("data-href") == _href) {
                    bStop = true;
                    bStopIndex = show_navLi.index($(this));
                    return false;
                }
            });
            if (!bStop) {
                creatIframe(_href, _titleName);
                min_titleList();
            }
            else {
                show_navLi.removeClass("active").eq(bStopIndex).addClass("active");
                var iframe_box = topWindow.find("#iframe_box");
                iframe_box.find(".show_iframe").hide().eq(bStopIndex).show();
            }
        });
        min_titleList()

        function min_titleList() {
            var show_nav = topWindow.find("#min_title_list");
            var aLi = show_nav.find("li");
        };

        function creatIframe(href, titleName) {
            var show_nav = topWindow.find('#min_title_list');
            show_nav.find('li').removeClass("active")
            var iframe_box = topWindow.find('#iframe_box');
            show_nav.append('<li class="active"><span data-href="' + href + '">' + titleName + '</span><i></i><em></em></li>');
            tabNavallwidth();
            var iframeBox = iframe_box.find('.show_iframe')
            iframeBox.hide();
            iframe_box.append('<div class="show_iframe"><div class="loading"></div><iframe frameborder="0" src="' + href + '"></iframe></div>');
            var showBox = iframe_box.find('.show_iframe:visible')
            showBox.find('iframe').hide().load(function () {
                showBox.find('.loading').hide();
                $(this).show()
            });
        }

        var num = 0;
        var oUl = $("#min_title_list");
        var hide_nav = $("#Hui-tabNav");
        $(document).on("click", "#min_title_list li", function () {
            var bStopIndex = $(this).index();
            var iframe_box = $("#iframe_box");
            $("#min_title_list li").removeClass("active").eq(bStopIndex).addClass("active");
            iframe_box.find(".show_iframe").hide().eq(bStopIndex).show();
        });
        $(document).on("click", "#min_title_list li i", function () {
            var aCloseIndex = $(this).parents("li").index();
            $(this).parent().remove();
            $('#iframe_box').find('.show_iframe').eq(aCloseIndex).remove();
            num == 0 ? num = 0 : num--;
            tabNavallwidth();
        });
        $(document).on("dblclick", "#min_title_list li", function () {
            var aCloseIndex = $(this).index();
            var iframe_box = $("#iframe_box");
            if (aCloseIndex > 0) {
                $(this).remove();
                $('#iframe_box').find('.show_iframe').eq(aCloseIndex).remove();
                num == 0 ? num = 0 : num--;
                $("#min_title_list li").removeClass("active").eq(aCloseIndex - 1).addClass("active");
                iframe_box.find(".show_iframe").hide().eq(aCloseIndex - 1).show();
                tabNavallwidth();
            } else {
                return false;
            }
        });
        tabNavallwidth();

        $('#js-tabNav-next').click(function () {
            num == oUl.find('li').length - 1 ? num = oUl.find('li').length - 1 : num++;
            toNavPos()
        });
        $('#js-tabNav-prev').click(function () {
            num == 0 ? num = 0 : num--;
            toNavPos();
        });

        function toNavPos() {
            oUl.stop().animate({'left': -num * 100}, 100)
        }

        /*jQuery("#Hui-tabNav").slide({mainCell:".Hui-tabNav-wp #min_title_list li",prevCell:"#js-tabNav-prev",nextCell:"#js-tabNav-next",autoPage:false,effect:"leftLoop",vis:10,pnLoop:false,trigger:"click"});*/

    });

