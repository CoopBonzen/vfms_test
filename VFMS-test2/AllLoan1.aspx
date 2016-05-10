<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site2.Master" CodeBehind="AllLoan1.aspx.vb" Inherits="VFMS_test2.AllLoan1" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Main content -->
    <section class="content-header ">
        <h1>ข้อมูลเงินกู้บัญชี 1
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>หน้าแรก</a></li>
            <li><a href="#">เงินกู้บัญชี 1</a></li>
            <li class="active">ข้อมูลเงินกู้บัญชี 1</li>
        </ol>
    </section>
    <section class="content">
        <div class="box box-success">
            <div class="box-header">
                <h3 class="box-title">แสดงรายการชำระเงินกู้</h3>
                <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
                </div>
            </div>
            <div class="box-body">
               <dx:ASPxGridView ID="ASPxGridView1" runat="server" CssClass="table" DataSourceID="sds_loan_acc1" KeyFieldName="la1_trans_id">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="เลขที่รายการ" FieldName="la1_trans_id" VisibleIndex="1"
                            Width="8%">
                            <DataItemTemplate>
                                <asp:LinkButton ID="lnk_DId" runat="server" Text='<%# Eval("la1_trans_id")%>' CommandName="PaymentLoan1"
                                    CommandArgument='<%# Eval("la1_trans_id")%>' OnCommand="ListItem_Command">
                                </asp:LinkButton>
                            </DataItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="lbl_Number" runat="server" Text='<%# Eval("la1_trans_id")%>'>
                                </asp:Label>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="เลขที่กู้" FieldName="lmem1_id" VisibleIndex="2"
                            Width="8%">
                            <EditItemTemplate>
                                <asp:Label ID="lbl_Loan" runat="server" Text='<%# Eval("lmem1_id")%>'>
                                </asp:Label>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="ชื่อ - สกุล" FieldName="mem_name" VisibleIndex="3"
                            Width="15%">
                            <EditCellStyle HorizontalAlign="Center">
                            </EditCellStyle>
                            <EditItemTemplate>
                                <asp:Label ID="lbl_Name" runat="server" Text='<%# Eval("mem_name")%>'>
                                </asp:Label>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn Caption="วันที่ฝาก" FieldName="la1_trans_timestamp" VisibleIndex="4"
                            Width="8%">
                            <EditItemTemplate>
                                <asp:Label ID="lbl_QDate" runat="server" Text='<%# Eval("la1_trans_timestamp", "{0:d/MM/yyyy}")%>'>
                                </asp:Label>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn Caption="เงินต้น" FieldName="cacc1_amount" VisibleIndex="5"
                            Width="10%">
                            <EditCellStyle HorizontalAlign="Center">
                            </EditCellStyle>
                            <EditItemTemplate>
                                <asp:Label ID="lbl_Money" runat="server" Text='<%# Eval("cacc1_amount")%>'>
                                </asp:Label>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="ชำระเงินต้น" FieldName="la1_trans_amount" VisibleIndex="6" Width="15%">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Note" runat="server" Text='<%# Bind("la1_trans_amount")%>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="ชำระดอกเบี้ย" FieldName="la1_trans_rate" VisibleIndex="7" Width="15%">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Note" runat="server" Text='<%# Bind("la1_trans_rate")%>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="ยอดคงเหลือ" FieldName="la1_trans_balance" VisibleIndex="8" Width="15%">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Note" runat="server" Text='<%# Bind("la1_trans_balance")%>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="เจ้าหน้าที่" FieldName="booking_by" VisibleIndex="9" Width="10%">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Note" runat="server" Text='<%# Bind("booking_by")%>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <SettingsEditing Mode="Inline" />
                    <Settings ShowFilterRow="True" />
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="sds_loan_acc1" runat="server" ConnectionString="<%$ ConnectionStrings:vfms_dbConnectionString%>"
                    SelectCommand="SELECT loan_acc1_transaction.la1_trans_id , loan_acc1_transaction.lmem1_id , loan_acc1_transaction.la1_trans_timestamp , loan_acc1_transaction.la1_trans_amount,
                                    loan_acc1_transaction.la1_trans_rate ,loan_acc1_transaction.la1_trans_balance ,loan_acc1_transaction.booking_by , loan_member_acc1.mem_id ,loan_member_acc1.cacc1_amount , member.mem_name  
                                    FROM loan_acc1_transaction
                                    INNER JOIN loan_member_acc1  ON loan_acc1_transaction.lmem1_id = loan_member_acc1.lmem1_id
                                    INNER JOIN member  ON loan_member_acc1.mem_id = member.mem_id"
                    UpdateCommand="UPDATE [loan_acc1_transaction] SET  [la1_trans_amount] = @la1_trans_amount WHERE [la1_trans_id] = @la1_trans_id"
                    DeleteCommand="DELETE FROM [loan_acc1_transaction] WHERE [la1_trans_id] = @la1_trans_id"
                    InsertCommand="INSERT INTO [loan_acc1_transaction] ([la1_trans_id], [lmem1_id], [la1_trans_timestamp], [la1_trans_amount], [la1_trans_rate], [la1_trans_balance], [booking_by], [mem_id], [cacc1_amount], [mem_name]) 
                    VALUES (@la1_trans_id, @lmem1_id, @la1_trans_timestamp, @la1_trans_amount, @la1_trans_rate, @la1_trans_balance, @booking_by, @mem_id, @cacc1_amount, @mem_name)">
                    <DeleteParameters>
                        <asp:Parameter Name="la1_trans_id" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="la1_trans_id" Type="String" />
                        <asp:Parameter Name="lmem1_id" Type="String" />
                        <asp:Parameter Name="la1_trans_amount" Type="String" />
                        <asp:Parameter Name="la1_trans_rate" Type="String" />
                        <asp:Parameter Name="la1_trans_balance" Type="String" />
                        <asp:Parameter Name="booking_by" Type="String" />
                        <asp:Parameter Name="mem_id" Type="String" />
                        <asp:Parameter Name="mem_name" Type="String" />
                        <asp:Parameter Name="cacc1_amount" Type="String" />
                        <asp:Parameter DbType="Date" Name="la1_trans_timestamp" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="la1_trans_id" Type="String" />

                    </UpdateParameters>

                </asp:SqlDataSource>
            </div>
            <!-- /.box-body -->
        </div>
        <!-- /.box -->
    </section>
</asp:Content>

