Public Class Deposit
    Inherits System.Web.UI.Page

    'Check add Save
    Private Function CheckValidatedata() As Boolean
        If cmb_Number.Text.Trim = String.Empty Then
            lbl_Error.Text = "กรุณากรอก ชื่อ-สกุล"
            lbl_Error.Visible = True
            Return False
        ElseIf ASPxDate.Text.Trim = String.Empty Then
            lbl_Error.Text = "กรุณากรอก วันที่ฝาก"
            lbl_Error.Visible = True
            Return False
        ElseIf txt_Money.Text.Trim = String.Empty Then
            lbl_Error.Text = "กรุณากรอก เลขบัตรประชาชน"
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
        gv_deposit.DataBind()
    End Sub

    Public Sub RunMemberID()
        Using ctx As New vfmsDataContext
            Dim MemberID As String = String.Empty
            Dim yeas As String = CStr(Now.Year).Substring(2, 2)
            Dim month As String = CStr(Now.Month)
            MemberID = yeas & "-" & month & "-" & CStr(FindNextDRunningNo(ctx)).PadLeft(3, "0")
            lbl_Number.Text = MemberID
        End Using
    End Sub

    Public Function FindNextDRunningNo(ByVal ctx As vfmsDataContext)
        Dim dRunningNo As Integer
        dRunningNo = (From g In ctx.depo_transactions Where CDate(g.dtrans_timestamp).Month = Now.Month
                      Select CType(g.runningNo, Integer?)).Max.GetValueOrDefault + 1
        Return dRunningNo
    End Function

    Protected Sub ListItem_Command(ByVal sender As Object, ByVal e As CommandEventArgs)
        Select Case e.CommandName
            Case "AddDeposit"
                Response.Redirect("Deposit.aspx?DId=" & e.CommandArgument)
        End Select
    End Sub

    Private Sub btn_Save_ServerClick(sender As Object, e As EventArgs) Handles btn_Save.ServerClick
        If Not CheckValidatedata() Then Exit Sub
        Using ctx As New vfmsDataContext
            Try
                Dim Runing = CStr(FindNextDRunningNo(ctx)).PadLeft(3, "0")
                Dim memberNo As String = cmb_Number.Text.Trim
                Dim money As String = txt_Money.Text.Trim
                Dim TbMoney = (From q In ctx.deposit_accounts Where q.mem_id = memberNo).SingleOrDefault
                Dim TbAcMoney As New depo_transaction
                With TbMoney
                    If txt_Money.Text.Trim = String.Empty Then
                        txt_Money.Text = 0.0
                    Else
                        .mem_id = memberNo
                        .depo_total = (.depo_total + money)
                    End If
                End With
                With TbAcMoney
                    .dtrans_id = lbl_Number.Text.Trim
                    .dtrans_timestamp = ASPxDate.Text.Trim
                    .dtrans_amount = money
                    .mem_id = memberNo
                    .booking_by = Session("Username")
                    .runningNo = Runing
                End With
                ctx.depo_transactions.InsertOnSubmit(TbAcMoney)
                ctx.SubmitChanges()
                gv_deposit.DataBind()
            Catch ex As Exception
                Throw ex
            End Try

        End Using
    End Sub

    Private Sub btn_cancel_ServerClick(sender As Object, e As EventArgs) Handles btn_cancel.ServerClick
        cmb_Number.Text = ""
        txt_Name.Text = ""
        ASPxDate.Text = ""
        txt_Money.Text = ""
    End Sub

    Public Sub AddDataInForm(ByVal D_No)
        lbl_Number.Text = D_No
        ShowData(D_No)
    End Sub

    Public Function chkDepositByNO(ByVal mno As String) As depo_transaction
        Dim depo As New depo_transaction
        Using ctx = New vfmsDataContext
            depo = (From q In ctx.depo_transactions Where q.dtrans_id = mno).SingleOrDefault
        End Using
        Return depo
    End Function

    Public Sub ShowData(ByVal dno As String)
        Using ctx As New vfmsDataContext
            Dim depo As New depo_transaction
            depo = chkDepositByNO(dno)
            If depo IsNot Nothing Then
                btn_Save.Visible = False
                btn_Uploan.Visible = True
                btn_cancel.Visible = True
                With depo
                    'lbl_Number.Text = .dtrans_id
                    cmb_Number.Text = .mem_id
                    txt_Money.Text = .dtrans_amount
                    ASPxDate.Text = .dtrans_timestamp

                End With
                Dim memberNo As String = cmb_Number.Text.Trim
                Dim mem = (From q In ctx.members Where q.mem_id = memberNo).SingleOrDefault
                With mem
                    txt_Name.Text = .mem_name
                End With
                Dim money As String = txt_Money.Text.Trim
                Dim TbMoney = (From q In ctx.deposit_accounts Where q.mem_id = memberNo).SingleOrDefault
                With TbMoney
                    If txt_Money.Text.Trim = String.Empty Then
                        txt_Money.Text = 0.0
                    Else
                        .mem_id = memberNo
                        .depo_total = (.depo_total - money)
                    End If
                End With
                ctx.SubmitChanges()
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
            Try
                Dim memberNo As String = cmb_Number.Text.Trim
                Dim money As String = txt_Money.Text.Trim
                Dim mem As String = lbl_Number.Text.Trim
                Dim TbMoney = (From q In ctx.deposit_accounts Where q.mem_id = memberNo).SingleOrDefault
                Dim TbAcMoney = (From m In ctx.depo_transactions Where m.dtrans_id = mem).SingleOrDefault
                With TbMoney
                    If txt_Money.Text.Trim = String.Empty Then
                        txt_Money.Text = 0.0
                    Else
                        .mem_id = memberNo
                        .depo_total = (.depo_total + money)
                    End If
                End With
                With TbAcMoney
                    .dtrans_timestamp = ASPxDate.Text.Trim
                    .dtrans_amount = money
                    .booking_by = Session("Username")
                End With
                ctx.SubmitChanges()
                gv_deposit.DataBind()
                MsgBox("อัปเดตข้อมูลแล้ว")
            Catch ex As Exception
                Throw ex
            End Try
        End Using
        Response.Redirect("Deposit.aspx")
    End Sub
End Class