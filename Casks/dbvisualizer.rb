cask 'dbvisualizer' do
  version '9.5.6'
  sha256 'f88446ac1381c17b81be8635bf1e828678b6f6a94b1f7078ce1e22d67f2d3fe6'

  url "https://www.dbvis.com/product_download/dbvis-#{version}/media/dbvis_macos_#{version.dots_to_underscores}.dmg"
  name 'DbVisualizer'
  homepage 'https://www.dbvis.com/'

  app 'DbVisualizer.app'
  installer script: 'DbVisualizer Installer.app/Contents/MacOS/JavaApplicationStub',
            args:   ['-q', '-dir', staged_path.to_s],
            sudo:   false

  uninstall signal: [['TERM', 'com.dbvis.DbVisualizer']]

  zap delete: '~/.dbvis'

  caveats do
    depends_on_java('8')
  end
end
