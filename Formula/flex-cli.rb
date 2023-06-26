class FlexCli < Formula
  include Language::Python::Virtualenv

  desc "A command-line tool for tracking flexible work hours"
  homepage "https://github.com/adrianrosen/homebrew-flex-cli"
  url "https://github.com/adrianrosen/homebrew-flex-cli/archive/refs/tags/v0.1.tar.gz"
  version "0.1"
  sha256 "6474431b3a5b466c1f5d09ed2fbc3de37831dc13c544b9ae0d970a888263bc39"
  license "MIT"

  depends_on "python3"

  def install
    virtualenv_create(libexec, "python3")
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/flex-cli", "--version"
  end
end