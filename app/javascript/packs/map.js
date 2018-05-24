import GMaps from 'gmaps/gmaps.js';
import { starMap } from '../components/customMap';

const mapElement = document.getElementById('map');
if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: 0, lng: 0 });

  map.addStyle({
    styles: starMap,
    mapTypeId: 'map_style'
  });
  map.setStyle('map_style');

  // var goldStar = {
  //   path: 'M 125,5 155,90 245,90 175,145 200,230 125,180 50,230 75,145 5,90 95,90 z',
  //   fillColor: 'yellow',
  //   fillOpacity: 0.8,
  //   scale: 1,
  //   strokeColor: 'gold',
  //   strokeWeight: 14
  // };

  const markers = JSON.parse(mapElement.dataset.markers);
  map.addMarkers(markers);
  if (markers.length === 0) {
    map.setZoom(2);
  } else if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    map.setZoom(6);
  } else {
    map.fitLatLngBounds(markers);
  }

}
