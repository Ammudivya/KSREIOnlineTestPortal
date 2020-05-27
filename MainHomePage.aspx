<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainHomePage.aspx.cs" Inherits="Login.MainHomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
    <title></title>
   <style>
       .main{
           margin-top:10%;
           margin-left:50%;
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
           margin-top:757px;
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
       form {
           width: 80%;
           padding: 50px;
           position: absolute;
           top: 50%;
           left: 50%;
           text-align: center;
           transform: translate(-50%,-50%);
           margin-left:140px;
           margin-right:140px;
       }
         #Button1, #Button2, #Button3, #Button4 {
             font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
             font-size: large;
             border: 1px solid black;
             padding: 15px;
             cursor: pointer;
             display: block;
             margin: 2%;
             width: 17%;
             height: 150px;
             float: left;
             background-color: #483D8b;
             color: white;
            font-weight:bold;   
         }
    #Button1:hover, #Button2:hover, #Button3:hover, #Button4:hover{
         background-color:#9f91ee;
         font-size:larger;
         /*font-weight:750;*/
     }
     #Button1{
            background-image: url('student.png');
             background-repeat: no-repeat;
             background-size: cover;
         }
      #Button4{
            background-image: url('intern.png');
             background-repeat: no-repeat;
             background-size: cover;
         }
       #Button2{
            background-image: url('staff.jpg');
             background-repeat: no-repeat;
             background-size: cover;
         }
        #Button3{
            background-image: url('admin.jpg');
             background-repeat: no-repeat;
             background-size: cover;
         }
       .auto-style3 {
           width: 416px;
       }
       .auto-style4 {
           margin-right: 0px;
           left: 45%;
           top: 53%;
           width: 49%;
           height: 640px;
       }
       .category{
           text-align:center;
           margin-left:90px;
       }
       .auto-style5 {
           width: 544px;
       }
       .auto-style6 {
           width: 544px;
           height: 361px;
       }
       .auto-style7 {
           width: 416px;
           height: 361px;
       }
   </style>
</head>   
<body class="body">
    <header>
        <ul id="left-side">
         <li><img src="ksreilogo.jpg" class="image"/></li>
        </ul>      
<ul  id="right-side" class="auto-style1">            
            <li ><i class="fa fa-home" aria-hidden="true" style="font-size:23px;color:white;"></i><a href="MainHomePage.aspx"> Home</a></li>
            <li > <i class="fa fa-user" aria-hidden="true" style="font-size:23px;color:white;"></i><a href="#"> AboutUs</a></li>
            <li> <i class="fa fa-phone" aria-hidden="true" style="font-size:23px;color:white;"></i><a href="#"> Contact</a></li>
   
        </ul>
        <div class="ksrei">
            <br />
           <h1>KSREI TestPortal</h1>
       </div>
           </header>
    <br />
    <br />
    <div class="category"><asp:Label ID="Label1" runat="server" Text="Select your Category?" Font-Bold="True" Font-Names="Times New Roman" Font-Size="25px" ForeColor="#003399"></asp:Label></div>

    <form id="form" runat="server" class="auto-style4">
     <div class="column"> 
         <table>
             <tr>
                 <td class="auto-style6">
                     <asp:Label ID="Label2" runat="server" Text="Student" Font-Bold="True" Font-Names="Times New Roman" Font-Size="20pt"></asp:Label>
                     <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="" Height="301px" Width="444px"/>
                     <br />
                 </td>
                 <td class="auto-style7">
                      <asp:Label ID="Label3" runat="server" Text="Intern" Font-Bold="True" Font-Names="Times New Roman" Font-Size="20pt"></asp:Label>
                     <asp:Button ID="Button4" runat="server" OnClick="Button2_Click" Text="" Height="301px" Width="444px" />  
                 </td>
             </tr>
              <tr>
                 <td class="auto-style5">
                      <asp:Label ID="Label4" runat="server" Text="Staff" Font-Bold="True" Font-Names="Times New Roman" Font-Size="20pt"></asp:Label>
                     <asp:Button ID="Button2" runat="server" OnClick="Button3_Click" Text="" Height="301px" Width="444px" />
                 </td>
                 <td class="auto-style3">
                      <asp:Label ID="Label5" runat="server" Text="Admin" Font-Bold="True" Font-Names="Times New Roman" Font-Size="20pt"></asp:Label>
                     <asp:Button ID="Button3" runat="server" OnClick="Button4_Click" Text="" Height="301px" Width="444px" />
                 </td>
             </tr>
         </table>
            
                            
                                       
            
        </div>
    </form>
    <footer>
        &copy;Virtusa 2020
    </footer>   
</body>
</html>
