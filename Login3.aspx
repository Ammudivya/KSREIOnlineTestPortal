<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login3.aspx.cs" Inherits="Login.Login3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
    <title></title>
    <style>
        .btn{
            cursor:pointer;
            font-size:16px;
            border:none;
        }
        .login-box{
            width:500px;
            height:350px;
            background:rgba(192,192,192,0.3);
            color:#fff;
            top:50%;
            left:50%;
            position:absolute;
            transform:translate(-50%,-50%);
            box-sizing:border-box;
            border-radius:15px;

        }
        .content {
            margin-top: 60px;
            margin-left: 30px;
            margin-right: 30px;
            margin-bottom: 30px;
        }
        .avatar{
            width:100px;
            height:100px;
            border-radius:50%;
            position:absolute;
            top:-15%;
            left:calc(50% - 50px);
        }
        td{
            padding:12px;
            text-align:center;
        }
        .align{
            text-align:center;
        }
        .check{
            margin-left:75px;
        }
        body{
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
      .auto-style1 {
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
       .auto-style2 {
           width: 158px;
           height: 113px;
       }
       header{
           background-color:#483D8B;
           height:120px;
       }
       
       ul li{
           list-style-type:none;
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
       #TextBox1, #TextBox2, #Button1{
           border-radius:10px;
       }
    </style>
    <script type="text/javascript">

        function myFunction() {
            var x = document.getElementById("TextBox2");
            if (x.type === "password") {
                x.type = "text";
            } else {
                x.type = "password";
            }
        } 

    </script>
</head>
<body class="body">
    <header>
        <ul id="left-side" class="auto-style2">
         <li><img src="ksreilogo.jpg" class="image"/></li>
        </ul>
       
<ul  id="right-side" class="auto-style1">            
            <li ><i class="fa fa-home" aria-hidden="true" style="font-size:23px;color:white;"></i><a href="MainHomePage.aspx"> Home</a></li>
            <li > <i class="fa fa-user" aria-hidden="true" style="font-size: 23px; color: white;"></i><a href="#"> AboutUs</a></li>
            <li> <i class="fa fa-phone" aria-hidden="true" style="font-size: 23px; color: white;"></i><a href="#"> Contact</a></li>
        </ul>
        <div class="ksrei">
            <br />
           <h1>KSREI TestPortal</h1>
       </div>
           </header>
    <form id="form1" runat="server">
        <div class="login-box">
            <img src="avatarlogo.jpg" class="avatar" />
            <div class="content">
            <table>
                <tr>
                    <td>
                        <i class="fa fa-user-circle" aria-hidden="true" style="font-size:23px;color:black;"></i>
                        <asp:Label ID="Label1" runat="server" Text="Username" BorderStyle="None" Font-Bold="True" Font-Names="Times New Roman" Font-Size="20px" ForeColor="Black" Width="116px"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" Width="210px" BorderStyle="None" Font-Bold="False" Font-Names="Times New Roman" Font-Size="23px" Height="28px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <i class="fa fa-lock" aria-hidden="true" style="font-size:27px;color:black;"></i>
                        <asp:Label ID="Label2" runat="server" Text=" Password" BorderStyle="None" Font-Bold="True" Font-Names="Times New Roman" Font-Size="20px" ForeColor="Black" Width="116px"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" Width="210px" BorderStyle="None" Font-Bold="False" Font-Names="Times New Roman" Font-Size="20px" Height="28px"></asp:TextBox>                      
                    </td>
                </tr>
                 </table>      
                <div class="align">
                 <div class="check"><asp:CheckBox ID="CheckBox"  runat="server" onclick="myFunction()" ForeColor="Black" Text="Show Password" Font-Bold="True" Font-Names="Times New Roman" Font-Size="18px" /> </div> <br />           
                 <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Text="Change Password?" Font-Bold="True" Font-Names="Times New Roman" Font-Size="20px" Font-Underline="True" ForeColor="#0066FF"></asp:LinkButton><br /> <br />                 
                 <asp:Button ID="Button1" runat="server" Text="Sign In" OnClick="Button1_Click" BackColor="Silver" Font-Bold="True" Font-Italic="False" Font-Names="Times New Roman" Font-Size="22px" Width="141px" BorderStyle="None" Height="35px" /><br /> <br />           
                 <asp:Label ID="Label3" runat="server" Text="" Font-Italic="True" Font-Names="Times New Roman" Font-Size="20px" ForeColor="Red" Height="46px" Width="449px"></asp:Label>                       
        </div>
        </div>
         </div>
    </form>
    <footer>
        &copy;Virtusa 2020
    </footer>
</body>
</html>
