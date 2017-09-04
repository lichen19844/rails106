


    // $(window).scroll(function() { // check if scroll event happened
    //     if ($(document).scrollTop() > 50) { 
    //         $(".navbar-fixed-top").css("background-color", "#212121"); 
    //     } else {
    //         $(".navbar-fixed-top").css("background-color", "transparent"); 
    //     }
    // });



      $(document).ready(function(){
         $(".navbar-fixed-top").css("background", "transparent"); 
         $(".navbar-fixed-top").css("border-color", "transparent"); 
      $(window).scroll(function() {
         if ($(document).scrollTop() > 50) {
           $(".navbar-fixed-top").css("background", "linear-gradient(180deg,#212121,#0091EA)"); 
         } else {
           $(".navbar-fixed-top").css("background", "transparent");
         }
       });
      });
