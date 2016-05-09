<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site2.Master" CodeBehind="ManageUserGroup.aspx.vb" Inherits="VFMS_test2.ManageUserGroup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Main content -->
    <section class="content-header ">
        <h1>จัดการกลุ่มผู้ใช้งาน
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>หน้าแรก</a></li>
            <li><a href="#">จัดการพนักงาน</a></li>
            <li class="active">จัดการกลุ่มผู้ใช้งาน</li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">

        <div class="box box-primary ">
            <div class="box-header">
                <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
                </div>
            </div>
            <div class="box-body">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <table style="float: left; width: 40%">
                            <tr>
                                <td>
                                    <asp:ListView ID="lv_UserGroup" runat="server" InsertItemPosition="LastItem" DataKeyNames="user_group_id"
                                        DataSourceID="lds_UserGroup">
                                        <LayoutTemplate>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <table cellspacing="5" cellpadding="4">
                                                            <thead>
                                                                <tr style="font-family: Sans-Serif,Tahoma; font-size: 9pt; background-color: #CCCCCC; text-align: center; font-weight: bold; padding: 4px 4px 4px 4px;">
                                                                    <th>
                                                                        <asp:Label runat="server" ID="lbl_DisplayOrder_Layout" Text="No."></asp:Label>
                                                                    </th>
                                                                    <th>
                                                                        <asp:Label runat="server" ID="lbl_UserGroupName_Layout" Text="Group Name"></asp:Label>
                                                                    </th>
                                                                    <th>
                                                                        <asp:Label runat="server" ID="lbl_Active" Text="Active"></asp:Label>
                                                                    </th>
                                                                </tr>
                                                            </thead>
                                                            <tbody id="itemPlaceHolder" runat="server">
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td id="Td1" runat="server" style="text-align: center; background-color: #5D7B9D; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF"></td>
                                                </tr>
                                            </table>
                                        </LayoutTemplate>
                                        <ItemTemplate>
                                            <tr id="table_row" runat="server" onmouseover="this.className='over'" onmouseout="this.className='out'">
                                                <td id="Td2" runat="server">
                                                    <asp:Label ID="lbl_DisplayOrder" runat="server" Text='<%# Eval("display_order") %>' />
                                                </td>
                                                <td id="Td3" runat="server">
                                                    <asp:Label ID="lbl_UserGroupNameLabel" runat="server" Text='<%# Eval("user_group_name") %>' />
                                                </td>
                                                <td id="Td4" runat="server" align="center">
                                                    <asp:CheckBox ID="chk_ItemActive" runat="server" Text="" Width="50px" Checked='<%# Eval("active") %>' />
                                                </td>
                                                <td id="Td5" runat="server" align="center">
                                                    <asp:Button ID="SelectButton" runat="server" CommandName="Select" Text="Select" Style="display: none" />
                                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" Style="display: none" />
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                        <InsertItemTemplate>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lbl_DisplayOrder" runat="server" Text='<%# Eval("display_order") %>' />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_UserGroupNameTextBox" runat="server" Width="100px" MaxLength="100"
                                                        Text='<%# Bind("user_group_name") %>' />
                                                </td>
                                                <td>
                                                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                                    <asp:ImageButton ID="CancelButton" runat="server" CommandName="Cancel" AlternateText="Cancel"
                                                        ImageUrl="../images/cancel.gif" BorderStyle="Outset" BorderWidth="1px" Visible="False" />
                                                </td>
                                                <td></td>
                                            </tr>
                                        </InsertItemTemplate>
                                        <SelectedItemTemplate>
                                            <tr id="table_row" runat="server" style="background-color: #90EE90">
                                                <td id="Td6" runat="server">
                                                    <asp:Label ID="lbl_DisplayOrder" runat="server" Text='<%# Eval("display_order") %>' />
                                                </td>
                                                <td id="Td7" runat="server">
                                                    <asp:Label ID="lbl_UserGroupNameLabel" runat="server" Text='<%# Eval("user_group_name") %>' />
                                                </td>
                                                <td id="Td8" runat="server" align="center">
                                                    <asp:CheckBox ID="chk_SelectedActive" runat="server" Text="" Checked='<%# Eval("active") %>'
                                                        AutoPostBack="true" />
                                                </td>
                                                <td id="Td9" runat="server">
                                                    <asp:ImageButton ID="DeleteButton" Visible='<%# Eval("user_group_id") %>'
                                                        runat="server" CommandName="Delete" AlternateText="Delete" ImageUrl="../images/trash.gif"
                                                        BorderStyle="Outset" BorderWidth="1px" />
                                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" Style="display: none" />
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
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lbl_DisplayOrder" runat="server" Text='<%# Eval("display_order") %>' />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_UserGroupNameTextBox" runat="server" Width="100px" MaxLength="100"
                                                        Text='<%# Bind("user_group_name") %>' />
                                                </td>
                                                <td></td>
                                                <td>
                                                    <asp:ImageButton ID="UpdateButton" runat="server" CommandName="Update" AlternateText="Update"
                                                        ImageUrl="../images/disk.png" BorderStyle="Outset" BorderWidth="1px" />
                                                    <asp:ImageButton ID="CancelButton" runat="server" CommandName="Cancel" AlternateText="Cancel"
                                                        ImageUrl="../images/cancel.gif" BorderStyle="Outset" BorderWidth="1px" />
                                                </td>
                                            </tr>
                                        </EditItemTemplate>
                                    </asp:ListView>
                                    <asp:LinqDataSource ID="lds_UserGroup" runat="server" ContextTypeName="VFMS_test2.vfmsDataContext"
                                        EnableDelete="True" EnableInsert="True" EnableUpdate="True" OrderBy="display_order"
                                        TableName="usergroups" EntityTypeName="">
                                    </asp:LinqDataSource>
                                </td>
                                <td>
                                    <asp:Button ID="btn_UserGroupUp" runat="server" Font-Names="Wingdings" Text="Ù" />
                                    <br />
                                    <asp:Button ID="btn_UserGroupDown" runat="server" Font-Names="Wingdings" Text="Ú" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lbl_Error" runat="server" ForeColor="Red"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <table id="tb_PanelPriv" style="float: left; width: 60%">
                            <tr>
                                <td>
                                    <asp:Panel ID="pnl_Priv" Width="100%" runat="server" Visible="false" BackColor="White"
                                        ForeColor="Black" BorderColor="#CDCDCD" EnableTheming="True" Font-Bold="True">
                                        <div style="text-align: left;">
                                            <asp:Label runat="server" ID="lbl_Privilege" Text="สิทธิกลุ่มผู้ใช้ :"></asp:Label>
                                            <asp:CheckBox ID="chk_AllGroupRole" runat="server" Text="เลือกทั้งหมด/ยกเลิกทั้งหมด"
                                                AutoPostBack="true" />
                                        </div>
                                        <asp:CheckBoxList ID="ckl_GroupRole" runat="server">
                                        </asp:CheckBoxList>
                                        <br />
                                        <asp:Button ID="ChangeRoleButton" Width="140px" runat="server" Text="Change Privilege" />
                                    </asp:Panel>
                                    <asp:LinqDataSource ID="lds_UserGroupFormView" runat="server" ContextTypeName="VFMS_test2.vfmsDataContext"
                                        EnableDelete="True" EnableInsert="True" EnableUpdate="True" TableName="usergroup_roles"
                                        Where="user_group_id == @user_group_id">
                                        <WhereParameters>
                                            <asp:ControlParameter ControlID="lv_UserGroup" DefaultValue="-1" Name="user_group_id"
                                                PropertyName="SelectedValue" Type="Int32" />
                                        </WhereParameters>
                                    </asp:LinqDataSource>
                                </td>
                                <td></td>
                            </tr>
                        </table>

                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <!-- /.box-body -->
        </div>
    </section>
</asp:Content>
