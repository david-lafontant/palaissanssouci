import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="offcanvas"
export default class extends Controller {
  connect() {
    (() => {
    
      document.querySelector('#navbarSideCollapse').addEventListener('click', () => {
        document.querySelector('.offcanvas-collapse').classList.toggle('open')
      })
    })()
  }
}
