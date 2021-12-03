// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.
import { displayChat } from '../components/choose_ride_btn';

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

const btn = document.querySelector('.btn-choose-ride');
btn.addEventListener('click', displayChat);