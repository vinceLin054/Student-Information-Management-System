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
		<title>班级管理</title>
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/my.css">
		<script src="js/jquery-2.1.0.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script type="text/javascript">
			function deleteInfo(classId){
	            if(confirm("确认删除？")){
	                location.href="ClazzAction_delete?classId="+classId;
	            }
	        };
	        function toClazzInfo(classId,className){
	            $("#classId").val(classId);
	            $("#className").val(className);
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
			        <li><a href="StudentAction_list">学生管理 <span class="sr-only">(current)</span></a></li>
			        <li class="active"><a href="ClazzAction_list">班级管理</a></li>
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
			<h2>班级列表</h2>
                <br>
                <div style="text-align: right;">
                    <button type="button" class="btn btn-default btn-md" data-toggle="modal" data-target="#add">
                        <span class="glyphicon glyphicon-plus"></span> 添加
                    </button>
                </div>	
                <hr>
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <td class="th" width="85%">
                            	班级名称
                        </td>
                        <td class="th" width="15%">
                            	操作
                        </td>
                    </tr>
                    </thead>
                    <tbody>
                    <s:iterator value="#clazzList">
                    	<tr>
                            <td class="tb">
                                <s:property value="className"/>
                            </td>
                            <td class="tb">
                                <button type="button" class="btn btn-default btn-sm" onclick="toClazzInfo('<s:property value="classId"/>','<s:property value="className"/>')">
                                    <span class="glyphicon glyphicon-pencil"></span> 修改
                                </button>
                                <button type="button" class="btn btn-default btn-sm" onclick="deleteInfo('<s:property value="classId"/>')">
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
                <h2 class="modal-title" id="myModalLabel">修改班级信息</h2>
            </div>
            <form action="ClazzAction_update" class="form-inline" method="post">
                <div class="modal-body" style="text-align: center;">
                    <input type="hidden" name="classId" id="classId">
                    <div class="modal-body" style="text-align: center;">
                    <div class="form-group">
                        <label for="className">&nbsp;&nbsp;&nbsp;班级名称</label>
                        <input type="text" class="form-control" name="className" id="className">
                    </div>
                </div>
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
                <h2 class="modal-title" id="myModalLabel">添加班级信息</h2>
            </div>
            <form action="ClazzAction_save" class="form-inline" method="post">
                <div class="modal-body" style="text-align: center;">
                    <div class="form-group">
                        <label for="className">&nbsp;&nbsp;&nbsp;班级名称</label>
                        <input type="text" class="form-control" name="className">
                    </div>
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