
const showCard = (item) => {
  const addCardInfos = document.querySelector(".card-interaction-infos");
  const triggerBtn = document.querySelector(".fa-sort-down");
    triggerBtn.addEventListener("click", (event) => {
      addCardInfos.classList.toggle("hidden")
      triggerBtn.classList.toggle("rotate")
    });
}

export { showCard };
