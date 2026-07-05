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
      sha256 "5f7cbe772ae1cd7960bfa5c2a780ca0033e6e44bdd55416a14f1ba6cb0c23c36"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/skdlr/releases/download/v0.2.7/skdlr-v0.2.7-aarch64-apple-darwin.tar.gz"
      sha256 "c0b32167398b6932b29fe1f85b8cf02003b0f587331d4bb5c8292616c7993793"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/skdlr/releases/download/v0.2.7/skdlr-v0.2.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e22ea165d751c9d206d9c792ad65b160f1dcb3d7eb8ce40551dabc28ee388949"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/skdlr/releases/download/v0.2.7/skdlr-v0.2.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "271bd2d3b764ad12002973f602f123997e12c58d1807c41d47cbc375741a0714"
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
