class Netmon < Formula
  desc "Network monitoring CLI tool"
  homepage "https://github.com/zzzzseong/netmon"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.1.0/netmon-darwin-amd64.tar.gz"
      sha256 "e9f0fe85f666efb70d9d200a946ee2e950549c7939a4fcdc2062eaf1c5271844"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.1.0/netmon-darwin-arm64.tar.gz"
      sha256 "ed38965e535ca8da6eebc36e4a3320bbf27b8b00711516704c4a75df8217e8e4"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.1.0/netmon-linux-amd64.tar.gz"
      sha256 "c6674be3e85e8db9ab54a5c0876d2afc8376b1d4506393b1f7c4f84ec841a047"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.1.0/netmon-linux-arm64.tar.gz"
      sha256 "716887c531af31155f3c9db5e2e75a76cc6972ec6bb5c1ea15d5dc2cf6239f4f"
    end
  end

  def install
    bin.install "netmon"
  end

  test do
    system "#{bin}/netmon", "help"
  end
end
