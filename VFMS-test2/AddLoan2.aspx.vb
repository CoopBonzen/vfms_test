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
        Dim RequestLId = Request.QueryString("lId")

        If Not IsPostBack Then
            AddDataInForm(RequestLId)
        End If
    End Sub

    Public Sub RunLoanID()
        Using ctx As New vfmsDataContext
            Dim LoanID As String = String.Empty
            Dim yeas As String = CStr(Now.Year).Substring(2, 2)
            Dim month As String = CStr(Now.Month)
            LoanID = "L2" & "-" & yeas & "-" & CStr(FindNextLRunningNo(ctx)).PadLeft(3, "0")
            lbl_Number.Text = LoanID
        End Using
    End Sub

    Public Function FindNextLRunningNo(ByVal ctx As vfmsDataContext)
        Dim lRunningNo As Integer
        lRunningNo = (From g In ctx.loan_member_acc2s Where CDate(g.lmem2_reg_date).Year = Now.Year
                      Select CType(g.runningNo, Integer?)).Max.GetValueOrDefault + 1
        Return lRunningNo
    End Function

   Private Sub btn_Save_ServerClick(sender As Object, e As EventArgs) Handles btn_Save.ServerClick
        If Not CheckValidatedata() Then Exit Sub
        Using ctx As New vfmsDataContext
            Try
                Dim nextId = CStr(FindNextLRunningNo(ctx)).PadLeft(3, "0")
                Dim loanNo As String = lbl_Number.Text.Trim
                Dim memberNo As String = cmb_Number.Text.Trim
                Dim TbLoan As New loan_member_acc2
                Dim TbAcc As New loan_account2
                With TbLoan
                    .lmem2_id = loanNo
                    .mem_id = memberNo
                    .lmem2_reg_date = ASPxDate.Text.Trim
                    .cacc2_amount = txt_Money.Text.Trim
                    .cacc2_period = txt_TimeLoan.Text.Trim
                    .cacc2_int_rate = txt_Interest.Text.Trim
                    .cacc2_person1 = cmb_con1.Text.Trim
                    .cacc2_person2 = cmb_con2.Text.Trim
                    .booking_by = Session("Username")
                    .runningNo = nextId
                End With
                With TbAcc
                    .lmem2_id = loanNo
                    .la2_balance = txt_Money.Text.Trim
                End With
                ctx.loan_member_acc2s.InsertOnSubmit(TbLoan)
                ctx.loan_account2s.InsertOnSubmit(TbAcc)
                ctx.SubmitChanges()
                'gv_showloan1.DataBind()
                Response.Redirect("AddLoan2.aspx")
            Catch ex As Exception
                Throw ex
            End Try

        End Using
    End Sub

     Private Sub btn_cancel_ServerClick(sender As Object, e As EventArgs) Handles btn_cancel.ServerClick
        clean()
        btn_Save.Visible = True
        btn_Uploan.Visible = False
    End Sub

    Sub clean()
        cmb_Number.Text = ""
        txt_Name.Text = ""
        ASPxDate.Text = ""
        txt_Money.Text = ""
        txt_TimeLoan.Text = ""
        txt_Interest.Text = ""
        cmb_con1.Text = ""
        cmb_con2.Text = ""
        txt_Name1.Text = ""
        txt_Name2.Text = ""
    End Sub

    Protected Sub ListItem_Command(ByVal sender As Object, ByVal e As CommandEventArgs)
        Select Case e.CommandName
            Case "AddLoanMember2"
                Response.Redirect("AddLoan2.aspx?lId=" & e.CommandArgument)
        End Select
    End Sub

    Public Sub AddDataInForm(ByVal L_No)
        lbl_Number.Text = L_No
        ShowData(L_No)
    End Sub

    Public Function chkMemberByNO(ByVal lno As String) As loan_member_acc2
        Dim loan As New loan_member_acc2
        Using ctx = New vfmsDataContext
            loan = (From q In ctx.loan_member_acc2s Where q.lmem2_id = lno).SingleOrDefault
        End Using
        Return loan
    End Function

    Public Sub ShowData(ByVal lno As String)
        Using ctx As New vfmsDataContext
            Dim loan As New loan_member_acc2
            loan = chkMemberByNO(lno)
            If loan IsNot Nothing Then
                btn_Save.Visible = False
                btn_Uploan.Visible = True
                With loan

                    lbl_Number.Text = .lmem2_id
                    cmb_Number.Text = .mem_id
                    ASPxDate.Text = .lmem2_reg_date
                    txt_Money.Text = .cacc2_amount
                    txt_TimeLoan.Text = .cacc2_period
                    txt_Interest.Text = .cacc2_int_rate
                    cmb_con1.Text = .cacc2_person1
                    cmb_con2.Text = .cacc2_person2

                End With
                Dim memberNo As String = cmb_Number.Text.Trim
                Dim memberNo1 As String = cmb_con1.Text.Trim
                Dim memberNo2 As String = cmb_con2.Text.Trim
                Dim mem = (From q In ctx.members Where q.mem_id = memberNo).SingleOrDefault
                Dim mem1 = (From q In ctx.members Where q.mem_id = memberNo1).SingleOrDefault
                Dim mem2 = (From q In ctx.members Where q.mem_id = memberNo2).SingleOrDefault
                With mem
                    txt_Name.Text = .mem_name
                End With
                With mem1
                    txt_Name1.Text = .mem_name
                End With
                With mem1
                    txt_Name2.Text = .mem_name
                End With
            Else
                RunLoanID()
                btn_Save.Visible = True
                btn_Uploan.Visible = False
                btn_cancel.Visible = True
            End If
        End Using
    End Sub

    Private Sub btn_Uploan_ServerClick(sender As Object, e As EventArgs) Handles btn_Uploan.ServerClick
        If Not CheckValidatedata() Then Exit Sub
        Using ctx As New vfmsDataContext
            Try
                Dim LoanNo As String = lbl_Number.Text.Trim
                Dim money As String = txt_Money.Text.Trim
                Dim TbMoney = (From q In ctx.loan_account2s Where q.lmem2_id = LoanNo).SingleOrDefault
                Dim TbAcMoney = (From m In ctx.loan_member_acc2s Where m.lmem2_id = LoanNo).SingleOrDefault
                'Dim changmoney = (From ch In ctx.loan_member_acc1s Where ch.lmem1_id = LoanNo Select ch.cacc1_amount).SingleOrDefault
                With TbMoney
                    If txt_Money.Text.Trim = String.Empty Then
                        txt_Money.Text = 0.0
                    Else
                        'Dim totel = (.la1_balance - changmoney)
                        ''.lmem1_id = LoanNo
                        .la2_balance = money
                    End If
                End With
                With TbAcMoney
                    .mem_id = cmb_Number.Text.Trim
                    .lmem2_reg_date = ASPxDate.Text.Trim
                    .cacc2_amount = money
                    .cacc2_period = txt_TimeLoan.Text.Trim
                    .cacc2_int_rate = txt_Interest.Text.Trim
                    .cacc2_person1 = cmb_con1.Text.Trim
                    .cacc2_person2 = cmb_con2.Text.Trim
                    .booking_by = Session("Username")
                End With
                ctx.SubmitChanges()
                gv_showloan2.DataBind()
                MsgBox("อัปเดตข้อมูลแล้ว")
            Catch ex As Exception
                Throw ex
            End Try
        End Using
        Response.Redirect("AddLoan2.aspx")
    End Sub
End Class