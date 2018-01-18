/**
 * Created by fantasy on 2017/3/26.
 */

/*获取元素对象*/
var piclist = $("#banner .pic ul li"); //获取图片序列对象
var picnav = $("#banner .picnav ul li"); //获取图片导航对象
var banner = $("#banner"); //特效容器
var navbox = $("#banner .picnav"); //图片导航容器
var but = $("#banner .but ul li"); //按钮对象
var i = 0;
var time = null //存储定时器
/*事件*/
banner.hover(function () {
    // 鼠标移入
	navbox.stop();
    navbox.animate({bottom:0},500);
    // 清除定时器
    clearInterval(time);
},function () {
    // 鼠标移出
	navbox.stop();
    navbox.animate({bottom:"-86px"},500);
    // 启动定时器
    time = setInterval(function () {
        i=(i+1)%5;
        auto(i)
    },3000);

});
picnav.mouseover(function () {
    // 找到当前li的下标
    i = $(this).index();
    auto(i);
});
/*自动切换*/
function auto(i) {
    // 鼠标移到上面
    picnav.addClass("first").siblings().removeClass("first");
    // 图片切换
    piclist.eq(i).fadeIn().siblings().fadeOut();//fadeIn()淡入，fadeIn()淡出
    but.eq(i).addClass("first").siblings().removeClass("first");
}
/*定时器*/
time = setInterval(function () {
    i=(i+1)%5;
    auto(i);
},3000);
