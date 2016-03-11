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
        Dim RequestQId = Request.QueryString("qId")

        gv_deposit.DataBind()
    End Sub

    Public Function FindNextDRunningNo(ByVal ctx As vfmsDataContext)
        Dim dRunningNo As Integer
        dRunningNo = (From g In ctx.depo_transactions Where CDate(g.dtrans_timestamp).Year = Now.Year
                      Select CType(g.dtrans_id, Integer?)).Max.GetValueOrDefault + 1
        Return dRunningNo
    End Function

    Private Sub btn_Save_ServerClick(sender As Object, e As EventArgs) Handles btn_Save.ServerClick
        If Not CheckValidatedata() Then Exit Sub
        Using ctx As New vfmsDataContext
            Try
                Dim DRuningNo = CStr(FindNextDRunningNo(ctx)).PadLeft(4, "0")
                Dim memberNo As String = cmb_Number.Text.Trim
                Dim money As String = txt_Money.Text.Trim
                Dim TbMoney = (From q In ctx.deposit_accounts Where q.mem_id = memberNo).SingleOrDefault
                Dim TbAcMoney As New depo_transaction
                With TbMoney
                    .mem_id = memberNo
                    .depo_total = (.depo_total + money)
                   
                End With
                With TbAcMoney
                    .dtrans_id = DRuningNo
                    .dtrans_timestamp = ASPxDate.Text.Trim
                    .dtrans_amount = money
                    .mem_id = memberNo
                    .booking_by = Session("Username")
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
End Class