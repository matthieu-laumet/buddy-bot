// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import 'emoji-picker-element';

// Internal imports, e.g:
// import { btnDisable } from '../components/btns-option';
import { actionModal } from '../components/modal_new_topic';
import { showCard } from '../plugins/show-card';
import { updateEmail } from '../components/change_email_user.js';
import { updateName } from '../components/change_name_user.js';
import { sleepMessage } from '../plugins/sleep_message';
import { emojiPicker } from '../components/emoji-picker';


document.addEventListener('turbolinks:load', () => {
  // btnDisable()
  // initSelect2();
  actionModal();
  showCard();
  updateEmail();
  updateName();
  const messages = document.querySelectorAll(".d-none")
  if (messages.length !== 0) {
    sleepMessage();
  }
  emojiPicker();
});

import "controllers"
