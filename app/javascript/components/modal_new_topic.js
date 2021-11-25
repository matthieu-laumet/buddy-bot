const actionModal = () => {
  const modalBtn = document.querySelector('.modal-btn');
  const modalBg = document.querySelector('.modal-bg');
  const modalClose = document.querySelector('.modal-close');
  const modalCloseOption = document.querySelector('.modal-close-option');

  const triggerBtnOptions = document.querySelectorAll('.btn-notification')

  if (triggerBtnOptions) {
    triggerBtnOptions.forEach((triggerBtnOption) => {
      triggerBtnOption.addEventListener('click', (event) => {
        const element = document.querySelector("." + triggerBtnOption.id);
        element.classList.add('bg-active');
      })
    });
  }

  // if (modalCloseOption) {
  //   triggerBtnOptions.forEach((triggerBtnOption) => {
  //     modalCloseOption.addEventListener('click', (event) => {
  //       const element = document.querySelector("." + triggerBtnOption.id);
  //       element.classList.remove('bg-active');
  //     })
  //   })
  // }

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
