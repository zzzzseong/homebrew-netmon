class Netmon < Formula
  desc "Network monitoring CLI tool"
  homepage "https://github.com/zzzzseong/netmon"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.2.0/netmon-darwin-amd64.tar.gz"
      sha256 "14dd1cbe423989d7c7f43a0934f814c3754ded185c73107425d60e1f9aca4aae"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.2.0/netmon-darwin-arm64.tar.gz"
      sha256 "e632c0849068cff2698a2b9c6b8dfcc1bc03f9f317ad32b104f312f60b84b98c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.2.0/netmon-linux-amd64.tar.gz"
      sha256 "fbe5e62e0bfc4b506de77893cbbcbcfa492d645b182d87f24d092bb51353f3f6"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.2.0/netmon-linux-arm64.tar.gz"
      sha256 "b94fbd107a98d912d7db82302f6bf57336fedc473c5809bd0a201ff60f45f3f0"
    end
  end

  def install
    bin.install "netmon"
    
    # Generate and install shell completions
    generate_completions_from_executable(bin/"netmon", "completion")
  end

  def post_install
    # Automatically configure zsh completion
    if ENV["SHELL"]&.include?("zsh") || File.exist?(File.expand_path("~/.zshrc"))
      zshrc = File.expand_path("~/.zshrc")
      brew_completion_block = <<~EOS

        # Homebrew completion (added by netmon)
        if type brew &>/dev/null; then
          FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
          autoload -Uz compinit
          compinit
        fi
      EOS
      
      # Check if Homebrew completion block already exists
      zshrc_content = File.exist?(zshrc) ? File.read(zshrc) : ""
      
      unless zshrc_content.include?("FPATH=$(brew --prefix)/share/zsh/site-functions")
        File.open(zshrc, "a") do |f|
          f.puts brew_completion_block
        end
        ohai "Added Homebrew completion configuration to ~/.zshrc"
        ohai "Run 'source ~/.zshrc' or restart your terminal to enable completion"
      end
    end
  end

  test do
    system "#{bin}/netmon", "help"
  end
end
