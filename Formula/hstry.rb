# typed: false
# frozen_string_literal: true

class Hstry < Formula
  desc "a unified history for all your agents"
  homepage "https://github.com/byteowlz/hstry"
  version "0.5.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.8/hstry-v0.5.8-x86_64-apple-darwin.tar.gz"
      sha256 "c8a71fba4057d6b9dcad0692e9e90c184fb1745496497a7d9f58f1402aabe5c0"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.8/hstry-v0.5.8-aarch64-apple-darwin.tar.gz"
      sha256 "5bed2fe2c71093f594ab786bf8c5d644249566919ed9cf7c0bdd9713ec013be5"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.8/hstry-v0.5.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d73ca856f4229a6cb7e683c51a5a4524decab673a824946b777215598b657e74"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.8/hstry-v0.5.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a4ad75b08828365f99a349c2ee8f5e1397aa3d9efa12eee7c8caa0b8156419f3"
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
