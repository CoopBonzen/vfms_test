﻿Public Class AllLoan2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If String.IsNullOrEmpty(Session("Username")) Then Response.Redirect("~/Login1.aspx")
        Dim RequestDId = Request.QueryString("dId")

    End Sub

    Protected Sub ListItem_Command(ByVal sender As Object, ByVal e As CommandEventArgs)
        Select Case e.CommandName
            Case "PaymentLoan2"
                Response.Redirect("PaymentLoan2.aspx?DId=" & e.CommandArgument)
        End Select
    End Sub

End Class