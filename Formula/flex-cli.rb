class FlexCli < Formula
  desc "A command-line tool for tracking flexible work hours"
  homepage "https://github.com/adrianrosen/homebrew-flex-cli"
  url "https://github.com/adrianrosen/homebrew-flex-cli/archive/refs/tags/v0.1.tar.gz"
  sha256 "6474431b3a5b466c1f5d09ed2fbc3de37831dc13c544b9ae0d970a888263bc39"
  license "MIT"

  def install
    bin.install "flex-cli.py" => "flex-cli"
  end

  test do
    system "#{bin}/flex-cli", "--version"
  end
end