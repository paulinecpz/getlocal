import "bootstrap";

// CSS
import 'mapbox-gl/dist/mapbox-gl.css';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

// internal imports
import { initMapbox } from '../plugins/init_mapbox.js';
import { initAutocomplete } from '../plugins/init_autocomplete.js';


initMapbox();
initAutocomplete();

