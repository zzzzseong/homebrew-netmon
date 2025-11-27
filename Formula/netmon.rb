class Netmon < Formula
  desc "Network monitoring CLI tool"
  homepage "https://github.com/zzzzseong/netmon"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.2.0/netmon-darwin-amd64.tar.gz"
      sha256 "142c00790a7c55139989187535acefd28e4624b78218f8b9cb628f9a7eaa53e8"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.2.0/netmon-darwin-arm64.tar.gz"
      sha256 "fb89d9ebddde07e58514e3128603befe5649e8463decab263e0dd12ace9f587c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.2.0/netmon-linux-amd64.tar.gz"
      sha256 "7175616a33affacd8d305da825af8b3044c9211de6b25c6ea3b015fcde661f79"
    elsif Hardware::CPU.arm?
      url "https://github.com/zzzzseong/netmon/releases/download/v1.2.0/netmon-linux-arm64.tar.gz"
      sha256 "f71e8dfeeb71fddbe32f24c851d8877b3bd97fabda34d20c75cd9ec1f755187c"
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
