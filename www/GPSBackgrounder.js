GPSBackgrounder = {

    initialize: function (success, error) {
        cordova.exec(success, error, 'GPSBackgrounder', 'initialize');
    },

    start: function (success, error) {
        cordova.exec(success, error, 'GPSBackgrounder', 'start');
    },

    stop: function (success, error) {
        cordova.exec(success, error, 'GPSBackgrounder', 'stop');
    },

    onPosition: function (position) {
        console.log (position);
    }

};

module.exports = GPSBackgrounder;