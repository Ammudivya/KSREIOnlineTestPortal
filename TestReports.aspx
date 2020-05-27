<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestReports.aspx.cs" Inherits="Login.TestReports" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
 <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        .split {
            height: 100%;
            width: 50%;
            position: fixed;
            z-index: 1;
            top: 0;
            overflow-x: hidden;
            padding-top: 20px;
        }
        /* Control the left side */
        /* If you want the content centered horizontally and vertically */
        .centered {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
        }
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
           margin-top:480px;
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
           margin-top: 0px;
           margin-left: -39px;
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
       .row{
           margin-right:50%;
           margin-left:5%;
       }
       table td{
           padding:15px;
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
            <li > <i class="fa fa-user" aria-hidden="true" style="font-size: 23px; color: white;"></i><a href="#"> AboutUs</a></li>
            <li> <<i class="fa fa-phone" aria-hidden="true" style="font-size:23px;color:white;"></i><a href="#"> Contact</a></li>
   
        </ul>
        <div class="ksrei">
            <br />
           <h1>KSREI TestPortal</h1>
       </div>
           </header>
    <form id="form1" runat="server">
        <div class="row">

            <div class="col-4" style="background-color: whitesmoke;">
                <br />
                <div style="margin-left: 2%;">
                     <asp:Label ID="Label4" runat="server" Text="FILTER BY" Font-Bold="True" Font-Names="Times New Roman" Font-Size="20px"></asp:Label><br />
                    <br />
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text="ORGANISATION"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownList1" AutoPostBack="true" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged1" style="margin-left:5%;">
                <asp:ListItem>--College--</asp:ListItem>
            </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                 <asp:Label ID="Label2" runat="server" Text="DEPARTMENT"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownList2" runat="server" style="margin-left:5%;">
                        <asp:ListItem>--Deparment--</asp:ListItem>
                    </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                 <asp:Label ID="Label3" runat="server" Text="YEAR"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownList3" runat="server" style="margin-left:5%;">
                         <asp:ListItem>--Year--</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                         <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>1</asp:ListItem></asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Apply" style="margin-left:10%;" />
                    <br />
                    <br />
                    &nbsp;<br />
                    </div>
                </div> 
        </div>
        <asp:Table ID="Table1" runat="server" class="table table-responsive">
        </asp:Table>
    </form>
     <footer>
        &copy;Virtusa 2020
    </footer> 
</body>
</html>
