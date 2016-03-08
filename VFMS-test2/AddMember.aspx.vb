Imports System.Data
Imports System.Data.DataTable
Imports System.Data.SqlClient
Imports System.IO
Imports System.Web.Configuration


Public Class AddMember
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'If String.IsNullOrEmpty(Session("Username")) Then Response.Redirect("~/Login.aspx")

    End Sub

    'Public Function FindNextMRunningNo(ByVal ctx As vfmsDataContext)
    '    Dim mRunningNo As Integer
    '    mRunningNo = (From g In ctx.members Select CType(g.mem_runningNo, Integer?)).Max.GetValueOrDefault + 1
    '    Return mRunningNo
    'End Function

    Private Sub btn_Save_ServerClick(sender As Object, e As EventArgs) Handles btn_Save.ServerClick
        Using ctx As New vfmsDataContext
            Try
                Dim maxId As String = String.Empty
                'maxId = " M " & CStr(FindNextMRunningNo(ctx)).PadLeft(3, "0")
                '    (From r In ctx.members Select CType(r.mem_id,   (r.Quota_ID, Integer?)).Max
                'Dim nextId = If(maxId.HasValue, maxId + 1, 1)
                'Dim quotationNo As String = txt_quotation.Text.Trim
                'Dim companyName As String = cmb_company.Text.Trim
                'Dim attnName As String = cmb_attn.Text.Trim
                'Dim TbQuotation As New Quotation
                'With TbQuotation
                '    .Quota_ID = nextId
                '    .company_name = companyName
                '    .attn = attnName
                '    .tel = txt_tel.Text.Trim
                '    .fax = txt_fax.Text.Trim
                '    .email = txt_email.Text.Trim
                '    .quotation_no = quotationNo
                '    .quotation_date = dte_quotationDate.Text.Trim
                '    .quotation_from = txt_from.Text.Trim
                '    .bonzen_tel = txt_bonzentel.Text.Trim
                '    .bonzen_email = txt_bonzenemail.Text.Trim
                '    'ยังไม่ได้ update Total
                '    '.total_amount = sumAmount
                '    .remark = memo_remark.Text
                '    .condition = memo_condition.Text
                'End With
                'ctx.Quotations.InsertOnSubmit(TbQuotation)
                'ctx.SubmitChanges()

                ''สั่ง insert Quotation Item
                'InsertQuotationItem(nextId)
                'UpdateCompanyAndAttnInQuotationProposal(quotationNo, companyName, attnName)
                'btn_AddQuotation.Visible = False
                'btn_SaveQuotation.Visible = True
                'btn_PrintQuotation.Visible = True

                'QuotationID = nextId
            Catch ex As Exception
                Throw ex
            End Try

        End Using
    End Sub
End Class