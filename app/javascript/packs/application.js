import "bootstrap";

import { loadDynamicBannerText } from '../components/banner';
import {initUpdateNavbarOnScroll } from '../components/navbar';
import { PrettySlider } from '../components/slider';
import "../plugins/flatpickr";

const mapElement = document.getElementById('banner-typed-text');
if (mapElement){
  loadDynamicBannerText();
}

initUpdateNavbarOnScroll();


