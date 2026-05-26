class Netmon < Formula
  desc "Network monitoring CLI tool"
  homepage "https://github.com/zzzzseong/netmon"
  version "1.6.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.6.4/netmon-darwin-amd64.tar.gz"
      sha256 "907510b66e9b8748f62c83ac394996513bb14215b1ecc7ffdc12958a0ca7cb60"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.6.4/netmon-darwin-arm64.tar.gz"
      sha256 "dfd6e16917094206e6b30ed2740b7790bd416aceb6cb21d2baa7107ae4b4dc6d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.6.4/netmon-linux-amd64.tar.gz"
      sha256 "03afce050b2d455192bb080d2215c8d20d54e5942efc453dc8dfd3d03d1acc7d"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.6.4/netmon-linux-arm64.tar.gz"
      sha256 "1976f0ead5422329504ddf82930d1fe6b641893beb4bb279e85a38473e9fe5cf"
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
