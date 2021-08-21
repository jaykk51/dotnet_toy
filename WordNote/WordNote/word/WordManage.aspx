<%@ Page Title="WordManage" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WordManage.aspx.cs" Inherits="WordNote.word.FrmView" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
  <h2><%: Title %></h2>
    <h3>내용을 작성하고 '수정' 버튼을 누르면 수정, <br />
        '삭제' 버튼을 누르면 단어가 삭제됩니다.<br /></h3>
    <hr style="height: -40px" />
 
        <div>
            <asp:GridView ID="GridView1" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" ShowHeader="False" UseAccessibleHeader="False"  Width="500px" >
                <FooterStyle BackColor="#CCCCCC"></FooterStyle>

                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White"></HeaderStyle>

                <PagerStyle HorizontalAlign="Left" BackColor="#CCCCCC" ForeColor="Black" VerticalAlign="Middle"></PagerStyle>

                <RowStyle BackColor="White" HorizontalAlign="Center" VerticalAlign="Middle"></RowStyle>

                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle"></SelectedRowStyle>

                <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>

                <SortedAscendingHeaderStyle BackColor="#808080"></SortedAscendingHeaderStyle>

                <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>

                <SortedDescendingHeaderStyle BackColor="#383838"></SortedDescendingHeaderStyle>
            </asp:GridView><br /><br />

            단어(영어) : <asp:TextBox ID="txteng" runat="server"></asp:TextBox><br />
            뜻(한국어) : <asp:TextBox ID="txtkor" runat="server"></asp:TextBox><br /><br />
            <asp:Button ID="btnUpdate" runat="server" Text="수정" OnClick="btnUpdate_Click"/>&nbsp;
            <asp:Button ID="btnDelete" runat="server" Text="삭제" OnClick="btnDelete_Click" />&nbsp;
            <asp:Button ID="btnCancel" runat="server" Text="취소" OnClick="btnCancel_Click" />
        </div>
 
</asp:Content>