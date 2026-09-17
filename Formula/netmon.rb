class Netmon < Formula
  desc "Network monitoring CLI tool"
  homepage "https://github.com/zzzzseong/netmon"
  version "1.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.7.0/netmon-darwin-amd64.tar.gz"
      sha256 "177b5a906fbc714e31de4d691d831196e059402912c307b9512f4a38620e9e3a"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.7.0/netmon-darwin-arm64.tar.gz"
      sha256 "9418a97841ecec28eb959e17f788ff8834a22d919424a1684a21fec68e23d070"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.7.0/netmon-linux-amd64.tar.gz"
      sha256 "01d44ad069383cd3f44569b7a384429ceb415ab6cd995a7d1bc837e1203a7aa9"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.7.0/netmon-linux-arm64.tar.gz"
      sha256 "4555fc45b2c7d372667cff66661a0759909b38fe19fcd2be3ae74aaaa6ad6581"
    end
  end

  def install
    bin.install "netmon"
    
    # Generate and install shell completions
    generate_completions_from_executable(bin/"netmon", "completion")
  end

  def caveats
    <<~EOS
      zsh completions have been installed to:
        #{HOMEBREW_PREFIX}/share/zsh/site-functions

      To enable shell completion, add the following to your ~/.zshrc:

        if type brew &>/dev/null; then
          FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
          autoload -Uz compinit
          compinit
        fi

      Then restart your terminal or run: source ~/.zshrc
    EOS
  end

  test do
    system "#{bin}/netmon", "help"
  end
end
