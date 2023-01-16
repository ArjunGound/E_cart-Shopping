Public Class Homepage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Request.QueryString("catid") <> Nothing Then
                DataListguest.DataSourceID = Nothing
                DataListguest.DataSource = SqlDataSource2
                DataListguest.DataBind()
            End If
            If Request.QueryString("catid") = 0 Then
                DataListguest.DataSourceID = Nothing
                DataListguest.DataSource = SqlDataSource1
                DataListguest.DataBind()
            End If
        End If
    End Sub

    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
        Response.Redirect("~/Homepage.aspx?catid=" + "1")
    End Sub

    Protected Sub LinkButton2_Click(sender As Object, e As EventArgs) Handles LinkButton2.Click
        Response.Redirect("~/Homepage.aspx?catid=" + "2")
    End Sub

    Protected Sub LinkButton3_Click(sender As Object, e As EventArgs) Handles LinkButton3.Click
        Response.Redirect("~/Homepage.aspx?catid=" + "3")
    End Sub

    Protected Sub LinkButton4_Click(sender As Object, e As EventArgs) Handles LinkButton4.Click
        Response.Redirect("~/Homepage.aspx?catid=" + "0")
    End Sub

    Protected Sub DataListguest_ItemCommand(source As Object, e As DataListCommandEventArgs) Handles DataListguest.ItemCommand
        If e.CommandName = "guestaddtocart" Then
            Response.Redirect("~/Loginpage.aspx")
        End If
    End Sub
End Class