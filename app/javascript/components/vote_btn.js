const changeHeartColor = (event) => {
    event.PreventDefault();
    const heartIcon = document.querySelector(".heart-icon");
    heartIcon.getElementsByClassName.backgroundcolor = "red";
}
const heartClick = () => {
  const heartBtn = document.querySelector(".btn-heart");
  if (heartBtn) {
  heartBtn.addEventListener('click', changeHeartColor);
  }
}
export {heartClick, changeHeartColor};