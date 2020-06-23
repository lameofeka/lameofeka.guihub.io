<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>
<%@ Import Namespace ="System.Data.SqlClient" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    
      <script runat="server">
          protected void Page_Load(object sender, EventArgs e)
          {
              if ((Session["Login"] == "user" || Session["Login"] == "admin"))
              {
                  Response.Redirect("theories.aspx");
              }


              
              string password = Request.Form["password3"];
              string userName = Request.Form["name3"];
              
              if (Request.Form["submit2"] != null)
              {
                  if (userName == "admin" && password == "admin")
                  {
                      Session["login"] = "admin";
                      Session["UserName"] = "admin";
                      Response.Redirect("homepage.aspx");   
                  }
                  else if (Login(userName, password))
                  {
                      Session["login"] = "user";
                      Session["UserName"] = userName;
                      Response.Redirect("homepage.aspx");
                  }
                  
                  
                      Response.Redirect("signUp.aspx");
                  

                  
              }
          
             

          }
          public static bool Login(string userName, string password)
          {
              bool exist = false;

              string conStr = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
              string cmdStr = string.Format("SELECT userName, password FROM Table1 WHERE (userName = N'{0}' AND  password = N'{1}')", userName, password);
              SqlConnection conObj = new SqlConnection(conStr);
              SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
              conObj.Open();
              SqlDataReader dr = cmdObj.ExecuteReader();
              if (dr.HasRows)
              {
                  exist = true;
              }
              conObj.Close();
              return exist;

          }
      </script>
   
    <script type="text/javascript">

        function checkForm() {
            var pass = checkPass();
            var user = checkUserName();
            return pass && user;
        }

        function checkUserName() {
            
            var lname = document.getElementById("loginUsernameFill").value;
            if (lname == "") {
                document.getElementById("logUsernameErr").innerHTML = " <span style='color:red;position:absolute;top:26px; width: 200px;'>הכנס שם</span>";
                return false;
            }

            else {
                lname = "";
                document.getElementById("logUsernameErr").innerHTML = "";
                return true;
            }
        }

        function checkPass() {
            var pass = document.getElementById("loginPasswordFill").value;
            if (pass == "") {
                document.getElementById("logPasErr").innerHTML = "<span style='color:red;position: absolute;top:30px; width: 200px;'> הכנס סיסמה </span>";
                return false;
            }
            else {
                pass = "";
                document.getElementById("logPasErr").innerHTML = "";
                return true;
            }
        }

        
    </script>



<h1 class="logInTitle">התחבר</h1>

<div class="signUpSquare"> 

<form action="" method="post" onsubmit="return checkForm()"> 
    
    
    <table border="0" dir="rtl" style="position:absolute; top:60px;left:320px;">
        <tr>
                 <td>
                 <h1 class="loginUsername">הכנס שם משתמש</h1>
                 </td>
                 <td id="logUsernameErr" style="text-align:right; position:relative; left:360px;"> </td>
        </tr>

        <tr>
                 <td>
                 <input type="text" class="loginUsernameFill" dir="rtl" size="70" id="loginUsernameFill" name="name3" maxlength="20" style="outline: none;"/>
                 </td>       
                 
        </tr>

        <tr>
                 <td>
                 <h1 class="loginEnterPassword">הכנס סיסמא</h1>
                 </td>       
                 <td id="logPasErr" style="text-align:right; position:relative; left:420px;"> </td>
        </tr>

        <tr>
                 <td>
                 <input type="password" class="loginPasswordFill"dir="rtl" size="70" id="loginPasswordFill" name="password3" maxlength="100" style="outline: none;" />
                 </td>      
        </tr>

        <tr><td>&nbsp</td></tr>
        <tr><td>&nbsp</td></tr>

        <tr>
                 <td>
                 <span class="dontHaveAccount" dir="rtl">אין לך משתמש?</span> <span class="dontHaveAccountPress"><a href="signUp.aspx"style="color:White;">הירשם</a></span>
                 </td>       
        </tr>

        <tr><td>&nbsp</td></tr>
        <tr><td>&nbsp</td></tr>


    </table>

                 <input type="submit" class="loginSubmit"value="התחבר" size="50" id="submit2" name="submit2" style="position:absolute;top:400px; left:800px; outline:0px;" />
                 <input type="reset" class="loginReset"value="נקה" size="50" id="reset2" name="reset2" style="position:absolute;top:400px; left:500px;outline:0px;"/>

</form>

</div>

</asp:Content>

