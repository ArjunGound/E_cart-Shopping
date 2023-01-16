<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Loginpage.aspx.vb" Inherits="finalassesmentproject.Loginpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        #logintable{
            border:solid;
            border-color:black;
            margin-left:auto;
            margin-right:auto;
           
        }
    </style>
</head>
<body style="background-color:beige">
    <form id="form1" runat="server">
    <div>
        <table id="logintable">
            <tr>
                <td>
                    <b>User Name: </b>
                </td>
                 <td>
                     <asp:TextBox ID="txtusername" runat="server" Height="25px" Width="240px"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="lblusernamecheck" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                 <td>
                    <b>Password: </b>
                </td>
                 <td>
                     <asp:TextBox ID="txtuserpassword" runat="server" Height="25px" Width="240px" TextMode="Password"></asp:TextBox>
                </td>
                <td>
                  <asp:Label ID="lblpasswordcheck" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3" style="text-align:center">
                    <asp:ImageButton ID="loginbutton" runat="server" Height="62px"  Width="178px" ImageUrl="~/Logo Image/new loginbutton.jfif"/>
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <asp:Label ID="lblvalidation" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
