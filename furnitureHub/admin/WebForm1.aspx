<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="furnitureHub.admin.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="Upload" />
        <hr />
        <asp:Label ID="lblMessage" ForeColor="Green" runat="server" />
        <asp:Image ID="Image1" Height="500px" Width="500px" runat="server" />
        <asp:Button ID="qwer" text="making .bat file test" runat="server" OnClick="txt" />
    </div>
    </form>
</body>
</html>
