$(document).on("turbolinks:load", () => {
  $(".flash-notice")
    .delay(10000)
    .fadeOut(1000);
  $(".flash-alert")
    .delay(30000)
    .fadeOut(1000);
});
