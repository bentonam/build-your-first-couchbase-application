var gulp = require( "gulp" );
var uglify = require( "gulp-uglify" );
var rename = require( "gulp-rename" );

var sass = require( "gulp-sass" );

gulp.task( "default", [ "compress", "watch" ] );


// Compile Our Sass
gulp.task( "sass", function(){
	console.log("sass it");
    return gulp.src( "exercises/final/assets/sass/*.scss" )
        .pipe(
        	sass( {
	    		style: "expanded"
        	} )
        )
        .pipe( gulp.dest( "exercises/final/assets/css" ) );
});

gulp.task( "compress", function() {
	return gulp.src( "exercises/final/assets/js/*.js" )
    		.pipe( uglify() )
    		.pipe(
    			rename( {
	    			extname: ".min.js"
	    		} )
	    	)
			.pipe( gulp.dest( "exercises/final/assets/js/" ) );
} );

gulp.task( "watch", function() {
	gulp.watch( "exercises/final/assets/sass/*.scss", [ "sass" ] );
	gulp.watch( "exercises/final/assets/js/*.js", [ "compress" ] );
});