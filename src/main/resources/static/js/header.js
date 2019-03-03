// function showInfoBox(){
//     if (IsElement('infobox')) {
//         thisinfobox = getObj('infobox');
//         if (thisinfobox.style.display == 'none') {
//             thisinfobox.style.display = '';
//             getObj('one-key').className = 'one-hidden';
//         } else {
//             thisinfobox.style.display = 'none';
//             getObj('one-key').className = 'one-show';
//         }
//     }
// }
function focusInput(obj) {
    if (obj.className.indexOf('black') == -1) {
        obj.value = '';
        obj.className = obj.className.replace('gray', 'black');
    }
}
function blurInput(obj, val) {
    if (obj.value != obj.defaultValue && obj.value == '') {
        obj.className = obj.className.replace('black', 'gray');
        var logintypeobj = document.getElementsByName('logintype');
        for (var i = 0; i < logintypeobj.length; i ++) {
            if (logintypeobj[i].checked == true) {
                var objValue = logintypeobj[i].value;
                obj.value = obj.defaultValue = '请输入' + getObj('login_'+objValue).innerHTML;
            }
        }
    }
}
function changeType(obj) {
    var objValue = obj.value;
    var radioType = getObj('radiotype')
    if (objValue == radioType.value) {
        return;
    } else {
        getObj("usercheck").value = "请输入" + getObj("login_" + objValue).innerHTML;
        radioType.value = objValue;
    }if (getObj('usercheck').className.indexOf('black') != -1) {
        getObj('usercheck').className = getObj('usercheck').className.replace('black', 'gray');
    }
}
function getObj(id) {
    return document.getElementById(id);
}
function IsElement(id) {
    return document.getElementById(id) != null ? true : false;
}