import { Controller } from "stimulus"
import { useClickOutside } from 'stimulus-use'

export default class extends Controller {
  static targets = ["showed", "hidden"]
  static classes = [ "hidden" ]
  connect() {
    useClickOutside(this)
  }
  toggle(event) {
    const elements = [...this.hiddenTargets, ...this.showedTargets]
    elements.forEach((el, i) => {
      el.classList.toggle(this.hiddenClass)
    })
  }
  hide(event) {
    this.showedTargets.forEach((el, i) => {
      el.classList.remove(this.hiddenClass)
    })
    this.hiddenTargets.forEach((el, i) => {
      el.classList.add(this.hiddenClass)
    })
  }
  clickOutside(event) {
    this.hide()
  }
}
