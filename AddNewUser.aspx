<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddNewUser.aspx.cs" Inherits="TestPortal.AddNewUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
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
            margin: 350px auto;
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Add new user</h2>
            <!-- Trigger the modal with a button -->
            <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal1">Studnet</button>
            <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal2">Intern</button>
            <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal3">Staff</button>

            <!-- Modal -->
            <div class="modal fade" id="myModal1" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Add Student</h4>
                        </div>
                        <div class="modal-body">
                            <div class="divStudent" id="studentDiv">
                                <div class="row">
                                    <div class="col-25">
                                        <asp:Label ID="lblStudentName" runat="server" Text="Name"></asp:Label>
                                    </div>
                                    <div class="col-75">
                                        <asp:TextBox ID="txtStudentName" runat="server" class="txtbox"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-25">
                                        <asp:Label ID="lblStudentMailId" runat="server" Text="Mail ID "></asp:Label>
                                    </div>
                                    <div class="col-75">
                                        <asp:TextBox ID="txtStudentMailId" runat="server" class="txtbox" TextMode="Email"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-25">
                                        <asp:Label ID="lblStudentDOB" runat="server" Text="DOB"></asp:Label>
                                    </div>
                                    <div class="col-75">
                                        <asp:TextBox ID="txtStudentDOB" runat="server" class="txtbox" TextMode="Date"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-25">
                                        <asp:Label ID="lblCollege" runat="server" Text="College"></asp:Label>
                                    </div>
                                    <div class="col-75">

                                        <asp:DropDownList ID="ddlCollege" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlCollege_SelectedIndexChanged" class="ddl">
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
                                        <asp:Label ID="lblStudentPassword" runat="server" Text="Password"></asp:Label>
                                    </div>
                                    <div class="col-75">
                                        <asp:TextBox ID="txtStudentPassword" runat="server" class="txtbox" TextMode="Password"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Button ID="btnStudent" runat="server" Text="Upload" OnClick="btnStudent_Click" class="btn btn-success" />
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
                            <h4 class="modal-title">Add Intern</h4>
                        </div>
                        <div class="modal-body">
                            <div class="divStudent" id="internDiv">
                                <div class="row">
                                    <div class="col-25">
                                        <asp:Label ID="lblInternName" runat="server" Text="Name"></asp:Label>
                                    </div>
                                    <div class="col-75">
                                        <asp:TextBox ID="txtInternName" runat="server" class="txtbox"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-25">
                                        <asp:Label ID="lblInternMailId" runat="server" Text="Mail ID "></asp:Label>
                                    </div>
                                    <div class="col-75">
                                        <asp:TextBox ID="txtInternMailId" runat="server" class="txtbox" TextMode="Email"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-25">
                                        <asp:Label ID="lblInternDOB" runat="server" Text="DOB"></asp:Label>
                                    </div>
                                    <div class="col-75">
                                        <asp:TextBox ID="txtInternDOB" runat="server" class="txtbox" TextMode="Date"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-25">
                                        <asp:Label ID="lblCompany" runat="server" Text="Company"></asp:Label>
                                    </div>
                                    <div class="col-75">

                                        <asp:DropDownList ID="ddlCompany" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlCompany_SelectedIndexChanged" class="ddl">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-25">
                                        <asp:Label ID="lblDomain" runat="server" Text="Domain"></asp:Label>
                                    </div>
                                    <div class="col-75">
                                        <asp:DropDownList ID="ddlDomain" runat="server" class="ddl">
                                            <asp:ListItem Text="-- select domain --" Value="0"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-25">
                                        <asp:Label ID="lblBatch" runat="server" Text="Batch"></asp:Label>
                                    </div>
                                    <div class="col-75">
                                        <asp:DropDownList ID="ddlBatch" runat="server" class="ddl">
                                            <asp:ListItem Text="-- select batch --" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="fourth year" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Third year" Value="2"></asp:ListItem>

                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-25">
                                        <asp:Label ID="lblInternPassword" runat="server" Text="Password"></asp:Label>
                                    </div>
                                    <div class="col-75">
                                        <asp:TextBox ID="txtInternPassword" runat="server" class="txtbox" TextMode="Password"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Button ID="btnIntern" runat="server" Text="Upload" OnClick="btnIntern_Click" class="btn btn-success" />
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="myModal3" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Add Staff</h4>
                        </div>
                        <div class="modal-body">
                            <div class="divStudent" id="staffDiv">
                                <div class="row">
                                    <div class="col-25">
                                        <asp:Label ID="lblStaffName" runat="server" Text="Name"></asp:Label>
                                    </div>
                                    <div class="col-75">
                                        <asp:TextBox ID="txtStaffName" runat="server" class="txtbox"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-25">
                                        <asp:Label ID="lblStaffMailId" runat="server" Text="Mail ID "></asp:Label>
                                    </div>
                                    <div class="col-75">
                                        <asp:TextBox ID="txtStaffMailId" runat="server" class="txtbox" TextMode="Email"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-25">
                                        <asp:Label ID="lblStaffPassword" runat="server" Text="Password"></asp:Label>
                                    </div>
                                    <div class="col-75">
                                        <asp:TextBox ID="txtStaffPassword" runat="server" class="txtbox" TextMode="Password"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Button ID="btnStaff" runat="server" Text="Upload" OnClick="btnStaff_Click" class="btn btn-success" />
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>

                </div>
            </div>




        </div>
    </form>
</body>
</html>
