cask "barista" do
  version "0.1.6"
  sha256 "3441a13c5200810350e60a441ccc993f3a7f4026e9197078564a852624519bdf"

  url "https://github.com/mdsakalu/barista/releases/download/v#{version}/Barista-macos.zip"
  name "Barista"
  desc "Menu bar app that wraps caffeinate for keep-awake control"
  homepage "https://github.com/mdsakalu/barista"

  depends_on macos: :ventura

  app "Barista.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Barista.app"]
  end

  zap trash: "~/Library/Preferences/com.mdsakalu.barista.plist"
end
