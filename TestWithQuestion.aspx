<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestWithQuestion.aspx.cs" Inherits="Login.TestWithQuestion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
    <title></title>
    <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        header{
           background-color:#483D8B;
           height:120px;
       }
        .image {
           height: 145px;
           width: 200px;
           margin-top: -18px;
           margin-left: -40px;
       }
       
       ul li{
           list-style-type:none;
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
             .ksrei{
           color:white;
           text-align:center;
           top:20px;
           margin-left:380px;
       }
       .body{
           margin-top:0px;
       }
        footer {
            clear: both;
            background-color: #483D8B;
            text-align: center;
            padding: 10px;
            color: white;
           width:100%;
            position:relative;
            left:0px;
           bottom:0px;
        }
        a {
            color: white;
            text-decoration: none;
        } 
    </style>
    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>
</head>
<body class="body">
    <header>
        <ul id="left-side" class="auto-style2">
         <li><img src="ksreilogo.jpg" class="image"/></li>
        </ul>
       
<ul  id="right-side" class="auto-style1">            
            <li ><i class="fa fa-home" aria-hidden="true" style="font-size: 23px; color: white; "></i><a href="MainHomePage.aspx"> Home</a></li>
            <li > <i class="fa fa-user" aria-hidden="true" style="font-size: 23px; color: white; "></i><a href="#"> AboutUs</a></li>
            <li> <i class="fa fa-phone" aria-hidden="true" style="font-size: 23px; color: white;"></i><a href="#"> Contact</a></li>
            <li><i class="fa fa-sign-out" aria-hidden="true" style="font-size:23px;color:white;"></i><a href="Login3.aspx"> Logout</a></li>
        </ul>
        <div class="ksrei">
            <br />
           <h1>KSREI TestPortal</h1>
       </div>
           </header>
     <form id="form1" runat="server">
        <div>
            <div align="right">
                <div>
                    <asp:ScriptManager ID="SM1" runat="server"></asp:ScriptManager>
                    <asp:Timer ID="timer1" runat="server"
                        Interval="1000" OnTick="timer1_tick">
                    </asp:Timer>
                </div>

                <div>
                    <asp:UpdatePanel ID="updPnl"
                        runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Label ID="lblTimer" runat="server" Font-Bold="True" Font-Names="Arial"
                                Font-Size="X-Large" ForeColor="blue"></asp:Label>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="timer1" EventName="tick" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
            <div style="margin-left:20px">                  
                   <h3>Test Name : <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></h3></br>
                       </div> 
                
            <div style="margin-left:30px; font-size:150% " >
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <table >
                        <tr>

                            <asp:Label ID="qno" runat="server" Text='<%# Container.ItemIndex + 1 %>'></asp:Label>. 
                            <asp:Label ID="ques" runat="server" Text='<%#Eval("test_question") %>'></asp:Label>
                        </tr>
                        <tr>
                            <td>

                                <asp:RadioButton ID="Option1" runat="server" Text='<%#Eval("test_option1") %>' GroupName="eiquiz" /><br>
                                <asp:RadioButton ID="Option2" runat="server" Text='<%#Eval("test_option2") %>' GroupName="eiquiz" /><br />
                                <asp:RadioButton ID="Option3" runat="server" Text='<%#Eval("test_option3") %>' GroupName="eiquiz" /><br />
                                <asp:RadioButton ID="Option4" runat="server" Text='<%#Eval("test_option4") %>' GroupName="eiquiz" /><br />
                                <asp:Label ID="corrans" runat="server" Text='<%#Eval("test_correctAns") %>' Visible="false"></asp:Label><br />
                                <asp:Label ID="score" runat="server" Text='<%#Eval("test_question_mark") %>' Visible="false"></asp:Label>

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="userans" runat="server" Text=""></asp:Label>
                            </td>

                        </tr>

                    </table>
                </ItemTemplate>
            </asp:Repeater>
            <asp:Button ID="submit" runat="server" Text="SUBMIT" OnClick="submit_Click" class="btn btn-primary" /></div><br />
        </div>
    </form>
    <br />
    <br />
    <footer>
        &copy;Virtusa 2020
    </footer>
</body>
</html>
