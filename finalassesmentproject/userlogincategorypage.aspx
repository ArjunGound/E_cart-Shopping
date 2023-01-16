<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="userlogincategorypage.aspx.vb" Inherits="finalassesmentproject.userlogincategorypage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <style type="text/css">
        .auto-style1 {
             width: 634px;
         }
        .auto-style2 {
            width: 818px;
        }
         .auto-style3 {
             width: 494px;
             text-align: center;
         }
         .auto-style4 {
             width: 475px;
             text-align: center;
         }
         .auto-style5 {
             width: 350px;
             text-align: center;
         }
         .auto-style6 {
             width: 421px;
             text-align: center;
         }
         .auto-style7 {
             width: 687px;
         }
          body{
            background-image:url("Logo Image/shoppingbackground.jpg");
            background-repeat:no-repeat;
            background-size:100% 100%;
            background-attachment:fixed;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="navigation">
        <table>
            <tr>
                <td style="text-align:center" class="auto-style2" colspan="2">
                    <asp:Image ID="Image1" runat="server" Height="100px" Width="100px" ImageUrl="~/Logo Image/userlogo.png" />
                </td>
            </tr>
            <tr>
                <td class="auto-style7" style="text-align:right">
 <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Welcome:"></asp:Label>
                </td>
                <td style="text-align:left" class="auto-style1">
                    <asp:Label ID="lblloginusername" runat="server" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                </td>
            </tr>  
            <tr>
                <td class="auto-style7" style="text-align: right">
                    <asp:Label ID="Label2" runat="server" Text="Your Cart Items are:" Font-Bold="True" Font-Size="Large" style="text-align: center"></asp:Label>
                &nbsp;</td>
                 <td class="auto-style1">
                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label>
                </td>
            </tr>       
        </table>  
    </div>
    <div id="buttondiv">
      <table style="height: 41px; width: 736px">
          <tr>
              <td class="auto-style6">
                  <asp:LinkButton ID="LinkButton1" runat="server" Text="MOBILES"></asp:LinkButton>
              </td>
              <td class="auto-style5">
                  <asp:LinkButton ID="LinkButton2" runat="server" Text="PERFUMES" style="text-align: center"></asp:LinkButton>
              </td>
              <td class="auto-style4">
<asp:LinkButton ID="LinkButton3" runat="server" Text="BAGS"></asp:LinkButton>
              </td>
              <td class="auto-style3">
                  <asp:LinkButton ID="LinkButton4" runat="server" Text="SHOW ALL CATEGORIES"></asp:LinkButton>
              </td>
          </tr>
      </table>
        <asp:Image ID="Image2" runat="server"  Height="200" Width="160" ImageUrl="~/Logo Image/iphone 13.jpg"/> 
         &nbsp;&nbsp; &nbsp; 
        <asp:Image ID="Image3" runat="server"  Height="200" Width="160" ImageUrl="~/Logo Image/impcat bell vita.jfif"/> 
    &nbsp;&nbsp;&nbsp; 
        <asp:Image ID="Image4" runat="server"  Height="200" Width="160" ImageUrl="~/Logo Image/bag image.jfif"/>
        &nbsp;&nbsp;&nbsp;        
        <br />
        <br />

        <asp:LinkButton ID="LinkButton5" runat="server" Text="Logout"></asp:LinkButton>
    </div>
        
    </form>
</body>
</html>
