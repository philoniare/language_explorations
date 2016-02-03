var gulp  = require('gulp'),
    watch = require('gulp-watch'),
    run   = require('gulp-run');


// Automatically refreshing perl
gulp.task('watch-perl', ['watch-perl'])

gulp.task('run-perl', function(){
  run('perl perl/intro.pl').exec();
});

gulp.task('watch-perl', function(){
  gulp.watch('perl/*.pl', ['run-perl']);
});
