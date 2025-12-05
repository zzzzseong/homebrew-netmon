class Netmon < Formula
  desc "Network monitoring CLI tool"
  homepage "https://github.com/zzzzseong/netmon"
  version "1.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.3.0/netmon-darwin-amd64.tar.gz"
      sha256 "5992846df8452c5aeae1070f7839126ff7650117db897400cb539c339a03773a"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.3.0/netmon-darwin-arm64.tar.gz"
      sha256 "11f9a690d77d62835acb529c9999b1b29ffebb9529f8ff0741db55d04fd968b6"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.3.0/netmon-linux-amd64.tar.gz"
      sha256 "69b70ac827b042e88a7773a9d73dae5b892c8947dc8770450881deb335a0142d"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.3.0/netmon-linux-arm64.tar.gz"
      sha256 "02651601fd6190e8a3867523233559b6cdc97c49aaa79da443e7f798ba5d412e"
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
