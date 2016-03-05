<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login1.aspx.vb" Inherits="VFMS_test2.Login1" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta charset="UTF-8">
    <title>Random Login Form</title>




    <style>
        /* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */
        @import url(http://fonts.googleapis.com/css?family=Exo:100,200,400);
        @import url(http://fonts.googleapis.com/css?family=Source+Sans+Pro:700,400,300);

        body {
            margin: 0;
            padding: 0;
            background: #fff;
            color: #fff;
            font-family: Arial;
            font-size: 12px;
        }

        .body {
            position: absolute;
            top: -20px;
            left: -20px;
            right: -40px;
            bottom: -40px;
            width: auto;
            height: auto;
            background-image: url("images/w_login.jpg");
            background-size: cover;
            -webkit-filter: blur(5px);
            z-index: 0;
        }

        .grad {
            position: absolute;
            top: -20px;
            left: -20px;
            right: -40px;
            bottom: -40px;
            width: auto;
            height: auto;
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(0,0,0,0)), color-stop(100%,rgba(0,0,0,0.65))); /* Chrome,Safari4+ */
            z-index: 1;
            opacity: 0.7;
        }

        .header {
            position: absolute;
            top: 342px;
            left: 428px;
            z-index: 2;
        }

            .header div {
                float: left;
                color: #fff;
                font-family: RSU, sans-serif;
                font-size: 35px;
                font-weight: 200;
            }

                .header div span {
                    color: #5379fa !important;
                    font-size: 50px;
                }

                .header div span1 {
                    color: #ed4848 !important;
                    font-size: 40px;
                }

        .login {
            position: absolute;
            top: 297px;
            left: 892px;
            height: 150px;
            width: 350px;
            padding: 10px;
            z-index: 2;
        }

        .tbuser {
            width: 250px;
            height: 30px;
            background: transparent;
            border: 1px solid rgba(255,255,255,0.6);
            border-radius: 2px;
            color: #fff;
            font-family: 'Exo', sans-serif;
            font-size: 16px;
            font-weight: 400;
            padding: 4px;
        }

        .tbpassword {
            width: 250px;
            height: 30px;
            background: transparent;
            border: 1px solid rgba(255,255,255,0.6);
            border-radius: 2px;
            color: #fff;
            font-family: 'Exo', sans-serif;
            font-size: 16px;
            font-weight: 400;
            padding: 4px;
            margin-top: 10px;
        }

        .login input[type=button] {
            width: 260px;
            height: 35px;
            background: #fff;
            border: 1px solid #fff;
            cursor: pointer;
            border-radius: 2px;
            color: #a18d6c;
            font-family: 'Exo', sans-serif;
            font-size: 16px;
            font-weight: 400;
            padding: 6px;
            margin-top: 10px;
        }

            .login input[type=button]:hover {
                opacity: 0.8;
            }

            .login input[type=button]:active {
                opacity: 0.6;
            }

        .tbuser:focus {
            outline: none;
            border: 1px solid rgba(255,255,255,0.9);
        }

        .tbpassword:focus {
            outline: none;
            border: 1px solid rgba(255,255,255,0.9);
        }

        .login input[type=button]:focus {
            outline: none;
        }

        ::-webkit-input-placeholder {
            color: rgba(255,255,255,0.6);
        }

        ::-moz-input-placeholder {
            color: rgba(255,255,255,0.6);
        }

        .btn {
            width: 260px;
            height: 35px;
            background: #fff;
            border: 1px solid #fff;
            cursor: pointer;
            border-radius: 2px;
            color: #a18d6c;
            font-family: 'Exo', sans-serif;
            font-size: 16px;
            font-weight: 400;
            padding: 6px;
            margin-top: 5px;
        }

            .btn:hover {
                opacity: 0.8;
            }

            .btn:active {
                opacity: 0.6;
            }

            .btn:focus {
                outline: none;
            }
    </style>


    <script src="js/prefixfree.min.js"></script>


</head>

<body>
    <form runat="server">
        <div class="body"></div>
        <div class="grad"></div>
        <div class="header">
            <div><strong>กองทุน</strong><span>หมู่บ้าน</span><span1><strong>ไอตีมุง</strong></span1></div>
        </div>
        <br>

        <div class="login">
            <%--<input id="User_tb" type="text" placeholder="username" name="user" runat="server">--%>
            <%-- <input id="password_tb" type="password" placeholder="password" name="password" runat="server">--%>
            <%--<input id="btn_Login" runat="server" type="button" value="Login" onserveclick="Login_Click" />--%>
            <asp:TextBox ID="User_tb" runat="server" placeholder="Username" class="tbuser"></asp:TextBox><br>
            <asp:TextBox ID="Password_tb" runat="server" placeholder="Password" class="tbpassword"></asp:TextBox><br>
            <asp:Button ID="btn_Login" runat="server" class="btn" onserverclick="Login_Click" Text="Login"></asp:Button>
        </div>
    </form>
    <%--<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>--%>
</body>
</html>

