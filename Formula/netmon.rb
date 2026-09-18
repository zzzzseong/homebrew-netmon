class Netmon < Formula
  desc "Network monitoring CLI tool"
  homepage "https://github.com/zzzzseong/netmon"
  version "1.7.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.7.2/netmon-darwin-amd64.tar.gz"
      sha256 "39b4bbc58cd58469a665d0c785261a9e776f3675e32cdbac95e8f7bd7df54268"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.7.2/netmon-darwin-arm64.tar.gz"
      sha256 "189b6ed138ea0a0d10928255b14647cdb1f6b16771b0e5ff653011c5d59e076a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.7.2/netmon-linux-amd64.tar.gz"
      sha256 "4fef2f53fe0e38899e4daa113b6e8375b50bfa6eb76f857394a148cf342d9a30"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.7.2/netmon-linux-arm64.tar.gz"
      sha256 "b2ae6519eff87fe2e3700f679d566e2e193137d703ff607ff204af97673c50f2"
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
