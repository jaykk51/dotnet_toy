<%@ Page Title="IdiomQuiz" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="IdiomQuiz.aspx.cs" Inherits="WordNote.idiom.IdiomQuiz" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <h3><b>사자성어 퀴즈</b><br />
        텍스트박스에 사자성어를 입력하고 제출버튼을 클릭하세요  </h3>
       <p style="font-size: 15px; color: #808080"> 체크박스를 체크하면 힌트가 출력됩니다. </p>
       <p style="font-size: 15px; color: #808080"> 정답을 맞히면 다음문제를 볼 수 있습니다. </p>

    <hr style="height: -40px" />
    
  <div>
      <h4>Q.&nbsp;&nbsp;<asp:Label ID="lblidiomeng" runat="server" ></asp:Label></h4>
      <asp:CheckBox ID="checkhint" runat="server" OnCheckedChanged="checkhint_CheckedChanged" AutoPostBack="True" />&nbsp;
      Hint.&nbsp;<asp:Label ID="lblhint" runat="server" ForeColor="#999999"></asp:Label>
          
      <h4>A.&nbsp;&nbsp;<asp:TextBox ID="txtidiomkor" runat="server"></asp:TextBox></h4>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtidiomkor" runat="server" ErrorMessage="빈칸을 입력해주세요" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
     
      <br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Button ID="btnSubmit" runat="server" Text="제출"  OnClick="btnSubmit_Click"/>&nbsp;&nbsp;
      <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Visible="False">다음 문제</asp:LinkButton>

  </div>
</asp:Content>
