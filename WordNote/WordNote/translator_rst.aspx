<%@ Page Title="Translator_rst" Language="C#"  MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="translator_rst.aspx.cs" Inherits="WordNote.translator_rst" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <h3>다시 검색하기를 눌러 다른 내용도 검색할 수 있습니다.<br /></h3>
    <p style="font-size: 15px; color: #808080"> 생성된 하이퍼링크를 클릭하면 파파고 번역기 번역결과로 연결됩니다. </p>
    <hr style="height: -40px" />
    <asp:HyperLink ID="HyperLink1"  Target="_blank" runat="server">HyperLink</asp:HyperLink><br />

      <br />
    <asp:Button ID="btnBack" runat="server" Text="다시 검색하기" class="btn btn-outline-dark btn-sm"  PostBackUrl="translator.aspx" />

</asp:Content>