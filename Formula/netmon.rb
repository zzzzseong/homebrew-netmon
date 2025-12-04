class Netmon < Formula
  desc "Network monitoring CLI tool"
  homepage "https://github.com/zzzzseong/netmon"
  version "1.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.2.1/netmon-darwin-amd64.tar.gz"
      sha256 "adff60ab2baedcefdead42b25bd265044d3696e50343ff5ea0afc240788d86a9"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.2.1/netmon-darwin-arm64.tar.gz"
      sha256 "96c0974085285b362897d1677dfc3e0d5e1436e92ec897d3bc9d0c5954513f0d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.2.1/netmon-linux-amd64.tar.gz"
      sha256 "5f4b193eb9535655eec397e299644ff5b12534c60c17d6e24c2f1ee915348e3c"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.2.1/netmon-linux-arm64.tar.gz"
      sha256 "c75405fedde6b7cd66b81bc74d3d002424ae3534a405671c21c282988fa074e5"
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
