# typed: false
# frozen_string_literal: true

class Hstry < Formula
  desc "a unified history for all your agents"
  homepage "https://github.com/byteowlz/hstry"
  version "0.5.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.2/hstry-v0.5.2-x86_64-apple-darwin.tar.gz"
      sha256 "528915457fa6cae8c8afd5bca465b6365b6b83401d44cb0e357de3dac613ffa1"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.2/hstry-v0.5.2-aarch64-apple-darwin.tar.gz"
      sha256 "bf4270c9e5222423438d7f584d0bddf1719a22b56a5a6340c096d50223e87477"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.2/hstry-v0.5.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "814f8e60b1d3ddf022b6e0aab95642be10c1275725a06593f94fa03963aa0a33"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.2/hstry-v0.5.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "97fce979dde45b6387ed719c83373774a862110446b9e267e7a0101b7928d198"
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
    system "#{bin}/hstry", "--version"
  end
end
