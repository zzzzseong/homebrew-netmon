class Netmon < Formula
  desc "Network monitoring CLI tool"
  homepage "https://github.com/zzzzseong/netmon"
  version "1.6.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.6.6/netmon-darwin-amd64.tar.gz"
      sha256 "16f872ef2dbd73d90df7d5ab3c1316d44fe9d5467842656a6c2649a41a06338d"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.6.6/netmon-darwin-arm64.tar.gz"
      sha256 "021f7dbea8cf4a03dac1de83addafdac02c7106e86e5a3f8fda937b41dd97a21"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.6.6/netmon-linux-amd64.tar.gz"
      sha256 "6b19dff4b42be8b571f3e98470403468a2f72bbf486b9736d2bbc950e380c565"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.6.6/netmon-linux-arm64.tar.gz"
      sha256 "d403ee2472ecf80c522d3d75d06bcb921089035f1625ea0d1617d0cbbcee90df"
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
