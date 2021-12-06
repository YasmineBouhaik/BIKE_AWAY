const changeHeartColor = (event) => {
  event.preventDefault();
    const heartIcon = document.querySelector(".heart-icon");
    heartIcon.style.color = "#FF4C4C";
}

const addAVote = (event) => {
  event.preventDefault();
  const votes = document.querySelector(".votes");
  votes =+ 1;
}

const heartClick = () => {
  const btnHeart = document.querySelector(".btn-heart");
  btnHeart.addEventListener('click', changeHeartColor);
  btnHeart.addEventListener('click', addAVote);
}
export { heartClick };