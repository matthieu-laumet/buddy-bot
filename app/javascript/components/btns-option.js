const btnDisable = () => {

  const btns = document.querySelectorAll('.btn-active');
  let index = 0;

  btns.forEach(btn => {
    btn.addEventListener('click', (event) => {
      index = btn.getAttribute("data")
      btns.forEach(btn => {
        if (index != btn.getAttribute("data") ) {
          event.preventDefault()
          console.log(btn);
          btn.classList.add("btn-disable");
          btn.disable = true
        }
      })
    })
  });

}

export { btnDisable }
