﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site2.Master" CodeBehind="ShowLoan2.aspx.vb" Inherits="VFMS_test2.ShowLoan2" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Main content -->
    <section class="content-header ">
        <h1>รายชื่อผู้กู้บัญชี 2
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>หน้าแรก</a></li>
            <li><a href="#">เงินกู้บัญชี 2</a></li>
            <li class="active">รายชื่อผู้กู้ทั้งหมด</li>
        </ol>
    </section>
    <section class="content">
        <div class="box box-success">
            <div class="box-header">
                <h3 class="box-title">แสดงรายชื่อผู้กู้ทั้งหมด</h3>
                <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
                </div>
            </div>
            <div class="box-body">
                 <dx:ASPxGridView ID="gv_showloan2" ClientInstanceName="gv_showloan2" runat="server" CssClass="table" DataSourceID="sds_showloan2" KeyFieldName="lmem2_id">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="เลขที่กู้เงิน" FieldName="lmem2_id" VisibleIndex="1" Width="5%">
                            <EditCellStyle HorizontalAlign="Center">
                            </EditCellStyle>
                            <DataItemTemplate>
                                <asp:LinkButton ID="lnk_MId" runat="server" Text='<%# Eval("lmem2_id")%>' CommandName="AddLoanMember2"
                                    CommandArgument='<%# Eval("lmem2_id")%>' OnCommand="ListItem_Command">
                                </asp:LinkButton>
                            </DataItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="lbl_lmemId" runat="server" Text='<%# Eval("lmem2_id")%>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="รหัสสมาชิก" FieldName="mem_id" VisibleIndex="2"
                            Width="5%">
                            <EditItemTemplate>
                                <asp:Label ID="lbl_memId" runat="server" Text='<%# Eval("mem_id")%>'>
                                </asp:Label>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="ชื่อ - สกุล" FieldName="mem_name" VisibleIndex="3"
                            Width="15%">
                            <EditItemTemplate>
                                <asp:Label ID="lbl_memName" runat="server" Text='<%# Eval("mem_name")%>'>
                                </asp:Label>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="จำนวนเงินกู้" FieldName="cacc2_amount" VisibleIndex="4" Width="10%">
                            <EditCellStyle HorizontalAlign="Center">
                            </EditCellStyle>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("cacc2_amount")%>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="ระยะเวลากู้" FieldName="cacc2_period" VisibleIndex="5" Width="10%">
                            <EditCellStyle HorizontalAlign="Center">
                            </EditCellStyle>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("cacc2_period")%>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="ดอกเบี้ย" FieldName="cacc2_int_rate" VisibleIndex="6" Width="10%">
                            <EditCellStyle HorizontalAlign="Center">
                            </EditCellStyle>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Eval("cacc2_int_rate")%>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="ผู้ค้ำคนที่ 1" FieldName="cacc2_person1" VisibleIndex="7" Width="10%">
                            <EditCellStyle HorizontalAlign="Center">
                            </EditCellStyle>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Eval("cacc2_person1")%>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="ผู้ค้ำคนที่ 2" FieldName="cacc2_person2" VisibleIndex="8" Width="10%">
                            <EditCellStyle HorizontalAlign="Center">
                            </EditCellStyle>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Eval("cacc2_person2")%>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="เจ้าหน้าที่" FieldName="booking_by" VisibleIndex="9" Width="10%">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Eval("booking_by")%>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewCommandColumn ButtonType="Image" VisibleIndex="10" ShowInCustomizationForm="True"
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
                    <SettingsPager Visible="True">
                    </SettingsPager>
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="sds_showloan1" runat="server" ConnectionString="<%$ ConnectionStrings:vfms_dbConnectionString%>"
                    SelectCommand="SELECT  loan_member_acc2.lmem2_id ,loan_member_acc2.mem_id ,loan_member_acc2.lmem2_reg_date ,loan_member_acc2.cacc2_amount,
                                            loan_member_acc2.cacc2_period ,loan_member_acc2.cacc2_int_rate ,loan_member_acc2.cacc2_person1 ,loan_member_acc2.cacc2_person2,
                                            loan_member_acc2.booking_by ,member.mem_name  
                                            FROM loan_member_acc2 
                                            INNER JOIN member ON loan_member_acc2.mem_id = member.mem_id"
                    UpdateCommand="UPDATE [loan_member_acc2] SET  [cacc2_amount] = @cacc2_amount ,[cacc2_period] = @cacc2_period ,[cacc2_int_rate] = @cacc2_int_rate ,[cacc2_person1] = @cacc2_person1,
                                            [cacc2_person2] = @cacc2_person2 WHERE [lmem2_id] = @lmem2_id"
                    DeleteCommand="DELETE FROM [loan_member_acc2] WHERE [lmem2_id] = @lmem2_id"
                    InsertCommand="INSERT INTO [loan_member_acc2] ([lmem2_id], [mem_id], [cacc2_amount], [cacc2_period], [cacc2_int_rate], [cacc2_person1], [cacc2_person2], [booking_by]) 
                                            VALUES (@lmem2_id, @mem_id, @cacc2_amount, @cacc2_period, @cacc2_int_rate, @cacc2_person1, @cacc2_person2, @booking_by)">
                    <DeleteParameters>
                        <asp:Parameter Name="lmem2_id" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="lmem2_id" Type="String" />
                        <asp:Parameter Name="mem_id" Type="String" />
                        <asp:Parameter Name="cacc2_amount" Type="String" />
                        <asp:Parameter Name="cacc2_period" Type="String" />
                        <asp:Parameter Name="cacc2_int_rate" Type="String" />
                        <asp:Parameter Name="cacc2_person1" Type="String" />
                        <asp:Parameter Name="cacc2_person2" Type="String" />
                        <asp:Parameter Name="booking_by" Type="String" />
                        <asp:Parameter DbType="Date" Name="lmem2_reg_date" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="cacc2_amount" Type="String" />
                        <asp:Parameter Name="cacc2_period" Type="String" />
                        <asp:Parameter Name="cacc2_int_rate" Type="String" />
                        <asp:Parameter Name="cacc2_person1" Type="String" />
                        <asp:Parameter Name="cacc2_person2" Type="String" />
                    </UpdateParameters>

                </asp:SqlDataSource>
            </div>
            <!-- /.box-body -->
        </div>
        <!-- /.box -->
    </section>
</asp:Content>

