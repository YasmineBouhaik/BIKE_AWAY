const AddStepToItinerary = () => {

  const input = document.querySelector("#input");
  const addstep = document.querySelector("#addstep");
  addstep.addEventListener("click", (event) => {
    event.preventDefault();
    console.log(event);
    console.log(event.currentTarget);
  });

    });
  }
}

export { AddStepToItinerary };
