# typed: false
# frozen_string_literal: true

class Mmry < Formula
  desc "A Byteowlz tool"
  homepage "https://github.com/byteowlz/mmry"
  version "0.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/mmry/releases/download/v0.12.0/mmry-v0.12.0-x86_64-apple-darwin.tar.gz"
      sha256 ""
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/mmry/releases/download/v0.12.0/mmry-v0.12.0-aarch64-apple-darwin.tar.gz"
      sha256 "803344354700b2ca80d0ac8b55dea867791851caa1fae06a7826ee4ed716ecb9"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/mmry/releases/download/v0.12.0/mmry-v0.12.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7dcd7222f82fa8940b0ce21a736710288cfa939959222db2aa4c7ae94f621ceb"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/mmry/releases/download/v0.12.0/mmry-v0.12.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "23978a1e46ccad91f7315218a72e17404cd27c4bfc534d2dff3da2da73a1af12"
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
    system "#{bin}/mmry", "--version"
  end
end
