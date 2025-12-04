class Netmon < Formula
  desc "Network monitoring CLI tool"
  homepage "https://github.com/zzzzseong/netmon"
  version "1.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.2.1/netmon-darwin-amd64.tar.gz"
      sha256 "4c235afc41a7fe82e6fc950790210f0f657b7ebbf1fd6393d8820b22cabf6e6a"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.2.1/netmon-darwin-arm64.tar.gz"
      sha256 "15494f7c8bd2e9ddf15054a6617f484b35c8752c0f59d7f6e884b32c181e8f56"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.2.1/netmon-linux-amd64.tar.gz"
      sha256 "9637bfabc40f63c19db1a44192ba1edfe121426437ed655033af752f8a1d21ff"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.2.1/netmon-linux-arm64.tar.gz"
      sha256 "9a30ceda56413aecc5569c900d27e3da1512da261b5295f7ef2fba6ad0bf9679"
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
