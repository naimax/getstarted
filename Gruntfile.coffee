module.exports = (grunt) ->

  # Load tasks
  require('matchdep').filterDev('grunt-*').forEach grunt.loadNpmTasks

  # Directories
  assets = "app/assets"
  # CoffeeScript files (modules, Angular controllers, etc.)
  coffee = "#{assets}/js"
  # CoffeeScript test files
  partials = "app/views/shared/**"
  # Stylus imports (variables, mixins, etc.)
  imports = "#{assets}/css/import"
  # Stylus modules
  stylus = "#{assets}/css/modules"
  # Compiled & minifies JS
  js = "#{assets}/vendor"
  # Compiled & minified CSS
  css = "public/css"

  # Project configuration
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    coffee:
      options:
        bare: true
      app:
        src:  'app/assets/coffee/**/*.coffee'
        dest: 'public/build/js/app.js'

    ngmin:
      dist:
        src: 'public/build/js/app.js'
        dest: 'public/build/js/app.js'

    uglify:
      app_js:
        src: "public/build/js/app.js"
        dest: "public/build/js/app.min.js"


    jade:
      compile:
        options:
          pretty: true

        files: [
          expand: true
          cwd: "app/views/shared/"
          src: ["**/*.html.jade"]
          dest: 'public/build/shared/'
          ext: '.html'
        ]

    coffeelint:
      options:
        'no_trailing_whitespace':
          'level': 'ignore'
        'max_line_length':
          'level': 'ignore'
        'no_empty_param_list':
          'level': 'ignore'
        'indentation':
          'level': 'ignore'
        'arrow_spacing':
          'level': 'ignore'
        'duplicate_key': 
          'level': 'ignore'
      app: ['app/assets/coffee/**/*.coffee']

    jshint:
      all: ['app/controllers/**/*.js','app/models/**/*.js', 'app/helpers/**/*.js']

    stylus:
      options:
        compress: true
      app:
        src: [ "#{stylus}/*.styl", "#{imports}/*.styl" ]
        dest: "#{css}/app.css"

    concat:
      app_css:
        src: ['public/css/app.css', 'public/css/jquery-ui.min.css']
        dest: 'public/build/css/build.css'


    cssmin:
      options:
        report: 'min'
        banner: '/* rbt-kartel css file */'
      compress:
        files:
          'public/build/css/build.min.css':'public/build/css/build.css'

    clean:
      options:
        force: true
      src: ['public/build/css/build.css']

  # Default task
  # Compile, compress, clean
  grunt.registerTask 'default', [
    'coffeelint'
    'coffee'
    'jshint'
    'ngmin'
    'uglify'
    'stylus'
    'concat'
    'cssmin'
    'jade'
    'clean'
  ]

