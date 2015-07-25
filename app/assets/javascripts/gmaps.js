$(function() {

  var CityPickerMap = function() {
  };

  CityPickerMap.prototype.renderMap = function() {
    
    var styles = [{"elementType":"geometry","stylers":[{"hue":"#ff4400"},{"saturation":-68},{"lightness":-4},{"gamma":0.72}]},{"featureType":"road","elementType":"labels.icon"},{"featureType":"landscape.man_made","elementType":"geometry","stylers":[{"hue":"#0077ff"},{"gamma":3.1}]},{"featureType":"water","stylers":[{"hue":"#00ccff"},{"gamma":0.44},{"saturation":-33}]},{"featureType":"poi.park","stylers":[{"hue":"#44ff00"},{"saturation":-23}]},{"featureType":"water","elementType":"labels.text.fill","stylers":[{"hue":"#007fff"},{"gamma":0.77},{"saturation":65},{"lightness":99}]},{"featureType":"water","elementType":"labels.text.stroke","stylers":[{"gamma":0.11},{"weight":5.6},{"saturation":99},{"hue":"#0091ff"},{"lightness":-86}]},{"featureType":"transit.line","elementType":"geometry","stylers":[{"lightness":-48},{"hue":"#ff5e00"},{"gamma":1.2},{"saturation":-23}]},{"featureType":"transit","elementType":"labels.text.stroke","stylers":[{"saturation":-64},{"hue":"#ff9100"},{"lightness":16},{"gamma":0.47},{"weight":2.7}]}]

    var mapOptions = {
      zoom: 4, 
      scrollwheel: false,
      center: this.currentLocation,
      styles: styles
    };
    
    this.map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
    this.bounds = new google.maps.LatLngBounds();
  }

  CityPickerMap.prototype.addMarker = function(location, name) {
    var marker = new google.maps.Marker({
        position: location,
        map: this.map,
        title: name
    });
    this.bounds.extend(marker.position)
    this.repositionMap(location);
  };

  CityPickerMap.prototype.getCurrentLocation = function () {
    if (!navigator.geolocation) throw new Error("Geolocation is not available!");
      
    var options = {
      enableHighAccuracy: true,
      maximumAge: 30000,
      timeout: 60000
    };

    navigator.geolocation.getCurrentPosition(this.geolocateSuccess.bind(this),
                                             this.geolocateError.bind(this),
                                             options);
  };

  CityPickerMap.prototype.geolocateSuccess = function(position) {
    console.log("got position!");
    var lat = position.coords.latitude;
    var lon = position.coords.longitude;
    this.currentLocation = new google.maps.LatLng(lat, lon);
    this.renderMap();
    this.addMarker(this.currentLocation, "You!");
  }

  CityPickerMap.prototype.geolocateError = function(error) {
    console.log(error);
  }

  CityPickerMap.prototype.getCoords = function(address, name, callback) {

    var geocoder = new google.maps.Geocoder();
    geocoder.geocode( { 'address' : address}, function(response, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        var lat = response[0].geometry.location.A
        var lon = response[0].geometry.location.F
        var latLng = new google.maps.LatLng(lat, lon)
        callback(latLng, name);
      } else {
        alert("There was something wrong with your address");
      };
    });
  };

  CityPickerMap.prototype.repositionMap = function(location) {
    this.map.setCenter(location);
    this.map.setZoom(10);
  };

  CityPickerMap.prototype.resizeMap = function() {
    this.map.fitBounds(this.bounds);
  };

  var cityPickerMap = new CityPickerMap();
  cityPickerMap.getCurrentLocation();
})


