cask "barista" do
  version "0.1.3"
  sha256 "bafb8101e39900b6338a7b6aa7901d7e529dc9e877e447d2cb2b32715e069d4a"

  url "https://github.com/mdsakalu/barista/releases/download/v0.1.3/Barista-macos.zip"
  name "Barista"
  desc "Menu bar app that wraps caffeinate for keep-awake control"
  homepage "https://github.com/mdsakalu/barista"

  app "Barista.app"

  postflight do
    system_command "/usr/bin/xattr",
      args: ["-cr", "#{appdir}/Barista.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.mdsakalu.barista.plist"
  ]
end
