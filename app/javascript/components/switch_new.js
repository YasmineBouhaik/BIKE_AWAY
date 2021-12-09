const switchNew = () => {
  const toto = document.querySelector(".switch-new");
  if (toto) {
    const part1 = document.querySelector(".new-part-one");
    const part2 = document.querySelector(".new-part-two");
    toto.addEventListener("click", (event) => {
      part1.classList.toggle("d-none");
      part2.classList.toggle("d-none");
      if (toto.innerText == "Suivant") {
        toto.innerText = "Retour";
      } else if (toto.innerText == "Retour") {
        toto.innerText = "Suivant";
      };
    });
  }
}

export { switchNew };
