class Macnetmon < Formula
  desc "Network interface bandwidth monitor for macOS"
  homepage "https://github.com/mdsakalu/macnetmon"
  url "https://github.com/mdsakalu/macnetmon/releases/download/v0.1.0/macnetmon-v0.1.0.tar.gz"
  sha256 "c8a04ab4b960380ffb48cb59101b129f7e6ff837ba37e1e61d435bbe0261f93a"
  license "MIT"
  version "0.1.0"

  depends_on :macos

  def install
    bin.install "macnetmon"
  end

  test do
    assert_match "macnetmon", shell_output("#{bin}/macnetmon --version")
  end
end
