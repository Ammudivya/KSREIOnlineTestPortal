<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Change_password.aspx.cs" Inherits="Login.Change_password" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
    <title></title>
    <style>
        .changepassword{
            width:600px;
            height:450px;
            background:rgba(192,192,192,0.3);
            color:#fff;
            top:50%;
            left:50%;
            position:absolute;
            transform:translate(-50%,-50%);
            box-sizing:border-box;
            border-radius:15px;
        }
        #TextBox1, #TextBox2, #TextBox3, #Button1, #Button2{
            border-radius:10px;
        }
        .password{
            width:150px;
            height:100px;
            border-radius:50%;
            position:absolute;
            top:-11%;
            left:calc(45% - 50px);
            border:double;
        }
        .content{
            margin-top: 80px;
            margin-left: 35px;
            margin-right: 30px;
            margin-bottom: 30px;
        }
        td{
            text-align:center;
            padding:12px;
        
        }
        .auto-style1 {
            margin-top: 0px;
        }
        .auto-style2 {
            width: 262px;
        }
        .auto-style3 {
            width: 531px;
        }
        #left-side{
           float:left;
       }
       #right-side{
           float:right;
       }
       #right-side li{
           display:inline-block;
           margin:15px;
           padding:15px;
       }
       .body{
           margin-top:0px;
       }
       footer{
           clear:both;
           background-color:#483D8B;
           text-align:center;
           padding:10px;
           color:white;
           margin-top:821px;
       }
       header{
           background-color:#483D8B;
           height:120px;
       }
       
       ul li{
           list-style-type:none;
       }
       body {
           background-color: white;
           margin: 0px;
           padding: 0px;
       }
       .image {
           height: 145px;
           width: 200px;
           margin-top: -18px;
           margin-left: -40px;
       }
      a{
          color:white;
          text-decoration:none;
      }
       
       .auto-style4 {
           width: 557px;
           height: 54px;
           margin-top: 18px;
       }
       .ksrei{
           color:white;
           text-align:center;
           top:20px;
           margin-left:500px;
       }
        .auto-style5 {
            width: 158px;
            height: 113px;
        }
    </style>
    <script type="text/javascript">

        function myFunction() {
            var current_pass = document.getElementById("TextBox1");
            var new_pass = document.getElementById("TextBox2");
            var confirm_pass = document.getElementById("TextBox3");
            if (current_pass.type === "password" && new_pass.type === "password" && confirm_pass.type === "password") {
                current_pass.type = "text";
                new_pass.type = "text";
                confirm_pass.type = "text";
            } else {
                current_pass.type = "password";
                new_pass.type = "password";
                confirm_pass.type = "password";
            }
        } 

    </script>
</head>
<body class="body">
     <header>
        <ul id="left-side" class="auto-style5">
         <li><img src="ksreilogo.jpg" class="image"/></li>
        </ul>       
<ul  id="right-side" class="auto-style4">            
            <li ><i class="fa fa-home" aria-hidden="true" style="font-size:23px;color:white;"></i><a href="Login3.aspx"> Home</a></li>
            <li > <i class="fa fa-user" aria-hidden="true" style="font-size:23px;color:white;"></i><a href="#"> AboutUs</a></li>
            <li> <i class="fa fa-phone" aria-hidden="true" style="font-size:23px;color:white;"></i><a href="#"> Contact</a></li>
            <li><i class="fa fa-sign-out" aria-hidden="true" style="font-size:23px;color:white;"></i><a href="MainHomePage.aspx"> Logout</a></li>
        </ul>
        <div class="ksrei">
            <br />
           <h1>KSREITestPortal</h1>
       </div>
           </header>
    <form id="form1" runat="server">
        <div class="changepassword">
            <img src="lock.jpg" class="password" />
            <div class="content">
            <table class="auto-style3">
                <tr>
                    <td class="auto-style">
                        <i class="fa fa-lock" aria-hidden="true" style="font-size:27px;color:black;"></i>
                         <asp:Label ID="Label1" runat="server" Text="Current Password" Font-Bold="True" Font-Names="Times New Roman" Font-Size="20px" ForeColor="Black" Width="220px" Height="32px"></asp:Label>
                    </td>
                    <td>
                         <asp:TextBox ID="TextBox1" runat="server" Width="210px" BorderStyle="None" Font-Bold="False" Font-Names="Times New Roman" Font-Size="23px" Height="28px" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <i class="fa fa-unlock" aria-hidden="true" style="font-size:27px;color:black;"></i>
                        <asp:Label ID="Label2" runat="server" Text="New Password" Font-Bold="True" Font-Names="Times New Roman" Font-Size="20px" ForeColor="Black" Width="220px" Height="32px"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" Width="210px" BorderStyle="None" Font-Bold="False" Font-Names="Times New Roman" Font-Size="23px" Height="28px" TextMode="Password"></asp:TextBox><br /><br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <i class="fa fa-lock" aria-hidden="true" style="font-size:27px;color:black;"></i>
                        <asp:Label ID="Label3" runat="server" Text="Confirm New Password" Font-Bold="True" Font-Names="Times New Roman" Font-Size="20px" ForeColor="Black" Width="220px" CssClass="auto-style1" Height="32px"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server" Width="210px" BorderStyle="None" Font-Bold="False" Font-Names="Times New Roman" Font-Size="23px" Height="28px" TextMode="Password"></asp:TextBox><br /><br />
                    </td>
                </tr>
            </table>
                <br />
                <center> <asp:CheckBox ID="CheckBox"  runat="server" onclick="myFunction()" ForeColor="Black" Text="Show Password" Font-Bold="True" Font-Names="Times New Roman" Font-Size="18px" /></center>
           </div> 
           <center>
         <asp:Button ID="Button1" runat="server" Text="Save Changes" OnClick="Button1_Click" BackColor="Silver" Font-Bold="True" Font-Italic="True" Font-Names="Times New Roman" Font-Size="20px" Width="141px" BorderStyle="None" Height="35px" />&nbsp&nbsp&nbsp&nbsp
         <asp:Button ID="Button2" runat="server" Text="Cancel" BackColor="Silver" Font-Bold="True" Font-Italic="True" Font-Names="Times New Roman" Font-Size="20px" Width="141px" BorderStyle="None" Height="35px" OnClick="Button2_Click" />
               <br />
            <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
            </center>           
        </div>
    </form>
    <footer>
        &copy;Virtusa 2020
    </footer>
</body>
</html>
