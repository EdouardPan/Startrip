import "bootstrap";

import { loadDynamicBannerText } from '../components/banner';
import {initUpdateNavbarOnScroll } from '../components/navbar';
import "../plugins/flatpickr";
import { PrettySlider } from '../components/slider';

loadDynamicBannerText();
initUpdateNavbarOnScroll();
PrettySlider("myWaterRange", "waterDemo");
PrettySlider("myBreathabilityRange", "breathabilityDemo");
PrettySlider("myAsteroidAttackRange", "myAsteroidAttackdemo")


