const displayChat = (event) => {
    event.preventDefault();
    const chat = document.querySelector(".chat");
    chat.style.display = "block";
  }
  
  export { displayChat };