const addStepToItinerary = () => {
  const hiddenform = document.querySelector(".hidden-form");
  const input = document.querySelector("#input");
  const addstep = document.querySelector("#addstep");
  addstep.addEventListener("click", (event) => {
    // event.preventDefault();
    // input.value;
    hiddenform.insertAdjacentHTML("beforeend", `<li> ${input.value} (X) <input type="hidden" name="steps[][address]" value="${input.value}"></li>`);
  });
}
export { addStepToItinerary };
