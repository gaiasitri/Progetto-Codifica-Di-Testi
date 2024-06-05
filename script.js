$(document).ready(function () {
  $("#btn-pers").click(function () {
    $("persname").css("background-color", "#67aad6");
    $("persname").css("display", "inline");
  });

  $("#btn-luogo").click(function () {
    $("placename").css("background-color", "#97d667");
  });

  $("#btn-add").click(function () {
    $("add").css("background-color", "#FFA500");
  });

  $("#btn-del").click(function () {
    $("del").css("background-color", "#FA8072");
    $("del").css("display", "inline");
  });

  $("#btn-choice").click(function () {
    $("choice").css("background-color", "#00c3ff9b");
    $("choice").css("display", "inline");
  });

  $("#btn-number").click(function () {
    $("number").css("background-color", "#fbff00df");
  });

  $("#btn-hide").click(function () {
    $("del").css("display", "none");
    $("placename, persname, choice, add, del, number").css("background-color", "#fff");
  });
});
