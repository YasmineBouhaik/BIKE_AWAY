


const clearLogos = (logos) => {
    logos.forEach((logo) => {
      logo.classList.remove("logo-checked");
    })
}
const clickCategoryBtn = () => {
  const radioBtns = document.querySelectorAll('.category-selector');
  const logos = document.querySelectorAll('.logo-category');

  console.log(radioBtns);

  if (radioBtns.length > 0) {
    console.log("radio");

    logos.forEach((logo) => {
      console.log("each");

        logo.addEventListener('click', (event) => {
          console.log("je passe ici");
          // event.preventDefault();
          // console.log(event.currentTarget.dataset.id);
          radioBtns[event.currentTarget.dataset.id].checked = true;
          clearLogos(logos);
          logo.classList.add("logo-checked");
        })
    })
  }
}

export {clickCategoryBtn};