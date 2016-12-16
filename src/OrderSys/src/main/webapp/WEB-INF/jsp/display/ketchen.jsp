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
<html>

<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8"/>
    <title>订餐系统--后厨</title>
    <link rel="stylesheet" href="static/displaymodel/css/reset1.1.css"/>
    <link rel="stylesheet" href="static/displaymodel/vendor/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="static/displaymodel/css/textscrolling.css"/>
    <link rel="stylesheet" href="static/displaymodel/css/waitUp.css"/>
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
        #wserving {
            width: 100%;
            height: 100%;
        }

        #serving {
            display: none;
        }

        .c-left,
        .c-right {
            height: 100%;
            padding-top: 5px;
        }

        .c-right {
            margin-left: 205px;
        }

        .c-right p:first-child {
            text-align: right;
            max-width: 960px;
        }

        .c-right select {
            width: auto;
            outline: none;
            margin: 0;
        }

        .c-right table {
            margin: 10px 0 0;
        }

        .c-right table thead tr {
            border-bottom: 1px solid #555;
        }

        .c-right table p {
            margin: 0;
        }

        .c-right .btn-group button {
            padding: 0 5px;
        }

        #serving .c-right {
            margin-left: 0;
            width: 100%;
        }

        #serving table,
        #serving p:first-child {
            max-width: 100%;
        }
    </style>
</head>

<body>
<div class="c-notice">
    <div class="cn-title">
        <a href="notice.html">公告：</a>
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
            <a href="javascript:;" data-id="#menu">订单界面</a>
        </li>
        <li>
            <a href="javascript:;" data-id="#serving">上菜界面(<span id="num">1</span>)</a>
        </li>
        <li>
            <a href="logoutDisplay.do"><i class="icon-chevron-right"></i>注销登录</a>
        </li>
    </ul>

</div>
<div class="c-content">
    <div id="menu">
        <div class="c-left">
            <ul>
                <li class="active">
                    <a href="#tuijian"><i class="icon-chevron-right"></i>全部</a>
                </li>
                <li>
                    <a href="#mifnag"><i class="icon-chevron-right"></i>已确认</a>
                </li>
                <li>
                    <a href="#"><i class="icon-chevron-right"></i>待确认</a>
                </li>
            </ul>
        </div>
        <div class="c-right">
            <p>查看方式:
                <select>
                    <option>下单时间</option>
                    <option>桌号</option>
                </select>
            </p>
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
                    <td>未确认</td>
                    <td>
                        <a href="static/displaymodel/kit_order_detail.html">查看</a>
                    </td>
                </tr>
                <tr>
                    <td>50</td>
                    <td>未确认</td>
                    <td>
                        <a href="static/displaymodel/kit_order_detail.html">查看</a>
                    </td>
                </tr>
                <tr>
                    <td>50</td>
                    <td>未确认</td>
                    <td>
                        <a href="static/displaymodel/kit_order_detail.html">查看</a>
                    </td>
                </tr>
                <tr>
                    <td>50</td>
                    <td>未确认</td>
                    <td>
                        <a href="static/displaymodel/kit_order_detail.html">查看</a>
                    </td>
                </tr>
                <tr>
                    <td>50</td>
                    <td>未确认</td>
                    <td>
                        <a href="static/displaymodel/kit_order_detail.html">查看</a>
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
    <div id="serving">
        <div class="c-right">
            <p>查看方式:
                <select>
                    <option>下单时间</option>
                    <option>桌号</option>
                </select>
            </p>
            <table>
                <thead>
                <tr>
                    <th>桌号</th>
                    <th>菜名</th>
                    <th>数量</th>
                    <th>备注</th>
                    <th>详细</th>
                    <th>状态</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>50</td>
                    <td>白饭</td>
                    <td>5</td>
                    <td>
                        <p>无</p>
                    </td>
                    <td>
                        <a href="static/displaymodel/kit_order_detail.html">查看</a>
                    </td>
                    <td>
                        <div class="btn-group" data-toggle="buttons-radio">
                            <button type="button" class="btn btn-success">等待烹制</button>
                            <button type="button" class="btn btn-danger">正在烹制</button>
                            <button type="button" class="btn btn-primary">烹制完毕</button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>50</td>
                    <td>白饭</td>
                    <td>5</td>
                    <td>
                        <p>无</p>
                    </td>
                    <td>
                        <a href="static/displaymodel/kit_order_detail.html">查看</a>
                    </td>
                    <td>
                        <div class="btn-group" data-toggle="buttons-radio">
                            <button type="button" class="btn btn-success">等待烹制</button>
                            <button type="button" class="btn btn-danger">正在烹制</button>
                            <button type="button" class="btn btn-primary">烹制完毕</button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>50</td>
                    <td>白饭</td>
                    <td>5</td>
                    <td>
                        <p>无</p>
                    </td>
                    <td>
                        <a href="static/displaymodel/kit_order_detail.html">查看</a>
                    </td>
                    <td>
                        <div class="btn-group" data-toggle="buttons-radio">
                            <button type="button" class="btn btn-success">等待烹制</button>
                            <button type="button" class="btn btn-danger">正在烹制</button>
                            <button type="button" class="btn btn-primary">烹制完毕</button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>50</td>
                    <td>白饭</td>
                    <td>5</td>
                    <td>
                        <p>无</p>
                    </td>
                    <td>
                        <a href="static/displaymodel/kit_order_detail.html">查看</a>
                    </td>
                    <td>
                        <div class="btn-group" data-toggle="buttons-radio">
                            <button type="button" class="btn btn-success">等待烹制</button>
                            <button type="button" class="btn btn-danger">正在烹制</button>
                            <button type="button" class="btn btn-primary">烹制完毕</button>
                        </div>
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
</div>
<script type="text/javascript" src="static/displaymodel/js/jquery1.9.min.js"></script>
<script type="text/javascript" src="static/displaymodel/js/textscrolling.js"></script>
<script type="text/javascript" src="static/displaymodel/vendor/bootstrap/js/bootstrap.js"></script>
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
    /*点击左边的分类菜单*/
    $('.c-left').delegate('li', 'click', function () {
        $('.c-left').find('li').removeClass('active');
        $(this).addClass('active');
    });
</script>
</body>

</html>