<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="Login.AdminHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
    <style>
                        #left-side {
            float: left;
        }

        #right-side {
            float: right;
        }

            #right-side li {
                display: inline-block;
                margin: 15px;
                padding: 15px;
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
           margin-top:124px;
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
       .Button{
           margin-top:140px;
           margin-left:300px;
       }
       table td{
           padding:15px;
       }
       .label, .label1, .label2{
           text-align:center;
       }
       #btnTestReport{
            background-image: url('tests.png');
             background-repeat: no-repeat;
             background-size: cover;
        }
        #btnStudentReport {
            background-image: url('studentre.png');
            background-repeat: no-repeat;
            background-size: cover;
            }
        #btnStaffReport{
            background-image: url('staffima.png');
             background-repeat: no-repeat;
             background-size: cover;
        }
                   </style>
</head>
<body>
    <header>
        <ul id="left-side">
         <li><img src="ksreilogo.jpg" class="image"/></li>
        </ul>      
<ul  id="right-side" class="auto-style1">            
            <li ><i class="fa fa-home" aria-hidden="true" style="font-size:23px;color:white;"></i><a href="MainHomePage.aspx"> Home</a></li>
            <li > <i class="fa fa-user" aria-hidden="true" style="font-size:23px;color:white;"></i><a href="#"> AboutUs</a></li>
            <li> <<i class="fa fa-phone" aria-hidden="true" style="font-size:23px;color:white;"></i><a href="#"> Contact</a></li>
   
        </ul>
        <div class="ksrei">
            <br />
           <h1>KSREI TestPortal</h1>
       </div>
           </header>
    <form id="form1" runat="server">
         <div class="Button">
     <table>
                <tr>
                    <td>
                        <asp:Button ID="btnTestReport" runat="server" Text="" OnClick="btnTestReport_Click" Height="450px" Width="400px" />   
                        <br /><br />
                        <div class="label"><asp:Label ID="Label1" runat="server" Text="Test Report" Font-Bold="True" Font-Names="Times New Roman" Font-Size="20px"></asp:Label>
                    </div>
                    </td>
                    <td>
                         <asp:Button ID="btnStudentReport" runat="server" Text="" OnClick="btnStudentReport_Click"  Height="450px" Width="400px"/>
                      
                        <br /><br />
                        <div class="label1"><asp:Label ID="Label2" runat="server" Text="Student Report" Font-Bold="True" Font-Names="Times New Roman" Font-Size="20px"></asp:Label></div>
                    </td>
                    <td>
                         <asp:Button ID="btnStaffReport" runat="server" Text="" OnClick="btnStaffReport_Click" Height="450px" Width="400px" />
                        <br /><br />
                        <div class="label2"><asp:Label ID="Label3" runat="server" Text="Staff Report" Font-Bold="True" Font-Names="Times New Roman" Font-Size="20px"></asp:Label></div>
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
