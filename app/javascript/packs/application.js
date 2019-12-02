import "bootstrap";

// CSS
import 'mapbox-gl/dist/mapbox-gl.css';
// import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

// internal imports
import { initMapbox } from '../plugins/init_mapbox.js';
import { initAutocomplete } from '../plugins/init_autocomplete.js';
import { initGeotracker } from '../plugins/init_mapbox.js';
// import { carouselCards } from '../plugins/carousel_cards.js';

// import { injectCoordinates, injectMap } from '../plugins/init_geocode.js';


initMapbox();
initAutocomplete();
initGeotracker();
// carouselCards();
// injectMap();


(function($) {
    "use strict";

    // manual carousel controls
    $('.next').click(function(){ $('.carousel').carousel('next');return false; });
    $('.prev').click(function(){ $('.carousel').carousel('prev');return false; });
    
})(jQuery);