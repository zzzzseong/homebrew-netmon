class Netmon < Formula
  desc "Network monitoring CLI tool"
  homepage "https://github.com/zzzzseong/netmon"
  version "1.6.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.6.2/netmon-darwin-amd64.tar.gz"
      sha256 "d8cc521c2d8e65d0a78c4dff26a382e65d4bbba3ff4ef8b27b634bce9003a449"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.6.2/netmon-darwin-arm64.tar.gz"
      sha256 "299cb426514d6a3d33f3ef61ba87cbd99cca5b5dc95d586aa61a8f2a9b410df1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.6.2/netmon-linux-amd64.tar.gz"
      sha256 "dbf2ab6c0b78daf484844f7996448bc3eb1ed6952094d40ba7b6e57406098352"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.6.2/netmon-linux-arm64.tar.gz"
      sha256 "26ed79ba012ce2332d6babb8344f2192a20c49fd3bb0902c7e1bd4902dddc097"
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
