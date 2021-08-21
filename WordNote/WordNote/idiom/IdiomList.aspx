<%@ Page Title="IdiomList" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="IdiomList.aspx.cs" Inherits="WordNote.Contact" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <h3>사자성어 리스트입니다. <br />
        <br /></h3>
    <hr style="height: -40px" />
    
  <div>
      <asp:Table ID="Table1" runat="server">
          <asp:TableRow>
              <asp:TableCell>
                    <br />
              </asp:TableCell>
          </asp:TableRow>
          <asp:TableRow>
              <asp:TableCell><br /></asp:TableCell>
          </asp:TableRow>
        </asp:Table>
  
      <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" AllowPaging="True" CellPadding="4" ForeColor="#333333" Height="200px"  Width="750px" CellSpacing="2" GridLines="Both" HorizontalAlign="Center" >
          <EditItemTemplate>
              idiom_name:
              <asp:TextBox Text='<%# Bind("idiom_name") %>' runat="server" ID="idiom_nameTextBox" /><br />
              idiom_kor:
              <asp:TextBox Text='<%# Bind("idiom_kor") %>' runat="server" ID="idiom_korTextBox" /><br />
              idiom_eng:
              <asp:TextBox Text='<%# Bind("idiom_eng") %>' runat="server" ID="idiom_engTextBox" /><br />
              <asp:LinkButton runat="server" Text="업데이트" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="취소" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
          </EditItemTemplate>
          <EditRowStyle BackColor="#7C6F57" />
          <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
          <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
          <InsertItemTemplate>
              idiom_name:
              <asp:TextBox Text='<%# Bind("idiom_name") %>' runat="server" ID="idiom_nameTextBox" /><br />
              idiom_kor:
              <asp:TextBox Text='<%# Bind("idiom_kor") %>' runat="server" ID="idiom_korTextBox" /><br />
              idiom_eng:
              <asp:TextBox Text='<%# Bind("idiom_eng") %>' runat="server" ID="idiom_engTextBox" /><br />
              <asp:LinkButton runat="server" Text="삽입" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="취소" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
          </InsertItemTemplate>
          <ItemTemplate>
              <br />
              사자성어&nbsp;&nbsp; :&nbsp;
              <asp:Label Text='<%# Bind("idiom_name") %>' runat="server" ID="idiom_nameLabel" />
              <br />
              <br />
              풀이(Kor)&nbsp; :&nbsp;
              <asp:Label Text='<%# Bind("idiom_kor") %>' runat="server" ID="idiom_korLabel" />
              <br />
              <br />
              풀이(Eng) :&nbsp;
              <asp:Label Text='<%# Bind("idiom_eng") %>' runat="server" ID="idiom_engLabel" />
              <br />
              <br />

          </ItemTemplate>
          <PagerSettings Mode="NumericFirstLast" />
          <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Font-Italic="True" Font-Size="Large" Height="30px" Width="350px" Wrap="True" />
          <RowStyle BackColor="#E3EAEB" />
      </asp:FormView>


      <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Memorization_DBConnectionString %>' SelectCommand="SELECT [idiom_name], [idiom_kor], [idiom_eng] FROM [idiom_tbl]"></asp:SqlDataSource>
  </div>
</asp:Content>
