class Netmon < Formula
  desc "Network monitoring CLI tool"
  homepage "https://github.com/zzzzseong/netmon"
  version "1.1.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.1.5/netmon-darwin-amd64.tar.gz"
      sha256 "e352b92275318aab1fc3adafc1fe212189e3f69018c2338c1f0ef7614ea749ed"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.1.5/netmon-darwin-arm64.tar.gz"
      sha256 "60305be2d9b5926bb198506d5957512b18dce1a925286ed2d7943ebb0a8998ca"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.1.5/netmon-linux-amd64.tar.gz"
      sha256 "f9f8cdfe5ba0da12a882d73589dc108b12e919148e73cb35079e9ed1bc14eb8f"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.1.5/netmon-linux-arm64.tar.gz"
      sha256 "0a6f7947133e19a236f06b0516f93a0325d55a7827f671359bca51ae86091fa6"
    end
  end

  def install
    bin.install "netmon"
  end

  test do
    system "#{bin}/netmon", "help"
  end
end
