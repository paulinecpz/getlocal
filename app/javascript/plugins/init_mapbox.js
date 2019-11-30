import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';


const mapElement = document.getElementById('map');
const geoTracker = document.getElementById('geolocation');


const buildMap = () => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/navigation-guidance-day-v4'
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // add this

    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url('${marker.image_url}')`;
    element.style.backgroundSize = 'contain';
    element.style.width = '38px';
    element.style.height = '40px';

    new mapboxgl.Marker(element)
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup) // add this
      .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};






const initMapbox = () => {
  if (mapElement) {
    const map = buildMap();
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
    map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
                                          mapboxgl: mapboxgl }));
    // initGeotracker();

    // const geolocate = new mapboxgl.GeolocateControl({
    //       positionOptions: {
    //       enableHighAccuracy: true
    //       },
    //       trackUserLocation: true
    //       });
    // map.addControl(geolocate)

  }
};

const initGeotracker = () => {
  if (geoTracker) {
      geoTracker.addEventListener('submit', (event) => {
      // prevent form's default behavior
        event.preventDefault();
          const map = buildMap();
          const geolocate = new mapboxgl.GeolocateControl({

          positionOptions: {
          enableHighAccuracy: true
          },
          trackUserLocation: true
          });
          map.addControl(geolocate);

        map.on('load', function(){
          geolocate.trigger();
        });
      });
  }
};

export { initGeotracker };
export { initMapbox };