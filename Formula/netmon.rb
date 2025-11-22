class Netmon < Formula
  desc "Network monitoring CLI tool"
  homepage "https://github.com/zzzzseong/netmon"
  version "1.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.1.3/netmon-darwin-amd64.tar.gz"
      sha256 "b1f103fcd66da65991e66b0db872eee94c89b69241f31e0a435d925253a098fa"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.1.3/netmon-darwin-arm64.tar.gz"
      sha256 "97c0ee7814bce9d8aafaf5818559415e2bb5a95757cb87e73d18143a5c00641a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.1.3/netmon-linux-amd64.tar.gz"
      sha256 "81284206b97c2f73a342c61aef213a28089bcbec780f785409fa7b8091f73afd"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.1.3/netmon-linux-arm64.tar.gz"
      sha256 "266b5ba83c58e53e71858529cb2af883ca68a8c2ca51ddc1eb93e87a6da6cf92"
    end
  end

  def install
    bin.install "netmon"
  end

  test do
    system "#{bin}/netmon", "help"
  end
end
