<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라인프랜즈 - 로그인</title>

</head>
<body>

<%--    	<form:form action="#" modelAttribute="" > --%>
<!--    		<div class="input_box" > -->
<!--    			<label class="input_label" > 아이디 -->
<%--    				<form:input path="id" cssClass="" /> --%>
<!--    			</label> -->
<!--    			<label class="input_label" > 비밀번호 -->
<%--    				<form:password path="pw" cssClass="" /> --%>
<!--    			</label> -->
<!--    			<input type="submit" value="로그인" > -->
<!--    		</div> -->
<%--    	</form:form> --%>
            
    <div class="container">
    	<div class="login_wrap">        
	        <section>    
	            <form action="#" method="post">
	                <div class="ip_box">
	                    <label class="ip_label">
	                        <input class="id_ip" name="#" type="text" placeholder="아이디">
	                    </label>
	                    <label class="ip_label">
	                        <input class="pw_ip" name="#" type="password" placeholder="비밀번호">
	                    </label>
	                    
	                    <div class="ip_btn_box">
	                        <div class="ch_wrap">
	                            <input class="ch_ip" type="checkbox" name="#">
	                            <span>로그인 상태 유지</span>
	                        </div>
	                    </div>
	                </div>
	                <div class="msg_box">
	                    <span>! 아이디 또는 비밀번호를 확인해주세요.</span>
	                </div>
	                <div class="login_btn">
	                    <input class="login_btn_ip" type="submit" value="로그인">
	                </div>
	            </form>
	        </section>
	    </div>
    </div>
</body>
</html>