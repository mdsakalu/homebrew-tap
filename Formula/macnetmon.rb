class Macnetmon < Formula
  desc "Network interface bandwidth monitor for macOS"
  homepage "https://github.com/mdsakalu/macnetmon"
  url "https://github.com/mdsakalu/macnetmon/releases/download/v0.1.2/macnetmon-v0.1.2.tar.gz"
  sha256 "958ac5f7990bd915ed5305598e9a68870f2c39874149615f6bdf9ff2ecd3ea7c"
  license "MIT"
  version "0.1.2"

  depends_on :macos

  def install
    bin.install "macnetmon"
  end

  test do
    assert_match "macnetmon", shell_output("#{bin}/macnetmon --version")
  end
end
