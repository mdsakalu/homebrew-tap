class Herald < Formula
  desc "Modern macOS notification CLI built on UNUserNotificationCenter"
  homepage "https://github.com/mdsakalu/herald"
  url "https://github.com/mdsakalu/herald/releases/download/v0.1.0/herald-v0.1.0.tar.gz"
  sha256 "516a3cce57aad39fb6795c3a00606b93d7804f71e39b2a74ce76b8019b64d120"
  license "MIT"
  version "0.1.0"

  depends_on :macos

  def install
    prefix.install "Herald.app"
    bin.install_symlink prefix/"Herald.app/Contents/MacOS/herald"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herald --version")
  end
end
