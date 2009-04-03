$LOAD_PATH << File.join('~/Cappuccino/trunk', 'Rake')

require 'objective-j'
require 'objective-j/bundletask'

$BUILD_DIR = "#{ENV['STEAM_BUILD']}"
$CONFIGURATION = 'Release'
$BUILD_PATH = File.join($BUILD_DIR, $CONFIGURATION, 'Editor')

ObjectiveJ::BundleTask.new(:Editor) do |t|
    t.name          = 'XYZRadio'
    t.identifier    = 'com.xyzradio'
    t.version       = '1.0'
    t.author        = 'Alos'
    t.email         = 'alos @nospam@ me.com'
    t.summary       = 'IP Radio based system'
    t.sources       = FileList['*.j']
    t.resources     = FileList['Resources/*']
    t.license       = ObjectiveJ::License::LGPL_v2_1
    t.build_path    = $BUILD_PATH
    t.flag          = 'DEBUG' if $CONFIGURATION == 'Debug'
end

task :default => [:XYZRadio]
