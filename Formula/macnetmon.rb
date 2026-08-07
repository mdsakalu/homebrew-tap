class Macnetmon < Formula
  desc "Network interface bandwidth monitor for macOS"
  homepage "https://github.com/mdsakalu/macnetmon"
  url "https://github.com/mdsakalu/macnetmon/releases/download/v0.1.4/macnetmon-v0.1.4.tar.gz"
  sha256 "63592554144f2ffe2b066c1f17f352f411d9de0781ba7c4fedb9c412440eda54"
  license "MIT"
  version "0.1.4"

  depends_on :macos

  def install
    bin.install "macnetmon"
  end

  test do
    assert_match "macnetmon", shell_output("#{bin}/macnetmon --version")
  end
end
