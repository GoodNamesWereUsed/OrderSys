<%--
  Created by IntelliJ IDEA.
  User: huangMP
  Date: 2016/12/16
  Time: 15:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8"/>
    <title>订餐系统--服务员界面</title>
    <link rel="stylesheet" href="/OrderSys/static/displaymodel/css/reset1.1.css"/>
    <link rel="stylesheet" href="/OrderSys/static/displaymodel/vendor/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/OrderSys/static/displaymodel/css/textscrolling.css"/>
    <link rel="stylesheet" href="/OrderSys/static/displaymodel/css/waitUp.css"/>
    <style>
        body {
            overflow: hidden;
        }

        .nav-tabs li:first-child {
            margin-left: 10px;
        }

        .c-content {
            height: 500px;
        }

        ul.nav-tabs {
            margin: 0;
        }

        iframe {
            width: 100%;
            height: 100%;
            border: 0;
            background-color: #006DCC;
        }

        .pagination {
            text-align: center;
            max-width: 960px;
        }

        #menu,
        #waitUp,
        #all-order {
            width: 100%;
            height: 100%;
        }

        #waitUp,
        #all-order {
            display: none;
        }
    </style>
</head>

<body>
<div class="c-notice">
    <div class="cn-title">
        <a href="/OrderSys/static/displaymodel/notice.html">公告：</a>
    </div>
    <div class="cn-msg">
        <ul class="con1">
            <li>
                <a href="#">1.学会html5 绝对的屌丝逆袭（案例）</a><span>2013-09-18</span></li>
            <li>
                <a href="#">2.tab页面切换效果（案例）</a><span>2013-10-09</span></li>
            <li>
                <a href="#">3.圆角水晶按钮制作（案例）</a><span>2013-10-21</span></li>
        </ul>
        <ul class="con2">
        </ul>
    </div>
</div>

<div class="c-tabs">
    <ul class="nav nav-tabs">
        <li class="active">
            <a href="javascript:;" data-id="#menu">订餐界面</a>
        </li>
        <li>
            <a href="javascript:;" data-id="#waitUp">待上菜(<span id="num">1</span>)</a>
        </li>
        <li>
            <a href="javascript:;" data-id="#all-order">全部订单</a>
        </li>

        <li>
            <a href="logoutDisplay.do"><i class="icon-chevron-right"></i>注销登录</a>
        </li>
    </ul>
</div>
<div class="c-content">
    <div id="menu">
        <iframe src="/OrderSys/static/displaymodel/order_meal.html">
        </iframe>
    </div>
    <div id="waitUp">
        <table>
            <thead>
            <tr>
                <th>菜名</th>
                <th>座号</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>白饭</td>
                <td>50</td>
                <td>未上</td>
                <td>
                    <button>确认上菜</button>
                </td>
            </tr>
            <tr>
                <td>白饭</td>
                <td>50</td>
                <td>未上</td>
                <td>
                    <button>确认上菜</button>
                </td>
            </tr>
            <tr>
                <td>白饭</td>
                <td>50</td>
                <td>未上</td>
                <td>
                    <button>确认上菜</button>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
    <div id="all-order">
        <table>
            <thead>
            <tr>
                <th>桌号</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>50</td>
                <td>未付款</td>
                <td>
                    <a href="/OrderSys/static/displaymodel/order_detail.html">查看</a>
                </td>
            </tr>
            <tr>
                <td>50</td>
                <td>未付款</td>
                <td>
                    <a href="/OrderSys/static/displaymodel/order_detail.html">查看</a>
                </td>
            </tr>
            <tr>
                <td>50</td>
                <td>未付款</td>
                <td>
                    <a href="/OrderSys/static/displaymodel/order_detail.html">查看</a>
                </td>
            </tr>
            <tr>
                <td>50</td>
                <td>未付款</td>
                <td>
                    <a href="/OrderSys/static/displaymodel/order_detail.html">查看</a>
                </td>
            </tr>
            </tbody>
        </table>
        <div class="pagination">
            <ul>
                <li>
                    <a href="#">Prev</a>
                </li>
                <li>
                    <a href="#">1</a>
                </li>
                <li>
                    <a href="#">2</a>
                </li>
                <li>
                    <a href="#">3</a>
                </li>
                <li>
                    <a href="#">4</a>
                </li>
                <li>
                    <a href="#">5</a>
                </li>
                <li>
                    <a href="#">Next</a>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="footer">

</div>
<script type="text/javascript" src="/OrderSys/static/displaymodel/js/jquery1.9.min.js"></script>
<script type="text/javascript" src="/OrderSys/static/displaymodel/js/textscrolling.js"></script>
<script type="text/javascript" src="/OrderSys/static/displaymodel/vendor/bootstrap/js/bootstrap.js"></script>
<script>
    var setconHig = function () {
        var winHig = $(window).height(),
                notHig = $('.c-notice').outerHeight(true),
                tabHig = $('.c-tabs').outerHeight(true);
        $('.c-content').height(winHig - notHig - tabHig);
    }
    setconHig();
    $(window).resize(function () {
        setconHig();
    });
    /*切换*/
    $('.nav-tabs').delegate('li', 'click', function () {
        $('.nav-tabs').find('li').removeClass('active');
        $(this).addClass('active');
        var id = $(this).find('a').attr('data-id');
        $('.c-content').children('div').hide();
        $(id).show();
    });
</script>
</body>

</html>
