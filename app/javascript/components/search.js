const changeRangeKm = (event) => {
    const ranger = document.querySelector(".ranger");
    const queryKm = document.querySelector("#query_km");
    queryKm.value = ranger.innerText

  if (rangeIcon) {
    rangeIcon.changeRangeKm;
  }
}
  const rangeChange = () => {
    const btnSearch = document.querySelector("#range-1a");

    if (btnSearch) {
      btnSearch.addEventListener('change', changeRangeKm);
    }

}




export { rangeChange };
