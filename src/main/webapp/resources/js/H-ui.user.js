
/*添加消息*/
function Msg_send(userid) {
    var msg=document.getElementById("msg").value;

    $.post('/user/Msg_send',
        {
            msg:msg,
            userId:userid
        },function (requestdata) {
        window.location.reload();

        }
    );

}
/*删除日志*/
function Log_del(logid) {

    $.post('/user/Log_delete',
        {
            logid:logid
        },function (requestdata) {
            window.location.reload();
        }
    );
}

/*修改用户信息*/
function User_edit() {
    
}