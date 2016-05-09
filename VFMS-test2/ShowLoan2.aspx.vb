Public Class ShowLoan2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If String.IsNullOrEmpty(Session("Username")) Then Response.Redirect("~/Login1.aspx")
        Dim RequestLId = Request.QueryString("lId")

       
    End Sub

    Protected Sub ListItem_Command(ByVal sender As Object, ByVal e As CommandEventArgs)
        Select Case e.CommandName
            Case "AddLoanMember2"
                Response.Redirect("AddLoan2.aspx?lId=" & e.CommandArgument)
        End Select
    End Sub

End Class