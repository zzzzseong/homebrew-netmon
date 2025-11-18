class Netmon < Formula
  desc "Network monitoring CLI tool"
  homepage "https://github.com/zzzzseong/netmon"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.0.0/netmon-darwin-amd64.tar.gz"
      sha256 "791b0a9b660182e1860d24eb6f33a04859904280b60ba4dfa20cb645299e3270"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.0.0/netmon-darwin-arm64.tar.gz"
      sha256 "7aff9b593d0e9508a248ad8226c9ec2bac2ca2e6ff12ebac469d4bc4751cc271"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.0.0/netmon-linux-amd64.tar.gz"
      sha256 "67d9213322853fb724efa424068b21dce679a1e86117bd853e1debd40d2bde30"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.0.0/netmon-linux-arm64.tar.gz"
      sha256 "01e473379a1b080274b6cce037a6548083d06b5ea9af1aa41b1a8846c1efdd48"
    end
  end

  def install
    bin.install "netmon"
  end

  test do
    assert_match "Network Monitoring Tool", shell_output("#{bin}/netmon help", 1)
  end
end
