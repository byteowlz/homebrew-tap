# typed: false
# frozen_string_literal: true

class Hmr < Formula
  desc "Home Assistant CLI"
  homepage "https://github.com/byteowlz/hmr"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/hmr/releases/download/v0.4.1/hmr-v0.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "727e6a673b4d1a85e10f9f3d78a3ab7aab55bfa4f49be7c8330a6ab19273b719"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/hmr/releases/download/v0.4.1/hmr-v0.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "6954f5b31c22b99f51df3a4a263cf3b5226048c33f2412287cd3bc141a751b78"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hmr/releases/download/v0.4.1/hmr-v0.4.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "34958616e18aa901c9d6e5175a19a253abfb4debcab5a65add71982dcf26b8ad"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hmr/releases/download/v0.4.1/hmr-v0.4.1-aarch64-unknown-linux-gnu.tar.gz"
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
    system "#{bin}/hmr", "--version"
  end
end
