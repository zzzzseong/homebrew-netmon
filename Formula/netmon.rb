class Netmon < Formula
  desc "Network monitoring CLI tool"
  homepage "https://github.com/zzzzseong/netmon"
  version "1.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.4.0/netmon-darwin-amd64.tar.gz"
      sha256 "3218e2f8fc8a6999c5c8a2aa455d23551111a4a833b86d26eb7dc5fabdaa7438"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.4.0/netmon-darwin-arm64.tar.gz"
      sha256 "83eb58d32a1eeaf710b89962e376e355a8ee9670cd6d8cd051afc61eb7018848"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.4.0/netmon-linux-amd64.tar.gz"
      sha256 "48317361da9c0c59c21aff8c32b2967c70d04328f7504854798d1a399a7e2c99"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.4.0/netmon-linux-arm64.tar.gz"
      sha256 "924ad199abe0fe184fa026e40f5d2996e885113be03ecd7680f57fcd45c91135"
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
