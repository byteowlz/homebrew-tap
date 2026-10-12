# typed: false
# frozen_string_literal: true

class Trx < Formula
  desc "lean issue tracker"
  homepage "https://github.com/byteowlz/trx"
  version "0.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/trx/releases/download/v0.9.0/trx-v0.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "88c9cae092d4576614733044b6d949cd154a635a1fa4e4f422415fa08b91b337"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/trx/releases/download/v0.9.0/trx-v0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "aba9ddc2b04c7125d8c524787ac9aa538d1a4e4b2f6beb3e4f1fc0b527804382"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/trx/releases/download/v0.9.0/trx-v0.9.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dd105a60ec12a443a4d2c549a64ca3302a59b228805a85a5d049e0342ec3a2e4"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/trx/releases/download/v0.9.0/trx-v0.9.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "db69b2152dd70e07e0660c402d621e3cfd9839e6b674e4e8a02d6748364a260f"
    end
  end

  def install
    # byt-packaged tarballs stage executables under bin/; older flat
    # tarballs keep them at the archive root. Support both.
    if Dir.exist?("bin")
      bin.install Dir["bin/*"]
    else
      Dir.glob("*").each do |file|
        next if File.directory?(file)
        next unless File.executable?(file)
        bin.install file
      end
    end
  end

  test do
    system "#{bin}/trx", "--version"
  end
end
