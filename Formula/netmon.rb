class Netmon < Formula
  desc "Network monitoring CLI tool"
  homepage "https://github.com/zzzzseong/netmon"
  version "1.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.5.0/netmon-darwin-amd64.tar.gz"
      sha256 "445c60247d02278e355e53cec57a0bc636638b98e284ea743c7dfbfe6b0c60e3"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.5.0/netmon-darwin-arm64.tar.gz"
      sha256 "57004efb9b9b18324fb890ec8248e1c4562cc3afd0ad72baf9959e44329b4ec5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.5.0/netmon-linux-amd64.tar.gz"
      sha256 "be07af13169e73977b79754bc67e982c0c60da56608619d3d74f1465b1254b56"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.5.0/netmon-linux-arm64.tar.gz"
      sha256 "459eb33ddbba14d2d0c7749d06330f2843f9b0521556a8590369fe272869bec2"
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
