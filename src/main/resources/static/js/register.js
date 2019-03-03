//手机号检查
function checkphone() {
    //手机号正则及输入的手机号
    var reg = /^1[3|5|7|8][0-9]\d{4,8}$/;
    var phone = document.getElementById("phone").value;
    //手机号提示信息
    var phonets = document.getElementById("phonets");
    //手机号为空，则不做判断
    if (phone == "") {
        phonets.innerHTML = "";
        phonets.style.border = "";
        phonets.style.backgroundColor = "";
        return true;
    }
    //验证手机号格式
    if (!reg.exec(phone)) {
        phonets.innerHTML = "&nbsp;手机号格式错误。";
        phonets.style.border = "1px solid red";
        phonets.style.backgroundColor = "rgba(255,0,0,0.25)";
        return false;
    } else {
        phonets.innerHTML = "&nbsp;手机号格式正确。";
        phonets.style.border = "1px solid green";
        phonets.style.backgroundColor = "rgba(0,255,0,0.25)";
        return true;
    }
}
//用户名检查
function checkuname() {
    //输入的用户名去空格
    var input = document.getElementById("uname").value.toString().replace(/\s+/g,"");
    //用户名格式提示信息
    var unamets = document.getElementById("checkyhm");
    //用户名判断空
    if (input == "") {
        unamets.innerHTML = "&nbsp;请填写用户名。";
        unamets.style.border = "1px solid red";
        unamets.style.backgroundColor = "rgba(255,0,0,0.25)";
        return false;
    }
    //判断用户名长度
    if (input.length > 8 || input.length < 3) {
        unamets.innerHTML = "&nbsp;用户名格式错误。";
        unamets.style.border = "1px solid red";
        unamets.style.backgroundColor = "rgba(255,0,0,0.25)";
        return false;
    }  else {
        // unamets.innerHTML = "&nbsp;用户名格式正确。";
        // unamets.style.border = "1px solid green";
        // unamets.style.backgroundColor = "rgba(0,255,0,0.25)";
        return true;
    }
}
//验证码检查
function checkyzm() {
    //用户输入的验证码
    var yzminput = document.getElementById("vcode").value;
    var yzm = '${Session.imagecode}';
    //验证码提示信息
    var checkyzm = document.getElementById("checkyzm");
    //判断空值
    if (yzminput == "") {
        checkyzm.innerHTML = "&nbsp;请填写验证码。";
        checkyzm.style.border = "1px solid red";
        checkyzm.style.backgroundColor = "rgba(255,0,0,0.25)";
        return false;
    }
    //忽略大小写进行比较
    if (yzminput.toLowerCase() == yzm.toLowerCase()) {
        checkyzm.innerHTML = "&nbsp;验证码正确。";
        checkyzm.style.border = "1px solid green";
        checkyzm.style.backgroundColor = "rgba(0,255,0,0.25)";
        return true;
    } else {
        checkyzm.innerHTML = "&nbsp;验证码错误。";
        checkyzm.style.border = "1px solid red";
        checkyzm.style.backgroundColor = "rgba(255,0,0,0.25)";
        return false;
    }
}
//验证码图片显示隐藏
function hideImage() {
    //验证码图片div元素
    var imagediv = document.getElementById("image");
    //填写验证码的文本框，图片在文本框正上方显示
    var dianji = document.getElementById("vcode").getBoundingClientRect();
    //图片左上角坐标
    imagediv.style.top = dianji.y - 53;
    imagediv.style.left = dianji.x;
    //设置显示或隐藏
    if (imagediv.style.display == 'none') {
        imagediv.style.display = 'block';
    } else {
        imagediv.style.display = 'none';
    }
}
function hsimage() {
    var imagediv = document.getElementById("image");
    if (imagediv.style.display == 'block') {
        imagediv.style.display = 'none';
    }
    checkyzm();
}
//密码验证及强度判断
function checkpswd() {
    //密码格式匹配正则式
    var isPassword = /^(\w){6,15}$/;
    //输入密码框
    var pwInput = document.getElementById("password").value;
    //输入密码后提示信息框
    var mmts = document.getElementById("checkmm");
    //判断密码格式
    if (!isPassword.exec(pwInput)) {
        mmts.innerHTML = "&nbsp;密码格式错误。";
        mmts.style.border = "1px solid red";
        mmts.style.backgroundColor = "rgba(255,0,0,0.25)";
        return false;
    }
    //密码格式验证通过，判断密码强度
    else {
        //密码强度简单，仅有一种类型字符
        var easy = /^(?:\d+|[a-zA-Z]+|[_]+)$/;
        //密码强度一般，由两种类型组成
        var normal = /^([a-zA-Z0-9]+|[a-zA-Z_]+|[0-9_]+)$/;
        //密码强度困难，由多类型字符组成
        var hard = /^([a-zA-Z0-9_]+)$/;
        if (easy.exec(pwInput)) {
            mmts.innerHTML = "&nbsp;密码格式正确，强度：<font color=red>弱</font>。";
            mmts.style.border = "1px solid green";
            mmts.style.backgroundColor = "rgba(0,255,0,0.25)";
        } else if (normal.exec(pwInput)) {
            mmts.innerHTML = "&nbsp;密码格式正确，强度：<font color='#ffa500'>中</font>。";
            mmts.style.border = "1px solid green";
            mmts.style.backgroundColor = "rgba(0,255,0,0.25)";
        } else if (hard.exec(pwInput)) {
            mmts.innerHTML = "&nbsp;密码格式正确，强度：<font color=blue>强</font>。";
            mmts.style.border = "1px solid green";
            mmts.style.backgroundColor = "rgba(0,255,0,0.25)";
        }
        return true;
    }
}
//确认密码检查
function checkrepswd() {
    //用户密码框输入的密码
    var pswd = document.getElementById("password").value;
    //用户确认框输入的密码
    var repw = document.getElementById("repassword").value;
    //确认密码提示信息
    var repwts = document.getElementById("repwts");
    //判断密码框是否为空
    if (pswd == "") {
        return false;
    }
    if (pswd == repw) {
        repwts.innerHTML = "&nbsp;输入密码一致。"
        repwts.style.border = "1px solid green";
        repwts.style.backgroundColor = "rgba(0,255,0,0.25)";
        return true;
    } else {
        repwts.innerHTML = "&nbsp;输入密码不一致。"
        repwts.style.border = "1px solid red";
        repwts.style.backgroundColor = "rgba(255,0,0,0.25)";
        return false;
    }
}
//邮箱格式验证
function checkemail() {
    //输入框及提示框
    var emailInput = document.getElementById("email").value;
    var emailts = document.getElementById("emailts");
    //邮箱格式正则表达式
    var reg = /^[a-zA-Z0-9_-]+@([a-zA-Z0-9]+\.)+(com|cn|net|org)$/;
    if (emailInput == "") {
        emailts.innerHTML = "&nbsp;请输入邮箱。"
        emailts.style.border = "1px solid red";
        emailts.style.backgroundColor = "rgba(255,0,0,0.25)";
        return false;
    }
    if (reg.exec(emailInput)) {
        // emailts.innerHTML = "&nbsp;邮箱格式正确。"
        // emailts.style.border = "1px solid green";
        // emailts.style.backgroundColor = "rgba(0,255,0,0.25)";
        return true;
    } else {
        emailts.innerHTML = "&nbsp;邮箱格式错误。"
        emailts.style.border = "1px solid red";
        emailts.style.backgroundColor = "rgba(255,0,0,0.25)";
        return false;
    }
}
//提交时检查数据
function checkInfo() {
    var checkyzm = document.getElementById("checkyzm");
    var checkyhm = document.getElementById("checkyhm");
    var checkmm = document.getElementById("checkmm");
    var repwts = document.getElementById("repwts");
    var emailts = document.getElementById("emailts");
    var phonets = document.getElementById("phonets");
    if (checkpswd() & checkemail() & checkphone() &
        checkrepswd() & checkuname()) {
        document.getElementById("register").submit();
        return true;
    } else {
        return false;
    }
}