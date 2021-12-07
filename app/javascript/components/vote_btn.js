const changeHeartColor = (event) => {
  event.preventDefault();
    const heartIcon = document.querySelector(".heart-icon");
    if (heartIcon) {
      heartIcon.style.color = "#FF4C4C";
    }
}

const heartClick = () => {
  const btnHeart = document.querySelector(".btn-heart");
  if (btnHeart) {
    btnHeart.addEventListener('click', changeHeartColor);
  }
}
export { heartClick };