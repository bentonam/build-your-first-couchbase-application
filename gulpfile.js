var gulp = require( "gulp" );
var uglify = require( "gulp-uglify" );
var rename = require( "gulp-rename" );

var sass = require( "gulp-sass" );

gulp.task( "default", [ "compress", "watch" ] );


// Compile Our Sass
gulp.task( "sass", function(){
	console.log("sass it");
    return gulp.src( "exercises/assets/sass/*.scss" )
        .pipe(
        	sass( {
	    		style: "expanded"
        	} )
        )
        .pipe( gulp.dest( "exercises/assets/css" ) );
});

gulp.task( "compress", function() {
	return gulp.src( "exercises/assets/js/*.js" )
    		.pipe( uglify() )
    		.pipe(
    			rename( {
	    			extname: ".min.js"
	    		} )
	    	)
			.pipe( gulp.dest( "exercises/assets/js/" ) );
} );

gulp.task( "watch", function() {
	gulp.watch( "exercises/assets/sass/*.scss", [ "sass" ] );
	gulp.watch( "exercises/assets/js/*.js", [ "compress" ] );
});