import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["latitude", "longitude", "name"]

    connect() {
        // Latitude és longitude célpontok lekérése
        console.log('ssd');
        const latitude = this.latitudeTarget.dataset.latitude;
        const longitude = this.longitudeTarget.dataset.longitude;
        const fieldName = this.nameTarget.dataset.name; // Név lekérése

        // Leaflet térkép inicializálása
        var map = L.map('map').setView([latitude, longitude], 15);

        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 19,
        }).addTo(map);

        L.marker([latitude, longitude]).addTo(map)
            .bindPopup('Field location: ' + fieldName) // Név használata a popupban
            .openPopup();
    }
}