'use strict';

const gulp = require('gulp');
const replace = require('gulp-replace');
const concat = require('gulp-concat');
const fs = require('fs');

gulp.task('default', () => {
  gulp.src('./slides/*.md')
    .pipe(concat('combined_slides.md'))
    .pipe(gulp.dest('dist'))
    .on('end', () => {
      const allSlides = fs.readFileSync("./dist/combined_slides.md", 'utf8');
      gulp.src(["./template/index.html"])
        .pipe(replace('<!--Replaceme-->', allSlides))
        .pipe(gulp.dest('dist'))
    })
});
