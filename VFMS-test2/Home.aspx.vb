Public Class Home
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If String.IsNullOrEmpty(Session("Username")) Then Response.Redirect("~/Login1.aspx")
    End Sub

    Protected Sub ListItem_Command(ByVal sender As Object, ByVal e As CommandEventArgs)
        Select Case e.CommandName
            Case "AddLoanMember1"
                Response.Redirect("AddLoan1.aspx?lId=" & e.CommandArgument)
            Case "AddLoanMember2"
                Response.Redirect("AddLoan2.aspx?lId=" & e.CommandArgument)
            Case "AddMember"
                Response.Redirect("AddMember.aspx?mId=" & e.CommandArgument)
        End Select
    End Sub
End Class