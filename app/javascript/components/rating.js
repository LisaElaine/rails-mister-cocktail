function ratingHover() {

  const stars = document.querySelector('#stars-existing')
  const stars_children = stars.children

  document.addEventListener("mouseover", (event) => {
    const star = document.querySelector(':hover')
    star.classList.add('active');
    ("i.active").prevAll().css({"color": "red", "border": "2px solid red"});

  });
}

export { ratingHover };
