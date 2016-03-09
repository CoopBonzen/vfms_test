<%@ Page Title="สมาชิกกองทุน" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site2.Master" CodeBehind="ShowMember.aspx.vb" Inherits="VFMS_test2.ShowMember" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Import Namespace="VFMS_test2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Main content -->
    <section class="content-header ">
        <h1>แสดงรายชื่อสมาชิกทั้งหมด
        </h1>
        <ol class="breadcrumb">
            <li><a href="Home.aspx"><i class="fa fa-home"></i>หน้าแรก</a></li>
            <li><a href="#">สมาชิก</a></li>
            <li class="active">สมาชิกกองทุน</li>
        </ol>
    </section>
    <!-- Main content -->
    <section class="content">
        <div class="box box-success">
            <div class="box-header">
                <h3 class="box-title"></h3>
                <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
                </div>
            </div>
            <div class="box-body">
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" CssClass="table">
                    <Columns>
                       <dx:ASPxGridView ID="gv_showmember" ClientInstanceName="gv_addmember" runat="server" CssClass="table" 
                    DataSourceID="sds_showmember" KeyFieldName="mem_id">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="รหัสสมาชิก" FieldName="mem_id" ReadOnly="True"
                            VisibleIndex="0" CellStyle-HorizontalAlign="Center" Width="8%" SortOrder="Descending">
                            <EditCellStyle HorizontalAlign="Center">
                            </EditCellStyle>
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="ชื่อ-สกุล" FieldName="mem_name" VisibleIndex="1" Width="20%">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Note" runat="server" Text='<%# Bind("mem_name")%>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="ที่อยู่" FieldName="mem_address" VisibleIndex="2"
                            Width="20%">
                            <EditCellStyle HorizontalAlign="Center">
                            </EditCellStyle>
                            <EditItemTemplate>
                                <asp:Label ID="lbl_ContactCompany" runat="server" Text='<%# Bind("mem_address")%>'>
                                </asp:Label>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="เลขบัตรประชาชน" FieldName="mem_id_card" VisibleIndex="3"
                            Width="20%">
                            <EditCellStyle HorizontalAlign="Center">
                            </EditCellStyle>
                            <EditItemTemplate>
                                <asp:Label ID="lbl_ContactName" runat="server" Text='<%# Bind("mem_id_card")%>'></asp:Label>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn Caption="วันที่สมัคร" FieldName="mem_reg_date" VisibleIndex="4"
                            Width="8%">
                            <EditItemTemplate>
                                <asp:Label ID="lbl_QDate" runat="server" Text='<%# Eval("mem_reg_date", "{0:d/MM/yyyy}")%>'>
                                </asp:Label>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewCommandColumn ButtonType="Image" VisibleIndex="5" ShowInCustomizationForm="True"
                            Width="8%" Caption="แก้ไข">
                            <EditButton Visible="True">
                                <Image AlternateText="Edit" Url="../images/edit.png">
                                </Image>
                            </EditButton>
                            <UpdateButton Visible="True">
                                <Image AlternateText="Update" Url="../images/disk.png">
                                </Image>
                            </UpdateButton>
                            <CancelButton Visible="True">
                                <Image AlternateText="Cancel" Url="../images/cancel.gif">
                                </Image>
                            </CancelButton>
                            <ClearFilterButton Visible="True">
                            </ClearFilterButton>
                        </dx:GridViewCommandColumn>
                    </Columns>
                    <SettingsEditing Mode="Inline" />
                    <Settings ShowFilterRow="True" />
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="sds_showmember" runat="server" ConnectionString="<%$ ConnectionStrings:vfms_dbConnectionString%>"
                    SelectCommand="SELECT mem_id, mem_name, mem_address, mem_id_card, mem_reg_date FROM member"
                    UpdateCommand="UPDATE [member] SET [mem_address] = @mem_address WHERE [mem_id] = @mem_id"
                    DeleteCommand="DELETE FROM [member] WHERE [mem_id] = @mem_id"
                    InsertCommand="INSERT INTO [member] ([mem_id], [mem_name], [mem_address], [mem_id_card], [mem_reg_date]) VALUES (@mem_id, @mem_name, @mem_address, @mem_id_card, @mem_reg_date)">
                    <DeleteParameters>
                        <asp:Parameter Name="mem_id" Type="String" />
                    </DeleteParameters>
                    
                </asp:SqlDataSource>
            </div>
            <!-- /.box-body -->
        </div>
        <!-- /.box -->
    </section>
    <!-- /.content -->
</asp:Content>
