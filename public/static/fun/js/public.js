function callBack(resData,msg) {
    switch (resData.code) {
        case 200:
            layer.msg(msg,{icon:1,time:1000},function () {
                window.parent.location.reload();
                var index = parent.layer.getFrameIndex(window.name);
                parent.layer.close(index);
            });
            break;
        case 400:
            layer.msg(resData.msg,{icon:2,time:1000},function () {
                $(obj.elem).removeAttr('disabled');
            });
            break;
    }
}