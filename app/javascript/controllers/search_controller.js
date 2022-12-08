import { Controller } from "@hotwired/stimulus"
// Connects to data-controller="search"
export default class extends Controller {
  static targets = [ "form" ]
  timeout = null
  

  submit_query() {
    clearTimeout(this.timeout)
    this.debounce(() =>  this.formTarget.requestSubmit())
  }

  debounce(callback) {
    //Add a delay to the search query
    this.timeout = setTimeout(callback, 300)
  }



}
