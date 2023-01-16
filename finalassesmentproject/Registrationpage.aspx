<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Registrationpage.aspx.vb" Inherits="finalassesmentproject.Registrationpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #registrationtable{
            margin-left:250px;
            border:solid;
            border-color:black;
            height:auto;
        }
        #imagelogo{
            text-align:center;
            
        }
        #DropDownList1{
            text-align:center;
        }
        #mybody{
           background-color:cornsilk;
        }
        #ImageButton1{
            text-align:center;
        }
        .auto-style1 {
            width: 86px;
        }
    </style>
</head>
<body id="mybody">
    <form id="form1" runat="server">
    <div id="innerdiv">
    <table id="registrationtable">
        <tr>
            <td colspan="3" id="imagelogo">
                <asp:Image ID="userlogoimage" runat="server" Height="169px" ImageUrl="~/Logo Image/userlogonew.png" style="text-align: center" Width="177px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style1">First Name</td>
            <td>
                <asp:TextBox ID="txtfirstname" runat="server" Height="25px" Width="308px"></asp:TextBox>
            </td>
            <td> 
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="<Mandatory" Text="*" ForeColor="Red" ControlToValidate="txtfirstname" Display="Dynamic"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="auto-style1">Last Name</td>
            <td>
                <asp:TextBox ID="txtlastname" runat="server" Height="25px" Width="308px"></asp:TextBox>
            </td>
            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="<Mandatory" Text="*" ForeColor="Red" ControlToValidate="txtlastname" Display="Dynamic"></asp:RequiredFieldValidator> </td>
        </tr>
        <tr>
            <td class="auto-style1">Age</td>
            <td>
                <asp:TextBox ID="txtage" runat="server" Height="17px" Width="71px" TextMode="Number"></asp:TextBox>
            </td>
            <td>
                <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Age should be between 15 To 75" ForeColor="Red" ControlToValidate="txtage" Type="Integer" Display="Dynamic" MaximumValue="75" MinimumValue="15"></asp:RangeValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Age should be in number" Text="*" ForeColor="Red"  Display="Dynamic" ControlToValidate="txtage" ></asp:RequiredFieldValidator>
            </td>
        </tr>
         <tr>
            <td class="auto-style1">Gender</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" Height="25px" Width="122px" >
                    <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                    <asp:ListItem Text="Male" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Female" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Others" Value="3"></asp:ListItem>
                </asp:DropDownList>
            </td>
            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="<Mandatory" Text="*" ForeColor="Red" ControlToValidate="DropDownList1" Display="Dynamic"></asp:RequiredFieldValidator> </td>
        </tr>
        <tr>
            <td>
                Email ID
            </td>
            <td>
                <asp:TextBox ID="txtgmail" runat="server"  Height="25px" Width="308px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Inavlid Email" ControlToValidate="txtgmail" ForeColor="Red" Text="*" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="End With @gmail.com" Display="Dynamic" ForeColor="Red" ControlToValidate="txtgmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
         <tr>
            <td class="auto-style1">Username</td>
            <td>
                <asp:TextBox ID="txtusername" runat="server"  Height="25px" Width="308px"></asp:TextBox>
            </td>
            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="<Mandatory" Text="*" ForeColor="Red" ControlToValidate="txtusername" Display="Dynamic"></asp:RequiredFieldValidator> </td>
        </tr>
         <tr>
            <td class="auto-style1">Password</td>
            <td>
                <asp:TextBox ID="txtpassword" runat="server" Height="25px" Width="308px" TextMode="Password"></asp:TextBox>
            </td>
            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="<Mandatory" Text="*" ForeColor="Red" ControlToValidate="txtpassword" Display="Dynamic"></asp:RequiredFieldValidator> </td>
        </tr>
         <tr>
            <td class="auto-style1">Confirm Password</td>
            <td>
                <asp:TextBox ID="txtconfrimpassword" runat="server"  Height="25px" Width="308px" TextMode="Password"></asp:TextBox>
            </td>
            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Mandatory" Text="*" ForeColor="Red" ControlToValidate="txtconfrimpassword" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password not Matched" ForeColor="Red" ControlToCompare="txtpassword" ControlToValidate="txtconfrimpassword" Display="Dynamic" Type="Integer"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="ImageButton1" runat="server" Height="53px" Width="347px" ImageUrl="~/Logo Image/submit logo.png" />
            </td>
            
        </tr>
        <tr>
            <td colspan="3" style="text-align: center">
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>