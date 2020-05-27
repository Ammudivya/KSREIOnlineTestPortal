<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TakeTest.aspx.cs" Inherits="Login.TakeTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    
<head runat="server">
     <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
     <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
    <title></title>
    <style>
        #left-side{
           float:left;
       }
       #right-side{
           float:right;
       }
       #right-side li{
           display:inline-block;
           margin-top:15px;
           margin-bottom:15px;
           margin-left:10px;
           margin-right:0px;
           padding:10px;
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
           margin-top:673px;
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
            margin-left: -40px;
        }

        a {
            color: white;
            text-decoration: none;     
        }

        .auto-style1 {
            width: 607px;
            height: 54px;
            margin-top: 18px;
        }

        .ksrei {
            color: white;
            text-align: center;
            top: 20px;
            margin-left: 380px;
        }

        .taketest {
            border: 1px solid black;
            margin-left: 20%;
            margin-right: 10%;
            height: 400px;
        }

        .head {
            margin: 30px;
        }

        #left {
            float: left;
        }

        #right {
            float: right;
        }

            #right li {
                display: inline-block;
                margin-top: 15px;
                margin-bottom: 15px;
                margin-left: -20px;
                margin-right: 0px;
                padding: 10px;
            }

        .drop {
            height: 36px;
            margin-left: 25px;
            margin-right: 25px;
            background-color: silver;
            margin-top: 45px;
        }

        #Button1 {
            width: 75px;
        }

        .dropdown {
            float: right;
        }
        .taketest{
            margin-top:120px;
            margin-left:300px;
            margin-right:300px;
            border-radius:20px;
        }
        .auto-style8 {
            margin: 30px;
            height: 28px;
        }
        .auto-style9 {
            height: 27px;
            width: 501px;
        }
        .auto-style10 {
            height: 32px;
            width: 135px;
        }
        .but{
            margin-left:45%;
            margin-top:23px;
        }
        .instruction{
            margin-top:20px;
            margin-left:20px;
        }
        .remember{
            height:120px;
            margin-top:15px;
            margin-left:130px;
            margin-right:130px;
        }
        .point1, .point2, .point3, .point4{
           font-size:18px;
           font-family:'Times New Roman', Times, serif;
        }
    </style>
    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>
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
            <li><i class="fa fa-sign-out" aria-hidden="true" style="font-size:23px;color:white;"></i><a href="Login3.aspx"> Logout</a></li>
            
        </ul>
        <div class="ksrei">
            <br />
           <h1>KSREI TestPortal</h1>
       </div>
           </header>
    <form id="form1" runat="server">
           
        <div class="taketest">
            <div class="auto-style8">
            <ul id="right" class="auto-style9">
                <li>
                    <i class="fa fa-question-circle-o" aria-hidden="true"></i>

                    <asp:Label ID="Label4" runat="server" Text="Total No.of Questions - " Font-Bold="True" Font-Names="Times New Roman" Font-Size="18px"></asp:Label>&nbsp
                     <asp:Label ID="lblTotalQuestions" runat="server" Font-Names="Times New Roman" Font-Size="18px"></asp:Label> &nbsp&nbsp
                    <i class="fa fa-clock-o" aria-hidden="true"></i>
                      <asp:Label ID="Label6" runat="server" Text="Total Duration - " Font-Bold="True" Font-Names="Times New Roman" Font-Size="18px"></asp:Label>&nbsp
                       <asp:Label ID="lblTestDuration" runat="server" Text="Label"></asp:Label>
                </li>
            </ul>
            <ul id ="left" class="auto-style10">
                <asp:Label ID="Label8" runat="server" Text="Instructions" Font-Bold="True" Font-Names="Times New Roman" Font-Size="25px"></asp:Label>
            </ul>
            </div>
            <div class="drop">
            <div class="dropdown">
            <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Test Details
            <span class="caret"></span></button>
               <ul class="dropdown-menu">       
                  <li><a href="#">Name - <asp:Label ID="lblTestName" runat="server" Text=""></asp:Label></a></li>
                  <li><a href="#">Type - <asp:Label ID="lblTestType" runat="server" Text=""></asp:Label></a></li>
                  <li><a href="#">Category - <asp:Label ID="lblTestCategory" runat="server" Text=""></asp:Label></a></li>
                  <li><a href="#">Total Mark - <asp:Label ID="lblTotalMarks" runat="server" Text=""></asp:Label></a></li>
               </ul>
           </div>
        </div>
            <div class="instruction">
                <asp:Label ID="Label1" runat="server" Text="Things to be Remember :" Font-Bold="True" Font-Names="Gabriola" Font-Size="24px"></asp:Label>
                <div class="remember">
                    <div class="point1">
                        1.If the test category is mandatory,then user should take test only once.
                    </div>
                    <div class="point2">
                        2.If the test time is finished, the test is automatically close and your answer will be saved.
                    </div>
                    <div class="point3">
                        3.If your computer system shuts down suddenly due to power supply being disconnected, you can't resume the test from the same question that you are attended earlier.All the previous answers are not saved.So, you can start your test from beginning.
                    </div>
                    <div class="point4">
                        4.Click on the Submit button at the bottom of the page to have your answers graded.
                    </div>
                </div>
            </div>
            <div class="but">
                <asp:Button ID="btnTakeTest" runat="server" Text="Take Test" OnClick="btnTakeTest_Click1" />                
            </div>
        </div>   
    </form>
    <footer>
        &copy;Virtusa 2020
    </footer>
</body>
</html>
