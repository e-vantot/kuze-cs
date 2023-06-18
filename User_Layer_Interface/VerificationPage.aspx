<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VerificationPage.aspx.cs" Inherits="kuze.VerificationPage" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Email Verification</title>
    <style>
        body {
            padding:0;
            margin: 0;
            background: url(../Images/kuze-login-bg1.jpeg);
            background-size: cover;
            width: 100%;
            height: 100%;
            font-family: 'Poppins', sans-serif;
        }

        
    /*Nav Bar*/
    .navbar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background-color: #fff;
        padding: 15px;
    }

    .navbar p {
        color: darkslateblue;
        font-size: 30px;
        font-weight: 600;
        padding: 0 auto;
        margin: 0 auto;
    }

    .navbar-list {
        list-style-type: none;
        margin: 0;
        padding: 0;
    }

    .navbar-list li {
        display: inline;
        margin-left: 10px;
        text-align: center;
    }

        .navbar-list li:first-child {
            margin-left: 0;
        }

        .navbar-list li a {
            text-decoration: none;
            color: #000;
            font-weight: 500;
            padding: 8px 10px;
            border-bottom: 2px solid transparent;
            transition: border-color 0.3s;
        }

        .navbar-list li a:hover {
             border-color: #ffc107;
             font-weight: 600;
         }

        .container{
            display: flex;
            flex-direction: column;
            justify-content: center;
            width: 100vw;
            height: 100vh;
            margin-left: 5%;
        }

        .buttonContainer{
            width: 550px;
            height: min-content;
            box-shadow: 2px 2px 4px rgb(220, 222, 223);
            padding:30px;
        }

        h2 {
            margin-bottom: 20px;
        }

        p {
            margin-bottom: 20px;
        }

        .button {
            display: inline-block;
            background-color: #9D786F;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;

        }

    @media screen and (max-width: 768px) {
     /* Media query for mobile devices */
    .navbar {
        flex-direction: column;
        padding: 10px;
    }

    .navbar-logo {
        margin-bottom: 10px;
    }

    .navbar-list li {
        display: block;
        margin: 5px 0;
    }

    .footer {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
    }

    .footer p {
        flex-basis: 50%;
    }
    </style>
</head>
<body>
    <div class="container">
        <div class="buttonContainer">
            <h2>Email Verification</h2>
            <p>Please click the button below to verify your email address:</p>
            <a href="#" class="button">Verify Email</a>
        </div>
    </div>
</body>
</html>
