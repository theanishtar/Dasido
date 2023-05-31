<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="views/css/validator.css">
</head>
<body>
    <div class="container">
        <h2>Mã xác nhận</h2>
        <p>
          DASIDO đã gửi mã xác nhận đến email của bạn <br/>
          Nhập mã dưới đây để xác nhận địa chỉ email của bạn
        </p>
    
        <div class="code-container">
          <input type="text" class="code" maxlength="6" placeholder="Nhập mã">
        </div>
    
        <div>
          <button type="button" class="btn btn-primary">Xác nhận</button>
        </div>
        <small class="info">
            Quay lại <a href="signup"> đăng ký</a>
        </small>
    
      </div>
</body>
</html>