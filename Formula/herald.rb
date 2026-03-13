class Herald < Formula
  desc "Modern macOS notification CLI built on UNUserNotificationCenter"
  homepage "https://github.com/mdsakalu/herald"
  url "https://github.com/mdsakalu/herald/archive/refs/tags/v#{version}.tar.gz"
  license "MIT"
  version "0.1.0"

  depends_on :macos
  depends_on xcode: ["15.0", :build]

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"

    # Create app bundle
    app_dir = libexec/"Herald.app/Contents"
    (app_dir/"MacOS").mkpath
    (app_dir/"Resources").mkpath

    cp buildpath/".build/release/Herald", app_dir/"MacOS/herald"

    # Stamp version into Info.plist
    inreplace "resources/Info.plist", "__VERSION__", version.to_s
    cp "resources/Info.plist", app_dir/"Info.plist"

    # Ad-hoc sign
    system "codesign", "--force", "--deep", "--sign", "-", libexec/"Herald.app"

    # Symlink binary into bin
    (bin/"herald").make_symlink(app_dir/"MacOS/herald")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herald --version")
  end
end
