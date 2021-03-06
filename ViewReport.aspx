﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewReport.aspx.cs" Inherits="Login.ViewReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        .tb {
            width: 850px;
            margin-left: 490px;
            text-align: center;
            font-weight: bold;
        }
        table input[type="submit"] {
            background-color: cornflowerblue;
            border-radius: 20px;
            border-radius: 20px;
            padding: 5px;
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
        .table-hover {
            width: 850px;
            margin-left: 490px;
            text-align: center;
            font-weight: bold;
        }
        tr:first-child td{
            background-color:#483D8B;
            color:white;
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
    <form id="form2" runat="server">
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">

                <ul class="nav navbar-nav">

                    <li><a class="navbar-brand" href="#">Username:</a></li>
                    <li><a href="#">
                        <asp:Label ID="Label1" runat="server" Text="Label" Font-Size="medium" Style="color: white" Font-Bold="true"></asp:Label>
                    </a></li>
                    
                </ul>

            </div>
        </nav>
        <asp:Table ID="Table1" runat="server" class="table table-responsive table-hover">
        </asp:Table>
    </form>
    <footer>
        &copy;Virtusa 2020
    </footer> 
</body>
</html>
