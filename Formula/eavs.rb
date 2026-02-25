# typed: false
# frozen_string_literal: true

class Eavs < Formula
  desc "A Byteowlz tool"
  homepage "https://github.com/byteowlz/eavs"
  version "0.5.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/eavs/releases/download/v0.5.13/eavs-v0.5.13-x86_64-apple-darwin.tar.gz"
      sha256 "2dfe43baff3b41be1c5909dcf2ce287755720cbb745d3ed753e9fc503177c151"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/eavs/releases/download/v0.5.13/eavs-v0.5.13-aarch64-apple-darwin.tar.gz"
      sha256 "72f47af33e7a1f22f61c5e83ef02343fcb4f49ed0500a1ccc858ee041fc01e69"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/eavs/releases/download/v0.5.13/eavs-v0.5.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b162d3aced712c424f5d81d518acd0ec10307282a3b11d51d6ef4b8565c14f4b"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/eavs/releases/download/v0.5.13/eavs-v0.5.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c244f650bfd327211435d7d58a5a81ffaa7a74fdcad8ea67124a900197946efc"
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
    system "#{bin}/eavs", "--version"
  end
end
