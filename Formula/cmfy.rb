# typed: false
# frozen_string_literal: true

class Cmfy < Formula
  desc "A Byteowlz tool"
  homepage "https://github.com/byteowlz/cmfy"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/cmfy/releases/download/v0.1.0/cmfy-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 ""
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/cmfy/releases/download/v0.1.0/cmfy-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 ""
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/cmfy/releases/download/v0.1.0/cmfy-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/cmfy/releases/download/v0.1.0/cmfy-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
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
    system "#{bin}/cmfy", "--version"
  end
end
