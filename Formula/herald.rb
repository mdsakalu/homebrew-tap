class Herald < Formula
  desc "Modern macOS notification CLI built on UNUserNotificationCenter"
  homepage "https://github.com/mdsakalu/herald"
  url "https://github.com/mdsakalu/herald/releases/download/v0.3.0/herald-v0.3.0.tar.gz"
  sha256 "2ae06f705cb79b23e2fcc10805f7bfad624d5da05f9fdd4f8699f3e38e72fefa"
  license "MIT"

  depends_on :macos

  def install
    prefix.install "Herald.app"
    bin.install_symlink prefix/"Herald.app/Contents/MacOS/herald"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herald --version")
  end
end
