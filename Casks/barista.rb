cask "barista" do
  version "0.1.7"
  sha256 "4ad4406953226d6c3c23d91ee25947d819349fa59920f9653ee28616d73af32c"

  url "https://github.com/mdsakalu/barista/releases/download/v#{version}/Barista-macos.zip"
  name "Barista"
  desc "Menu bar app that wraps caffeinate for keep-awake control"
  homepage "https://github.com/mdsakalu/barista"

  depends_on macos: :ventura

  app "Barista.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Barista.app"]
  end

  zap trash: "~/Library/Preferences/com.mdsakalu.barista.plist"
end
