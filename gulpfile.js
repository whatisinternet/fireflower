'use strict';

const gulp = require('gulp');
const replace = require('gulp-replace');
const concat = require('gulp-concat');
const fs = require('fs');
const base64Img = require('base64-img');
const del = require('del');
const watch = require('gulp-watch');
const runSequence = require('run-sequence')

gulp.task('compile', () => {
  gulp.src('./slides/*.md')
    .pipe(concat('combined_slides.md'))
    .pipe(gulp.dest('dist'))
    .on('end', () => {
      const allSlides = fs.readFileSync("./dist/combined_slides.md", 'utf8');
      gulp.src(["./dist/index.html"])
        .pipe(replace('<!--Replaceme-->', allSlides))
        .pipe(replace('---\n\n    </textarea>', '\n    </textarea>'))
        .pipe(gulp.dest('dist'))
    })
});

gulp.task('css', () => {
  const allSlides = fs.readFileSync("./assets/css/remark.css", 'utf8');
  gulp.src(["./template/index.html"])
    .pipe(replace('<!--ReplacemeWithCss-->', allSlides))
    .pipe(gulp.dest('dist'))
});

gulp.task('html-images', () => {
  gulp.src(["./dist/index.html"])
    .pipe(replace(/img.*src=(".*" |".*" )/, (src) => {
      const imageSource = src.match(/img.*src="(.*)"/)
      return `img src=${base64Img.base64Sync(imageSource[1].slice(1))} `;
    }))
    .pipe(gulp.dest('dist'))
});

gulp.task('css-images', () => {
  gulp.src(["./dist/index.html"])
    .pipe(replace(/background:*.url\((".*" |".*")/, (src) => {
      const imageSource = src.match(/background:*.url\("(.* |.*)"/)
      return `background: url(${base64Img.base64Sync(imageSource[1].slice(1))} `;
    }))
    .pipe(gulp.dest('dist'))
});

gulp.task('clean', () => {
  return del([
    './dist/*.html',
    './dist/*.md',
    './dist',
  ]);
})

gulp.task('watch', () => {
  gulp.watch([
    'assets/**/*.css',
    'assets/**/*.png',
    'assets/**/*.jpg',
    'slides/**/*.md'
  ], [
    'default'
  ]);
})

gulp.task('default', () => {
  runSequence('clean', 'compile', 'css', 'html-images', 'css-images');
})
