<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!(Session["Login"] == "user" || Session["Login"] == "admin"))
        {
            Response.Redirect("subOnly.aspx");
        }
    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<h1 class="sendTitle">שלח תאוריה</h1>

<div class="signUpSquare"> 


<h1 class="sendPutcadagory">הכנס קטגוריה</h1>
    
    
<select id="sel" class="sendSelect" dir="rtl" >
<option value="1">קטגוריה</option>
<option value="2">חלל</option>
<option value="3">פופולארי ביותר</option>
<option value="4">היסטוריה</option>
<option value="5">דת</option>
<option value="6">פוליטיקה</option>
</select>


<h1 class="sendExplain">הסבר את התאוריה שלך</h1> 

    <form action="" method="post">

<textarea class="sendTextarea"rows="20" cols="10" dir="rtl" name="feedback" style="outline: none;"> </textarea>\

<input type="button" class="sendbutton" value="שלח" size="50" id="submit2" name="submit2" />


</form>

</div>

</asp:Content>

