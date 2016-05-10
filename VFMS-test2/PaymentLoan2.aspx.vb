Public Class PaymentLoan2
    Inherits System.Web.UI.Page

    'Check add Save
    Private Function CheckValidatedata() As Boolean
        If cmb_Number.Text.Trim = String.Empty Then
            lbl_Error.Text = "กรุณาเลือกรหัสสมาชิก"
            lbl_Error.Visible = True
            Return False
        ElseIf cmb_Loan.Text.Trim = String.Empty Then
            lbl_Error.Text = "กรุณาเลือกเลขที่กู้"
            lbl_Error.Visible = True
            Return False
        ElseIf txt_Money2.Text.Trim = String.Empty Then
            lbl_Error.Text = "กรุณากรอก จำนวนเงินต้น"
            lbl_Error.Visible = True
            Return False
        ElseIf txt_Interest2.Text.Trim = String.Empty Then
            lbl_Error.Text = "กรุณากรอก จำนวนดอกเบี้ย"
            lbl_Error.Visible = True
            Return False
        Else : lbl_Error.Text = ""
            lbl_Error.Visible = True
            Return True
        End If
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If String.IsNullOrEmpty(Session("Username")) Then Response.Redirect("~/Login1.aspx")
        Dim RequestDId = Request.QueryString("dId")

        If Not IsPostBack Then
            AddDataInForm(RequestDId)

        End If
    End Sub

    Public Sub RunMemberID()
        Using ctx As New vfmsDataContext
            Dim MemberID As String = String.Empty
            Dim yeas As String = CStr(Now.Year).Substring(2, 2)
            Dim month As String = CStr(Now.Month)
            MemberID = "L2" & "/" & yeas & "-" & month & "-" & CStr(FindNextDRunningNo(ctx)).PadLeft(3, "0")
            lbl_Numberloan.Text = MemberID
        End Using
    End Sub

    Protected Sub ListItem_Command(ByVal sender As Object, ByVal e As CommandEventArgs)
        Select Case e.CommandName
            Case "PaymentLoan2"
                Response.Redirect("PaymentLoan2.aspx?DId=" & e.CommandArgument)
        End Select
    End Sub

    Public Function FindNextDRunningNo(ByVal ctx As vfmsDataContext)
        Dim dRunningNo As Integer
        dRunningNo = (From g In ctx.loan_acc2_transactions Where CDate(g.la2_trans_timestamp).Month = Now.Month
                      Select CType(g.runningNo, Integer?)).Max.GetValueOrDefault + 1
        Return dRunningNo
    End Function

    Private Sub CIN_cmb_Loan_Callback(ByVal sender As Object, e As DevExpress.Web.ASPxClasses.CallbackEventArgsBase) Handles cmb_Loan.Callback
        cmb_Loan.DataBind()
        'ShowData(e.Parameter)
    End Sub

    Public Function chkMemberByNO(ByVal lno As String) As member
        Dim loan As New member
        Using ctx = New vfmsDataContext
            loan = (From q In ctx.members Where q.mem_id = lno).SingleOrDefault
        End Using
        Return loan
    End Function

    Private Sub btnCheck_Click(sender As Object, e As EventArgs) Handles btnCheck.Click
        Using ctx As New vfmsDataContext
            Dim loanNo As String = cmb_Loan.Text.Trim
            Dim loan = (From q In ctx.loan_member_acc2s Where q.lmem2_id = loanNo).SingleOrDefault
            Dim loanAcc = (From a In ctx.loan_account2s Where a.lmem2_id = loanNo Select a.la2_balance).SingleOrDefault
            With loan

                lbl_Number.Text = .cacc2_int_rate
                txt_Money1.Text = loanAcc
                txt_Interest1.Text = (loanAcc * .cacc2_int_rate)

            End With
        End Using
    End Sub

    Private Sub btnName_Click(sender As Object, e As EventArgs) Handles btnName.Click
        Using ctx As New vfmsDataContext
            Dim memberNo As String = cmb_Number.Text.Trim
            Dim loan = (From q In ctx.members Where q.mem_id = memberNo Select q.mem_name).SingleOrDefault
            txt_Name1.Text = loan
        End Using
    End Sub

    Private Sub btn_Save_ServerClick(sender As Object, e As EventArgs) Handles btn_Save.ServerClick
        If Not CheckValidatedata() Then Exit Sub
        Using ctx As New vfmsDataContext
            Try
                Dim Runing = CStr(FindNextDRunningNo(ctx)).PadLeft(3, "0")
                Dim loanNo As String = cmb_Loan.Text.Trim
                Dim money As String = txt_Money2.Text.Trim
                Dim TbMoney = (From q In ctx.loan_account2s Where q.lmem2_id = loanNo).SingleOrDefault
                Dim changmoney = (From ch In ctx.loan_account2s Where ch.lmem2_id = loanNo Select ch.la2_balance).SingleOrDefault
                Dim TbAcMoney As New loan_acc2_transaction
                With TbMoney
                    If txt_Money2.Text.Trim = String.Empty Then
                        txt_Money2.Text = 0.0
                    Else
                        .lmem2_id = loanNo
                        .la2_balance = (.la2_balance - money)
                    End If
                End With
                With TbAcMoney
                    Dim tot = (changmoney - money)
                    .la2_trans_id = lbl_Numberloan.Text.Trim
                    .lmem2_id = loanNo
                    .la2_trans_timestamp = Format(Date.Now)
                    .la2_trans_amount = money
                    .la2_trans_rate = txt_Interest2.Text.Trim
                    .la2_trans_balance = tot
                    .booking_by = Session("Username")
                    .runningNo = Runing
                End With
                ctx.loan_acc2_transactions.InsertOnSubmit(TbAcMoney)
                ctx.SubmitChanges()
                Response.Redirect("PaymentLoan2.aspx")
            Catch ex As Exception
                Throw ex
            End Try
        End Using
    End Sub

    Private Sub btn_cancel_ServerClick(sender As Object, e As EventArgs) Handles btn_cancel.ServerClick
        Response.Redirect("PaymentLoan2.aspx")
    End Sub

    Public Sub AddDataInForm(ByVal L_No)
        lbl_Number.Text = L_No
        ShowData(L_No)
    End Sub

    Public Function chkDepositByNO(ByVal mno As String) As loan_acc2_transaction
        Dim depo As New loan_acc2_transaction
        Using ctx = New vfmsDataContext
            depo = (From q In ctx.loan_acc2_transactions Where q.la2_trans_id = mno).SingleOrDefault
        End Using
        Return depo
    End Function

    Public Sub ShowData(ByVal dno As String)
        Using ctx As New vfmsDataContext
            Dim depo As New loan_acc2_transaction
            depo = chkDepositByNO(dno)
            If depo IsNot Nothing Then
                btn_Save.Visible = False
                btn_Uploan.Visible = True
                btn_cancel.Visible = True


                With depo
                    lbl_Numberloan.Text = .la2_trans_id
                    cmb_Loan.Text = .lmem2_id
                    txt_Money1.Text = .la2_trans_balance + .la2_trans_amount
                    txt_Money2.Text = .la2_trans_amount
                    Dim loanNo As String = cmb_Loan.Text.Trim
                    Dim loan = (From q In ctx.loan_member_acc2s Where q.lmem2_id = loanNo Select q.cacc2_int_rate).SingleOrDefault
                    lbl_Number.Text = loan

                    txt_Interest1.Text = .la2_trans_rate
                    txt_Interest2.Text = .la2_trans_rate
                End With
                Dim loanNo1 As String = cmb_Loan.Text.Trim
                Dim number = (From q In ctx.loan_member_acc2s Where q.lmem2_id = loanNo1 Select q.mem_id).SingleOrDefault
                cmb_Number.Text = number
                Dim memberNo As String = cmb_Number.Text.Trim
                Dim mem = (From q In ctx.members Where q.mem_id = memberNo Select q.mem_name).SingleOrDefault
                txt_Name1.Text = mem
            Else
                RunMemberID()
                btn_Save.Visible = True
                btn_Uploan.Visible = False
                btn_cancel.Visible = True
            End If
        End Using
    End Sub

    Private Sub btn_Uploan_ServerClick(sender As Object, e As EventArgs) Handles btn_Uploan.ServerClick
        If Not CheckValidatedata() Then Exit Sub
        Using ctx As New vfmsDataContext
            'Try
            Dim loanNo As String = cmb_Loan.Text.Trim
            Dim tloan As String = lbl_Numberloan.Text.Trim
            Dim money As String = txt_Money2.Text.Trim
            Dim TbMoney = (From q In ctx.loan_account2s Where q.lmem2_id = loanNo).SingleOrDefault
            Dim TbAcMoney = (From q In ctx.loan_acc2_transactions Where q.la2_trans_id = tloan).SingleOrDefault
            Dim changloan = (From ch In ctx.loan_account2s Where ch.lmem2_id = loanNo Select ch.la2_balance).SingleOrDefault
            Dim changmoney = (From ch In ctx.loan_acc2_transactions Where ch.la2_trans_id = tloan Select ch.la2_trans_amount).SingleOrDefault
            With TbMoney
                If txt_Money2.Text.Trim = String.Empty Then
                    txt_Money2.Text = 0.0
                Else
                    Dim loantotal = (.la2_balance + changmoney)
                    .lmem2_id = loanNo
                    .la2_balance = (loantotal - money)
                End If
            End With
            With TbAcMoney
                Dim tot = (.la2_trans_balance + changmoney)
                .la2_trans_timestamp = Format(Date.Now)
                .la2_trans_amount = money
                .la2_trans_rate = txt_Interest2.Text.Trim
                .la2_trans_balance = (tot - money)
                .booking_by = Session("Username")

            End With
            'ctx.loan_acc1_transactions.InsertOnSubmit(TbAcMoney)
            ctx.SubmitChanges()
            MsgBox("อัปเดตข้อมูลแล้ว")

            'Catch ex As Exception
            '    Throw ex
            'End Try
        End Using
        Response.Redirect("PaymentLoan2.aspx")
    End Sub
End Class