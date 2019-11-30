import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';
import { initMapbox } from '../plugins/init_mapbox.js';


const geoTracker = document.getElementById('geolocation');
    const map = buildMap();

const initGeotracker = () => {
  if (geoTracker) {
      geoTracker.addEventListener('submit', (event) => {
      // prevent form's default behavior
        event.preventDefault();

		initMapbox();
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
      // geoTracker.addEventListener('submit', (event) => {
      // // prevent form's default behavior
      //   event.preventDefault();

          // const geolocate = new mapboxgl.GeolocateControl({
          // positionOptions: {
          // enableHighAccuracy: true
          // },
          // trackUserLocation: true
          // });

      // //     map.addControl(geolocate);


      // // // geolocate.on('geolocate', function()
      // // // {
      // // //   //Get the updated user location, this returns a javascript object.
      // // //   const userlocation = geolocate._lastKnownPosition;
      // // //   //Your work here - Get coordinates like so
      // // //   const lat = userlocation.coords.latitude;
      // // //   const lng = userlocation.coords.longitude;
      // // //   });

      // // map.on('load', function()
      // // {
      // //   geolocate.trigger();

      // // });

      // });



export { initGeotracker };