import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal"]

  connect() {
    console.log("Hello")
  }

  toggle() {
    console.log(this.modalTarget.classList)
  }
}
