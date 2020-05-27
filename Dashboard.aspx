<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Login.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
    <title></title>
    <style>
        
 .btn {
  background-color: DodgerBlue; 
  border: none; 
  color: white; 
  padding: 12px 16px; 
  font-size: 16px; 
  cursor: pointer; 
}
.btn:hover {
  background-color: RoyalBlue;
}
.btn .fa{
   font-size:100%;
}     
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
       .content{
          margin-top:80px;
           margin-left:720px;
       }

        .auto-style2 {
            height: 30px;
            width: 275px;
            margin-left: 0px;
        }
       
             

        .auto-style3 {
            left: 50%;
            top: 60%;
            width: 46%;
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
        <script>
                       function myFunction() {
                           var input, filter, table, tr, td, i, txtValue;
                           input = document.getElementById("myInput");
                           filter = input.value.toUpperCase();
                           table = document.getElementById("Table1");
                           tr = table.getElementsByTagName("tr");
                           for (i = 0; i < tr.length; i++) {
                               td = tr[i].getElementsByTagName("td")[1];
                               if (td) {
                                   txtValue = td.textContent || td.innerText;
                                   if (txtValue.toUpperCase().indexOf(filter) > -1) {
                                       tr[i].style.display = "";
                                   } else {
                                       tr[i].style.display = "none";
                                   }
                               }
                           }
                       }
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
            <li><i class="fa fa-user-circle" aria-hidden="true" style="font-size:23px;color:white;"></i><a href="Profile.aspx"> Profile </a></li>
        </ul>
        <div class="ksrei">
            <br />
           <h1>KSREI TestPortal</h1>
       </div>
           </header>
    <form id="form1" runat="server">
        <div class="content">
            <input type="text" id="myInput" onkeyup="myFunction()" placeholder="                    Search for type.." title="Type in a name" class="auto-style2"/></div> 
        <br /><br />
         <div class="table"><asp:Table ID="Table1" runat="server" class="table table-responsive table-hover"></asp:Table></div>   
                
    </form>
    <footer>
        &copy;Virtusa 2020
    </footer> 
</body>
</html>
