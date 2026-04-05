# typed: false
# frozen_string_literal: true

class Trx < Formula
  desc "lean issue tracker"
  homepage "https://github.com/byteowlz/trx"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/trx/releases/download/v0.4.0/trx-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "8b22fefd28291dd0d7b39da7971287c743dfdacc5069a1f1bafcb3a8b2cf6525"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/trx/releases/download/v0.4.0/trx-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "2239a05ed045a2eb739b564e93d19a70004a88a4da12ac8f1ffd1e606b0b96c1"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/trx/releases/download/v0.4.0/trx-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a35eae560063d457befad42369782a136b6cd15692393d74a287756d06a05976"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/trx/releases/download/v0.4.0/trx-v0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "22418e7750066fa75af7bfe40f0dccb9dae620eea9c2fcb7ae29b25237d77833"
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
