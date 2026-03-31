class Herald < Formula
  desc "Modern macOS notification CLI built on UNUserNotificationCenter"
  homepage "https://github.com/mdsakalu/herald"
  url "https://github.com/mdsakalu/herald/releases/download/v0.2.0/herald-v0.2.0.tar.gz"
  sha256 "d09bef12690a7a75ba2bd1aa793b574b964f2fdcecbe44b7309dcedde2e59b01"
  license "MIT"
  version "0.2.0"

  depends_on :macos

  def install
    prefix.install "Herald.app"
    bin.install_symlink prefix/"Herald.app/Contents/MacOS/herald"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herald --version")
  end
end
