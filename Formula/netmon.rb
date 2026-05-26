class Netmon < Formula
  desc "Network monitoring CLI tool"
  homepage "https://github.com/zzzzseong/netmon"
  version "1.6.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.6.5/netmon-darwin-amd64.tar.gz"
      sha256 "709b6646b3865d4f7263545de7ba68207b78f872448754abf6cc736ab7bf0a26"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.6.5/netmon-darwin-arm64.tar.gz"
      sha256 "5a011c6ee1073983cc72157394908478efcc619a63a4c304ddc88ae77423963b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.6.5/netmon-linux-amd64.tar.gz"
      sha256 "939660d346ffe845e315a495ae061cb8ce89b584ff9165021ab4a684d4da629a"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.6.5/netmon-linux-arm64.tar.gz"
      sha256 "5d3346fffa971d0d3be7532102139151021080fbdfacaa5745ed3c39a1d2850a"
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
