function showRemainingCount(input) {
  let remaining = input.maxLength - input.mainId.val().length;

  if (remaining >= 0) {
    if (input.mainId.hasClass("count-error")) input.mainId.removeClass("count-error");
  } else {
    if (!input.mainId.hasClass("count-error")) input.mainId.addClass("count-error");
  }

  if (remaining < 10) {
    if (remaining < 0) {
      input.remainingCountId.text(
        `${Math.abs(remaining)} characters over the ${input.maxLength} character limit (input will be truncated)`
      );
    } else {
      input.remainingCountId.text(`${remaining}/${input.maxLength} characters remaining`);
    }
  } else {
    input.remainingCountId.text("");
  }
}

$(document).on("turbolinks:load", () => {
  $(".flash-notice")
    .delay(10000)
    .fadeOut(1000);

  $(".flash-alert")
    .delay(30000)
    .fadeOut(1000);

  $("#note_title").keyup(() => {
    showRemainingCount({
      mainId: $("#note_title"),
      remainingCountId: $("#title-remaining-count"),
      maxLength: parseInt($("#note_title").data().maxLength)
    });
  });

  $("#note_body").keyup(() => {
    showRemainingCount({
      mainId: $("#note_body"),
      remainingCountId: $("#body-remaining-count"),
      maxLength: parseInt($("#note_body").data().maxLength)
    });
  });
});
