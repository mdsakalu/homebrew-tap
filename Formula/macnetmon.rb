class Macnetmon < Formula
  desc "Network interface bandwidth monitor for macOS"
  homepage "https://github.com/mdsakalu/macnetmon"
  url "https://github.com/mdsakalu/macnetmon/releases/download/v0.1.3/macnetmon-v0.1.3.tar.gz"
  sha256 "f5306a91ff50cf61cd0a090c94bd5ef3870e2e320136745dff6a36c3dfc73bfc"
  license "MIT"
  version "0.1.3"

  depends_on :macos

  def install
    bin.install "macnetmon"
  end

  test do
    assert_match "macnetmon", shell_output("#{bin}/macnetmon --version")
  end
end
