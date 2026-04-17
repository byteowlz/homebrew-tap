# typed: false
# frozen_string_literal: true

class Tmz < Formula
  desc "making MS teams barely bearable"
  homepage "https://github.com/byteowlz/tmz"
  version "0.2.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/tmz/releases/download/v0.2.5/tmz-v0.2.5-x86_64-apple-darwin.tar.gz"
      sha256 "99115efedeeb8ea7bb75465c50bcdfb131a1b8f8668faf144c437f4505b23ba8"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/tmz/releases/download/v0.2.5/tmz-v0.2.5-aarch64-apple-darwin.tar.gz"
      sha256 "761d83e4d83e4981b68fdff8bd3c2c8a9257473862b2436839f4508bff3e5a3a"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/tmz/releases/download/v0.2.5/tmz-v0.2.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "280eb91a662ed98afe703f2b1c311452be7f1e568b681dcba75431447f730e16"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/tmz/releases/download/v0.2.5/tmz-v0.2.5-aarch64-unknown-linux-gnu.tar.gz"
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
    system "#{bin}/tmz", "--version"
  end
end
