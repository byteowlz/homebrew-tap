# typed: false
# frozen_string_literal: true

class Trx < Formula
  desc "lean issue tracker"
  homepage "https://github.com/byteowlz/trx"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/trx/releases/download/v0.2.2/trx-v0.2.2-x86_64-apple-darwin.tar.gz"
      sha256 "b51a0d059304aebe12de8219b723ab79ae1e28ef91ef5d0af472d96f40e6bd55"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/trx/releases/download/v0.2.2/trx-v0.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "d4c2dc0aea8574c882e4a733a14ab3a7959a6d2989aee33f90b1a2d817c53261"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/trx/releases/download/v0.2.2/trx-v0.2.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "320edceac57f26bdcb051f86d0576578e14bb887ce53b7c61d1ccb6aa010e2b9"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/trx/releases/download/v0.2.2/trx-v0.2.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ac5786bfab25b55e4befe1a0d1255e8df09ec9e098423822b5e95a5c9cacd9b1"
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
