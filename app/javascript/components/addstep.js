const addStepToItinerary = () => {
  const hiddenform = document.querySelector(".hidden-form");
  const input = document.querySelector("#input");
  const addstep = document.querySelector("#addstep");
  if (addstep) {
    addstep.addEventListener("click", (event) => {
      // event.preventDefault();
      // input.value;
      hiddenform.insertAdjacentHTML("beforeend", `<li id="${input.value}" class="city"> ${input.value} <input type="hidden" name="steps[][address]" value="${input.value}" ></li>`);
      removeStepFromItinerary();
    });
  }
}

const removeStepFromItinerary = () => {
  const cities = document.querySelectorAll(".city");
  if (cities) {
    cities.forEach((city) => {
      city.addEventListener("click", (event) => {
        city.remove();
      });
    })
  }
}

export { addStepToItinerary };
export { removeStepFromItinerary };
