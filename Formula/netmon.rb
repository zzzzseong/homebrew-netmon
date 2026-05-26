class Netmon < Formula
  desc "Network monitoring CLI tool"
  homepage "https://github.com/zzzzseong/netmon"
  version "1.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.6.0/netmon-darwin-amd64.tar.gz"
      sha256 "9afa7e038220dda3c5bc6131780d15d16ab5a4e568be7757a60f50e80042bf59"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.6.0/netmon-darwin-arm64.tar.gz"
      sha256 "a0140117d8634d8b20687a55e5af00673a296137ad992dec3a4d2fc0211dc857"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.6.0/netmon-linux-amd64.tar.gz"
      sha256 "72ab4509482e8f5c3d61fa69cf605dd7b6442cb17d23f5f01223b628d75f28ed"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.6.0/netmon-linux-arm64.tar.gz"
      sha256 "5842aa5a719eef0fce063d658d95edfe5914a03b99cd3d8c8c16a4da9b917156"
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
