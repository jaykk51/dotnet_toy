<%@ Page Title="Translator" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="translator.aspx.cs" Inherits="WordNote.translator" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <h3>번역할 내용을 입력한 후 검색 버튼을 클릭하세요. <br /></h3>
    <p style="font-size: 15px; color: #808080"> 생성된 하이퍼링크를 클릭하면 파파고 변역기 번역 결과로 연결됩니다. </p>
    <hr style="height: -40px" />


    <asp:TextBox ID="txtin" runat="server"></asp:TextBox><br /><br />
        <asp:Button ID="btnExec1" class="btn btn-outline-dark btn-sm" runat="server" Text="검색"    OnClick="btnExec1_Click1" />


    
      <br />


</asp:Content>