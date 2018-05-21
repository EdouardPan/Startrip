import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Look at the stars", "This could be your home."],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
