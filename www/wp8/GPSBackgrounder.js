GPSBackgrounder = {

	watchID: null,

    initialize: function (success, error) {

        if (success) {
        	success ();
        }
    },

    start: function (success, error) {

    	try {
			this.watchID = navigator.geolocation.watchPosition(function (p) {				
				this.onPosition ({
					latitude: p.coords.latitude, 
					longitude: p.coords.longitude, 
					speed: p.coords.speed, 
					timestamp: p.timestamp, 
					accuracy: p.coords.horizontalAccuracy
				});
			}.bind(this),
			function (e) {
			    console.log(e);
			},
			{ 
			    enableHighAccuracy: true 
			});

			if (success) {
				success ();
			}

    	} catch (e) {
    		if (error) {
    			error (e);
    		}
    	}
    },

    stop: function (success, error) {
        try {
        	navigator.geolocation.clearWatch(this.watchID);
			if (success) {
				success ();
			}        	
        } catch (e) {
    		if (error) {
    			error (e);
    		}        	
        }     
    },

    onPosition: function (position) {
        console.log (position);
    }

};

module.exports = GPSBackgrounder;