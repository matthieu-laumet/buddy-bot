const emojiPicker = () => {
  document.querySelector('emoji-picker')
    .addEventListener('emoji-click', (e) => {
      document.querySelector('#option_title').value += e.detail.unicode;
      // document.querySelector('#option_title').insertAdjacentText('beforeend', e.detail.unicode));
    })
}

  export { emojiPicker };
