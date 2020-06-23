<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">
    protected void  Page_Load(object sender, EventArgs e)
    {
        
        Session.Abandon();
        Response.Redirect("homepage.aspx");
        
    }
        
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

</asp:Content>