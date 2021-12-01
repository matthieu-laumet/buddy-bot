const emojiPicker = () => {

  const imputsFocus = document.querySelectorAll('input')
  imputsFocus.forEach(input => {
    input.addEventListener('focus', (event) => {
      // console.log(input.value)
      if (document.querySelector('emoji-picker')) {
        document.querySelector('emoji-picker').remove();
      }
      input.insertAdjacentHTML('afterend', '<emoji-picker></emoji-picker>')
      document.querySelector('emoji-picker')
        .addEventListener('emoji-click', (e) => {
          input.value += e.detail.unicode;
        })
    })

    // input.addEventListener('focusout', (event) => {
    //   const emojiList = document.querySelector('emoji-picker')
    //   emojiList.remove();
    // })
  });

  const textAreaFocus = document.querySelectorAll('textarea')
  textAreaFocus.forEach(input => {
    input.addEventListener('focus', (event) => {
      // console.log(input.value)
      if (document.querySelector('emoji-picker')) {
        document.querySelector('emoji-picker').remove();
      }
      input.insertAdjacentHTML('afterend', '<emoji-picker></emoji-picker>')
      document.querySelector('emoji-picker')
        .addEventListener('emoji-click', (e) => {
          input.value += e.detail.unicode;
        })
    })

    // input.addEventListener('focusout', (event) => {
    //   const emojiList = document.querySelector('emoji-picker')
    //   emojiList.remove();
    // })
  });

  // const textAreaFocus = document.querySelectorAll('textarea')
  // textAreaFocus.forEach(text => {
  //   text.addEventListener('focus', (event) => {
  //     text.insertAdjacentHTML('afterend', '<emoji-picker></emoji-picker>')
  //     // console.log(text.value)
  //     document.querySelector('emoji-picker')
  //       .addEventListener('emoji-click', (e) => {
  //         text.value += e.detail.unicode;
  //       })
  //   })
  // });
}

  export { emojiPicker };
