Public Class PaymentLoan1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub CIN_cmb_attn_Callback(ByVal sender As Object, e As DevExpress.Web.ASPxClasses.CallbackEventArgsBase) Handles cmb_Loan.Callback
        cmb_Loan.DataBind()
    End Sub
End Class