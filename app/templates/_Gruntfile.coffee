module.exports = (grunt) ->
  sources = "src/*.js";
  
  gruntConfig =
    pkg: grunt.file.readJSON("package.json")
    
    coffee:
      compile:
        options:
          sourceMap: false
          join: true
        expand: true,
        flatten: true,
        cwd: "src",
        src: [ "*.coffee" ],
        dest: "dist/",
        ext: ".js"
        
    mochaTest:
      test:
        options:
          reporter: "spec"
        src: [ "test/*.coffee" ]        
        
    clean: [ "dist/" ]
  
  grunt.initConfig(gruntConfig);

  grunt.loadNpmTasks("grunt-mocha-test")
  grunt.loadNpmTasks("grunt-coffeelint");
  grunt.loadNpmTasks("grunt-contrib-coffee")
  grunt.loadNpmTasks("grunt-contrib-concat")
  grunt.loadNpmTasks("grunt-contrib-uglify")
  grunt.loadNpmTasks("grunt-contrib-clean")
  
  grunt.registerTask("default", [ "clean", "coffee" ])
  grunt.registerTask("test", [ "mochaTest" ])