class Netmon < Formula
  desc "Network monitoring CLI tool"
  homepage "https://github.com/zzzzseong/netmon"
  version "1.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.1.1/netmon-darwin-amd64.tar.gz"
      sha256 "bda97dcec48644d9983aba0979fc0ad9b513dc3630e08593d6240f77bf52a118"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.1.1/netmon-darwin-arm64.tar.gz"
      sha256 "87cb26c137ed4639f7b335fd8a089e5a3b7eb333f0ead9ebe776eb789de60be1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.1.1/netmon-linux-amd64.tar.gz"
      sha256 "aed988e6219b36a8dff7b8ddc13210a1056b46c3a76c42144f9ee9a5df7cc361"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.1.1/netmon-linux-arm64.tar.gz"
      sha256 "cda959525ca362b625d1403cd44305bf1e73e55938e70f6e474d8159fad97eb2"
    end
  end

  def install
    bin.install "netmon"
  end

  test do
    system "#{bin}/netmon", "help"
  end
end
