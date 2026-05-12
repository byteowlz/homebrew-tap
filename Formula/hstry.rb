# typed: false
# frozen_string_literal: true

class Hstry < Formula
  desc "a unified history for all your agents"
  homepage "https://github.com/byteowlz/hstry"
  version "0.5.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.17/hstry-v0.5.17-x86_64-apple-darwin.tar.gz"
      sha256 "7c3046239d2cbb37e1bb97aa36a628b5c6ddae8ec7d7c98759af7b70f6ef5706"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.17/hstry-v0.5.17-aarch64-apple-darwin.tar.gz"
      sha256 "1008d3b8b9e78b75a9463d2ff7e980b6015d7f3719359125f1d61fbea38c1c63"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.17/hstry-v0.5.17-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4158b1432a8cc18218a771cbcb00f2dd66f7d3b0b41e7602b06c6ca11ad3060b"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.17/hstry-v0.5.17-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1c4639d6d907f60d0c8a175a08981f548a0df0813f729719271f98742f4c3f09"
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
