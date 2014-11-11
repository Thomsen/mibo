# A sample Guardfile
# More info at https://github.com/guard/guard#readme

ignore %r{^ignored/path/}, /public/
filter /\.txt$/, /.*\.zip/

notification :growl_notify
notification :gntp, :host => '192.168.1.68'


group :frontend do

  guard :bundler do
    watch('Gemfile')
  end

end

logger level:       :warn,
       template:    '[:severity - :time - :progname] :message',
       time_format: 'at %I:%M:p',
       only:        [:rspec, :jasmine, 'coffeescript'],
       except:      :jammit,
       device:      'guard.log'
