const showCard = (item) => {

  const triggerBtns = document.querySelectorAll(".card-toggle");
  if (triggerBtns) {
    triggerBtns.forEach((triggerBtn) => {
      triggerBtn.addEventListener("click", (event) => {
        const element = document.querySelector("." + triggerBtn.id);
        element.classList.toggle("hidden")
        triggerBtn.classList.toggle("rotate")
        // triggerBtn.style.transition = "width 5s ease-in-out 0s";
      });
    });
  }
}

export { showCard };
