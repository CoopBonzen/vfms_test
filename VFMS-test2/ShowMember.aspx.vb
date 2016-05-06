Public Class ShowMember
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub ListItem_Command(ByVal sender As Object, ByVal e As CommandEventArgs)
        Select Case e.CommandName
            Case "AddMember"
                Response.Redirect("AddMember.aspx?mId=" & e.CommandArgument)
        End Select
    End Sub
End Class