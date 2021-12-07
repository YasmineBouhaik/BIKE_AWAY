const displayChat = (event) => {
  event.preventDefault();
  const chat = document.querySelector(".chat");
  if (chat){
    console.log("hello");
    chat.style.display = "block";
  }
}

const btnClick = () => {
  const btn = document.querySelector('.btn-choose-ride');
  if (btn) {
    btn.addEventListener('click', displayChat);
  }
}

export { btnClick };