# typed: false
# frozen_string_literal: true

class Trx < Formula
  desc "lean issue tracker"
  homepage "https://github.com/byteowlz/trx"
  version "0.8.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/trx/releases/download/v0.8.3/trx-v0.8.3-x86_64-apple-darwin.tar.gz"
      sha256 "9a9f2c14ee7e509e5f615afedb759cd7a408b650551bd31d04bb7bddfb2716a0"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/trx/releases/download/v0.8.3/trx-v0.8.3-aarch64-apple-darwin.tar.gz"
      sha256 "6084a54acd89bea53e2cf64a19a6c66519d7da9ea69ec789319fa203c415fb00"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/trx/releases/download/v0.8.3/trx-v0.8.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c7ca8eea61beded1e24fe57a17e10af8c9e01824c5f2e659d1e2d205147cf754"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/trx/releases/download/v0.8.3/trx-v0.8.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7a97582e590b78f6564a7393e00df44accd7a7ddd471c0c6ac3d432536f8535a"
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
