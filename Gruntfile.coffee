module.exports = (grunt)->
	grunt.initConfig {
		pkg: grunt.file.readJSON('package.json')
		coffee:
			compileJoined: {
				options:{
					join: true
				},
				files:{
					'dist/uiFlag.js':['src/directives/*.coffee'],
					'dist/uiFlagCss16.js':['src/directives/*.coffee', 'src/inlineCss/inline16.coffee'],
					'dist/uiFlagCss32.js':['src/directives/*.coffee', 'src/inlineCss/inline32.coffee'],
				}
			}
		uglify:
			uiFlag:{
				files: [{
					expand: true,
					cwd: 'dist/',
					src: ['*.js', '!*.min.js'],
					dest: 'dist/',
					ext: '.min.js'
				}]
			}
		imagemin:
			flags:{
				options:{
					optimizationLevel: 5
				}
				files:[{
					expand: true,
					cwd: 'bower_components/world-flags-sprite/images/',
					src: ['**/*.{png,jpg,gif}'],
					dest: 'dist/images/'
				}]
			}
		dataUri:
			flags: {
				src: ['dist/css/*.css'],
				dest: 'dist/css/',
				options: {
					target: [
						'dist/images/*'
					],
					fixDirLevel: true
				}
			}
		replace:
			flags:{
				src: ['dist/*.js'],
				dest: 'dist/',
				replacements:[{
					from: '@@CSS_16',
					to: -> grunt.file.read('dist/css/flags16.min.css')
				},
				{
					from: '@@CSS_32',
					to: -> grunt.file.read('dist/css/flags32.min.css')
				}]
			}
		cssmin:
			flags:{
				files: [{
					expand: true,
					cwd: 'bower_components/world-flags-sprite/stylesheets/',
					src: ['*.css', '!*.min.css'],
					dest: 'dist/css/',
					ext: '.min.css'
				}]
			}
	}

	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-contrib-uglify'
	grunt.loadNpmTasks 'grunt-data-uri'
	grunt.loadNpmTasks 'grunt-contrib-imagemin'
	grunt.loadNpmTasks 'grunt-text-replace'
	grunt.loadNpmTasks 'grunt-contrib-cssmin'

	grunt.registerTask 'default', 'coffee:compileJoined'
	grunt.registerTask 'dist-uglify', [
		'coffee:compileJoined',
		'imagemin:flags',
		'cssmin:flags',
		'dataUri:flags',
		'replace:flags',
		'uglify:uiFlag'
	]
