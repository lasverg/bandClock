"use strict";

module.exports = function(grunt) {

    // loadNpmTasks
    require('load-grunt-tasks')(grunt);
    require('time-grunt')(grunt);

    // Grunt Config
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),


        watch: {
            src: {
                files: '*.coffee',
                tasks: ['coffee', 'uglify'],
                options: {
                    spawn: false
                }
            },
            gruntfile: {
                files: ['Gruntfile.js']
            }
        },

        coffee: {
            compile: {
                options: {
                    sourceMap: false
                },
                files: {
                    '<%= pkg.name %>.js': 'bandClock.coffee'
                }
            }
        },
        clean: {
            build: {
                src: ["<%= pkg.name %>.js", "<%= pkg.name %>.min.js", "<%= pkg.name %>.js.map"]
            }
        },

        uglify: {
            dist: {
                options: {
                    mangle: {
                        except: ['jQuery']
                    }
                },
                files: {
                    '<%= pkg.name %>.min.js': ['<%= pkg.name %>.js']
                }
            }
        },

        jshint: {
            options: {
                jshintrc: '.jshintrc',
                reporter: require('jshint-stylish')
            },
            src: {
                src: [
                    'Gruntfile.js',
                    '<%= pkg.name %>.js'
                ]
            },
            test: {
                options: {
                    jshintrc: '.jshintrc'
                },
                src: ['unit.test.js']
            }
        },

        jsbeautifier: {
            files: ['<%= pkg.name %>.js', 'test/**/*.js'],
            options: {
                js: {
                    indentSize: 4,
                    indentChar: " ",
                    fileTypes: ['.js', '!.min.js'],
                    "end_with_newline": true
                }

            }
        },

        karma: {
            unit: {
                configFile: 'karma.conf.js'
            }
        }


    });

    // registerTasks
    grunt.registerTask('start', ['watch']);
    grunt.registerTask('default', ['clean','coffee', 'uglify']);
    grunt.registerTask('test', ['karma:unit']);
    grunt.registerTask('all', ['default', 'test']);
};
