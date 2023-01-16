Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient

Public Class userloginhomepage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Session("username") <> Nothing Then
                lblloginusername.Text = Session("username").ToString()
            End If
            If Request.QueryString("cat_id") <> Nothing Then
                loginuserdatalist.DataSourceID = Nothing
                loginuserdatalist.DataSource = SqlDataSource2
                loginuserdatalist.DataBind()
            End If
            If Request.QueryString("cat_id") = "0" Then
                loginuserdatalist.DataSourceID = Nothing
                loginuserdatalist.DataSource = SqlDataSource1
                loginuserdatalist.DataBind()
            End If
        End If      
    End Sub

    Protected Sub loginuserdatalist_ItemCommand(source As Object, e As DataListCommandEventArgs) Handles loginuserdatalist.ItemCommand
        Dim ddlquantity As DropDownList = CType(e.Item.FindControl("ddlqauntity"), DropDownList)
        If (e.CommandName = "addtocart") Then
            Response.Redirect("Addtocartpage.aspx?pid=" + e.CommandArgument.ToString() + "&ddlqauntity=" + ddlquantity.SelectedValue)

        End If
    End Sub

    Protected Sub linklogoutbutton_Click(sender As Object, e As EventArgs) Handles linklogoutbutton.Click
        Session.Abandon()
        Response.Redirect("~/Homepage.aspx")

    End Sub

    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
        Response.Redirect("~/userlogincategorypage.aspx")
    End Sub
End Class