# typed: false
# frozen_string_literal: true

class Trx < Formula
  desc "lean issue tracker"
  homepage "https://github.com/byteowlz/trx"
  version "0.6.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/trx/releases/download/v0.6.2/trx-v0.6.2-x86_64-apple-darwin.tar.gz"
      sha256 "b4930cefac2b317666796946eb7a1d10c3b1628137b443f617a91630b2a8e3b1"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/trx/releases/download/v0.6.2/trx-v0.6.2-aarch64-apple-darwin.tar.gz"
      sha256 "f8fd07cfa7f294c0660e255fb4fcffd6f8e07c9d49f283f0aa47fd052ad9c49a"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/trx/releases/download/v0.6.2/trx-v0.6.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0c9ea5139cb94d1e94776b17a69aed451b70c8c5951f007aff52e8e9fa743691"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/trx/releases/download/v0.6.2/trx-v0.6.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a3a3aa7c93caa49eef5aa0e6f456370d83562c7c0c99e4c1f0145f4feaefa757"
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
