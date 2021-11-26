const sleepMessage = () => {
  const messages = document.querySelectorAll(".d-none")
  var i = 0;
  myLoop(i, messages);
}

function myLoop(i, messages) {
  setTimeout(function () {
    messages[i].classList.remove("d-none")
    i++;
    if (i < messages.length) {
      myLoop(i, messages);
    }
  }, 800)
}

export { sleepMessage };
