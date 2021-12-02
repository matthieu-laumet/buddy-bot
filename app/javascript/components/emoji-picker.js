const emojiPicker = () => {
  const selectInput = document.querySelector(".input-for-emoji");

  if (selectInput) {
    const imputsFocus = document.querySelectorAll('input')
    imputsFocus.forEach(input => {
      input.addEventListener('focus', (event) => {
        if (document.querySelector('emoji-picker')) {
          document.querySelector('emoji-picker').remove();
        }
        input.insertAdjacentHTML('afterend', '<emoji-picker></emoji-picker>')
        document.querySelector('emoji-picker')
          .addEventListener('emoji-click', (e) => {
            input.value += e.detail.unicode;
          })
      })
    });

    const textAreaFocus = document.querySelectorAll('textarea')
    textAreaFocus.forEach(input => {
      input.addEventListener('focus', (event) => {
        if (document.querySelector('emoji-picker')) {
          document.querySelector('emoji-picker').remove();
        }
        input.insertAdjacentHTML('afterend', '<emoji-picker></emoji-picker>')
        document.querySelector('emoji-picker')
          .addEventListener('emoji-click', (e) => {
            input.value += e.detail.unicode;
          })
      })
    });
  }

}

  export { emojiPicker };
