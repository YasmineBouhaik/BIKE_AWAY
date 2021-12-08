const radioBtns = document.querySelectorAll('.category-selector');

const logos = document.querySelectorAll('.logo-category');


const clearLogos = () => {
    logos.forEach((logo) => {
      logo.classList.remove("logo-checked");
    })
}
const clickCategoryBtn = () => {
  if (radioBtns.length > 0) {
    logos.forEach((logo) => {
        logo.addEventListener('click', (event) => {
            // console.log(event.currentTarget.dataset.id);
            radioBtns[event.currentTarget.dataset.id].checked = true;
            clearLogos();
            logo.classList.add("logo-checked");
        })
    })
  }
}

export {clickCategoryBtn};