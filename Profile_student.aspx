<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile_student.aspx.cs" Inherits="Login.Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
    <title></title> <style>
       
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
           margin-top:821px;
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
      
        body{
	        margin: 0;
	        padding: 0;
	        font-family: sans-serif;
        }
		
        h1 {
            text-align: center;
            font-family: 'Lucida Calligraphy';
        }
        form {
            width: 25%;
            padding: 30px;
            position: absolute;
            top: 52%;
            left: 50%;
            right:30%;
            transform: translate(-50%,-50%);
            border: 2px solid #483D8b;
            border-radius: 3%;
           
            font-family: Arial;
            font-size: larger;
            font-weight: 500;
        }
        #Label2, #Label4 {
           
            color: black;
           
        }
 
        #Label9, #Label10, #Label11, #Label12, #Label13, #Label14, #Label15 {
           
            text-align: left;
            color: #483D8b;
            
        }
        .tab1{
            text-align:left;
        }
        .tab2{
            margin-top:-4%;
            margin-left: 40%;
           
        }
        #LinkButton1{
           margin-left:150px;
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
        <div>
         <br />
            <div class="tab1"><asp:Label ID="Label4" runat="server" Text="Name : "></asp:Label></div>
             <div class="tab2"><asp:Label ID="Label10" runat="server" Text="Label"></asp:Label></div>
            <br />
            <div class="tab1"><asp:Label ID="Label6" runat="server" Text="Mail_id :  "></asp:Label></div>
            <div class="tab2"> <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label></div>
            <br />
            <div class="tab1"><asp:Label ID="Label3" runat="server" Text="Date Of Birth :  "></asp:Label></div>
            <div class="tab2"> <asp:Label ID="Label12" runat="server" Text="Label"></asp:Label></div>
            <br />
            <div class="tab1"><asp:Label ID="Label7" runat="server" Text="Year : "></asp:Label></div>
            <div class="tab2"> <asp:Label ID="Label15" runat="server" Text="Label"></asp:Label></div>
            <br />
            <div class="tab1"><asp:Label ID="Label8" runat="server" Text="Department :  "></asp:Label></div>
             <div class="tab2"><asp:Label ID="Label14" runat="server" Text="Label"></asp:Label></div>
            <br />
            <div class="tab1"><asp:Label ID="Label5" runat="server" Text="College :  "></asp:Label></div>
            <div class="tab2"> <asp:Label ID="Label13" runat="server" Text="Label"></asp:Label></div>
            <br />         
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Text="Change Password?" Font-Bold="True" Font-Names="Times New Roman" Font-Size="20px" Font-Underline="True" ForeColor="#0066FF"></asp:LinkButton>
            <br />
        </div>
    </form>
    <footer>
        &copy;Virtusa 2020
    </footer> 
        </body>

</html>