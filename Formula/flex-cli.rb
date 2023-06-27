class FlexCli < Formula
    desc "A command-line tool written in Rust to log flexible working hours."
    homepage "https://github.com/adrianrosen/homebrew-flex-cli"
    url "https://github.com/adrianrosen/homebrew-flex-cli/releases/download/v0.2/flex-cli.tar.gz"
    sha256 "a006e5e3211ab7af98a1ce15ada569dbdd8c28744b1dd9bc3d5a6058dde3e624"
    license "MIT"
    version "0.2"
  
    def install
        bin.install "flex-cli"
    end
  
    test do
      system "#{bin}/flex-cli", "show"
    end
  end