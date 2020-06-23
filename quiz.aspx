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

    <script type="text/javascript">


        var count2 = 0;
        function time1() {
            count2++;
        }
        var time = setInterval('time1()', 1000);
        function endtime() {
            check();
            clearInterval(time);
            count2 %= 3600;
            var minutes = Math.floor(count2 / 60);
            var seconds = count2 % 60;
            document.getElementById("timerr").innerHTML = "ב: " + minutes + " דקות " + "ו: " + seconds + " שניות";
        }

    function check(){
            
            var grade = 0;
            var count = 0;
            ques1 = document.getElementsByName("q1")
            if (ques1[0].checked == true) {
                count++;
                grade += 10;
            }

            ques2 = document.getElementsByName("q2")
            if (ques2[0].checked == true) {
                count++;
                grade += 10;
            }
            
            ques3 = document.getElementsByName("q3")
            if (ques3[0].checked == true) {
                count++;
                grade += 10;
            }

            ques4 = document.getElementsByName("q4")
            if (ques4[0].checked == true) {
                count++;
                grade += 10;
            }

            ques5 = document.getElementsByName("q5")
            if (ques5[0].checked == true) {
                count++;
                grade += 10;
            }

            ques6 = document.getElementsByName("q6")
            if (ques6[2].checked == true) {
                count++;
                grade += 10;
            }

            ques7 = document.getElementsByName("q7")
            if (ques7[1].checked == true) {
                count++;
                grade += 10;
            }

            ques8 = document.getElementsByName("q8")
            if (ques8[2].checked == true) {
                count++;
                grade += 10;
            }

            ques9 = document.getElementsByName("q9")
            if (ques9[0].checked == true) {
                count++;
                grade += 10;
            }

            ques10 = document.getElementsByName("q10")
            if (ques10[2].checked == true) {
                count++;
                grade += 10;
            }
     
            document.getElementById("right").innerHTML = "צדקת ב: " + count + " / 10";
            
        }

       

        
    </script>





<h1 class="quizTitle">שאלון</h1>

<div class="quizSquare"> 
<form action="" method="post"> 

<table border="0" cellpadding="0" cellspacing="0" dir="rtl" style="position:absolute; top:60px;left:320px;">
        <tr>
                 <td>
                  <h1 class="quiz1" dir="rtl">באיזה שנה נחתה אפולו 11?</h1>
                 </td>
        </tr>

        <tr>
                 <td>
                     <input type="radio" class="enterq1ans1" name="q1" value="q1ans1"  size="70"  /> 
                     <span class="q1ans1" dir="rtl">ב־20 ביולי 1969</span>
                 </td>

        </tr>
        <tr>
                 <td>
                    <input type="radio" class="enterq1ans2" name="q1" value="q1ans2"  size="70"  />
                    <span class="q1ans2" dir="rtl">ב־5 דצמבר 1969</span>
                 </td>

        </tr>
        <tr>
                 <td>
                    <input type="radio" class="enterq1ans3" name="q1" value="q1ans3"  size="70"  />
                    <span class="q1ans3" dir="rtl">ב־20 ביולי 1970</span>
                 </td>

        </tr>











        <tr>
                 <td>  &nbsp    </td>
        </tr>











        <tr>
                 <td>
                    <h1 class="quiz2" dir="rtl">באיזה שנה נולד וויליאם שייקספיר?</h1>
                 </td>
         
        </tr>

        <tr>
                 <td>
                    <input type="radio" class="enterq2ans1" name="q2" value="q1ans1"  size="70"  />
                    <span class="q2ans1" dir="rtl">1564</span>
                 </td>
          
        </tr>
        <tr>
                 <td>
                    <input type="radio" class="enterq2ans2" name="q2" value="q2ans2"  size="70"  />
                    <span class="q2ans2" dir="rtl">1664</span>
                 </td>
         
        </tr>
        <tr>
                 <td>
                      <input type="radio" class="enterq2ans3" name="q2" value="q2ans3"  size="70"  />
                      <span class="q2ans3" dir="rtl">1434</span>
                 </td>
             
        </tr>













        <tr>
                 <td>  &nbsp    </td>
        </tr>













        <tr>
                 <td>
                    <h1 class="quiz3" dir="rtl">כמה טענות יש לתאוריה שאלביס עדיין חיי?</h1>
                 </td>
             
        </tr>

        <tr>
                 <td>
                    <input type="radio" class="enterq3ans1" name="q3"   size="70"  />
                    <span class="q3ans1" dir="rtl">5</span>
                 </td>
              
        </tr>
        <tr>
                 <td>
                    <input type="radio" class="enterq3ans2" name="q3"   size="70"  />
                    <span class="q3ans2" dir="rtl">9</span>
                 </td>
       
        </tr>
        <tr>
                 <td>
                    <input type="radio" class="enterq3ans3" name="q3"   size="70"  />
                    <span class="q3ans3" dir="rtl">2</span>
                 </td>
       
        </tr>











        <tr>
                 <td>  &nbsp    </td>
        </tr>











        <tr>
                 <td>
                    <h1 class="quiz4" dir="rtl">באיזה שנה קרה אסון מגדל התאומים?</h1>
                 </td>
          
        </tr>

        <tr>
                 <td>
                    <input type="radio" class="enterq4ans1" name="q4"   size="70"  />
                    <span class="q4ans1" dir="rtl">2001</span>
                 </td>
             
        </tr>
        <tr>
                 <td>
                    <input type="radio" class="enterq4ans2" name="q4"   size="70"  />
                    <span class="q4ans2" dir="rtl">2003</span>  
                 </td>
        
        </tr>
        <tr>
                 <td>
                    <input type="radio" class="enterq4ans3" name="q4"   size="70"  />
                    <span class="q4ans3" dir="rtl">1998</span>
                 </td>
          
        </tr>













        <tr>
                 <td>  &nbsp    </td>
        </tr>












         <tr>
                 <td>
                    <h1 class="quiz5" dir="rtl">מה השטח של משולש ברמודה?</h1>
                 </td>
            
        </tr>

         <tr>
                 <td>
                    <input type="radio" class="enterq5ans1" name="q5"   size="70"  />
                    <span class="q5ans1" dir="rtl">100,000,000 קילומטרים רבועים</span>
                 </td>
               
        </tr>
         <tr>
                 <td>
                    <input type="radio" class="enterq5ans2" name="q5"   size="70"  />
                    <span class="q5ans2" dir="rtl">219,452,700 קילומטרים רבועים</span>
                 </td>
             
        </tr>
         <tr>
                 <td>
                    <input type="radio" class="enterq5ans3" name="q5"   size="70"  />
                    <span class="q5ans3" dir="rtl">300,000,000 קילומטרים רבועים</span>
                 </td>
               
        </tr>













        <tr>
                 <td>  &nbsp    </td>
        </tr>














        <tr>
                 <td>
                    <h1 class="quiz6" dir="rtl">לפי התאוריה של רצח הנשיא קנדי מי איזה ארגון רצח אותו?</h1>
                 </td>
             
        </tr>

        <tr>
                 <td>
                    <input type="radio" class="enterq6ans1" name="q6"   size="70"  />
                    <span class="q6ans1" dir="rtl">FBI</span>
                 </td>
          
        </tr>
        <tr>
                 <td>
                    <input type="radio" class="enterq6ans2" name="q6"   size="70"  />
                    <span class="q6ans2" dir="rtl">NYPD</span>
                 </td>
            
        </tr>
        <tr>
                 <td>
                    <input type="radio" class="enterq6ans3" name="q6"   size="70"  />
                    <span class="q6ans3" dir="rtl">CIA</span>
                 </td>
            
        </tr>











        <tr>
                 <td>  &nbsp    </td>
        </tr>












         <tr>
                 <td>
                    <h1 class="quiz7" dir="rtl">איך הנסיכה דיאנה מתה?</h1>
                 </td>
     
        </tr>

         <tr>
                 <td>
                    <input type="radio" class="enterq7ans1" name="q7"   size="70"  />
                    <span class="q7ans1" dir="rtl">התנקשות</span>
                 </td>
              
        </tr>
         <tr>
                 <td>
                    <input type="radio" class="enterq7ans2" name="q7"   size="70"  />
                    <span class="q7ans2" dir="rtl">תאונה</span>
                 </td>
           
        </tr>
         <tr>
                 <td>
                    <input type="radio" class="enterq7ans3" name="q7"   size="70" />
                    <span class="q7ans3" dir="rtl">התאבדות</span>
                 </td>
             
        </tr>











        <tr>
                 <td>  &nbsp    </td>
        </tr>












        <tr>
                 <td>
                    <h1 class="quiz8" dir="rtl">לפי התאוריה של היטלר לאיזה מדינה הוא ברח?</h1>
                 </td>
          
        </tr>

        <tr>
                 <td>
                    <input type="radio" class="enterq8ans1" name="q8"   size="70"  />
                    <span class="q8ans1" dir="rtl">ברזיל</span>
                 </td>
           
        </tr>
        <tr>
                 <td>
                    <input type="radio" class="enterq8ans2" name="q8"   size="70"  />
                    <span class="q8ans2" dir="rtl">ספרד</span>
                 </td>
              
        </tr>
        <tr>
                 <td>
                    <input type="radio" class="enterq8ans3" name="q8"   size="70"  />
                    <span class="q8ans3" dir="rtl">ארגנטינה</span>
                 </td>
           
        </tr>









        <tr>
                 <td>  &nbsp    </td>
        </tr>












        <tr>
                 <td>
                    <h1 class="quiz9"  dir="rtl">לפי התאוריה של הכוכב התשיעי כל כמה זמן הכוכב משלים סיבוב סביב השמש?</h1>
                 </td>

        </tr>

        <tr>
                 <td>
                    <input type="radio" class="enterq9ans1" name="q9"   size="70"  />
                    <span class="q9ans1" dir="rtl">10-20 אלף שנים</span>
                 </td>

        </tr>
        <tr>
                 <td>
                    <input type="radio" class="enterq9ans2" name="q9"   size="70"  />
                    <span class="q9ans2" dir="rtl">5-10 אלף שנים</span>
                 </td>

        </tr>
        <tr>
                 <td>
                    <input type="radio" class="enterq9ans3" name="q9"   size="70"  />
                    <span class="q9ans3" dir="rtl">100-200 אלף שנים</span>
                 </td>

        </tr>










        <tr>
                 <td>  &nbsp    </td>
        </tr>












        <tr>
                 <td>
                    <h1 class="quiz10" dir="rtl">מה השם של הבן אדם שמצא את העב"ם בתקרית רוזוול?</h1>
                 </td>
                 <td id="q10"> </td>
        </tr>

        <tr>
                 <td>
                    <input type="radio" class="johan" name="q10"  size="70"  />
                    <span class="johan3" dir="rtl">ג'ון ברייטנס</span>
                 </td>

        </tr>
        
        <tr>
                 <td>
                    <input type="radio" class="elon" name="q10"  size="70"  />
                    <span class="elon3" dir="rtl">אילון מאסק</span>
                 </td>

        </tr>

        <tr>
                 <td>
                    <input type="radio" class="enterq10ans2" name="q10"  size="70"  />
                    <span class="q10ans2" dir="rtl">מאק ברייזל</span>
                 </td>
        </tr>


 </table>


 
          <input type="button" class="quizCheck" value="בדוק" size="50"  name="submit4"  onclick = "endtime()"/>
           
          <input type="reset" class="quizReset" value="נקה" size="50"  name="reset4" />
            
    
    
    
    </form>  


    <table dir="rtl">


<tr>
 <td id="right" class="grade"> </td>
 <td id="timerr" class="time"> </td>

</tr>
</table>


    </div>
</asp:Content>

