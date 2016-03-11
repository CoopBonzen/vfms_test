<%@ Page Title="500" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site2.Master" CodeBehind="test500.aspx.vb" Inherits="VFMS_test2.test500" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Main content -->
    <section class="content-header ">
        <h1>500 Error Page
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
            <li><a href="#">Examples</a></li>
            <li class="active">500 error</li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-6">

                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title">กรอกข้อมูล</h3>
                        <div class="box-tools pull-right">
                            <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                            <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
                        </div>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body form-horizontal ">
                        <div class="form-group">
                            <label runat="server" id="lbl_UserGroup" class="col-sm-2 control-label">User Group :</label>
                            <div class="col-sm-10">
                                <asp:DropDownList ID="ddl_UserGroup" runat="server" AutoPostBack="True" Width="150px">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-2">
                                <asp:ListView ID="lv_User" runat="server" DataKeyNames="user_id" DataSourceID="sds_user">
                                    <LayoutTemplate>
                                        <table style="width: 95%">
                                            <tr>
                                                <td>
                                                    <table class="bordercolor">
                                                        <thead>
                                                            <tr style="font-family: Sans-Serif,Tahoma; font-size: 9pt; background-color: #CCCCCC; text-align: center; font-weight: bold; padding: 4px 4px 4px 4px;">
                                                                <th>
                                                                    <asp:Label runat="server" ID="lbl_Username" Text="User name"></asp:Label>
                                                                </th>
                                                                <th>
                                                                    <asp:Label runat="server" ID="lbl_active" Text="Active"></asp:Label>
                                                                </th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="itemPlaceHolder" runat="server">
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td id="Td1" runat="server" style="text-align: center; background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000;"></td>
                                            </tr>
                                        </table>
                                    </LayoutTemplate>
                                    <ItemTemplate>
                                        <tr id="table_row" runat="server" onmouseover="this.className='over'" onmouseout="this.className='out'">
                                            <td id="Td2" runat="server">
                                                <asp:Label ID="user_nameLabel" runat="server" Text='<%# Eval("user_name") %>' />
                                            </td>
                                            <td id="Td4" runat="server" align="center">
                                                <asp:CheckBox ID="chk_activeLv" runat="server" Enabled="false" Checked='<%# Eval("active") %>' />
                                            </td>
                                            <td id="Td5" runat="server">
                                                <asp:Button ID="SelectButton" runat="server" CommandName="Select" Text="Select" Style="display: none" />
                                                <asp:ImageButton ID="DeleteButton" runat="server" CommandName="Delete" AlternateText="Delete"
                                                    ImageUrl="../images/trash.gif" BorderStyle="Outset" BorderWidth="1px" BackColor="White" />
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <InsertItemTemplate>
                                        <tr id="Tr1" runat="server">
                                            <td id="Td6" runat="server">
                                                <asp:TextBox ID="user_nameTextBox" runat="server" Text='<%# Bind("user_name") %>'
                                                    MaxLength="100" />
                                            </td>
                                            <td id="Td8" runat="server" align="center">
                                                <asp:CheckBox ID="chk_activeLv" runat="server" Enabled="false" Checked='<%# Eval("active") %>' />
                                            </td>
                                            <td id="Td9" runat="server">
                                                <br />
                                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" Width="75px" />
                                                <asp:ImageButton ID="CancelButton" runat="server" CommandName="Cancel" AlternateText="Cancel"
                                                    ImageUrl="../images/cancel.gif" BorderStyle="Outset" BorderWidth="1px" Visible="False" />
                                            </td>
                                        </tr>
                                    </InsertItemTemplate>
                                    <SelectedItemTemplate>
                                        <tr id="table_row" runat="server" style="background-color: #90EE90">
                                            <td id="Td10" runat="server">
                                                <asp:Label ID="user_nameLabel" runat="server" Text='<%# Eval("user_name") %>' />
                                            </td>
                                            <td id="Td12" runat="server" align="center">
                                                <asp:CheckBox ID="chk_activeLv" runat="server" Enabled="false" Checked='<%# Eval("active") %>' />
                                            </td>
                                            <td id="Td13" runat="server">
                                                <asp:Button ID="SelectButton" runat="server" CommandName="Select" Text="Select" Style="display: none" />
                                                <asp:ImageButton ID="DeleteButton" runat="server" CommandName="Delete" AlternateText="Delete"
                                                    ImageUrl="../images/trash.gif" BorderStyle="Outset" BorderWidth="1px" BackColor="White" />
                                            </td>
                                        </tr>
                                    </SelectedItemTemplate>
                                    <EmptyDataTemplate>
                                        <table>
                                            <tr>
                                                <td></td>
                                            </tr>
                                        </table>
                                    </EmptyDataTemplate>
                                    <EditItemTemplate>
                                        <tr id="Tr2" runat="server">
                                            <td id="Td14" runat="server">
                                                <asp:TextBox ID="user_nameTextBox" runat="server" Text='<%# Bind("user_name") %>'
                                                    MaxLength="100" />
                                            </td>
                                            <td id="Td16" runat="server" align="center">
                                                <asp:CheckBox ID="chk_activeLv" runat="server" Enabled="false" Checked='<%# Eval("active") %>' />
                                            </td>
                                            <td id="Td17" runat="server">
                                                <asp:ImageButton ID="UpdateButton" runat="server" CommandName="Update" AlternateText="Update"
                                                    ImageUrl="../images/disk.png" BorderStyle="Outset" BorderWidth="1px" />
                                                <asp:ImageButton ID="CancelButton" runat="server" CommandName="Cancel" AlternateText="Cancel"
                                                    ImageUrl="../images/cancel.gif" BorderStyle="Outset" BorderWidth="1px" />
                                            </td>
                                        </tr>
                                    </EditItemTemplate>
                                </asp:ListView>
                                 <asp:SqlDataSource runat="server" ID="sds_user" ConnectionString="<%$ ConnectionStrings:vfms_dbConnectionString %>"
                                        SelectCommand="SELECT * FROM [user] WHERE (user_group_id = @UserGroupID)" DeleteCommand="DELETE FROM [user] WHERE (user_name = @UserName)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddl_UserGroup" DefaultValue="-1" Name="UserGroupID"
                                                PropertyName="SelectedValue" Type="Int32" />
                                        </SelectParameters>
                                        <DeleteParameters>
                                            <asp:Parameter Name="UserName" Type="String" />
                                        </DeleteParameters>
                                    </asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.box-body -->

                <!-- /.box-footer -->
            </div>
        </div>
        <!-- /.col (left) -->
        <div class="col-md-6">

            <div class="box box-danger">
                <div class="box-header with-border">
                    <h3 class="box-title">อับโหลดเอกสาร</h3>
                    <div class="box-tools pull-right">
                        <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
                    </div>
                </div>
                <!-- /.box-header -->
                <div class="box-body form-horizontal ">

                    <!-- /.box-body -->

                    <!-- /.box-footer -->
                </div>
            </div>
            <!-- /.col (right) -->
        </div>
        
        <!-- /.row -->

    </section>
</asp:Content>
