class Netmon < Formula
  desc "Network monitoring CLI tool"
  homepage "https://github.com/zzzzseong/netmon"
  version "1.7.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.7.3/netmon-darwin-amd64.tar.gz"
      sha256 "a241afdb8fdcf554738135082293e101304820955d5c45c8e40ccaec5e11aee9"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.7.3/netmon-darwin-arm64.tar.gz"
      sha256 "3a2a55d96be9ce668ddec5e9ba0b2cef839d1896472b141c715f731c26114de1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.7.3/netmon-linux-amd64.tar.gz"
      sha256 "04d0abc933394065e2346afe602ebc68560b7f8f3971e759e05a31747f57e053"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.7.3/netmon-linux-arm64.tar.gz"
      sha256 "51ffe9f23568e8f0ef211fd8cdedb94fdd7bf9ba73e2cc313eaabcfe8209b5b6"
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
