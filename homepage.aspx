
<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

  <script type="text/javascript">

      var picNum = 1;
      var slideShow;
      var time = 1500;
      var height = 300;
      var width = 400;

      function StartShow() {
          slideShow = setInterval('PictureSlide()', time);
      }
      function PictureSlide() {
          document.getElementById("pic2").src = "album/" + picNum + ".jpg";
          if (picNum == 30)
              picNum = 1;
          else
              picNum++;
      }

      function StopShow() {
          clearInterval(slideShow);
      }
      function after() {
          document.getElementById("pic2").src = "album/" + picNum + ".jpg";
          if (picNum == 30)
              picNum = 1;
          else
              picNum++;
      }

      function pre() {
          document.getElementById("pic2").src = "album/" + picNum + ".jpg";
          if (picNum == 1)
              picNum = 30;
          
          else
              picNum--;
      }

      function Faster() {
          StopShow();
          time -= 200;
          slideShow = setInterval('PictureSlide()', time);
      }

      function Slower() {
          StopShow()
          time += 200;
          slideShow = setInterval('PictureSlide()', time);
      }

      function Bigger() {
          document.getElementById("pic2").height = (height + 20);
          document.getElementById("pic2").width = (width + 20);
      }
      
      function Smaller() {
          document.getElementById("pic2").height = (height - 20);
          document.getElementById("pic2").width = (width - 20);
      }
      
  </script>


  

    <h1 class="titleText2">
        !אתר הקונספירציות של ישראל
    </h1>
    <h1 class="maintext" dir="rtl"> 
    באתר זה תוכלו למצוא את כל תאוריות הקונספירציה הכי טובות שיש!
    יש תאוריות קונספירציה מכל הסוגים:
    חלל, פוליטיקה, היסטוריה, התאוריות הפופולאריות ביותר, תאוריות שלי ואפילו תוכלו להוסיף תאוריה משלכם בלחיצה על הכפתור שלח תאוריה.
    </h1>
  

  <div class="slide5">
     <center>
     <form action="" dir="ltr">
    
     <img src="album/1.jpg" id="pic2" name="pic2" alt="pic" width="400" height="300" />
     

<br />
<br />
<input type="button" class="AbuttomSmall" onclick="after()" value="<" style="padding:5px; width:40px;" />
<input type="button" class="Abuttom" onclick="StopShow()" value="עצור" style="padding:5px;" />
<input type="button" class="Abuttom" onclick="StartShow()" value="התחל" style="padding:5px;" />
<input type="button" class="AbuttomSmall" onclick="pre()" value=">" style="padding:5px; width:40px;"/>
<br />
<br />

<input type="button" class="Abuttom" onclick="Faster()" value="האץ " style="padding:5px; width: 150px; position:relative; right:10px;"  />
<input type="button" class="Abuttom"onclick="Slower()" value="האט" style="padding:5px; position:relative; right:9px;" />
<input type="button" class="Abuttom"onclick="Bigger()" value="הגדל" style="padding:5px; position:relative; right:9px;" />
<input type="button" class="Abuttom" onclick="Smaller()" value="הקטן " style="padding:5px; position:relative; right:10px;" />

</form>
</center>
</div>
     
</asp:Content>

