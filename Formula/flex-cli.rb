class FlexCli < Formula
    desc "A command-line tool written in Rust to log flexible working hours."
    homepage "https://github.com/adrianrosen/homebrew-flex-cli"
    url "https://github.com/adrianrosen/homebrew-flex-cli/releases/download/v0.1/flex-cli.tar.gz"
    sha256 "5de55403fd251bd041930ce5805b4e3bce02db81807907f294e80aa3487ec26a"
    license "MIT"
    version "0.1"
  
    def install
        bin.install "flex-cli"
    end
  
    test do
      system "#{bin}/flex-cli", "show"
    end
  end