# typed: false
# frozen_string_literal: true

class Hstry < Formula
  desc "a unified history for all your agents"
  homepage "https://github.com/byteowlz/hstry"
  version "0.5.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.15/hstry-v0.5.15-x86_64-apple-darwin.tar.gz"
      sha256 "7b5ab7aadeeabd65b8ad94165641733ed0bf8b1df965303cdf73e55b4749beb2"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.15/hstry-v0.5.15-aarch64-apple-darwin.tar.gz"
      sha256 "8723d6aed98e06db07e9965462ae1567ddba19e945d6046987480e3ed79dde3b"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.15/hstry-v0.5.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "55a3a67828548276657b53c71ae1d2f46a0ed936f214cb4dfb29541e25250b44"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.15/hstry-v0.5.15-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8bb3e1572e1604111d445c1e2d784bc942a25511805902c2bb22faf18d785964"
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
