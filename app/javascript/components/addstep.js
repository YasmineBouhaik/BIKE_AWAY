import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const fetchCoordinates = (step, map) => {
  fetch(`https://api.mapbox.com/geocoding/v5/mapbox.places/${step}.json?access_token=pk.eyJ1IjoicnRkeCIsImEiOiJja3ZtajJlZnkwaHV4MnFxZnJtN3FnbXphIn0.O1Eb4fD2EF_yZfdZPxss4A`)
    .then(response => response.json())
    .then((data) => {
      console.log(data);
      const marker = (data["features"][0]["geometry"]["coordinates"]);
      new mapboxgl.Marker()
        .setLngLat(marker)
        .addTo(map);
      const bounds = new mapboxgl.LngLatBounds();
      bounds.extend(marker);
      map.fitBounds(bounds, { padding: 70, maxZoom: 8 });
    });
};

const addStepToItinerary = (map) => {
  const hiddenform = document.querySelector(".hidden-form");
  const input = document.querySelector("#input");
  const addstep = document.querySelector("#addstep");
  if (addstep) {
    addstep.addEventListener("click", (event) => {
      hiddenform.insertAdjacentHTML("beforeend", `<div id="${input.value}" class="city"> ${input.value} <input type="hidden" name="steps[][address]" value="${input.value}" ></div>`);
      fetchCoordinates(input.value, map);
      // removeStepFromItinerary(); active it if we want to remove step while creating itinerary
    });
  }
}

const removeStepFromItinerary = () => {
  const cities = document.querySelectorAll(".city");
  if (cities) {
    cities.forEach((city) => {
      city.addEventListener("click", (event) => {
        city.remove();
      });
    })
  }
}

export { addStepToItinerary };
export { removeStepFromItinerary };
