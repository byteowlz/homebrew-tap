# typed: false
# frozen_string_literal: true

class Trx < Formula
  desc "lean issue tracker"
  homepage "https://github.com/byteowlz/trx"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/trx/releases/download/v0.3.1/trx-v0.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "5a5108c8ec3589ae90570e4ac7f794dd3b93920faca3b6dc2494f49237dff18b"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/trx/releases/download/v0.3.1/trx-v0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "ca71654e64608e2cd0836048b6d2cb45d40a561ecd768564b6627b73c42b64e1"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/trx/releases/download/v0.3.1/trx-v0.3.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "71cde2fe8e974143615e8ac47e753c997d3a9e1398485049696cf6da4342db8e"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/trx/releases/download/v0.3.1/trx-v0.3.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d6f8695cd5ac5dae71626318ae389622183016879223da95b28f66967ccd0d71"
    end
  end

  def install
    # Install all binaries found in the archive
    Dir.glob("*").each do |file|
      next if File.directory?(file)
      next unless File.executable?(file)
      bin.install file
    end
  end

  test do
    system "#{bin}/trx", "--version"
  end
end
