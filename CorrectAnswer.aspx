<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CorrectAnswer.aspx.cs" Inherits="Login.CorrectAnswer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
    <title></title>   
    <style>
        .button{
            margin-left:41%;
            margin-top:2%;
        } #left-side{
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
           margin-top:657px;
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
       .auto-style1 {
           width: 557px;
           height: 54px;
           margin-top: 18px;
       }
       .ksrei{
           color:white;
           text-align:center;
           top:20px;
           margin-left:380px;
       }
       .but{
           margin-top:50px;
           
       }
       #Button2{
           margin-left:80px;
       }
       #Button1{
           margin-left:-20px;
       }
       #Button3{
           margin-left:5px;
       }
       
    </style>
</head>
<body class="body">
    <form id="form1" runat="server">
        <div class="Buttons">
        <div class="button">
            <asp:Button ID="Button3" runat="server" Text="View Test Answer" OnClick="Button3_Click" />
           <div class="but">
             <asp:Button ID="Button1" runat="server" Text="Back" OnClick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" Text="home" OnClick="Button2_Click" /></div>
        </div>
            </div>
    </form>
</body>
</html>
