# typed: false
# frozen_string_literal: true

class Hstry < Formula
  desc "a unified history for all your agents"
  homepage "https://github.com/byteowlz/hstry"
  version "0.5.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.18/hstry-v0.5.18-x86_64-apple-darwin.tar.gz"
      sha256 "4d67031c6a3c3f2f934f48d2e6c7021086a230316e193145a587904195f1ec1f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.18/hstry-v0.5.18-aarch64-apple-darwin.tar.gz"
      sha256 "3d06d6fac6e1e0e5ea581d46d2076512db8ea5ed9da405d8337ffe8015e89779"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.18/hstry-v0.5.18-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ff493c6db30ab2035afb52f3a4617aaeb990778abf3b69ca6a2b39311336f0cf"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.18/hstry-v0.5.18-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d312448a8a8d82507249312ebc55c28e30a8278a8d911efb9a9779e9ed585a10"
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
