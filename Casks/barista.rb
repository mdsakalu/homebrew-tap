cask "barista" do
  version "0.1.4"
  sha256 "876b4d957499db3547a7f7077f38970dc49d42bcc044b7785a9855f28505837c"

  url "https://github.com/mdsakalu/barista/releases/download/v0.1.4/Barista-macos.zip"
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
