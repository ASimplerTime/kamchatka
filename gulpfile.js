var gulp = require('gulp');

var gutil = require('gulp-util');

var sasslint = require('gulp-scss-lint');
var sass = require('gulp-sass');
var minify_css = require('gulp-minify-css');

var coffee = require('gulp-coffee');
var uglify = require('gulp-uglify');

gulp.task('sass', function() {
  // Compiles src/scss to res/css
  gulp.src('./src/scss/*.scss')
    .pipe(sass({includePaths:['/src/scss/']}))
    .pipe(gulp.dest('./res/css'));
});

gulp.task('scss-lint', function() {
  gulp.src('./src/scss/*.scss')
    .pipe(sasslint())
    .pipe(sasslint.failReporter('E'));
});

gulp.task('css-minify', function() {
  return gulp.src('./res/css/*.css')
    .pipe(minify_css())
    .pipe(gulp.dest('./res/css'));
});

gulp.task('coffee', function() {
  // Compiles src/cs to res/js
  gulp.src('./src/cs/*.coffee')
    .pipe(coffee({bare: true}).on('error', gutil.log))
    .pipe(gulp.dest('./res/js'));
});

gulp.task('move-images', function() {
  return gulp.src('./src/images/*')
    .pipe(gulp.dest('./res/images'));
});

gulp.task('move-textures', function() {
  return gulp.src('./src/textures/*')
    .pipe(gulp.dest('./res/textures'));
});

gulp.task('move-audio', function() {
  return gulp.src('./src/audio/*')
    .pipe(gulp.dest('./res/audio'));
});

gulp.task('move-lang', function() {
  return gulp.src('./src/lang/*')
    .pipe(gulp.dest('./res/lang'));
});

gulp.task('default', ['scss-lint', 'sass', 'css-minify', 'coffee', 'move-images', 'move-textures', 'move-audio', 'watch']);

gulp.task('watch', function() {
  gulp.watch('./src/scss/*.scss', function() {
    gulp.run('scss-lint', 'sass', 'css-minify');
  });
  
  gulp.watch('./src/cs/*.coffee', function() {
    gulp.run('coffee');
  });
  
  gulp.watch('./src/images/*', function() {
    gulp.run('move-images');
  });
  gulp.watch('./src/textures/*', function() {
    gulp.run('move-textures');
  });
  gulp.watch('./src/audio/*', function() {
    gulp.run('move-audio');
  });
})

// Coffee logging

var coffeeStream = coffee({bare: true});
 
// Error listener for coffee
coffeeStream.on('error', gutil.log);