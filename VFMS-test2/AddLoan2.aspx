<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site2.Master" CodeBehind="AddLoan2.aspx.vb" Inherits="VFMS_test2.AddLoan2" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script lang="javascript" type="text/javascript">
        function OnFileUploadComplete(s, e) {
            btnUpdate.DoClick();
        }
    </script>
    <!-- Main content -->
    <section class="content-header ">
        <h1>เพิ่มรายชื่อผู้กู้บัญชี 2
        </h1>
        <ol class="breadcrumb">
            <li><a href="Home.aspx"><i class="fa fa-dashboard"></i>หน้าแรก</a></li>
            <li><a href="#">เงินกู้บัญชี 2</a></li>
            <li class="active">เพิ่มรายชื่อผู้กู้</li>
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
                            <label for="inputEmail3" class="col-sm-2 control-label">เลขที่สมาชิก</label>
                            <div class="col-sm-10">
                                <%--<asp:Label ID="lbl_Number" runat="server" Class="col-sm-2" Text="555" Font-Size="16"></asp:Label>--%>
                                <dx:ASPxComboBox ID="ASPxCom_Number" runat="server" ValueType="System.String" CssClass="form-control" Width="20%"></dx:ASPxComboBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-2 control-label">ชื่อ-สกุล</label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="txt_Name" runat="server" class="form-control" Width="70%"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label">เลขที่ผู้กู้</label>
                            <div class="col-sm-10">
                                <asp:Label ID="lbl_Number" runat="server" Class="col-sm-2" Text="555" Font-Size="16"></asp:Label>
                                <%--<dx:ASPxLabel ID="lbl_Number" runat="server" Class="col-sm-2" ></dx:ASPxLabel>--%>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-2 control-label">วันที่กู้</label>
                            <div class="col-sm-10">
                                <dx:ASPxDateEdit ID="ASPxDate" runat="server" CssClass="form-control" Width="40%"></dx:ASPxDateEdit>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-2 control-label">จำนวนเงิน</label>
                            <div class="col-sm-2">
                                <asp:TextBox ID="txt_Money" runat="server" class="form-control" Width="100%"></asp:TextBox>
                            </div>
                            <div class="col-sm-2 ">
                                <label for="inputPassword3" class="col-sm-2 control-label">บาท</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-2 control-label">ระยะเวลากู้</label>
                            <div class="col-sm-2">
                                <asp:TextBox ID="txt_TimeLoan" runat="server" class="form-control" Width="100%"></asp:TextBox>
                            </div>
                            <div class="col-sm-2 ">
                                <label for="inputPassword3" class="col-sm-2 control-label">เดือน</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-2 control-label">ดอกเบี้ย</label>
                            <div class="col-sm-2">
                                <asp:TextBox ID="txt_Interest" runat="server" class="form-control" Width="100%"></asp:TextBox>
                            </div>
                            <div class="col-sm-2 ">
                                <label for="inputPassword3" class="col-sm-2 control-label">%</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">

                                <button type="submit" id="btn_Save" runat="server" class="btn btn-info t"><i class="fa fa-save">&nbsp;บันทึก</i></button>
                                <button type="submit" id="btn_cancel" class="btn btn-success " style="margin-right: 5px;"><i class="fa trash-o">ยกเลิก</i></button>

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
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label">เลขที่ผู้กู้</label>
                            <div class="col-sm-10">
                                <asp:Label ID="lbl_NumberLoan2" runat="server" Class="col-sm-2" Text="555" Font-Size="16"></asp:Label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-2 control-label">อับโหลด</label>
                            <div class="col-sm-2">
                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>

                                <dx:ASPxUploadControl ID="ulc_ProposalFile" runat="server" ShowUploadButton="True" CssClass="form"
                                    ShowProgressPanel="True" Width="280px">
                                    <ValidationSettings AllowedFileExtensions=".pdf,.doc,.docx,.xlsx,.xls" ShowErrors="false" />
                                    <ClientSideEvents FileUploadComplete="OnFileUploadComplete" />
                                </dx:ASPxUploadControl>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label">ชื่อผู้กู้</label>
                            <div class="col-sm-10">
                                <dx:ASPxLabel ID="lbl_PCompanyName" runat="server" CssClass="col-sm-2 control-label" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label">เอกสารทั้งหมด</label>
                            <div class="col-sm-10">
                                <dx:ASPxGridView ID="gv_PFile" runat="server" KeyFieldName="P_FileID" CssClass="table" Width="80%">
                                    <Settings ShowColumnHeaders="false" />
                                    <Columns>
                                        <dx:GridViewDataColumn>
                                            <DataItemTemplate>
                                                <asp:HyperLink ID="Link" runat="server" NavigateUrl='<%#Eval("link") %>' ForeColor="#6798de"
                                                    ToolTip='<%#Eval("filename")%>'><%#Eval("filename")%>
                                                </asp:HyperLink>
                                            </DataItemTemplate>
                                        </dx:GridViewDataColumn>
                                        <dx:GridViewDataDateColumn FieldName="P_FileDate" Visible="false" SortOrder="Descending">
                                        </dx:GridViewDataDateColumn>
                                    </Columns>
                                </dx:ASPxGridView>
                            </div>
                        </div>
                    </div>
                    <!-- /.box-body -->

                    <!-- /.box-footer -->
                </div>
            </div>
            <!-- /.col (right) -->

        </div>
        <!-- /.row -->

        <div class="box box-success">
            <div class="box-header">
                <h3 class="box-title">แสดงรายชื่อผู้กู้</h3>
                <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
                </div>
            </div>
            <div class="box-body">
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" CssClass="table">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="รหัสสมาชิก" FieldName="Q_Date" VisibleIndex="2"
                            Width="5%">
                            <EditItemTemplate>
                                <asp:Label ID="lbl_ContactCompany" runat="server" Text='<%# Eval("company_name") %>'>
                                </asp:Label>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="ชื่อ - สกุล" FieldName="company_name" VisibleIndex="4"
                            Width="15%">
                            <EditCellStyle HorizontalAlign="Center">
                            </EditCellStyle>
                            <EditItemTemplate>
                                <asp:Label ID="lbl_ContactCompany" runat="server" Text='<%# Eval("company_name") %>'>
                                </asp:Label>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="เลขที่กู้เงิน" FieldName="Title" VisibleIndex="9" Width="5%">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Note" runat="server" Text='<%# Bind("Title") %>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="จำนวนเงินกู้" FieldName="Title" VisibleIndex="10" Width="10%">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Note" runat="server" Text='<%# Bind("Title") %>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="ระยะเวลากู้" FieldName="Title" VisibleIndex="11" Width="10%">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Note" runat="server" Text='<%# Bind("Title") %>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="ดอกเบี้ย" FieldName="Title" VisibleIndex="12" Width="10%">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Note" runat="server" Text='<%# Bind("Title") %>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="ผู้ค้ำคนที่ 1" FieldName="Title" VisibleIndex="13" Width="10%">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Note" runat="server" Text='<%# Bind("Title") %>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="ผู้ค้ำคนที่ 2" FieldName="Title" VisibleIndex="14" Width="10%">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Note" runat="server" Text='<%# Bind("Title") %>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="เจ้าหน้าที่" FieldName="Title" VisibleIndex="15" Width="10%">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Note" runat="server" Text='<%# Bind("Title") %>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewCommandColumn ButtonType="Image" VisibleIndex="16" ShowInCustomizationForm="True"
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
                    <SettingsPager Visible="False">
                    </SettingsPager>
                </dx:ASPxGridView>
            </div>
            <!-- /.box-body -->
        </div>
        <!-- /.box -->
    </section>
</asp:Content>
