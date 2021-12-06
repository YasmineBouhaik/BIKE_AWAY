const changeHeartColor = (event) => {
  event.preventDefault();
    const heartIcon = document.querySelector(".heart-icon");
    heartIcon.style.color = "#FF4C4C";
}

const heartClick = () => {
  const btnHeart = document.querySelector(".btn-heart");
  btnHeart.addEventListener('click', changeHeartColor);
}
export { heartClick };