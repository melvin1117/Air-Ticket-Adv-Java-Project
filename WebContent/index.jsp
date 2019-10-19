<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <title>Air Booking | An awesome place to book your air ticket</title>
      <link rel="stylesheet" href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" />
      <link rel="stylesheet" href="webjars/font-awesome/4.7.0/css/font-awesome.min.css" />
      <script src="webjars/jquery/3.2.1/jquery.min.js"></script>
      <script src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
      <link href="css/grayscale.css" rel="stylesheet">
      <script src="js/grayscale.js"></script>
      <!-- fonts -->
      <link href="http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css">
      <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
      <link href="https://fonts.googleapis.com/css?family=Cookie|Great+Vibes" rel="stylesheet">
      <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500" rel="stylesheet">

</head>
   <body>
      <jsp:include page="/include/navbar.jsp" />
      <!-- Intro Header -->
      <div class="header-container">
         <div class="video-container">
            <video id="hero-vid" preload = "true" autoplay = "autoplay" loop = "loop" muted  >
               <source src = "vid/Mountain View.mp4" type = "video/mp4"/>
            </video>
         </div>
      </div>
      <div class="container-video">
         <header>
            <h1>One Stop to book your Flight<span></span></h1>
            <p>Fast, Easy & Secure...</p>
         </header>
      </div>
      <!-- About us section Start-->
      <section id="about">
         <div class="heading">
            About
         </div>
         <div class="heading-border-about"></div>
         <div class="para">
            Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
         </div>
         <div class="center-icon ">
            <a href="#"><i class="fa fa-facebook-official fa-3x"></i></a>&nbsp;&nbsp;&nbsp;
            <a href="#"><i class="fa fa-google-plus-square fa-3x"></i></a>&nbsp;&nbsp;&nbsp;
            <a href="#"><i class="fa fa-linkedin-square fa-3x"></i></a>&nbsp;&nbsp;&nbsp;
         </div>
      </section>
      <!-- about us section end-->
      <!-- contact start -->
      <section id="contact">
         <div class="container contact-form">
            <div class="contact-image">
               <i class="fa fa-paper-plane fa-5x" style="margin-top: 25px;"></i>
            </div>
            <div class="heading">
               Drop Us a Message
            </div>
            <div class="heading-border-contact"></div>
            <form method="post">
               <div class="row">
                  <div class="col-md-6">
                     <div class="form-group">
                        <input type="text" name="txtName" class="form-control" placeholder="Your Name *" value="" />
                     </div>
                     <div class="form-group">
                        <input type="text" name="txtEmail" class="form-control" placeholder="Your Email *" value="" />
                     </div>
                     <div class="form-group">
                        <input type="text" name="txtPhone" class="form-control" placeholder="Your Phone Number *" value="" />
                     </div>
                     <div class="form-group">
                        <input type="submit" name="btnSubmit" class="btnContact" value="Send Message" />
                     </div>
                  </div>
                  <div class="col-md-6">
                     <div class="form-group">
                        <textarea name="txtMsg" class="form-control" placeholder="Your Message *" style="width: 100%; height: 150px;"></textarea>
                     </div>
                  </div>
               </div>
            </form>
         </div>
      </section>
      <!-- contact end -->
      <jsp:include page="/include/footer.jsp" />
   </body>
</html>