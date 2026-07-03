# typed: false
# frozen_string_literal: true

class Skdlr < Formula
  desc "Cross-platform task scheduler with native OS integration"
  homepage "https://github.com/byteowlz/skdlr"
  version "0.2.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/skdlr/releases/download/v0.2.7/skdlr-v0.2.7-x86_64-apple-darwin.tar.gz"
      sha256 "29336f9a0caef178630eb43befdb63388f2a0afca66e4583031602a79f01bf70"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/skdlr/releases/download/v0.2.7/skdlr-v0.2.7-aarch64-apple-darwin.tar.gz"
      sha256 "945a39c7d97953a2fead6caba21a3b2928ad0447c31e7380845af575e2ae04d8"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/skdlr/releases/download/v0.2.7/skdlr-v0.2.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7ff933c92a709ab9cf1813b4a782e9aa67ed6889fdd68205d29aee9f2c925250"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/skdlr/releases/download/v0.2.7/skdlr-v0.2.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "caa61b2e02e887040e1dc598af3a99d288df7af274ef16a15c0cc7b1dea15ac2"
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
    system "#{bin}/skdlr", "--version"
  end
end
