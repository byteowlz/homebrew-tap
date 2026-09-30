# typed: false
# frozen_string_literal: true

class Mmry < Formula
  desc "A Byteowlz tool"
  homepage "https://github.com/byteowlz/mmry"
  version "0.14.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/mmry/releases/download/v0.14.0/mmry-v0.14.0-x86_64-apple-darwin.tar.gz"
      sha256 "ef88a9801ef2b4ebf17c678e763f17f43fdd453331b7ae7897aa6bd2c02d546f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/mmry/releases/download/v0.14.0/mmry-v0.14.0-aarch64-apple-darwin.tar.gz"
      sha256 "a102c63a6c1e5762e9228c358c411ff17c563e2a3461fe9465c410824e153441"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/mmry/releases/download/v0.14.0/mmry-v0.14.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d34abf3eb899dabf2e3c5f5babe0c68d58eab0b2f5a6ed78f84e53f838c3d1d9"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/mmry/releases/download/v0.14.0/mmry-v0.14.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "17dfdee9bd6462380fcb13e274dfda74476e6267780b194f1108054e89fabae6"
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
    system "#{bin}/mmry", "--version"
  end
end
