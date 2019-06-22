<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>登录</title>
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/my.css">
		<script src="js/jquery-2.1.0.min.js"></script>
		<script src="js/bootstrap.min.js"></script>

		<body>
			<nav class="navbar navbar-default navbar-fixed-top">
			  <div class="container-fluid">
			    <!-- Brand and toggle get grouped for better mobile display -->
			    <div class="navbar-header">
			      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			      </button>
			      <a class="navbar-brand" href="#">学生信息管理系统&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
			    </div>
			
			    <!-- Collect the nav links, forms, and other content for toggling -->
			    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			      <ul class="nav navbar-nav">
			        <li><a href="StudentAction_list">学生管理 <span class="sr-only">(current)</span></a></li>
			        <li><a href="ClazzAction_list">班级管理</a></li>
			      </ul>
			      <ul class="nav navbar-nav navbar-right">
			        <s:if test="#session.admin==null">
			      		<li><a href="index.jsp">登录</a></li>
			      	</s:if>
			      	<s:else>
				        <li><a href="AdminAction_logout">注销</a></li>
			      	</s:else>
			      </ul>
			    </div>
			   </div>
			</nav>
		</body>
		
		<div class="loginDiv">
			<h2 align="center">登录</h2>
            <span class="wrong">
            	<s:property value="#message"/>
            </span>
            <hr>
            <form action="AdminAction_login" method="get">
                <table align="center">
                    <tr>
                        <td width="200px" colspan="3">
                            <div class="form-group">
                                <label>账号</label> <input type="text"
                                                         class="form-control" name="adminName">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td width="200px" colspan="3">
                            <div class="form-group">
                                <label>密码</label> <input type="password"
                                                         class="form-control" name="adminPassword">
                            </div>
                        </td>
                    </tr>
                    <tr align="right">
                        <TD><button type="submit" class="btn btn-info">登录</button></TD>
                    </tr>
                </table>
            </form>
		</div>
</html>