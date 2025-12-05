class Netmon < Formula
  desc "Network monitoring CLI tool"
  homepage "https://github.com/zzzzseong/netmon"
  version "1.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.2.2/netmon-darwin-amd64.tar.gz"
      sha256 "31bdffe5223ac221f2681a28ab1353e8a48cfdfb3f1faffd8e09ee70a16ae726"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.2.2/netmon-darwin-arm64.tar.gz"
      sha256 "b89c7efdfc0f45e299f2410bfb9adeb6828ea4f883ccfc368bb54d208e92d9a8"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.2.2/netmon-linux-amd64.tar.gz"
      sha256 "922e68a264e55543443a724e65d3f58a762aa33291738ade5e034d71906f193c"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.2.2/netmon-linux-arm64.tar.gz"
      sha256 "3c4b86c469eba33c2ad07e0c44542eced15c353c1e1a9036962977eae3f9e992"
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
