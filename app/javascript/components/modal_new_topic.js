const actionModal = () => {
  const modalBtn = document.querySelector('.modal-btn');
  const modalBtnOptions = document.querySelector('.modal-btn-options')
  const modalBg = document.querySelector('.modal-bg');
  const modalClose = document.querySelector('.modal-close');

  if (modalBtnOptions) {
    modalBtnOptions.addEventListener('click', (event) => {
      modalBg.classList.add('bg-active');
    })
  }

  if (modalBtn) {
    modalBtn.addEventListener('click', (event) => {
      modalBg.classList.add('bg-active');
    })
  }

  if (modalClose) {
    modalClose.addEventListener('click', (event) => {
      modalBg.classList.remove('bg-active');
    })
  }
}

export {actionModal};
