class Netmon < Formula
  desc "Network monitoring CLI tool"
  homepage "https://github.com/zzzzseong/netmon"
  version "1.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.7.0/netmon-darwin-amd64.tar.gz"
      sha256 "232e471dc14e9c76a530a9e6fcccb6dfb9b632f6ac4c0cbcce1c713f434ffe87"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.7.0/netmon-darwin-arm64.tar.gz"
      sha256 "cfdabb9f970bb6fdbde70fd245055171fac6d3980c1ecd96dcb28485704ed91e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.7.0/netmon-linux-amd64.tar.gz"
      sha256 "bf59c943715f2e800e3758fd09f90b814d72aaee9e9e342d8eb6352af60adc47"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.7.0/netmon-linux-arm64.tar.gz"
      sha256 "de86ecaa3b5ee2ec9d5859dba28e73871de4d657e61a4101e2c1c0469756ea10"
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
