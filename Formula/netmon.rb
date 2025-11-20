class Netmon < Formula
  desc "Network monitoring CLI tool"
  homepage "https://github.com/zzzzseong/netmon"
  version "1.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.1.2/netmon-darwin-amd64.tar.gz"
      sha256 "5e413b7d01f46769cb4a5ad96fbec68cda2da39e4e7179e6e3059142072cad13"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.1.2/netmon-darwin-arm64.tar.gz"
      sha256 "eaf9d672a1bf21785be54ce5c9dec5c239ff8f0d23e1e3a2a295c7f8d0972e7f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.1.2/netmon-linux-amd64.tar.gz"
      sha256 "1187b0b143917dac5412a4c750e0c3d1f4136665c89a955df8909025f48ad9cc"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.1.2/netmon-linux-arm64.tar.gz"
      sha256 "121272c477848457f9e7b81c188cf33d5761e1b49db35b10de09b1874bcd5f84"
    end
  end

  def install
    bin.install "netmon"
  end

  test do
    system "#{bin}/netmon", "help"
  end
end
