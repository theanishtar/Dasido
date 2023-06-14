<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="fr"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="views/css/signup.css">
    <script src="https://kit.fontawesome.com/152112956f.js" crossorigin="anonymous"></script>
<style type="text/css">


body {
    font-family: 'Poppins', sans-serif;
    /* background: linear-gradient(to right, #333399, #ff00cc); */
    background: linear-gradient(to right, #112D60, #DD83E0);
    display: flex;
    justify-content: center;
    align-items: center;
}

.reason__container {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 2rem;
    padding-top: 0.5rem;
}

.right_content {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 1rem;
}

.right_content {
    display: flex;
    align-items: center;
    justify-content: center;
}

.left_content>div {
    max-width: 520px;
    display: grid;
    gap: 1rem;
}

.right_content .section__title {
    font-size: 2.6rem;
    line-height: 4rem;
    font-weight: 800;
    color: var(--text-dark);
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    color: #7ed6df;
    margin-bottom: 0px;
}

.right_content .section__title p {
    font-size: 2.6rem;
    line-height: 4rem;
    color: #ffffff;
    margin-bottom: 0px;
}

.section__subtitle {
    font-size: 1rem;
    color: var(--text-dark);
    max-width: calc(var(--max-width) / 2);
    margin-bottom: 1rem;
    color: #c7ecee;
}

div.return {
    font-size: 1rem;
    color: #c7ecee;

}

div.return a {
    text-decoration: none;
    color: #67e6dc;
}

.right_content {
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
}

/* signup */
p {
    margin-bottom: 0px;
    font-size: 15px;
    color: #777;
}

h2 {
    line-height: 1.66;
    margin: 0;
    padding: 0;
    font-weight: 900;
    color: #222;
    font-family: 'Montserrat';
    font-size: 24px;
    text-transform: uppercase;
    text-align: center;
    margin-bottom: 40px;
}
.container {
    width: 660px;
    position: relative;
    margin: 0 auto;
}

.signup-content {
    background: rgba(240, 240, 240, 0.5);
    border-radius: 10px;
    -moz-border-radius: 10px;
    -webkit-border-radius: 10px;
    -o-border-radius: 10px;
    -ms-border-radius: 10px;
    padding: 50px 50px;
}

.form-group {
    overflow: hidden;
    margin-bottom: 20px;
}

.form-input {
    background: rgba(255, 255, 255, .3);
    width: 100%;
    border: none;
    border-radius: 100px;
    padding: 17px 20px;
    box-sizing: border-box;
    font-size: 14px;
    font-weight: 500;
    color: #222;
    transition: background .5s;
    outline: none;
}
.signup-form input:focus {
    background: white;
}
.form-submit {
    width: 100%;
border-radius: 100px;
    padding: 17px 20px;
    box-sizing: border-box;
    font-size: 14px;
    font-weight: 700;
    color: #fff;
    text-transform: uppercase;
    border: none;
    background: black;
}

.signup-form .form-submit:hover {
    background-color: rgba(0, 0, 0, 0.85);
    cursor: pointer;
}

.label-agree-term {
    font-size: 12px;
    font-weight: 600;
    color: #555;
}

.term-service {
    color: #555;
}

.loginhere {
    color: #555;
    font-weight: 500;
    text-align: center;
    margin-top: 20px;
    margin-bottom: 5px;
}

.loginhere-link {
    font-weight: 700;
    color: #222;
}

.field-icon {
    float: right;
    margin-right: 17px;
    margin-top: -32px;
    position: relative;
    z-index: 2;
    color: #555;
}
/* Login Card Social Buttons */
.method{
    display: flex;
    justify-content: center;
    align-items: center;
    margin-right: 2rem;
}
.striped {
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
    margin: 1rem 0;
}
.striped-line {
    flex: auto;
    flex-basis: auto;
    border: none;
    outline: none;
    height: 2px;
    background: #dadce0;
}
.striped-text {
    font-family: inherit;
    font-size: 1rem;
    font-weight: 500;
    line-height: inherit;
    color: #121212;
    margin: 0 1rem;
}
 .method-control {
    margin-bottom: 1rem;
    
}
.method-control a{
    text-decoration: none;
    border: none;
}
.method-action {
    font-family: inherit;
    font-size: 0.95rem;
    font-weight: 500;
    line-height: inherit;
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    height: auto;
    padding: 1rem 1.25rem;
    outline: none;
    border: 2px solid #dadce0;
    border-radius: 2rem;
    color: #121212;;
    background: #ffffff;
    text-rendering: optimizeLegibility;
    transition: all 0.35s ease;
}
.method-action:hover {
    background: #f1f5f9;
}
.fa-google {
    font-size: 1rem;
    line-height: inherit;
    margin-right: 0.5rem;
    color: #f44336;
}
@media screen and (max-width: 768px) {
    .container {
        width: calc(100% - 40px);
        max-width: 100%;
    }
    section.reason {
    max-width: min-content;
}


@media screen and (max-width: 480px) {
    .signup-content {
        padding: 50px 25px;
    }
}
/* Responsive */
@media (max-width: 768px) {
    body {
        padding: 0 15px 0 15px;
    }

    .right_content {
        display: none;
    }

    .signup-content {
        width: 260px;
        padding: 2rem;
    }

    .reason__container {
        margin-top: 5rem;
    }
}
</style>
</head>
<body>
<section class="reason">
        <div class="section__container reason__container">
            <div class="left_content">
                <div class="container">
                    <div class="signup-content">
                        <fr:form action="/createuser" method="POST" modelAttribute="user" id="signup-form" class="signup-form">
                        <h2 class="form-title"><s:message code="login.signup" /></h2>
                            <!-- <p class="content">Đăng ký để trao và nhận hàng ngàn món đồ Secondhand!!!</p> -->
                            <div class="form-group">
                                <fr:input type="text" path="username" class="form-input" name="username" id="username" placeholder="annv"/>
                                <fr:errors path="username"></fr:errors>
                                <span>${messageuser}</span>
                            </div>
                             <div class="form-group">
                                <fr:input type="text" path="fullname" class="form-input" name="fullname" id="fullname" placeholder="Nguyen Van An" />
                                <fr:errors path="fullname"></fr:errors>                            </div>
                            <div class="form-group">
                                <fr:input type="email" path="email" class="form-input" name="email" id="email" placeholder="an@gmail.com"/>
                            <fr:errors path="email"></fr:errors>
                            <span>${messageemail}</span>
                            </div>
                            <div class="form-group">
                                <fr:input type="text" path="password" class="form-input" name="password" id="password" placeholder="123"/>
                               <fr:errors path="password"></fr:errors>
                                <span toggle="#password" class="zmdi zmdi-eye field-icon toggle-password"></span>
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-input" name="re_password" id="re_password" placeholder="123" required/>
                                <span>${message}</span>
                            </div>
                       
                            <div class="form-group">
                                <input type="submit" name="submit" id="submit" class="form-submit" value="<s:message code="login.signup" />"/>
                            </div>
                        </fr:form>
                        <div class="striped">
                            <span class="striped-line"></span>
                            <span class="striped-text">Or</span>
                            <span class="striped-line"></span>
                        </div>
                        <div class="method">
                            <div class="method-control">
                                <a href="#" class="method-action">
                                    <i class="fa-brands fa-google"></i>
                                    <span><s:message code="login.loginwgg" /></span>
                                </a>
                            </div>
                        </div>
                        <p class="loginhere">
                        <s:message code="login.alreadyhaveaccount" />? <a href="log" class="loginhere-link"><s:message code="forgotPW.login" /></a>
                        </p>
                    </div>
                </div>
                
            </div>
            <div class="right_content">
                <div>
                    <div class="section__title">
                        <p><s:message code="index.title" /></p>
                        <s:message code="login.slogan" />
                    </div>
                    <p class="section__subtitle">
                        <!-- "Chia sẻ đồ cũ - Tạo niềm vui mới"<br> -->
                        <s:message code="login.logintouse" />!!!
                    </p>
                    <div class="return">
                        <s:message code="forgotPW.turnback" />
                        <a href="index"><s:message code="login.home" /></a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>