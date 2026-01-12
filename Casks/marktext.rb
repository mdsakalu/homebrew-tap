cask "marktext" do
  version "0.18.6-mdsakalu.1"

  on_arm do
    sha256 "d0c7537b2b030981b95ef3a4921ce162bb0e7c19351c02b5c682a912790a3576"
    url "https://github.com/mdsakalu/marktext/releases/download/v#{version}/marktext-mac-arm64-#{version}.zip",
        verified: "github.com/mdsakalu/marktext/"
  end
  on_intel do
    sha256 "f96071bddd2b823ba72a14644261c3d2e202d6fe969a61a56aabca165161d83c"
    url "https://github.com/mdsakalu/marktext/releases/download/v#{version}/marktext-mac-x64-#{version}.zip",
        verified: "github.com/mdsakalu/marktext/"
  end

  name "MarkText"
  desc "Simple and elegant markdown editor (mdsakalu fork)"
  homepage "https://github.com/mdsakalu/marktext"

  auto_updates true
  depends_on macos: ">= :monterey"

  app "marktext.app"

  postflight do
    system_command "/usr/bin/xattr",
         args: ["-cr", "#{appdir}/marktext.app"],
         sudo: false
  end

  zap trash: [
    "~/Library/Application Support/marktext",
    "~/Library/Preferences/com.electron.marktext.plist",
    "~/Library/Saved Application State/com.electron.marktext.savedState",
  ]

  caveats <<~EOS
    MarkText is not notarized by Apple, but quarantine has been removed automatically.
    The app should launch without any Gatekeeper warnings.
  EOS
end
