<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PostNewTestStudent.aspx.cs" Inherits="Login.PostNewTestStudent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<meta charset="utf-8" />
     <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: "Times New Roman", Times, serif;
        }
        #form1 {
            margin: 250px auto;
            width: 500px;
        }
        .col-25 {
            float: left;
            width: 25%;
            margin-top: 6px;
        }
        .col-75 {
            float: left;
            width: 75%;
            margin-top: 6px;
        }
        .ddl, .txtbox {
            border-radius: 5px;
            background-color: steelblue;
            height: 35px;
            width: 200px;
        }
        .student{
            width: 50%;
            background: #fff;
            float: left;
            height: 60px;
            line-height: 60px;
            text-align: center;
            cursor: pointer;
            text-transform: uppercase;
        }
        .divStudent {
            background: #fff;
            padding: 40px;
            clear: both;
            width: 100%;
            box-sizing: border-box;
            height: 400px;
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
           margin-top:645px;
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
    </style>
</head>
<body>
     <header>
        <ul id="left-side">
         <li><img src="ksreilogo.jpg" class="image"/></li>
        </ul>      
<ul  id="right-side" class="auto-style1">            
            <li ><i class="fa fa-home" aria-hidden="true" style="font-size:23px;color:white;"></i><a href="StaffHome.aspx"> Home</a></li>
            <li > <i class="fa fa-user" aria-hidden="true" style="font-size:23px;color:white;"></i><a href="#"> AboutUs</a></li>
            <li> <<i class="fa fa-phone" aria-hidden="true" style="font-size:23px;color:white;"></i><a href="#"> Contact</a></li>
   
        </ul>
        <div class="ksrei">
            <br />
           <h1>KSREI TestPortal</h1>
       </div>
           </header>
    <form id="form1" runat="server">
        <div>
            <div class="divStudent" id="studentDiv" >
                <div class="row">
                    <div class="col-25">
                        <asp:Label ID="lblCollege" runat="server" Text="College"></asp:Label>
                    </div>
                    <div class="col-75">
                        <asp:DropDownList ID="ddlCollege" AutoPostBack="true"  runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" class="ddl">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <asp:Label ID="lblDepartment" runat="server" Text="Department"></asp:Label>
                    </div>
                    <div class="col-75">
                        <asp:DropDownList ID="ddlDepartment"   runat="server" class="ddl">
                            <asp:ListItem Text="-- select department --" Value="0"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <asp:Label ID="lblYear" runat="server" Text="Year"></asp:Label>
                    </div>
                    <div class="col-75">
                        <asp:DropDownList ID="ddlYear" runat="server" class="ddl">
                            <asp:ListItem Text="-- select year --" Value="0"></asp:ListItem>
                            <asp:ListItem Text="First year" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Second year" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Third year" Value="3"></asp:ListItem>
                            <asp:ListItem Text="fourth year" Value="4"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <asp:Label ID="lblTestName" runat="server" Text="Test Name"></asp:Label>
                    </div>
                    <div class="col-75">
                        <asp:TextBox ID="txtTestName" runat="server" class="txtbox"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <asp:Label ID="lblTestType" runat="server" Text="Test Type"></asp:Label>
                    </div>
                    <div class="col-75">
                        <asp:DropDownList ID="ddlType" runat="server" class="ddl">
                            <asp:ListItem Text="-- select type --" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Mandatory" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Self Analysis" Value="2"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <asp:Label ID="lblTestCategory" runat="server" Text="Test Category"></asp:Label>
                    </div>
                    <div class="col-75">
                        <asp:TextBox ID="txtCategory" runat="server" class="txtbox"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <asp:Label ID="lblStartDuration" runat="server" Text="Start duration"></asp:Label>
                    </div>
                    <div class="col-75">
                        <asp:TextBox ID="txtStartDuration" runat="server" TextMode="DateTimeLocal" class="txtbox"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <asp:Label ID="lblEndDuration" runat="server" Text="End duration"></asp:Label>
                    </div>
                    <div class="col-75">
                        <asp:TextBox ID="txtEndDuration" runat="server" TextMode="DateTimeLocal" class="txtbox"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <asp:Label ID="lblDurationStudent" runat="server" Text="Test duration"></asp:Label>
                    </div>
                    <div class="col-75">
                        <asp:TextBox ID="txtDurationStudent" runat="server"  class="txtbox" TextMode="Number"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <asp:Label ID="lblTotalMarksStudnet" runat="server" Text="Total marks"></asp:Label>
                    </div>
                    <div class="col-75">
                        <asp:TextBox ID="txtTotalMarksStudnet" runat="server"  class="txtbox" TextMode="Number"></asp:TextBox>
                    </div>
                </div>
                <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" class="btn btn-success" />
            </div>
        </div>
    </form>
    <footer>
        &copy;Virtusa 2020
    </footer> 
</body>
</html>