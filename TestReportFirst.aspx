<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestReportFirst.aspx.cs" Inherits="Login.TestReportFirst" %>

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
        table{
            padding:10%;
            margin-right: 404px;
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
           margin-top:600px;
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
    <script>
        function nav() {
            window.location.href = "TestReports.aspx";
        }
    </script>
</head>
<body>

    <form id="form1" runat="server">
        <header>
            <ul id="left-side">
                <li>
                    <img src="ksreilogo.jpg" class="image" /></li>
            </ul>
            <ul id="right-side" class="auto-style1">
                <li><i class="fa fa-home" aria-hidden="true" style="font-size: 23px; color: white;"></i><a href="MainHomePage.aspx">Home</a></li>
                <li><i class="fa fa-user" aria-hidden="true" style="font-size: 23px; color: white;"></i><a href="#">AboutUs</a></li>
                <li><<i class="fa fa-phone" aria-hidden="true" style="font-size: 23px; color: white;"></i><a href="#"> Contact</a></li>

            </ul>
            <div class="ksrei">
                <br />
                <h1>KSREI TestPortal</h1>
            </div>
        </header>
      
           <button style="margin-left: 65%;margin-top:2%;" type="button" onclick="nav()" class="btn btn-default">
               <span class="glyphicon glyphicon-sort"></span>Filter
           </button>
        <br />
        <br />

        <div style="padding: 1%; margin-left:10%;">
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" Height="152px" Width="1374px">
                <Columns>
                    <asp:BoundField DataField="test_type" HeaderText="TEST TYPE" SortExpression="test_type" />
                    <asp:BoundField DataField="test_name" HeaderText="TEST NAME" SortExpression="test_name" />
                    <asp:BoundField DataField="test_category" HeaderText="TEST CATEGORY" SortExpression="test_category" />
                    <asp:BoundField DataField="test_start_duration" HeaderText="DATE OF TEST" SortExpression="test_start_duration" />
                    <asp:BoundField DataField="conducted_by" HeaderText="INCHARGE" SortExpression="conducted_by" />
                    <asp:BoundField DataField="conducted_to_college" HeaderText="ORGANISATION" SortExpression="conducted_to_college" />
                    <asp:BoundField DataField="conducted_to_department" HeaderText="DEPARTMENT" SortExpression="conducted_to_department" />
                    <asp:BoundField DataField="conducted_to_year" HeaderText="YEAR" SortExpression="conducted_to_year" />
                    
                    
                    
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#483D8B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>

        </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="SELECT [test_type], [test_start_duration], [conducted_by], [conducted_to_college], [conducted_to_department], [conducted_to_year], [test_name], [test_category] FROM [TestDetails]"></asp:SqlDataSource>

    </form>

    <footer>
        &copy;Virtusa 2020
    </footer>
</body>
</html>
            
       
