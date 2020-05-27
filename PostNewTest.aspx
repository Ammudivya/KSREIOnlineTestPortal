<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PostNewTest.aspx.cs" Inherits="TestPortal.PostNewTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
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

        .student {
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
            height: 500px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Modal Example</h2>
            <!-- Trigger the modal with a button -->
            <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal1">Student</button>
            <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal2">intern</button>
            <!-- Modal -->
            <div class="modal fade" id="myModal1" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Test for Student</h4>
                        </div>
                        <div class="modal-body">
                            <div class="divStudent" id="studentDiv">
                                <div class="row">
                                    <div class="col-25">
                                        <asp:Label ID="lblCollege" runat="server" Text="College"></asp:Label>
                                    </div>
                                    <div class="col-75">
                                        <asp:DropDownList ID="ddlCollege" AutoPostBack="true" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" class="ddl">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-25">
                                        <asp:Label ID="lblDepartment" runat="server" Text="Department"></asp:Label>
                                    </div>
                                    <div class="col-75">
                                        <asp:DropDownList ID="ddlDepartment" runat="server" class="ddl">
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
                                        <asp:TextBox ID="txtDurationStudent" runat="server" class="txtbox" TextMode="Number"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-25">
                                        <asp:Label ID="lblTotalMarksStudnet" runat="server" Text="Total marks"></asp:Label>
                                    </div>
                                    <div class="col-75">
                                        <asp:TextBox ID="txtTotalMarksStudnet" runat="server" class="txtbox" TextMode="Number"></asp:TextBox>
                                    </div>
                                </div>
                                <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" class="btn btn-success" />
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="myModal2" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Test for Intern</h4>
                        </div>
                        <div class="modal-body">
                            <div class="divStudent" id="internDiv">
                                <div class="row">
                                    <div class="col-25">
                                        <asp:Label ID="lblComapny" runat="server" Text="Company"></asp:Label>
                                    </div>
                                    <div class="col-75">
                                        <asp:DropDownList ID="ddlCompany" AutoPostBack="true" runat="server" class="ddl" OnSelectedIndexChanged="ddlCompany_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-25">
                                        <asp:Label ID="lblDomain" runat="server" Text="Domain"></asp:Label>
                                    </div>
                                    <div class="col-75">
                                        <asp:DropDownList ID="ddlDomain" runat="server" class="ddl">
                                            <asp:ListItem Text="-- select Domain --" Value="0"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-25">
                                        <asp:Label ID="lblBatch" runat="server" Text="Batch"></asp:Label>
                                    </div>
                                    <div class="col-75">
                                        <asp:DropDownList ID="ddlBatch" runat="server" class="ddl">
                                            <asp:ListItem Text="-- select Batch --" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="final year" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Prefinal year" Value="2"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-25">
                                        <asp:Label ID="lblTestNameIntern" runat="server" Text="Test Name"></asp:Label>
                                    </div>
                                    <div class="col-75">
                                        <asp:TextBox ID="txtTestNameIntern" runat="server" class="txtbox"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-25">
                                        <asp:Label ID="lblTestTypeIntern" runat="server" Text="Test Type"></asp:Label>
                                    </div>
                                    <div class="col-75">
                                        <asp:DropDownList ID="ddlTestTypeIntern" runat="server" class="ddl">
                                            <asp:ListItem Text="-- select type --" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="Mandatory" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Self Analysis" Value="2"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-25">
                                        <asp:Label ID="lblTestCategoryIntern" runat="server" Text="Test Category"></asp:Label>
                                    </div>
                                    <div class="col-75">
                                        <asp:TextBox ID="txtTestCategoryIntern" runat="server" class="txtbox"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-25">
                                        <asp:Label ID="lblStartDuartionIntern" runat="server" Text="Start duration"></asp:Label>
                                    </div>
                                    <div class="col-75">
                                        <asp:TextBox ID="txtStartDuartionIntern" runat="server" TextMode="DateTimeLocal" class="txtbox"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-25">
                                        <asp:Label ID="lblEndDuartionIntern" runat="server" Text="End duration"></asp:Label>
                                    </div>
                                    <div class="col-75">
                                        <asp:TextBox ID="txtEndDuartionIntern" runat="server" TextMode="DateTimeLocal" class="txtbox"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-25">
                                        <asp:Label ID="lblDuration" runat="server" Text="Test duration"></asp:Label>
                                    </div>
                                    <div class="col-75">
                                        <asp:TextBox ID="txtDuration" runat="server" class="txtbox" TextMode="Number"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-25">
                                        <asp:Label ID="lblTotalMarks" runat="server" Text="Total marks"></asp:Label>
                                    </div>
                                    <div class="col-75">
                                        <asp:TextBox ID="txtTotalMarks" runat="server" class="txtbox" TextMode="Number"></asp:TextBox>
                                    </div>
                                </div>
                                <asp:Button ID="upload" runat="server" Text="Upload" class="btn btn-success" OnClick="upload_Click" />
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

