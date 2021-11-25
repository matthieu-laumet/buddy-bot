
const showCard = (item) => {

  const triggerBtns = document.querySelectorAll(".card-toggle");
  if (triggerBtns) {
    triggerBtns.forEach((triggerBtn) => {
      triggerBtn.addEventListener("click", (event) => {
        const element = document.querySelector(".card-target-" + triggerBtn.id);
        element.classList.toggle("hidden")
        triggerBtn.classList.toggle("rotate")
      });
    });
  }
}

export { showCard };
