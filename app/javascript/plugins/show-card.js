
const showCard = (item) => {
  const addCardInfos = document.querySelectorAll(".card-interaction-infos");
  const triggerBtns = document.querySelectorAll(".fa-chevron-down");
  if (triggerBtns) {
    triggerBtns.forEach((triggerBtn) => {
      triggerBtn.addEventListener("click", (event) => {
        addCardInfos.classList.toggle("hidden")
        triggerBtn.classList.toggle("rotate")
      });
    });
  }
}

export { showCard };
