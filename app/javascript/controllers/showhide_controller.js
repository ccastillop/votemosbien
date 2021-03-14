import { Controller } from "stimulus";
//import { useClickOutside } from 'stimulus-use'

export default class extends Controller {
  static targets = ["element", "innerElement", "svgElement", "innerSvgElement"];
  connect() {
  }
  toggle(event) {
    this.elementTargets.forEach((el, i) => {
      el.classList.toggle("hidden");
    });
  }
}
