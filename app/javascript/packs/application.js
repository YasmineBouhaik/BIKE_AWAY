// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import { loadDynamicBannerText } from '../components/banner';
import { addStepToItinerary, removeStepFromItinerary } from '../components/addstep';
import { initMapbox } from '../plugins/init_mapbox';
import { btnClick } from '../components/choose_ride_btn';
import { heartClick } from '../components/vote_btn';

Rails.start()
Turbolinks.start()
ActiveStorage.start()


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";


// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
  // map
document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();

  initMapbox();
  loadDynamicBannerText();
  addStepToItinerary();
  removeStepFromItinerary();
  
  heartClick();



});
