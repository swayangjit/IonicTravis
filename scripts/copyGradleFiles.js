module.exports = function (context) {
    var fs = require('fs');
    fs.copyFileSync("config/build-extras.gradle", "platforms/android/app/build-extras.gradle");
    fs.copyFileSync("config/ionic.properties", "platforms/android/gradle.properties");
}
