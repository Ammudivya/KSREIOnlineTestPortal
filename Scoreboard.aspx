
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Scoreboard.aspx.cs" Inherits="Login.Scoreboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
    <title></title>
    <style>
        #left-side{
           float:left;
       }
       #right-side{
           float:right;
       }
        #right-side li {
            display: inline-block;
            margin: 15px;
            padding: 15px;
        }

        .body {
            margin-top: 0px;
        }

        footer {
            clear: both;
            background-color: #483D8B;
            text-align: center;
            padding: 10px;
            color: white;
            margin-top: 262px;
        }

        header {
            background-color: #483D8B;
            height: 120px;
        }

        ul li {
            list-style-type: none;
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

        a {
            color: white;
            text-decoration: none;
        }

        .auto-style1 {
            width: 557px;
            height: 54px;
            margin-top: 18px;
        }

        .ksrei {
            color: white;
            text-align: center;
            top: 20px;
            margin-left: 380px;
        }

        .left {
            width: 15%;
            float: left;
        }

        .row {
            margin-left: 1%;
            margin-top: 1%;
        }

        .final {
            margin-top:30px;
            margin-left:41%;
        }
        .right {
           
            float: left;
            width: 100%;
        }
        .Score{
            margin-top:50px;
            margin-left:33%;
            margin-right:45%;
            border:1px solid black;
        }
        table td{
            text-align:left;
            padding:10px;
        }
        .board{
            margin-top:100px;
            margin-left:40%;
        }
         .auto-style2 {
            width: 284px;
        }
        .auto-style3 {
            width: 103px;
        }
         </style>        
</head>
<body>
    <header>
        <ul id="left-side">
         <li><img src="ksreilogo.jpg" class="image"/></li>
        </ul>      
<ul  id="right-side" class="auto-style1">            
            <li ><i class="fa fa-home" aria-hidden="true" style="font-size:23px;color:white;"></i><a href="Dashboard.aspx"> Home</a></li>
            <li > <i class="fa fa-user" aria-hidden="true" style="font-size:23px;color:white;"></i><a href="#"> AboutUs</a></li>
            <li> <i class="fa fa-phone" aria-hidden="true" style="font-size:23px;color:white;"></i><a href="#"> Contact</a></li>
            <li><i class="fa fa-sign-out" aria-hidden="true" style="font-size:23px;color:white;"></i><a href="MainHomePage.aspx"> Logout</a></li>
        </ul>
        <div class="ksrei">
            <br />
           <h1>KSREI TestPortal</h1>
       </div>
           </header>
    <form id="form1" runat="server">
        <div class="board">
        <asp:Label ID="Label1" runat="server" Text="ScoreBoard" Font-Bold="False" Font-Size="30px" Font-Names="Times New Roman"></asp:Label>
        </div>
        <div class="Score">
            
            <table>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label2" runat="server" Text="Test Name" Font-Bold="False" Font-Size="20px" Font-Names="Times New Roman"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:Label ID="Label3" runat="server" Text="" Font-Bold="False" Font-Size="20px" Font-Names="Times New Roman"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label4" runat="server" Text="Total questions" Font-Bold="False" Font-Size="20px" Font-Names="Times New Roman"></asp:Label>                                 
                    </td>
                    <td class="auto-style3">                    
                        <asp:Label ID="Label5" runat="server" Text="" Font-Bold="False" Font-Size="20px" Font-Names="Times New Roman"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label6" runat="server" Text="Number of questions attended" Font-Bold="False" Font-Size="20px" Font-Names="Times New Roman"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:Label ID="Label7" runat="server" Text="" Font-Bold="False" Font-Size="20px" Font-Names="Times New Roman"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label8" runat="server" Text="Number of questions not attended" Font-Bold="False" Font-Size="20px" Font-Names="Times New Roman"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:Label ID="Label9" runat="server" Text="" Font-Bold="False" Font-Size="20px" Font-Names="Times New Roman"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label10" runat="server" Text="Number of correct answers" Font-Bold="False" Font-Size="20px" Font-Names="Times New Roman"></asp:Label>
                    </td>
                    <td class="auto-style3">
                         <asp:Label ID="Label11" runat="server" Text="" Font-Bold="False" Font-Size="20px" Font-Names="Times New Roman"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label12" runat="server" Text="Number of wrong answers" Font-Bold="False" Font-Size="20px" Font-Names="Times New Roman"></asp:Label>
                    </td>
                    <td class="auto-style3">
                         <asp:Label ID="Label13" runat="server" Text="" Font-Bold="False" Font-Size="20px" Font-Names="Times New Roman"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label14" runat="server" Text="Total score" Font-Bold="False" Font-Size="20px" Font-Names="Times New Roman"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:Label ID="Label15" runat="server" Text="" Font-Bold="False" Font-Size="20px" Font-Names="Times New Roman"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
            <div class="final">
                <asp:Button ID="Button1" runat="server" Text="View answers" OnClick="Button1_Click" style="height: 26px" />
            </div>
       
    </form>
    <footer>
        &copy;Virtusa 2020
    </footer> 
</body>
</html>
