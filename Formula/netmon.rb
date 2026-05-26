class Netmon < Formula
  desc "Network monitoring CLI tool"
  homepage "https://github.com/zzzzseong/netmon"
  version "1.6.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.6.3/netmon-darwin-amd64.tar.gz"
      sha256 "b50e1332000bce46cc981f6b6a3b46916366d1af8f8710b3dbbbfbc0968b4bd9"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.6.3/netmon-darwin-arm64.tar.gz"
      sha256 "5959e2931e56f77125b5a34840585b4b48e958180a8adbcfb28e87399c6ebca9"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.6.3/netmon-linux-amd64.tar.gz"
      sha256 "11f3af0da4b39a269ac8428cf1b4d8d6555bd5b8995aa8d9cd31b6e56a7ff5a9"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.6.3/netmon-linux-arm64.tar.gz"
      sha256 "f1686f52d8fdf40ca957b84a746e06ea26ea071e92c15f48c905ffd4eab35f5a"
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
