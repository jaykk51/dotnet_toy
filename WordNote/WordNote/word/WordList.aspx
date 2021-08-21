<%@ Page Title="WordList" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WordList.aspx.cs" Inherits="WordNote.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <h3>등록한 단어 리스트입니다. <br />
        [No.]를 클릭하여 단어의 수정, 삭제가 가능합니다.</h3>
    <hr style="height: -40px" />
    
  <div>
      <asp:Table ID="Table1" runat="server">
          <asp:TableRow>
              <asp:TableCell>
                    <asp:Button ID="btnWrite" runat="server" Text="단어등록" OnClick="btnWrite_Click"/>&nbsp;&nbsp;
                    
              </asp:TableCell>
          </asp:TableRow>
          <asp:TableRow>
              <asp:TableCell><br /></asp:TableCell>
          </asp:TableRow>
          <asp:TableRow>
              <asp:TableCell>
                 
      
              </asp:TableCell>
          </asp:TableRow>
      </asp:Table>

       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="word_no" DataSourceID="SqlDataSource1" ForeColor="Black" AllowPaging="True"  Width="500px" UseAccessibleHeader="False"   >
        <Columns>
             <asp:TemplateField HeaderText="No.">
                  <ItemTemplate>
                     <a href="<%# "WordManage.aspx?No="+Eval("word_no")%>"> <%# Eval("word_no")%> </a>
                     </ItemTemplate>
                  <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                  <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                  </asp:TemplateField>

            <asp:BoundField DataField="eng" SortExpression="eng" HeaderText="단어" >
             <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
             <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="kor"  SortExpression="kor" HeaderText="뜻" >
             <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
             <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>

        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Center" Font-Italic="True" Font-Size="Large" VerticalAlign="Middle" />
        <RowStyle BackColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Memorization_DBConnectionString %>" SelectCommand="SELECT [word_no], [eng], [kor] FROM [word_tbl]"></asp:SqlDataSource>
    
 
    
  </div>
</asp:Content>
