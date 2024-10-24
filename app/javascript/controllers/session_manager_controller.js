import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["menuButton", "dropdownMenu"];
    connect() {
        this.setupEventListeners();
      }
    
      setupEventListeners() {
        this.menuButtonTarget.addEventListener('click', this.toggleMenu.bind(this));
        document.addEventListener('click', this.closeMenu.bind(this));
      }
    
      toggleMenu(event) {
        this.dropdownMenuTarget.classList.toggle('hidden');
        event.stopPropagation();  // Megakadályozza, hogy a dokumentum eseményre is reagáljon
      }
    
      closeMenu(event) {
        if (!this.menuButtonTarget.contains(event.target) && !this.dropdownMenuTarget.contains(event.target)) {
          this.dropdownMenuTarget.classList.add('hidden');
        }
      }
}