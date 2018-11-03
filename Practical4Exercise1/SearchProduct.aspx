<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchProduct.aspx.cs" Inherits="Practical4Exercise1.SearchProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <p><b><u>Search Product Information Based On Category Name</u></b></p>
        <p>Select a category name: 
            <asp:DropDownList ID="ddlCategory" runat="server" DataSourceID="SqlDataSource2" DataTextField="CategoryName" DataValueField="CategoryName">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CategoryName] FROM [Categories]"></asp:SqlDataSource>
&nbsp;<asp:Button ID="btnFind" runat="server" Text="Find" />
        </p>
        <p>Your search return
            <asp:Label ID="lblResult" runat="server"></asp:Label>
&nbsp;record(s).</p>
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <hr /><br />Product Name: <%#DataBinder.Eval(Container.DataItem, "ProductName") %><br /><br />
                    Unit Price: <%#DataBinder.Eval(Container.DataItem, "UnitPrice") %><br /><br />
                
                </ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT ProductName, UnitPrice from Products p, Categories c WHERE c.CategoryID = p.CategoryID AND c.CategoryName = @CategoryName">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlCategory" DefaultValue="" Name="CategoryName" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
    </form>
</body>
</html>
