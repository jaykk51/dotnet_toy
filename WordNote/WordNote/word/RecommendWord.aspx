<%@ Page Title="RecommendWord" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RecommendWord.aspx.cs" Inherits="WordNote.word.RecommendWord" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <h2><%: Title %></h2>
    <h3>word.xlsx<br />
       추천하는 영단어 리스트 A to Z </h3>
    <p style="font-size: 15px; color: #808080"> 메인페이지에서 다운로드가 가능합니다. </p>
    <hr style="height: -40px" />

   <br />

    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

</asp:Content>