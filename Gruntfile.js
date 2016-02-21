(function() {
  module.exports = function(grunt) {
    grunt.initConfig({
      pkg: grunt.file.readJSON('package.json'),
      coffee: {
        compileJoined: {
          options: {
            join: true
          },
          files: {
            'dist/ui.flag.js': ['src/**/*.coffee']
          }
        }
      },
      uglify: {
        uiFlag: {
          files: {
            'dist/ui.flag.min.js': ['dist/ui.flag.js']
          }
        }
      }
    });
    grunt.loadNpmTasks('grunt-contrib-coffee');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.registerTask('default', 'coffee:compileJoined');
    return grunt.registerTask('dist-uglify', ['coffee:compileJoined', 'uglify:uiFlag']);
  };

}).call(this);
