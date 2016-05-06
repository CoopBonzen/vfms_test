Public Class AddLoan2
    Inherits System.Web.UI.Page

    'Check add Save
    Private Function CheckValidatedata() As Boolean
        If cmb_Number.Text.Trim = String.Empty Then
            lbl_Error.Text = "กรุณาเลือกรหัสสมาชิก"
            lbl_Error.Visible = True
            Return False
        ElseIf ASPxDate.Text.Trim = String.Empty Then
            lbl_Error.Text = "กรุณากรอก วันที่"
            lbl_Error.Visible = True
            Return False
        ElseIf txt_Money.Text.Trim = String.Empty Then
            lbl_Error.Text = "กรุณากรอก จำนวนเงินกู้"
            lbl_Error.Visible = True
            Return False
        ElseIf txt_TimeLoan.Text.Trim = String.Empty Then
            lbl_Error.Text = "กรุณากรอก ระยะเวลากู้"
            lbl_Error.Visible = True
            Return False
        ElseIf txt_Interest.Text.Trim = String.Empty Then
            lbl_Error.Text = "กรุณากรอก อัตราดอกเบี้ย"
            lbl_Error.Visible = True
            Return False
        Else : lbl_Error.Text = ""
            lbl_Error.Visible = True
            Return True
        End If
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If String.IsNullOrEmpty(Session("Username")) Then Response.Redirect("~/Login1.aspx")


        RunLoanID()
        gv_showloan2.DataBind()
    End Sub

    Public Sub RunLoanID()
        Using ctx As New vfmsDataContext
            Dim LoanID As String = String.Empty
            LoanID = "L2-" & CStr(FindNextLRunningNo(ctx)).PadLeft(3, "0")
            lbl_Number.Text = LoanID
        End Using
    End Sub

    Public Function FindNextLRunningNo(ByVal ctx As vfmsDataContext)
        Dim lRunningNo As Integer

        lRunningNo = (From g In ctx.loan_account2s Select CType(g.la2_id, Integer?)).Max.GetValueOrDefault + 1

        Return lRunningNo
    End Function

    Public Function FindNextARunningNo(ByVal ctx As vfmsDataContext)
        Dim aRunningNo As Integer

        aRunningNo = (From g In ctx.loan_account2s Select CType(g.la2_id, Integer?)).Max.GetValueOrDefault + 1

        Return aRunningNo
    End Function

    Public Function FindNextCRunningNo(ByVal ctx As vfmsDataContext)
        Dim cRunningNo As Integer

        cRunningNo = (From g In ctx.contract_acc2s Select CType(g.contract2_no, Integer?)).Max.GetValueOrDefault + 1

        Return cRunningNo
    End Function

    Private Sub btn_Save_ServerClick(sender As Object, e As EventArgs) Handles btn_Save.ServerClick
        If Not CheckValidatedata() Then Exit Sub
        Using ctx As New vfmsDataContext
            Try
                Dim maxId = (From r In ctx.loan_members Select CType(r.lmem_runningNo, Integer?)).Max
                Dim nextId = If(maxId.HasValue, maxId + 1, 1)
                Dim loanNo As String = lbl_Number.Text.Trim
                Dim accNo As String = CStr(FindNextARunningNo(ctx)).PadLeft(3, "0")
                Dim conNO As String = CStr(FindNextCRunningNo(ctx)).PadLeft(3, "0")
                Dim memberNo As String = cmb_Number.Text.Trim
                Dim TbLoan As New loan_member
                Dim TbAcc As New loan_account2
                Dim TbCon As New contract_acc2
                With TbLoan
                    .lmem_id = loanNo
                    .mem_id = memberNo
                    .lmem_reg_date = ASPxDate.Text.Trim
                    .lmem_runningNo = nextId

                End With
                With TbAcc
                    .la2_id = accNo
                    .lmem_id = loanNo
                    .la2_balance = txt_Money.Text
                    .la2_period = txt_TimeLoan.Text.Trim
                End With
                With TbCon
                    .contract2_no = conNO
                    .la2_id = accNo
                    .cacc2_amount = txt_Money.Text
                    .cacc2_period = txt_TimeLoan.Text.Trim
                    .cacc2_int_rate = txt_Interest.Text.Trim
                    .cacc2_person1 = cmb_con1.Text.Trim
                    .cacc2_person2 = cmb_con2.Text.Trim

                End With
                ctx.loan_members.InsertOnSubmit(TbLoan)
                ctx.loan_account2s.InsertOnSubmit(TbAcc)
                ctx.contract_acc2s.InsertOnSubmit(TbCon)
                ctx.SubmitChanges()
                gv_showloan2.DataBind()
            Catch ex As Exception
                Throw ex
            End Try

        End Using
    End Sub

    Private Sub btn_cancel_ServerClick(sender As Object, e As EventArgs) Handles btn_cancel.ServerClick
        cmb_Number.Text = ""
        txt_Names.Text = ""
        ASPxDate.Text = ""
        txt_Money.Text = ""
        txt_TimeLoan.Text = ""
        txt_Interest.Text = ""
        cmb_con1.Text = ""
        cmb_con2.Text = ""
    End Sub
End Class