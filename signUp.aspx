<%@ Page Title="" Language="C#" Debug="true" MasterPageFile="~/MasterPage.master" %>
<%@ Import Namespace ="System.Data.SqlClient" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script runat="server">
        static string msg = "";
        
        public static bool ThereIsUserName(string userName)
        {
           
            string conStr = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
            string cmdStr = string.Format("SELECT userName FROM Table1 WHERE (userName = N'{0}')", userName);
            SqlConnection conObj = new SqlConnection(conStr);
            SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
            conObj.Open();
            SqlDataReader read = cmdObj.ExecuteReader();
            if (read.HasRows)
                return false;

            conObj.Close();
            return true;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
    
        if ((Session["Login"] == "user" || Session["Login"] == "admin"))
        {
            Response.Redirect("theories.aspx");
        }
    
            
            if (Request.Form["submit2"] != null)
            {
                msg = "";
                string email = Request.Form["emailFill"];
                string firstName = Request.Form["FnameFill"];
                string userName = Request.Form["name"];
                string lastName = Request.Form["LnameFill"];
                string password = Request.Form["password1"];
                string tas = Request.Form["tazfill"];
                string consirmPassword = Request.Form["confirmPassword"];
                string intrestionCatagory = Request.Form["intresting"];
                string birthday = Request.Form["date"];
                string sex = Request.Form["sex"];
                string phone = Request.Form["phoneFill"];
                string address = Request.Form["street"];
                string donate = Request.Form["yeda"];
                string whichTheory = Request.Form["theo"];
                string conStr = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True";
                string cmdStr = string.Format("INSERT INTO Table1(email, firstName, userName, lastName, password, tas, consirmPassword, intrestionCatagory, birthday, sex, phone, address, donate, whichTheory) VALUES        (N'{0}', N'{1}', N'{2}', N'{3}', N'{4}', N'{5}', N'{6}', N'{7}', N'{8}', N'{9}', N'{10}', N'{11}', N'{12}', N'{13}')", email, firstName, userName, lastName, password, tas, consirmPassword, intrestionCatagory, birthday, sex, phone, address, donate, whichTheory);
                if (ThereIsUserName(userName))
                {
                    SqlConnection conObj = new SqlConnection(conStr);
                    SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
                    conObj.Open();
                    cmdObj.ExecuteNonQuery();
                    conObj.Close();
                }
                else
                {
                    msg = "<span style='color:red; position:absolute; width:100px;'> שם המשתמש קיים במערכת </span>";
                }
             }
            
        }
        
    </script>

    <script type="text/javascript">

        function checkForm() {

            var mail = checkEmail();
            var userName = checkUserName();
            var pass = checkPass();
            var confirm = checkConfirmPass();
            var date = checkDate();
            var phone = checkPhone();
            var fName = checkFirstName();
            var lName = checkLastName();
            var id = checkTaz();
            var address = checkAdress();
            var sex = checkSex();
            var cat = checkBest();
            var bel = checkBelive();
            var yed = checkYeda();


            if (!(fName && lName && mail && pass && userName && confirm && date && phone && id && address && sex && cat && bel && yed!=true)) {
                return fName && lName && mail && pass && userName && confirm && date && phone && id && address && sex && cat && bel && yed;
            }
            else {
                window.scrollTo(0, 5);
            }
                  
             
              
                
            

        }

       

        function checkBelive() {
            var bel = document.getElementsByName("theo");
            if (bel[0].checked == false && bel[1].checked == false && bel[2].checked == false && bel[3].checked == false) {
                document.getElementById("errBelive").innerHTML = "<span style='color:red; position:absolute; width:200px;'> בחר אפשרות </span>";
                return false;
            }
            document.getElementById("errBelive").innerHTML = "";
            return true;
        } 

        function checkPhone() {
            var flag = 0;
            var good = 0;
            var text = document.getElementById("phoneFill").value;
            if (text.charAt(0) == "0" && text.charAt(1) != "1") {
                for (var i = 0; i < text.length; i++) {
                    if (text.charAt(i) >= "0" && text.charAt(i) <= "9" && (text.charAt(3) == "-") || text.charAt(2) == "-") {
                        if (text.charAt(1) == 5 && text.length == 11 && text.charAt(4) != 0) {
                            flag = 1;
                        }
                        else {
                            if (text.length == 10 && text.charAt(3) != 0 && text.charAt(2) == "-") {
                                flag = 1;

                            }
                        }
                    }
                }
            }
            if (text == "") {
                document.getElementById("errPhone").innerHTML = "<span style='color:red; position:absolute; width:200px;'> הכנס מספר טלפון </span>";
                return false;
            }
            else {
                if (flag == 1) {
                    document.getElementById("errPhone").innerHTML = "";
                    return true;
                }
                else {
                    document.getElementById("errPhone").innerHTML = "<span style='color:red; position:absolute; width:100px;'> המספר אינו תקין </span>";
                    return false;
                }
            }
        }  

        function checkEmail() {
            var e = document.getElementById("emailFill").value;
            var dot2 = e.lastIndexOf(".");
            var dot1 = e.indexOf(".");
            var shtrud1 = e.indexOf("@");
            var shtrud2 = e.lastIndexOf("@");
            if (e == "") {
                document.getElementById("errMaill").innerHTML = "<span style='color:red; position:absolute; width:200px;'> הכנס אימייל </span>";
                return false;
            }
            else {
                if (dot1 != dot2) {
                    document.getElementById("errMaill").innerHTML = "<span style='color:red; position:absolute; width:200px;'> אימייל לא תקין </span>";
                    return false;
                }
                if (shtrud1 != shtrud2) {
                    document.getElementById("errMaill").innerHTML = "<span style='color:red; position:absolute; width:200px;'> אימייל לא תקין </span>";
                    return false;
                }
                if (dot1 - shtrud1 - 1 < 2) {
                    document.getElementById("errMaill").innerHTML = " <span style='color:red; position:absolute; width:200px;'>אימייל לא תקין </span>";
                    return false;
                }
                if (e.length - dot2 < 2) {
                    document.getElementById("errMaill").innerHTML = " <span style='color:red; position:absolute; width:200px;'>אימייל לא תקין </span>";
                    return false;
                }
                if (shtrud1 < 2) {
                    document.getElementById("errMaill").innerHTML = "<span style='color:red; position:absolute; width:200px;'> אימייל לא תקין </span>";
                    return false;
                }
            }
            document.getElementById("errMaill").innerHTML = "";
            return true;
        }


        function checkYeda() {
            var yeda = document.getElementsByName("yeda");
            var bool = false;
            for (var i = 0; i < yeda.length; i++) {
                if (yeda[i].checked == true) {
                    bool = true;
                }
            }
            if (bool == false) {
                document.getElementById("errYeda").innerHTML = "<span style='color:red; position:absolute; width:200px;'> סמן תשובה </span>";
                return false;
            }
            document.getElementById("errYeda").innerHTML = "";
            return true;
        }  
 
        function checkUserName() {
            var name = document.getElementById("userNameFill").value;
            if (name == "") {
                document.getElementById("errUsername").innerHTML = " <span style='color:red; position:absolute; width:200px;'>הכנס שם</span>";
                return false;
            }
            if (name.length < 8) {
                document.getElementById("errUsername").innerHTML = " <span style='color:red; position:absolute; width:100px;'>הכנס שם משתמש באורך 8 או מעלה </span>";
                return false;
            }
            var pass = document.getElementById("passFill").value;
            if (name == pass) {
                document.getElementById("errUsername").innerHTML = " <span style='color:red; position:absolute; width:100px;'>שם המשתמש זהה לסיסמה, שנה אותו  </span> ";
                return false;
            }
            else {
                document.getElementById("errUsername").innerHTML = "";
                return true;
            }
        } 

     
        function checkPass() {
            var username = document.getElementById("userNameFill").value;
            var pass = document.getElementById("passFill").value;
            var level = 0;
            if (pass == "") {
                document.getElementById("errPas").innerHTML = "<span style='color:red; position:absolute; width:200px;'> הכנס סיסמה </span>";
                return false;
            }
            if (pass == "abcd" || pass == "qwer" || pass == "123456" || username == pass) {
                level = 1;
                document.getElementById("errPas").innerHTML = " <span style='color:red; position:absolute; width:200px;'>סיסמה חלשה מדי </span>";
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
                    document.getElementById("errPas").innerHTML = "";
                    return true;
                }
                level = 2;
                document.getElementById("errPas").innerHTML = "<span style='color:red; position:absolute; width:200px;'> סיסמה בינונית, אנא חזק אותה </span> ";
                return false;
            }
        }  

     
        function checkConfirmPass() {
            var pass = document.getElementById("passFill").value;
            var imut = document.getElementById("confirmPassFill").value;
            if (imut == "") {
                document.getElementById("errConfirmPass").innerHTML = "<span style='color:red; position:absolute; width:200px;'>   הכנס אימות סיסמה </span>";
                return false;
            }
            else {
                if (pass != imut) {
                    document.getElementById("errConfirmPass").innerHTML = "<span style='color:red; position:absolute; width:200px;'> הסיסמאות לא תואמות </span>";
                    return false;
                }
                document.getElementById("errConfirmPass").innerHTML = "";
                return true;
            }
        }


    
        function checkFirstName() {
            check = true;
            var fName = document.getElementById("FnameFill").value;
            if (fName == "") {
                document.getElementById("errFirstName").innerHTML = "<span style='color:red; position:absolute; width:200px;' >  הכנס שם פרטי </span>";
                return false;
            }
            if (fName.length == 1) {
                document.getElementById("errFirstName").innerHTML = "<span style='color:red; position:absolute; width:200px;'> שם פרטי קצר מידי </span>";
                return false;
            }
            var bad = "!@#$%^&*()?_-+=<>/\{}[].',;:0123456789";
            var i = 0, ch = "";
            while (i < bad.length) {
                ch = fName.indexOf(bad.charAt(i));
                if (ch != -1) {
                    document.getElementById("errFirstName").innerHTML = "<span style='color:red; position:absolute; width:200px;'> שם פרטי חייב להכיל אותיות בלבד </span>";
                    return false;
                }
                i++;
            }
            var english = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
            var i = 0, che = "";
            while (i < english.length) {
                che = fName.indexOf(english.charAt(i));
                if (che != -1) {
                    document.getElementById("errFirstName").innerHTML = "<span style='color:red; position:absolute; width:200px;'> שם פרטי חייב להכיל אותיות בעברית בלבד </span>";
                    return false;
                }
                i++;
            }
            document.getElementById("errFirstName").innerHTML = "";
            return true;
        }  


    
        function checkLastName() {
            check = true;
            var lastName = document.getElementById("LastNameFill").value;
            if (lastName == "") {
                document.getElementById("errLastName").innerHTML = "<span style='color:red; position:absolute; width:200px;'>  הכנס שם משפחה </span>";
                return false;
            }
            if (lastName.length == 1) {
                document.getElementById("errLastName").innerHTML = "<span style='color:red; position:absolute; width:200px;'> שם משפחה קצר מידי </span>";
                return false;
            }
            var bad = "!@#$%^&*()?_-+=<>/\{}[].',;:0123456789";
            var i = 0, ch = "";
            while (i < bad.length) {
                ch = lastName.indexOf(bad.charAt(i));
                if (ch != -1) {
                    document.getElementById("errLastName").innerHTML = "<span style='color:red; position:absolute; width:200px;'> שם משפחה חייב להכיל אותיות בלבד </span>";
                    return false;
                }
                i++;
            }
            var english = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
            var i = 0, che = "";
            while (i < english.length) {
                che = lastName.indexOf(english.charAt(i));
                if (che != -1) {
                    document.getElementById("errLastName").innerHTML = "<span style='color:red; position:absolute; width:200px;'> שם משפחה חייב להכיל אותיות בעברית בלבד </span>";
                    return false;
                }
                i++;
            }
            document.getElementById("errLastName").innerHTML = "";
            return true;
        }  


     
        function checkAdress() {
            check = true;
            var street = document.getElementById("streetFill").value;
            if (street == "") {
                document.getElementById("errStreet").innerHTML = "<span style='color:red; position:absolute; width:200px;'> הכנס כתובת </span>";
                return false;
            }
            if (street.length == 1) {
                document.getElementById("errStreet").innerHTML = "<span style='color:red; position:absolute; width:200px;'> שם הכתובת קצר מידי </span>";
                return false;
            }
            var english = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
            var i = 0, che = "";
            while (i < english.length) {
                che = street.indexOf(english.charAt(i));
                if (che != -1) {
                    document.getElementById("errStreet").innerHTML = "<span style='color:red; position:absolute; width:200px;'> שם הכתובת חייב להכיל אותיות בעברית בלבד </span>";
                    return false;
                }
                i++;
            }
            document.getElementById("errStreet").innerHTML = "";
            return true;
        }  


   
        function checkTaz() {
            var x = document.getElementById("idFill").value;
            if (x == "") {
                document.getElementById("errId").innerHTML = "<span style='color:red; position:absolute; width:200px;'> הכנס מספר תעודת זהות </span>";
                return false;
            }
            else {

                var flag = false
                for (var i = 0; i < x.length; i++) {
                    if (x.charAt(i) >= "0" && x.charAt(i) <= "9") {
                        flag = true;
                    }
                    else {
                        document.getElementById("errId").innerHTML = "<span style='color:red; position:absolute; width:200px;'>  הכנס רק מספרים </span>";
                        return false;
                    }
                }
                if (x.length != 9) {
                    document.getElementById("errId").innerHTML = "<span style='color:red; position:absolute; width:200px;'> הכנס מספר תעודת זהות באורך תקין  </span>";
                    return false;
                }
                document.getElementById("errId").innerHTML = "";
                return true;
            }
        } 


     
        function checkSex() {
            var x = document.getElementsByName("sex");
            var bool = false;
            for (var i = 0; i < x.length; i++) {
                if (x[i].checked == true) {
                    bool = true;
                }
            }
            if (bool == false) {
                document.getElementById("errSex").innerHTML = "<span style='color:red; position:absolute; width:200px;'> סמן מין </span>";
                return false;
            }
            document.getElementById("errSex").innerHTML = "";
            return true;
        }  


       
        function checkDate() {
            var year = document.getElementById("yearFill");
            var month = document.getElementById("monthFill");
            var day = document.getElementById("dayFill");
            if (year[0].selected == true || month[0].selected == true || day[0].selected == true) {
                document.getElementById("errBirth").innerHTML = "<span style='color:red; position:absolute; width:200px;'> הכנס תאריך  </span>";
                return false;
            }
            document.getElementById("errBirth").innerHTML = "";
            return true;
        }  

        function checkBest() {
            var best = document.getElementById("sel");
            if (best[0].selected == true) {
                document.getElementById("errBestCatagory").innerHTML = "<span style='color:red; position:absolute; width:200px;'> הכנס קטגוריה </span>";
                return false;
            }
            document.getElementById("errBestCatagory").innerHTML = "";
            return true;
        }  

    </script>



<h1 class="signUpTitle">הירשם</h1>

<div class="quizSquare"> 

<form action="signUp.aspx" method="post"  onsubmit="return checkForm()" > 

<table border="0" cellpadding="0" cellspacing="0" dir="rtl" style="position:absolute; top:10px; right:40px;">



<tr >
        <td> 
            <h1 class="enterEmail">הכנס אימייל</h1>
            
        </td>
            <td id="errMaill" style="text-align:right; position:relative; left:120px;" ></td>
        <td> 

           <h1 class="enterSex" style="text-align:right; ">הכנס שם פרטי</h1>
           
        </td>
           <td id="errFirstName" style="position:relative; left:400px;"></td>
</tr>

<tr>
        <td > 
             <input type="text" class="emailfill" dir="rtl" size="70" id="emailFill" name="emailFill" maxlength="100" style="outline: none;"/>
        </td>

        <td id="Td1" > </td>

        <td> 
            
             <input type="text" class="emailfill" dir="rtl" size="70" id="FnameFill" name="FnameFill" maxlength="100" style="outline: none;"/>

        </td>


</tr>

<tr>
        <td > 
            <h1 class="enterUsername">הכנס שם משתמש</h1>          
        </td>
            <td id="errUsername" style="color:red; width:500px; position:relative; left:60px;"><%=msg %></td>




        
        <td> 
              <h1 class="belive" dir="rtl">הכנס שם משפחה</h1>
        </td>
              <td id="errLastName" style="position:relative; left:380px;"></td>


         

                
</tr>

<tr>
        <td> 
            <input type="text" class="userfill" dir="rtl" size="70" id="userNameFill" name="name" maxlength="20" style="outline: none;"/>
        </td>

        <td></td>

        <td>

            <input type="text" class="emailfill" dir="rtl" size="70" id="LastNameFill" name="LnameFill" maxlength="100" style="outline: none;"/>

        </td>

</tr>

<tr>
        <td > 
           <h1 class="enterPassword">הכנס סיסמא</h1>
        </td>
           <td id="errPas" style="position:relative; left:120px;"></td>


        <td> 
            <h1 class="belive2" dir="rtl">הכנס ת.ז</h1>
        </td>
            <td id="errId" style="position:relative; left:460px;"></td>
</tr>


<tr>
        <td > 
           <input type="password" class="passwordfill"dir="rtl" size="70" id="passFill" name="password1" maxlength="100" style="outline: none;" />
        </td>


       <td></td>

        <td> 
            <input type="text" class="emailfill" dir="rtl" size="70" id="idFill" name="tazfill" maxlength="100" style="outline: none;"/>
        </td>


</tr>

<tr>
        <td > 
            <h1 class="confirmPassword">אשר סיסמא</h1>
        </td>
            <td id="errConfirmPass" style="position:relative; left:130px;"></td>

         <td> 
            <h1 class="bestcatagory">באיזה קטגוריה אתה מוצא הכי הרבה עניין?</h1>
        </td>
            <td id="errBestCatagory" style="position:relative; left:120px;"></td>
</tr>



<tr>
        <td > 
            <input type="password" class="confirmPasswordfill" dir="rtl" size="70" id="confirmPassFill" name="confirmPassword" maxlength="100" style="outline: none;"/>
        </td>

        <td></td>

         <td> 
            <select id="sel" class="bestcatagorychoose" dir="rtl" style="outline: none;" name="intresting" >
                <option value="katagory">קטגוריה</option>
                <option value="space">חלל</option>
                <option value="popular">פופולארי ביותר</option>
                <option value="history">היסטוריה</option>
                <option value="religion">דת</option>
                <option value="politics">פוליטיקה</option>
            </select>
        </td>
</tr>

<tr>
        <td > 
            <h1 class="enterBirth">הכנס תאריך לידה</h1>
        </td>
         <td id="errBirth"style="position:relative; left:65px;"></td>


         <td>
             <h1 class="enterBirth">הכנס מין</h1>
         </td>
          <td id="errSex"style="position:relative; left:470px;"></td>
</tr>
        

<tr>
        <td> 
            <select class="userfillYear" dir="rtl" style="outline: none;" id="yearFill" name="date">
    <option>שנה</option>
    <option value="2020">2020</option>
    <option value="2019">2019</option>
    <option value="2018">2018</option>
    <option value="2017">2017</option>
    <option value="2016">2016</option>
    <option value="2015">2015</option>
    <option value="2014">2014</option>
    <option value="2013">2013</option>
    <option value="2012">2012</option>
    <option value="2011">2011</option>
    <option value="2010">2010</option>
    <option value="2009">2009</option>
    <option value="2008">2008</option>
    <option value="2007">2007</option>
    <option value="2006">2006</option>
    <option value="2005">2005</option>
    <option value="2004">2004</option>
    <option value="2003">2003</option>
    <option value="2002">2002</option>
    <option value="2001">2001</option>
    <option value="2000">2000</option>
    <option value="1999">1999</option>
    <option value="1998">1998</option>
    <option value="1997">1997</option>
    <option value="1996">1996</option>
    <option value="1995">1995</option>
    <option value="1994">1994</option>
    <option value="1993">1993</option>
    <option value="1992">1992</option>
    <option value="1991">1991</option>
    <option value="1990">1990</option>
    <option value="1989">1989</option>
    <option value="1988">1988</option>
    <option value="1987">1987</option>
    <option value="1986">1986</option>
    <option value="1985">1985</option>
    <option value="1984">1984</option>
    <option value="1983">1983</option>
    <option value="1982">1982</option>
    <option value="1981">1981</option>
    <option value="1980">1980</option>
    <option value="1979">1979</option>
    <option value="1978">1978</option>
    <option value="1977">1977</option>
    <option value="1976">1976</option>
    <option value="1975">1975</option>
    <option value="1974">1974</option>
    <option value="1973">1973</option>
    <option value="1972">1972</option>
    <option value="1971">1971</option>
    <option value="1970">1970</option>
    <option value="1969">1969</option>
    <option value="1968">1968</option>
    <option value="1967">1967</option>
    <option value="1966">1966</option>
    <option value="1965">1965</option>
    <option value="1964">1964</option>
    <option value="1963">1963</option>
    <option value="1962">1962</option>
    <option value="1961">1961</option>
    <option value="1960">1960</option>
    <option value="1959">1959</option>
    <option value="1958">1958</option>
    <option value="1957">1957</option>
    <option value="1956">1956</option>
    <option value="1955">1955</option>
    <option value="1954">1954</option>
    <option value="1953">1953</option>
    <option value="1952">1952</option>
    <option value="1951">1951</option>
    <option value="1950">1950</option>
    <option value="1949">1949</option>
    <option value="1948">1948</option>
    <option value="1947">1947</option>
    <option value="1946">1946</option>
    <option value="1945">1945</option>
    <option value="1944">1944</option>
    <option value="1943">1943</option>
    <option value="1942">1942</option>
    <option value="1941">1941</option>
    <option value="1940">1940</option>
    <option value="1939">1939</option>
    <option value="1938">1938</option>
    <option value="1937">1937</option>
    <option value="1936">1936</option>
    <option value="1935">1935</option>
    <option value="1934">1934</option>
    <option value="1933">1933</option>
    <option value="1932">1932</option>
    <option value="1931">1931</option>
    <option value="1930">1930</option>
    <option value="1929">1929</option>
    <option value="1928">1928</option>
    <option value="1927">1927</option>
    <option value="1926">1926</option>
    <option value="1925">1925</option>
    <option value="1924">1924</option>
    <option value="1923">1923</option>
    <option value="1922">1922</option>
    <option value="1921">1921</option>
    <option value="1920">1920</option>
    <option value="1919">1919</option>
    <option value="1918">1918</option>
    <option value="1917">1917</option>
    <option value="1916">1916</option>
    <option value="1915">1915</option>
    <option value="1914">1914</option>
    <option value="1913">1913</option>
    <option value="1912">1912</option>
    <option value="1911">1911</option>
    <option value="1910">1910</option>
    <option value="1909">1909</option>
    <option value="1908">1908</option>
    <option value="1907">1907</option>
    <option value="1906">1906</option>
    <option value="1905">1905</option>
        </select>

  <select class="userfillMonth" dir="rtl" style="outline: none;" id="monthFill" name="date" >
  <option>חודש</option>
        <option value="1">ינואר</option>
        <option value="2">פברואר</option>
        <option value="3">מרץ</option>
        <option value="4">אפריל</option>
        <option value="5">מאי</option>
        <option value="6">יוני</option>
        <option value="7">יולי</option>
        <option value="8">אוגוסט</option>
        <option value="9">ספטמבר</option>
        <option value="10">אוקטובר</option>
        <option value="11">נובמבר</option>
        <option value="12">דצמבר</option>
        </select>
  <select class="userfillDay" dir="rtl" style="outline: none;" id="dayFill" name="date">
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
        <option value="6">6</option>
        <option value="7">7</option>
        <option value="8">8</option>
        <option value="9">9</option>
        <option value="10">10</option>
        <option value="11">11</option>
        <option value="12">12</option>
        <option value="13">13</option>
        <option value="14">14</option>
        <option value="15">15</option>
        <option value="16">16</option>
        <option value="17">17</option>
        <option value="18">18</option>
        <option value="19">19</option>
        <option value="20">20</option>
        <option value="21">21</option>
        <option value="22">22</option>
        <option value="23">23</option>
        <option value="24">24</option>
        <option value="25">25</option>
        <option value="26">26</option>
        <option value="27">27</option>
        <option value="28">28</option>
        <option value="29">29</option>
        <option value="30">30</option>
        <option value="31">31</option>
        </select>

        </td>

        <td></td>

        <td>   
                 
                    <input type="radio" class="sexy" name="sex" size="70" value="male" />
                    <span class="sexymale" dir="rtl">זכר</span>
                 
                <br />
                 
                    <input type="radio" class="sexy2" name="sex" size="70" value="female" />
                    <span class="sexyfemale" dir="rtl">נקבה</span>
                
                 
        </td>

        </tr>








        

<tr>
        <td > 
            <h1 class="confirmPassword">הכנס מספר טלפון</h1>
        </td>
            <td id="errPhone" style="position:relative; left:60px;"></td>

        <td > 
            <h1 class="confirmPassword"> הכנס כתובת </h1>
        </td>
            <td id="errStreet" style="position:relative; left:420px;"></td>
</tr>

<tr></tr>

<tr>
         <td> 
            <input type="text" class="emailfill" dir="rtl" size="70" id="phoneFill" name="phoneFill" maxlength="100" style="outline: none;"/>
        </td>

        <td></td>

        <td>
           <input type="text" class="emailfill" dir="rtl" size="70" id="streetFill" name="street" maxlength="100" style="outline: none;"/>
        </td>
</tr>           


<tr>
        <td > 
            <h1 class="confirmPassword">האם תרצה לתרום מהידע שלך לאתר?</h1>
        </td>
            <td id="errYeda" style="position:relative; left:50px;"></td>

        <td > 
            <h1 class="confirmPassword"> איזה תאוריה הכי מופרכת לדעתך? </h1>
        </td>
            <td id="errBelive" style="position:relative; left:370px;"></td>
</tr>

<tr></tr>

<tr>
         <td>   
                    <input type="radio" class="enterq10ans1" name="yeda" size="70" value="yes" />
                    <span class="q10ans1" dir="rtl">כן</span>
                 
                <br />
                 
                    <input type="radio" class="enterq10ans3" name="yeda" size="70" value="no" />
                    <span class="q10ans3" dir="rtl">לא</span>
        </td>
            
            
        <td></td>

        <td>
           <input type="checkbox" class="belibe"    name="theo"  value="hitler" /> <span class="beliveAns">היטלר עדיין חי </span>
           <br />
           <br />
           <input type="checkbox" class="belibe"    name="theo"  value="planetnine" /> <span class="beliveAns">הכוכב התשיעי </span>
           <br />
           <br />
           <input type="checkbox" class="belibe"    name="theo"  value="kenedi" /> <span class="beliveAns"> רצח הנשיא קנדי </span>
           <br />
           <br />
           <input type="checkbox" class="belibe"    name="theo"  value="flatearth" /> <span class="beliveAns"> העולם שטוח </span>
        </td>
</tr>           
            
            <tr>
            <td id="link"> </td>
            </tr>
    </table>



           <input type="submit" class="signupSubmit" value="שלח" size="50" id="submit2" name="submit2" style="position:absolute; top:1010px; right: 80px "/>
           <input type="reset" class="signupReset" value="נקה" size="50" id="reset2" name="reset2" style="position:absolute; top:1010px; right: 270px "/>




 </form> 

 
    <h1 class="haveAccount">?יש לך משתמש</h1>
    <h1 class="haveAccountPress"> <a href="logIn.aspx"style="color:White;"> התחבר  </a></h1>
    




</div>


</asp:Content>

