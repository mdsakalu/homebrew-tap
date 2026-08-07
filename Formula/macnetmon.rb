class Macnetmon < Formula
  desc "Network interface bandwidth monitor for macOS"
  homepage "https://github.com/mdsakalu/macnetmon"
  url "https://github.com/mdsakalu/macnetmon/releases/download/v0.1.5/macnetmon-v0.1.5.tar.gz"
  sha256 "d4cca8797f3b88375416d2c4cb8989ee8d4cd9642b98e9dd23e6c207cacdb980"
  license "MIT"
  version "0.1.5"

  depends_on :macos

  def install
    bin.install "macnetmon"
  end

  test do
    assert_match "macnetmon", shell_output("#{bin}/macnetmon --version")
  end
end
