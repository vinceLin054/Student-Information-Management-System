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
		<title>学生管理</title>
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/my.css">
		<script src="js/jquery-2.1.0.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script type="text/javascript">
			function deleteInfo(studentId,classId){
	            if(confirm("确认删除？")){
	                location.href="StudentAction_delete?studentId="+studentId+"&clazz.classId="+classId;
	            }
	        };
	        function toStudentInfo(studentId,studentNo,studentName,studentSex,clazzId,studentPhone){
	            $("#studentId").val(studentId);
	            $("#studentNo").val(studentNo);
	            $("#studentName").val(studentName);
	            $("#studentSex").val(studentSex);
	            $("#studentPhone").val(studentPhone);
	            $("#classId option[value='"+clazzId+"']").prop("selected", "selected");
	            $("#edit").modal('show');
	        };
		</script>

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
			        <li class="active"><a href="StudentAction_list">学生管理 <span class="sr-only">(current)</span></a></li>
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
		
		<div class="mainDiv">
			<div class="container-fluid">
			<h2>学生列表</h2>
                <br>
                <form action="StudentAction_list" method="get">
                    <table>
                        <tr>
                            <td width="80px"><h3>班级</h3></td>
                            <td width="200px" align="center">
                                <select class="form-control" name="clazz.classId">
                                    <option value="0">全部</option>
                                    <s:iterator value="#clazzList">
                                    	<option value="<s:property value="classId"/>" <s:if test="classId==#classId">selected="selected"</s:if>>
                                    		<s:property value="className"/>
                                    	</option>
                                    </s:iterator>
                                </select>
                            </td>
                            <td width="200px">
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="submit" class="btn btn-info" value="选择">
                            </td>
                        </tr>
                    </table>
                </form>
                <div style="text-align: right;">
                    <button type="button" class="btn btn-default btn-md" data-toggle="modal" data-target="#add">
                        <span class="glyphicon glyphicon-plus"></span> 添加
                    </button>
                </div>	
                <hr>
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <td class="th" width="25%">
                            	学号
                        </td>
                        <td class="th" width="15%">
                            	姓名
                        </td>
                        <td class="th" width="5%">
                            	性别
                        </td>
                        <td class="th" width="15%">
                            	班级
                        </td>
                        <td class="th" width="25%">
                            	电话
                        </td>
                        <td class="th" width="15%">
                            	操作
                        </td>
                    </tr>
                    </thead>
                    <tbody>
                    	<s:iterator value="#studentList">
                    		<tr>
	                            <td class="tb">
	                                <s:property value="studentNo"/>
	                            </td>
	                            <td class="tb">
	                                <s:property value="studentName"/>
	                            </td>
	                            <td>
	                                <s:property value="studentSex"/>
	                            </td>
	                            <td>
	                                <s:property value="clazz.className"/>
	                            </td>
	                            <td>
	                                <s:property value="studentPhone"/>
	                            </td>
	                            <td class="tb">
	                                <button type="button" class="btn btn-default btn-sm" onclick="toStudentInfo('<s:property value="studentId"/>','<s:property value="studentNo"/>','<s:property value="studentName"/>','<s:property value="studentSex"/>','<s:property value="clazz.classId"/>','<s:property value="studentPhone"/>')">
	                                    <span class="glyphicon glyphicon-pencil"></span> 修改
	                                </button>
	                                <button type="button" class="btn btn-default btn-sm" onclick="deleteInfo('<s:property value="studentId"/>','<s:property value="clazz.classId"/>')">
	                                    <span class="glyphicon glyphicon-minus"></span> 删除
	                                </button>
	                            </td>
	                        </tr>
                    	</s:iterator>
                    </tbody>
                </table>
            </div>
		</div>
		
<!-- 修改 -->
<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h2 class="modal-title" id="myModalLabel">修改学生信息</h2>
            </div>
            <form action="StudentAction_update" class="form-inline" method="post">
                <input type="hidden" name="page" value="studentManage">
                <input type="hidden" name="classId" th:value="${classId}">
                <div class="modal-body">
                    <input type="hidden" name="studentId" id="studentId">
                    <table>
                        <tr>
                            <td class="th">
                                <div class="form-group">
                                    <label for="student_no">&nbsp;&nbsp;&nbsp;学号</label>
                                    <input type="text" class="form-control" id="studentNo" name="studentNo">
                                </div>
                            </td>
                            <td class="th">
                                <div class="form-group">
                                    <label for="student_no">&nbsp;&nbsp;&nbsp;姓名</label>
                                    <input type="text" class="form-control" id="studentName" name="studentName">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="th">
                                <div class="form-group" style="margin-top: 10px;">
                                    <label for="student_no">&nbsp;&nbsp;&nbsp;性别</label>
                                    <input type="text" class="form-control" name="studentSex" id="studentSex">
                                </div>
                            </td>
                            <td class="th">
                                <div class="form-group" style="margin-top: 10px;">
                                    <label for="student_name">&nbsp;&nbsp;&nbsp;电话</label>
                                    <input type="text" class="form-control" name="studentPhone" id="studentPhone">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="th">
                                <div class="form-group" style="margin-top: 10px;">
                                    <label>&nbsp;&nbsp;&nbsp;班级</label>
                                    <select class="form-control" style="width: 180px;" name="clazz.classId" id="classId">
                                       <s:iterator value="#clazzList">
	                                    	<option value="<s:property value="classId"/>">
	                                    		<s:property value="className"/>
	                                    	</option>
	                                    </s:iterator>
                                    </select>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn-primary">保存</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- 添加 -->
<div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h2 class="modal-title" id="myModalLabel">添加学生信息</h2>
            </div>
            <form action="StudentAction_add" class="form-inline" method="post">
                <input type="hidden" name="page" value="studentManage">
                <div class="modal-body">
                    <table>
                        <tr>
                            <td class="th">
                                <div class="form-group">
                                    <label for="student_no">&nbsp;&nbsp;&nbsp;学号</label>
                                    <input type="text" class="form-control" name="studentNo">
                                </div>
                            </td>
                            <td class="th">
                                <div class="form-group">
                                    <label for="student_name">&nbsp;&nbsp;&nbsp;姓名</label>
                                    <input type="text" class="form-control" name="studentName">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="th">
                                <div class="form-group" style="margin-top: 10px;">
                                    <label for="student_no">&nbsp;&nbsp;&nbsp;性别</label>
                                    <input type="text" class="form-control" name="studentSex">
                                </div>
                            </td>
                            <td class="th">
                                <div class="form-group" style="margin-top: 10px;">
                                    <label for="student_name">&nbsp;&nbsp;&nbsp;电话</label>
                                    <input type="text" class="form-control" name="studentPhone">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="th">
                                <div class="form-group" style="margin-top: 10px;">
                                    <label>&nbsp;&nbsp;&nbsp;班级</label>
                                    <select class="form-control" style="width: 180px;" name="clazz.classId">
                                        <s:iterator value="#clazzList">
	                                    	<option value="<s:property value="classId"/>" <s:if test="classId==#classId">selected="selected"</s:if>>
	                                    		<s:property value="className"/>
	                                    	</option>
	                                    </s:iterator>
                                    </select>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn-primary">添加</button>
                </div>
            </form>
        </div>
    </div>
</div>
</html>