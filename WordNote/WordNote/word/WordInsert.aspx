<%@ Page Title="WordInsert" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WordInsert.aspx.cs" Inherits="WordNote.word.WordInsert" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
  <h2><%: Title %></h2>
    <h3>등록할 영단어와 뜻을 입력해주세요 <br />
        <br /></h3>
    <hr style="height: -40px" />
 
        <div>
            단어(영어) : <asp:TextBox ID="txteng" runat="server"></asp:TextBox><br />
            뜻(한국어) : <asp:TextBox ID="txtkor" runat="server"></asp:TextBox><br />
            <asp:Button ID="btnInsert" runat="server" Text="저장"  OnClick="btnInsert_Click"/>&nbsp;
            <asp:Button ID="btnCancel" runat="server" Text="취소"  OnClick="btnCancel_Click"/>

        </div>
 
</asp:Content>