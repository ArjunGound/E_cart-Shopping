Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports System.IO
Public Class Adminpage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Session("adminName") = Nothing Then
                MultiViewadmin.ActiveViewIndex = 0
            Else
                MultiViewadmin.ActiveViewIndex = 1
            End If

        End If
        BindGrid()

    End Sub
    Public Sub BindGrid()
        Dim cs As String = ConfigurationManager.ConnectionStrings("DBCS").ConnectionString
        Using con As SqlConnection = New SqlConnection(cs)
            Dim da As SqlDataAdapter = New SqlDataAdapter("sp_adminsorting", con)
            da.SelectCommand.CommandType = CommandType.StoredProcedure
            da.SelectCommand.Parameters.AddWithValue("@sorting_id", ddladminsorting.SelectedValue)
            Dim ds As DataSet = New DataSet()
            da.Fill(ds, "product_detials")
            gvadmin.DataSource = ds
            gvadmin.DataBind()

        End Using
    End Sub

    Public Sub adminloginbutton_Click(sender As Object, e As EventArgs) Handles adminloginbutton.Click
        If String.IsNullOrWhiteSpace(txtadminname.Text) And String.IsNullOrWhiteSpace(txtadminpassword.Text) Then

            lbladminname.Text = "*"
            lbladminpass.Text = "*"

        Else
        End If

        If (txtadminname.Text = "arjun" And txtadminpassword.Text = "arjun123") Then
            Session("adminName") = txtadminname.Text
            MultiViewadmin.ActiveViewIndex = 1


        Else

            lbladmin.ForeColor = System.Drawing.Color.Red
            lbladmin.Text = "Invalid Login credential!"

        End If


    End Sub

    Protected Sub AddNewProductbutton_Click(sender As Object, e As EventArgs) Handles AddNewProductbutton.Click
        MultiViewadmin.ActiveViewIndex = 2
    End Sub

    Protected Sub Backbutton_Click(sender As Object, e As EventArgs) Handles Backbutton.Click
        MultiViewadmin.ActiveViewIndex = 1
        lbladdproduct.Text = ""
        txtproductname.Text = ""
        txtproductprice.Text = ""
        ddladdproduct.SelectedIndex = -1

    End Sub

    Protected Sub gvadmin_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles gvadmin.RowDeleting
        Dim productId As Integer = Convert.ToInt32(gvadmin.DataKeys(e.RowIndex).Values(0))
        Dim constr As String = ConfigurationManager.ConnectionStrings("DBCS").ConnectionString
        Using con As SqlConnection = New SqlConnection(constr)
            Using cmd As SqlCommand = New SqlCommand("sp_delete", con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@id", productId)
                con.Open()
                cmd.ExecuteNonQuery()
                con.Close()
            End Using
        End Using
        BindGrid()
    End Sub

    Protected Sub onrowdatabound(sender As Object, e As GridViewRowEventArgs) Handles gvadmin.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow And e.Row.RowIndex <> gvadmin.EditIndex Then
            CType(e.Row.Cells(0).Controls(0), LinkButton).Attributes("onclick") = "return confirm('Do you want to delete this row?')"
        End If
    End Sub

    Protected Sub logoutbutton_Click(sender As Object, e As EventArgs) Handles logoutbutton.Click
        Session.Abandon()
        Response.Redirect("~/Homepage.aspx")
    End Sub

    Protected Sub insertbutton_Click(sender As Object, e As EventArgs) Handles insertbutton.Click
        'Dim filename As String = FileUpload1.PostedFile.FileName
        'Dim filepath As String = ""
        If FileUpload1.HasFile Then
            'filepath = "~/productimage/" + filename
            Dim fileExtension As String = System.IO.Path.GetExtension(FileUpload1.FileName)
            If fileExtension.ToLower() <> ".png" And fileExtension.ToLower() <> ".jpg" And fileExtension.ToLower() <> ".jfif" Then
                lblimage.ForeColor = System.Drawing.Color.Red
                lblimage.Text = "Only Images with .png or .jpg or .jfif are allowed"
            Else
                Dim length As Integer = FileUpload1.PostedFile.ContentLength
                If length > 2097152 Then
                    lblimage.ForeColor = System.Drawing.Color.Red
                    lblimage.Text = "Images Sizes cannot be greater than 2MB"
                Else
                    FileUpload1.SaveAs(Server.MapPath("~/productimage" + FileUpload1.FileName))
                    lblimage.ForeColor = System.Drawing.Color.Green
                    lblimage.Text = "Images uploaded successfull"
                    insertnewproductindb()
                End If
            End If
        Else
            lblimage.ForeColor = System.Drawing.Color.Red
            lblimage.Text = "Please select an Image"
        End If


    End Sub
    Public Sub insertnewproductindb()
        Dim cs As String = ConfigurationManager.ConnectionStrings("DBCS").ConnectionString
        Using con As SqlConnection = New SqlConnection(cs)
            Dim cmd As SqlCommand = New SqlCommand("sp_insertproduct", con)
            cmd.CommandType = CommandType.StoredProcedure
            con.Open()
            If String.IsNullOrWhiteSpace(txtproductname.Text) Or String.IsNullOrWhiteSpace(txtproductprice.Text) Or Convert.ToInt16(ddladdproduct.SelectedValue) = 0 Then
                lbladdproduct.ForeColor = System.Drawing.Color.Red
                lbladdproduct.Text = "Please Enter valid product"
            Else
                cmd.Parameters.AddWithValue("@productname", txtproductname.Text)
                cmd.Parameters.AddWithValue("@price", txtproductprice.Text)
                cmd.Parameters.AddWithValue("@cat_id", ddladdproduct.SelectedValue)
                cmd.Parameters.AddWithValue("@productimage", "~/productimage" + FileUpload1.FileName)
                cmd.ExecuteNonQuery()
                lbladdproduct.ForeColor = System.Drawing.Color.Green
                lbladdproduct.Text = "product is added"
                con.Close()
            End If
        End Using
    End Sub

    Protected Sub adminlogoutbutton_Click(sender As Object, e As EventArgs) Handles adminlogoutbutton.Click
        Response.Redirect("~/Homepage.aspx")
    End Sub

    Protected Sub gvadmin_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gvadmin.SelectedIndexChanged
        Dim row As GridViewRow = gvadmin.SelectedRow
        txtpriceupdate.Text = row.Cells(4).Text
        txtproductidinvisible.Text = row.Cells(2).Text
        txtproductnameupdate.Text = row.Cells(3).Text
    End Sub
    Protected Sub priceupdatebutton_Click(sender As Object, e As EventArgs) Handles priceupdatebutton.Click
        Dim cs As String = ConfigurationManager.ConnectionStrings("DBCS").ConnectionString
        Dim con As SqlConnection = New SqlConnection(cs)
        Dim updatecommand As String = "update product_detials set product_name=@newproductname, product_price=@newprice where product_id=@selectedproductid"
        Try
            Dim cmd As SqlCommand = New SqlCommand(updatecommand, con)
            con.Open()
            cmd.Parameters.AddWithValue("@newprice", txtpriceupdate.Text)
            cmd.Parameters.AddWithValue("@selectedproductid", txtproductidinvisible.Text)
            cmd.Parameters.AddWithValue("@newproductname", txtproductnameupdate.Text)
            cmd.ExecuteNonQuery()
            con.Close()
            BindGrid()
        Catch ex As SqlException
            Response.Write("DO NOT CLICK UPDATE BUTTON WITH EMPTY FIELD")
        Catch ex As Exception
            Response.Write("Something Went Wrong Please try again later")        
        End Try
        txtproductnameupdate.Text = ""
        txtpriceupdate.Text = ""
    End Sub
End Class