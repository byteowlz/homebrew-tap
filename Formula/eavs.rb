# typed: false
# frozen_string_literal: true

class Eavs < Formula
  desc "A Byteowlz tool"
  homepage "https://github.com/byteowlz/eavs"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/eavs/releases/download/v0.8.0/eavs-v0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "5b746a2ff5a7860169149fe3267727576d47d3ce0d7a3e3a77ba356a7110fbf5"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/eavs/releases/download/v0.8.0/eavs-v0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "9a7d8e7e26a8b0e6fba5953b6942052f563c4158fea99dff6906bb175260a09e"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/eavs/releases/download/v0.8.0/eavs-v0.8.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "48838351c144b34d2cd1715d2c2edcc0dac4c69f1c4b1f73b44dbdf25e95e6ae"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/eavs/releases/download/v0.8.0/eavs-v0.8.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3cb27f311cc4f6f7f5bd8cfb3112dc5d53e5caa48c1bfe2a543d115de6a50872"
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
    system "#{bin}/eavs", "--version"
  end
end
