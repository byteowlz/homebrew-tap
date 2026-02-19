# typed: false
# frozen_string_literal: true

class Hstry < Formula
  desc "a unified history for all your agents"
  homepage "https://github.com/byteowlz/hstry"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.0/hstry-v0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "d1c6da0d378e1483d8bb2004f5af9558579909b2bb944a775f6bab9a93559483"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.0/hstry-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "e72125ae3ff387660811ad294b535dc1abe9b4703fa9e019eba9f59c286aef44"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.0/hstry-v0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "04717365d8a8a97a790dbf68710ea613c4b853d10941bd4477bb026bcd25dff4"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.0/hstry-v0.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4817d9a848316b75ff46dd68bc76de676c06f5b0133bd204db9a79f2808666f6"
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
    system "#{bin}/hstry", "--version"
  end
end
