class Netmon < Formula
  desc "Network monitoring CLI tool"
  homepage "https://github.com/zzzzseong/netmon"
  version "1.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.1.4/netmon-darwin-amd64.tar.gz"
      sha256 "fb6008ec43dc3dac6bb6669086c878402b4c2f8c8b5575e613d21b971888fb31"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.1.4/netmon-darwin-arm64.tar.gz"
      sha256 "e8828c880cd7539eee6b764bea12d1a3968879dc5a57bfcf5a8a9eee2389d214"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.1.4/netmon-linux-amd64.tar.gz"
      sha256 "9eb7531e9c2ba558a658f19d91dcd2d53ba9b8376c7ac0d1f3ab024129c37596"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.1.4/netmon-linux-arm64.tar.gz"
      sha256 "dc49b860b6008dedcd50c6be8c113f9b69fe558812cee1464f0ecd613121df65"
    end
  end

  def install
    bin.install "netmon"
  end

  test do
    system "#{bin}/netmon", "help"
  end
end
