<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="PaginaPrincipal.aspx.vb" Inherits="Muni_Antigua.PaginaPrincipal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
<%--     <script src="Scripts/slider.js" type="text/javascript"></script>--%>
    <form id="form1" runat="server">
        <ext:ResourceManager ID="ResourceManager1" runat="server" />
        <ext:Viewport ID="Viewport1" runat="server" >
            <LayoutConfig>
                <ext:VBoxLayoutConfig Align="Center" Pack="Center" />
            </LayoutConfig>
            <Items>
                
            </Items>
        </ext:Viewport>
           
    <div class="slider">
        <asp:Image runat="server" ImageUrl="~/Images/municipalidadantigua.jpg" ID="Image1" ImageAlign="AbsMiddle" />   
        <asp:Image runat="server" ImageUrl="~/Images/muniantigua.jpg" ID="Image2" ImageAlign="AbsMiddle" /> 
    </div>
    </form>
</body>
</html>
