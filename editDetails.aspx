<%@ Page Title=""  Debug="true" Language="C#" MasterPageFile="~/MasterPage.master" %>
<%@ Import Namespace ="System.Data.SqlClient" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


      <script runat="server">
      
          protected void Page_Load(object sender, EventArgs e)
          {
              if (!(Session["Login"] == "user" || Session["Login"] == "admin"))
              {
                  Response.Redirect("AdminOnly.aspx");
              }
              
              string oldpass = Request.Form["editTas"];
              string newpass = Request.Form["newpass"];
              
              if (Request.Form["submit2"] != null)
              {
                  string cmdStr = string.Format("UPDATE Table1 SET password = N'{0}' WHERE (userName = N'{1}') ", newpass, Session["UserName"].ToString());
                  string conStr = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
                  SqlConnection conObj = new SqlConnection(conStr);
                  SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
                  conObj.Open();
                  cmdObj.ExecuteNonQuery();
                  conObj.Close();
              }
          }
          
      </script>
   
    <script type="text/javascript">

        function checkForm() {
            var pass = checkNewPass();
            var id = checkTaz();
            return pass && id;
        }
        
         function checkTaz() {
            var x = document.getElementById("editTas").value;
            if (x == "") {
                document.getElementById("editTASErr").innerHTML = "<span style='color:red; position:absolute; left:-100px; top:30px; width:200px;'> הכנס מספר תעודת זהות </span>";
                return false;
            }
        }

        function checkNewPass() {
            var pass = document.getElementById("newpass").value;
            var level = 0;
            if (pass == "") {
                document.getElementById("newPassErr").innerHTML = "<span style='color:red; position:absolute; right:60px; top:30px; width:200px;'> הכנס סיסמה </span>";
                return false;
            }
            
           if (pass == "abcd" || pass == "qwer" || pass == "123456") {
                level = 1;
                document.getElementById("newPassErr").innerHTML = " <span style='color:red; position:absolute; right:70px; top:30px; width:200px;'>סיסמה חלשה מדי </span>";
                return false;
            }
            else {
                var digit = 0;
                var chr = 0;
                var pass1 = pass.toLowerCase();
                for (var i = 0; i < pass.length; i++) {
                    if (pass1.charAt(i) >= "a" && pass1.charAt(i) <= "z") {
                        chr = 1;
                    }
                    if (pass1.charAt(i) >= "0" && pass1.charAt(i) <= "9") {
                        digit = 1;
                    }
                }
                if (digit == 1 && chr == 1 && pass.length >= 6) {
                    level = 3;
                    document.getElementById("newPassErr").innerHTML = "";
                    return true;
                }
                level = 2;
                document.getElementById("newPassErr").innerHTML = "<span style='color:red; position:absolute; right:70px; top:30px; width:200px;'> סיסמה בינונית, אנא חזק אותה </span> ";
                return false;
            }
        }  


    </script>



<h1 class="changePassTitle">שנה סיסמא</h1>

<div class="signUpSquare"> 

<form action="editDetails.aspx" method="post" onsubmit="return checkForm()"> 


    <table border="0" dir="rtl" style="position:absolute; top:60px;left:320px;">
        <tr>
                 <td>
                 <h1 class="loginUsername">הכנס סיסמא ישנה</h1>
                 </td>
                 <td id="editTASErr" style="text-align:right; position:relative; left:360px;"> </td>
        </tr>

        <tr>
                 <td>
                 <input type="password" class="loginUsernameFill" dir="rtl" size="70" id="editTas" name="editTas" maxlength="20" style="outline: none;"/>
                 </td>       
                 
        </tr>

        <tr>
                 <td>
                 <h1 class="loginEnterPassword">הכנס סיסמא חדשה</h1>
                 </td>       
                 <td id="newPassErr" style="text-align:right; position:relative; left:420px;"> </td>
        </tr>


        <tr>
                 <td>
                 <input type="password" class="loginPasswordFill"dir="rtl" size="70" id="newpass" name="newpass" maxlength="100" style="outline: none;" />
                 </td>      
        </tr>
        


    </table>

                 <input type="submit" class="loginSubmit"value="עדכן" size="50" id="submit2" name="submit2" style="position:absolute;top:320px; left:800px; outline:0px;" />
                 <input type="reset" class="loginReset"value="נקה" size="50" id="reset2" name="reset2" style="position:absolute;top:320px; left:500px;outline:0px;"/>

</form>

</div>

</asp:Content>

