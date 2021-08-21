<%@ Page Language="C#" Title="Notice" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="notice.aspx.cs" Inherits="WordNote.notice" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
  <h2><%: Title %></h2>

    <div>
        <asp:TreeView ID="TreeView1" runat="server" DataSourceID="SiteMapDataSource1" ImageSet="Arrows">
            <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD"></HoverNodeStyle>

            <NodeStyle HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" Font-Names="Tahoma" Font-Size="10pt" ForeColor="Black"></NodeStyle>

            <ParentNodeStyle Font-Bold="False"></ParentNodeStyle>

            <SelectedNodeStyle HorizontalPadding="0px" VerticalPadding="0px" Font-Underline="True" ForeColor="#5555DD"></SelectedNodeStyle>
        </asp:TreeView>
        <asp:SiteMapDataSource runat="server" ID="SiteMapDataSource1"></asp:SiteMapDataSource>
    </div>


</asp:Content>