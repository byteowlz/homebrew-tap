# typed: false
# frozen_string_literal: true

class Trx < Formula
  desc "lean issue tracker"
  homepage "https://github.com/byteowlz/trx"
  version "master"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/trx/releases/download/vmaster/trx-vmaster-x86_64-apple-darwin.tar.gz"
      sha256 "18118a4deaad4b573fb9bf5a27552a4b7715e3e1e4c6c9f13793cdc0f4959c4f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/trx/releases/download/vmaster/trx-vmaster-aarch64-apple-darwin.tar.gz"
      sha256 "5ff675d50c1cd75ab8e37f9fba7dc10c1ff68d60c546820796de60a2e9f68a4e"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/trx/releases/download/vmaster/trx-vmaster-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e24226faefa1bd46d4b71a1c6ca85cf0f0260cea7e5d52350da1fe23c17d142e"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/trx/releases/download/vmaster/trx-vmaster-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5403dcd5942c428464f09e1a000ec28e4dce735b713e741e1710f155e025a18f"
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
