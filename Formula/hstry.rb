# typed: false
# frozen_string_literal: true

class Hstry < Formula
  desc "Universal AI chat history database with full-text search"
  homepage "https://github.com/byteowlz/hstry"
  version "0.4.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/hstry/releases/download/v0.4.3/hstry-v0.4.3-x86_64-apple-darwin.tar.gz"
      sha256 "TBD"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/hstry/releases/download/v0.4.3/hstry-v0.4.3-aarch64-apple-darwin.tar.gz"
      sha256 "TBD"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.4.3/hstry-v0.4.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "TBD"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.4.3/hstry-v0.4.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "TBD"
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
