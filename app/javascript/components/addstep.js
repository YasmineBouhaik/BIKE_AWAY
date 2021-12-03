const addStepToItinerary = () => {
  const hiddenform = document.querySelector(".hidden-form");
  const input = document.querySelector("#input");
  const addstep = document.querySelector("#addstep");
  addstep.addEventListener("click", (event) => {
    // event.preventDefault();
    input.value;
    hiddenform.insertAdjacentHTML("beforeend", `<div> ${input.value} (x) <input type = "hidden" name = "steps[][address]" value = "${input.value} ><input type="hidden" name="steps[][latitude]" value="30"><input type="hidden" name="steps[][longitude]" value="40"></div>`);
  });
}
export { addStepToItinerary };
