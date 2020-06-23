<%@ Page Title=""  Language="C#" Debug="true"  MasterPageFile="~/MasterPage.master" %>
<%@ Import Namespace ="System.Data.SqlClient" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<script runat="server">
    string str = " ";
    int count = 0;
    string display = "none";
    static string GirlsN = "";
    static string BoysN = "";
    static string WantN = "";
    static string DoesntwantN = "";
    static string boysWords = "";
    static string girlsWords = "";
    static string wantWords = "";
    static string doesntwantWords = "";
    
    
    public static int wantDonoCount()
    {
        int count = 0;
        string conStr = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
        string cmdStr = string.Format("SELECT  email, firstName, userName, lastName, password, tas, birthday, sex, phone, address, donate FROM  Table1 WHERE (donate = N'yes')");
        SqlConnection conObj = new SqlConnection(conStr);
        SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
        conObj.Open();
        SqlDataReader dr = cmdObj.ExecuteReader();

        if (dr.HasRows)
        {
            while (dr.Read())
            {
                count++;
            }
        }
        conObj.Close();
        return count;
    }
    
    public static int BoysCount()
    {
        int count = 0;
        string conStr = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
        string cmdStr = string.Format("SELECT  email, firstName, userName, lastName, password, tas, birthday, sex, phone, address, donate FROM  Table1 WHERE (sex = N'male')");
        SqlConnection conObj = new SqlConnection(conStr);
        SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
        conObj.Open();
        SqlDataReader dr = cmdObj.ExecuteReader();

        if (dr.HasRows)
        {
            while (dr.Read())
            {
                count++;
            }
        }
        conObj.Close();
        return count;
    }

    public static int Users()
    {
        int count = 0;
        string conStr = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
        string cmdStr = string.Format("SELECT  email, firstName, userName, lastName, password, tas, birthday, sex, phone, address, donate FROM  Table1 ");
        SqlConnection conObj = new SqlConnection(conStr);
        SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
        conObj.Open();
        SqlDataReader dr = cmdObj.ExecuteReader();

        if (dr.HasRows)
        {
            while (dr.Read())
            {
                count++;
            }
        }
        conObj.Close();
        return count;
    }
    
    
        protected void Page_Load(object sender, EventArgs e)
        {
        // protect the page
            if (!(Session["Login"] == "admin"))
            {
                Response.Redirect("AdminOnly.aspx");
            }
        //          
            
            string requestUser= Request.Form["deleteUserfill"];
            string sex = Request.Form["bySex"];
            string donate = Request.Form["byDonate"] ;

          
            string ByUser = Request.Form["adminEditByName"];
            string newpass2 = Request.Form["adminEditNewPass"];
            
            // admin change pass
            if (!(Request.Form["editPassByUserbtn"] == null))
            {
                string cmdStr = string.Format("UPDATE Table1 SET password = N'{0}' WHERE (userName = N'{1}') ", newpass2, ByUser);
                string conStr = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
                SqlConnection conObj = new SqlConnection(conStr);
                SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
                conObj.Open();
                cmdObj.ExecuteNonQuery();
                conObj.Close();
            }
            
            //filter
            string cmdStrA;
            if (Request.Form["showUsers"] != null)
            {
                wantWords = "";
                doesntwantWords = "";
                girlsWords = "";
                boysWords = "";
                WantN = "";
                DoesntwantN = "";
                GirlsN = "";
                BoysN = "";
                if (sex != "all" && donate != "all")
                    cmdStrA = string.Format("SELECT email, firstName, lastName, userName, password, tas, birthday, sex, phone, address, donate FROM Table1 WHERE (sex = N'{0}') AND (donate = N'{1}')", sex, donate);

                else if (sex == "all" && donate != "all")
                    cmdStrA = string.Format("SELECT email, firstName, lastName, userName, password, tas, birthday, sex, phone, address, donate FROM Table1  WHERE (donate = N'{0}')", donate);

                else if (sex != "all" && donate == "all")
                    cmdStrA = string.Format("SELECT email, firstName, lastName, userName, password, tas, birthday, sex, phone, address, donate FROM Table1  WHERE (sex = N'{0}')", sex);     
               
                else
                   cmdStrA =  string.Format("SELECT email, firstName, lastName, userName, password, tas, birthday, sex, phone, address, donate FROM Table1");
                
                 
                                
                display = "inline-block";
                str = "<table border='5' class='userTable'><tr><td>אמייל</td><td>שם פרטי</td><td>שם משפחה</td><td>שם משתמש</td><td>סיסמא</td><td>ת.ז</td><td>תאריך לידה</td><td>מין</td><td>טלפון</td><td>כתובת</td><td>תורם</td></tr>";
                string conStr = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True"; 
                SqlConnection conObj = new SqlConnection(conStr);
                SqlCommand cmdObj = new SqlCommand(cmdStrA, conObj);
                conObj.Open();
                SqlDataReader dr = cmdObj.ExecuteReader();
                
                
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        str += "<tr> <td>" + dr["email"] + "</td> <td>" + dr["firstName"] + "</td> <td>" + dr["lastName"] + "</td> <td>" + dr["userName"] + "</td> <td>" + dr["password"] + "</td> <td>" + dr["tas"] + "</td> <td>" + dr["birthday"] + "</td> <td>" + dr["sex"] + "</td> <td>" + dr["phone"] + "</td> <td>" + dr["address"] + "</td> <td>" + dr["donate"] + "</td> </tr>";
                        count++;
                    }str+="</table>";
                }

                else
                {
                    str = "<h1 class='noOne'>אין משתמשים</h1>";
                }
                conObj.Close();
            }

            //
                
                //deletUser
            else if (Request.Form["deleteUserbtn"] != null)
            {
                string cmdStr = string.Format("DELETE FROM Table1 WHERE userName = N'{0}'", requestUser);
                string conStr = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
                SqlConnection conObj = new SqlConnection(conStr);
                SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
                conObj.Open();
                cmdObj.ExecuteNonQuery();
                conObj.Close();
            }

            if (Request.Form["showStatsBtn"] != null)
            {

                double BoysNum = (double)(BoysCount()) / Users() * 100;
                BoysNum = Math.Round(BoysNum);
                BoysN = "" + BoysNum + "%";
                double GirlsNum = 100 - BoysNum;
                GirlsNum = Math.Round(GirlsNum);
                GirlsN = "" + GirlsNum + "%";

                double WantNum = (double)(wantDonoCount()) / Users() * 100;
                WantNum = Math.Round(WantNum);
                WantN = "" + WantNum + "%";
                double DoesnotwantNum = 100 - WantNum;
                DoesnotwantNum = Math.Round(DoesnotwantNum);
                DoesntwantN = "" + DoesnotwantNum + "%";

                boysWords = "בנים:";
                girlsWords = "בנות:";

                wantWords = "רוצה לתרום:";
                doesntwantWords = "לא רוצה לתרום:";
                 
            }
        }
        
        
        
        
    </script>


     <h1 class="usersTitle">  טבלת משתמשים  </h1>

    <form action="Users.aspx" method="post">
    

    <input type="submit" name="showUsers" class="showUsersBtn" value="הצג משתמשים"/>

    <input type="submit" name="showStatsBtn" class="showStatsBtn" value="הצג סטטיסטיקה"/>

    <input type="submit" name="editPassByUserbtn" class="editPassByUserbtn" value="שנה סיסמא"/>

    
    <input type="text" name="adminEditByName" placeholder="הכנס שם משתמש" class="AdminEditNameFill" />
    <input type="password" name="adminEditNewPass" placeholder="הכנס סיסמא חדשה" class="AdminEditPassFill" /> 
    
    <h1 class="bysexWords"> בחר לפי מין:</h1>
    <select name="bySex" class="bySexChoose">
        <option value="all">הכל</option>
        <option value="male">זכר</option>
        <option value="female">נקבה</option>
    </select>

    <h1 class="byDonateWords"> בחר לפי תורם:</h1>
    <select name="byDonate" class="byDonateChoose">
        <option value="all">הכל</option>
        <option value="yes">רוצה לתרום</option>
        <option value="no">לא רוצה לתרום</option>
        
    </select>

   </form>

    <div class="usersSqure"> 

<%=str %>

    </div>
    <h1 class="usersCount" style="display:<%=display%>">מונה כניסות: <%=count %></h1>

    <h1 class='boys'> <%=boysWords %> </h1>
    <h1 class="perboys"> <%=BoysN %> </h1>
                
    <h1 class='gils'> <%=girlsWords %> </h1>
    <h1 class="pergils"> <%=GirlsN%> </h1>

    
    
    <h1 class="want"> <%=wantWords %> </h1>
    <h1 class="perwant"> <%=WantN %> </h1>

    <h1 class="doesntwant"> <%=doesntwantWords %> </h1>
    <h1 class="perdoesntwant"> <%=DoesntwantN%> </h1>


    <form action="Users.aspx" method="post">
    <input type="submit" name="deleteUserbtn" class="deleteUserbtn" value="מחק משתמש"/>
    <input type="text" name="deleteUserfill" placeholder="הכנס שם משתמש" class="deleteUserfill" />
     </form>

    
   
</asp:Content>