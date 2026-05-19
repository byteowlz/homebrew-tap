# typed: false
# frozen_string_literal: true

class Trx < Formula
  desc "lean issue tracker"
  homepage "https://github.com/byteowlz/trx"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/trx/releases/download/v0.6.0/trx-v0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "57eb904b88e1b0339bfc5761de61cc29fa841192ae44f415934b6b0f7b477db1"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/trx/releases/download/v0.6.0/trx-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "0997a8c6802b6fc0c3a4c30ddb02e655b0cbe679b3511999b4334384527db12d"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/trx/releases/download/v0.6.0/trx-v0.6.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5b4be70d301a4e69e4223f41fb2031b93e26eed302ce88a7230589cc105d69db"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/trx/releases/download/v0.6.0/trx-v0.6.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a588e59521fff245e50b592d6b51941529482140be85c88ad8b0b03c8b1cd73e"
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
