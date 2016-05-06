<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site2.Master" CodeBehind="ShowDeposit.aspx.vb" Inherits="VFMS_test2.ShowDeposit" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Main content -->
    <section class="content-header ">
        <h1>ฝากเงิน
        </h1>
        <ol class="breadcrumb">
            <li><a href="Home.aspx"><i class="fa fa-home"></i>หน้าแรก</a></li>
            <li><a href="#">เงินฝาก</a></li>
            <li class="active">แสดงฝากเงินทั้งหมด</li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">

        <div class="box box-success">
            <div class="box-header">
                <h3 class="box-title">แสดงรายการฝากทั้งหมด</h3>
                <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
                </div>
            </div>
            <div class="box-body">
                <dx:ASPxGridView ID="gv_deposit" runat="server" CssClass="table" DataSourceID="sds_depo_transaction" KeyFieldName="dtrans_id">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="เลขที่รายการ" FieldName="dtrans_id" ReadOnly="True"
                            VisibleIndex="1" Width="8%" SortOrder="Descending">
                            <EditCellStyle HorizontalAlign="Center">
                            </EditCellStyle>
                            <DataItemTemplate>
                                <asp:LinkButton ID="lnk_DId" runat="server" Text='<%# Eval("dtrans_id")%>' CommandName="AddDeposit"
                                    CommandArgument='<%# Eval("dtrans_id")%>' OnCommand="ListItem_Command">
                                </asp:LinkButton>
                            </DataItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="lbl_dtrans_id" runat="server" Text='<%# Eval("dtrans_id")%>'></asp:Label>
                            </EditItemTemplate>
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="รหัสสมาชิก" FieldName="mem_id" ReadOnly="True"
                            VisibleIndex="2" Width="8%" SortOrder="Descending">
                            <EditCellStyle HorizontalAlign="Center">
                            </EditCellStyle>
                            <EditItemTemplate>
                                <asp:Label ID="lbl_mem_id" runat="server" Text='<%# Eval("mem_id")%>'></asp:Label>
                            </EditItemTemplate>
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="ชื่อ-สกุล" FieldName="mem_name" VisibleIndex="3" Width="10%" SortOrder="Descending">
                            <EditCellStyle HorizontalAlign="Center">
                            </EditCellStyle>
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_name" runat="server" Text='<%# Eval("mem_name")%>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn Caption="วันที่ฝาก" FieldName="dtrans_timestamp" VisibleIndex="4"
                            Width="8%">
                            <EditItemTemplate>
                                <asp:Label ID="lbl_QDate" runat="server" Text='<%# Eval("dtrans_timestamp", "{0:d/MM/yyyy}")%>'>
                                </asp:Label>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn Caption="จำนวนเงินฝาก" FieldName="dtrans_amount" VisibleIndex="5"
                            Width="10%">
                            <EditItemTemplate>
                                <asp:TextBox ID="lbl_ContactName" runat="server" Text='<%# Bind("dtrans_amount")%>'></asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="เงินฝากทั้งหมด" FieldName="depo_total" VisibleIndex="6"
                            Width="8%">
                            <EditItemTemplate>
                                <asp:Label ID="lbl_money" runat="server" Text='<%# Eval("depo_total")%>'></asp:Label>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="เจ้าหน้าที่" FieldName="booking_by" VisibleIndex="7"
                            Width="10%">
                            <EditItemTemplate>
                                <asp:Label ID="lbl_BookingBy" runat="server" Text='<%# Eval("booking_by")%>'>
                                </asp:Label>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewCommandColumn ButtonType="Image" VisibleIndex="8" ShowInCustomizationForm="True"
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
                        </dx:GridViewCommandColumn>
                    </Columns>
                    <SettingsEditing Mode="Inline" />
                    <Settings ShowFilterRow="True" />
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="sds_depo_transaction" runat="server" ConnectionString="<%$ ConnectionStrings:vfms_dbConnectionString%>"
                    SelectCommand="SELECT dtrans_id, dtrans_timestamp, dtrans_amount, depo_transaction.mem_id, member.mem_name,booking_by,deposit_account.depo_total FROM depo_transaction
                                    INNER JOIN member ON depo_transaction.mem_id = member.mem_id
                                    INNER JOIN deposit_account ON depo_transaction.mem_id = deposit_account.mem_id"
                    UpdateCommand="UPDATE [depo_transaction] SET  [dtrans_amount] = @dtrans_amount WHERE [dtrans_id] = @dtrans_id"
                    DeleteCommand="DELETE FROM [depo_transaction] WHERE [dtrans_id] = @dtrans_id"
                    InsertCommand="INSERT INTO [depo_transaction] ([dtrans_id], [dtrans_timestamp], [dtrans_amount], [mem_id], [mem_name], [booking_by]) 
                    VALUES (@dtrans_id, @dtrans_timestamp, @dtrans_amount, @mem_id, @mem_name, @booking_by)">
                    <DeleteParameters>
                        <asp:Parameter Name="dtrans_id" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="dtrans_id" Type="String" />
                        <asp:Parameter Name="dtrans_amount" Type="String" />
                        <asp:Parameter Name="mem_id" Type="String" />
                        <asp:Parameter Name="mem_name" Type="String" />
                        <asp:Parameter Name="booking_by" Type="String" />
                        <asp:Parameter DbType="Date" Name="dtrans_timestamp" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="dtrans_amount" Type="String" />

                    </UpdateParameters>

                </asp:SqlDataSource>
            </div>
            <!-- /.box-body -->
        </div>
        <!-- /.box -->
    </section>
</asp:Content>
