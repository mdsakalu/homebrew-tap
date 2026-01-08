class Macnetmon < Formula
  desc "Network interface bandwidth monitor for macOS"
  homepage "https://github.com/mdsakalu/macnetmon"
  url "https://github.com/mdsakalu/macnetmon/releases/download/v0.1.1/macnetmon-v0.1.1.tar.gz"
  sha256 "fc5f0dd3c94af7366b33baf6e8412edce2f32c2d334f32bcf390440403daff99"
  license "MIT"
  version "0.1.1"

  depends_on :macos

  def install
    bin.install "macnetmon"
  end

  test do
    assert_match "macnetmon", shell_output("#{bin}/macnetmon --version")
  end
end
