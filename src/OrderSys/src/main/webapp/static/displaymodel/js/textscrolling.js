var $area = $('.cn-msg'),
    $con1 = $('.con1'),
    $con2 = $('.con2'),
    speed = 5000;
$con2.append($con1.html()); //克隆内容
function textscrollUp() {
    if ($area.scrollTop() >= $con1.height() - $area.height() + 30) {
        $area.scrollTop(0);
    }
    $area.animate({
        'scrollTop': '+=30'
    }, 1000);
}
var myScroll = setInterval("textscrollUp()", speed);
$area.on('mouseover', function () {
    clearInterval(myScroll);
}).on('mouseout', function () {
    myScroll = setInterval("textscrollUp()", speed);
});