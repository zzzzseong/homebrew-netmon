class Netmon < Formula
  desc "Network monitoring CLI tool"
  homepage "https://github.com/zzzzseong/netmon"
  version "1.7.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.7.1/netmon-darwin-amd64.tar.gz"
      sha256 "dca500061250ccb4dbe6c270d26a836dabc70013fee3654442d5dcbf23bf2ee0"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.7.1/netmon-darwin-arm64.tar.gz"
      sha256 "520293de5306902d1d4f0c735f701d41067b8e3886a466036a1fa9796957954a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.7.1/netmon-linux-amd64.tar.gz"
      sha256 "437cd209ac3188750cddc4dde836572fc0892362f9c82f8d54c34b4b90ba53e6"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.7.1/netmon-linux-arm64.tar.gz"
      sha256 "9f1bba201f1baa0f0525f3486067a104254cc86822eeab7770a3136af7300730"
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
