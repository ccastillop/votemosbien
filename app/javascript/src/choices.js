import Choices from "choices.js";

document.addEventListener("turbo:load", event => {
  const elements = document.querySelectorAll(".js-choice");
  console.log(`choices: ${elements.length}`);
  elements.forEach((el, i) => {
    let ch = new Choices(el, {
      removeItemButton: true,
      noResultsText: 'Sin resultados',
      noChoicesText: '---',
      itemSelectText: '↵'
    });
  });
});
