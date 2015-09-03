var gulp = require( "gulp" );
var uglify = require( "gulp-uglify" );
var rename = require( "gulp-rename" );

var sass = require( "gulp-sass" );

gulp.task( "default", [ "watch" ] );


// Compile Our Sass
gulp.task( "sass", function(){
    return gulp.src( "exercises/assets/sass/*.scss" )
        .pipe(
        	sass( {
	    		style: "expanded"
        	} )
        )
        .pipe( gulp.dest( "exercises/assets/css" ) );
});

gulp.task( "watch", function() {
	gulp.watch( "exercises/assets/sass/*.scss", [ "sass" ] );
});