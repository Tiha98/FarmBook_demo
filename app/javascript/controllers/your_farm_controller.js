import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["menuButtonFarm", "dropdownMenuFarm"];
    connect() {
        this.setupEventListeners();
      }

      setupEventListeners() {
        this.menuButtonFarmTarget.addEventListener('click', this.toggleMenu.bind(this));
        document.addEventListener('click', this.closeMenu.bind(this));
      }
    
      toggleMenu(event) {
        this.dropdownMenuFarmTarget.classList.toggle('hidden');
        event.stopPropagation();  // Megakadályozza, hogy a dokumentum eseményre is reagáljon
      }
    
      closeMenu(event) {
        if (!this.menuButtonFarmTarget.contains(event.target) && !this.dropdownMenuFarmTarget.contains(event.target)) {
          this.dropdownMenuFarmTarget.classList.add('hidden');
        }
      }
}

