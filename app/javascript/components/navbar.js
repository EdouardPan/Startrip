function initUpdateNavbarOnScroll() {
  const navbar = document.querySelector('.navbar-wagon');
  window.addEventListener('scroll', () => {
    if (window.scrollY >= 100) {
      console.log("1er cas");
      navbar.classList.add('navbar-wagon-black');
    } else {
      console.log("2ème cas")
      navbar.classList.remove('navbar-wagon-black');
    }
  });
}

export { initUpdateNavbarOnScroll };
