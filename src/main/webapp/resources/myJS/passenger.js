/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


$(document).ready(function () {


  $("#fname-1").change(function () {
      
      var firstName = $("#fname-1").val();
      
      $("#fnamec").val(firstName);
      
  });
  
   $("#lname-1").change(function () {
      
      var firstName = $("#lname-1").val();
      
      $("#lnamec").val(firstName);
      
  });
  
   $("#gender-1").change(function () {
      
      var gender = $("#gender-1").val();
      
      $("#genderc[value='"+ gender +"']").attr("selected", "selected");
      
  });
  
   $("#birthDate-1").change(function () {
      
      var birthDate = $("#birthDate-1").val();
      
      $("#birthDatec").val(birthDate);
      
  });
  
  $(".birthDate").attr("max", new Date().toISOString().substr(0,10));

});