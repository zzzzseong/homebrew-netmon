class Netmon < Formula
  desc "Network monitoring CLI tool"
  homepage "https://github.com/zzzzseong/netmon"
  version "1.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.6.1/netmon-darwin-amd64.tar.gz"
      sha256 "b3c84b47fda647144ba1bbea1525f83290f13a50fcbb0fd0c3583be55e8b8c71"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.6.1/netmon-darwin-arm64.tar.gz"
      sha256 "055f2a7acb6df2728c4c40a2b77514cf4eaa7fd89ecb53ca5db2d1c3983c2953"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.6.1/netmon-linux-amd64.tar.gz"
      sha256 "b63cf4297938f0ef666b4f0f3dee45eb181d7f90ac0690ced241d9ff00b3cad5"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.6.1/netmon-linux-arm64.tar.gz"
      sha256 "55a0b90e5765e7833f5c14a47125d27d03859e8d3fc03d6dde451fcc9c9a50e9"
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
