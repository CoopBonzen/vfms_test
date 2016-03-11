Public Module RoleEnum

    ' สิทธิต่างๆ ที่ user สามารถทำได้
    Public Const PrivViewQPQ As String = "เพิ่มสมาชิก/เปิดบัญชี"

    Public Const PrivAddNewDocument As String = "แก้ไขข้อมูลสมาชิก"

    Public Const PrivEditQuotation As String = "เพิ่มข้อมูลเงินฝาก"
    Public Const PrivApproveQuotation As String = "แก้ไขข้อมูลเงินฝาก"
    Public Const PrivDeleteFileQuotation As String = "เพิ่มผู้กู้"

    Public Const PrivUploadFileQuotation As String = "แก้ไขข้อมูลผู้กู้"
    Public Const PrivUploadFileProposal As String = "จัดการเงินปันผล"
    Public Const PrivUploadFileGeneral As String = "จัดการพนักงาน"

    Public Const PrivManageUserAndUserGroup As String = ""

#Region "Privilege"
    Public Class PrivilegeInfo
        Private _name As String
        ''' <summary>
        ''' ชื่อสิทธิ
        ''' </summary>
        ''' <value></value>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public Property Name() As String
            Get
                Return _name
            End Get
            Set(ByVal value As String)
                _name = value
            End Set
        End Property

        Private _text As String
        ''' <summary>
        ''' ชื่อของสิทธิที่สามารถอ่านเข้าใจได้
        ''' </summary>
        ''' <value></value>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public Property Text() As String
            Get
                Return _text
            End Get
            Set(ByVal value As String)
                _text = value
            End Set
        End Property
    End Class

    Public UserPrivilege As New List(Of PrivilegeInfo)

    ''' <summary>
    ''' สร้างข้อมูลสำหรับรายการ Privilege ในระบบ
    ''' </summary>
    ''' <remarks></remarks>
    Public Sub CreatePrivilege()
        With UserPrivilege
            .Clear()
            .Add(New PrivilegeInfo With {.Name = PrivViewQPQ, .Text = "เพิ่มสมาชิก/เปิดบัญชี"})

            .Add(New PrivilegeInfo With {.Name = PrivAddNewDocument, .Text = "แก้ไขข้อมูลสมาชิก"})

            .Add(New PrivilegeInfo With {.Name = PrivEditQuotation, .Text = "เพิ่มข้อมูลเงินฝาก"})
            .Add(New PrivilegeInfo With {.Name = PrivApproveQuotation, .Text = "แก้ไขข้อมูลเงินฝาก"})
            .Add(New PrivilegeInfo With {.Name = PrivDeleteFileQuotation, .Text = "เพิ่มผู้กู้"})

            .Add(New PrivilegeInfo With {.Name = PrivUploadFileQuotation, .Text = "แก้ไขข้อมูลผู้กู้"})
            .Add(New PrivilegeInfo With {.Name = PrivUploadFileProposal, .Text = "จัดการเงินปันผล"})
            .Add(New PrivilegeInfo With {.Name = PrivUploadFileGeneral, .Text = "จัดการพนักงาน"})

            .Add(New PrivilegeInfo With {.Name = PrivManageUserAndUserGroup, .Text = ""})

            End With
    End Sub
#End Region


    Public Function IsUserRole(ByVal user As String, ByVal role As String) As Boolean
        Dim ctx As New vfmsDataContext
        'Dim UserId = (From u In ctx.Users Where u.user_id = User).SingleOrDefault
        Dim UserRole = (From u In ctx.users _
                     Join ug In ctx.usergroups On u.user_group_id Equals ug.user_group_id
                     Join gr In ctx.usergroup_roles On ug.user_group_id Equals gr.user_group_id
                     Where u.user_name = user And gr.role_name.ToLower = role.ToLower).SingleOrDefault
        If UserRole IsNot Nothing Then
            Return True
        Else
            Return False
        End If
    End Function

End Module
