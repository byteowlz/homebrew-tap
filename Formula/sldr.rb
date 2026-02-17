# typed: false
# frozen_string_literal: true

class Sldr < Formula
  desc "Modular markdown presentations powered by slidev"
  homepage "https://github.com/byteowlz/sldr"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/sldr/releases/download/v0.2.0/sldr-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "c64372e90554b196c494126559e12f9d0058cfa1d00d85fcb7a5330bf130fd67"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/sldr/releases/download/v0.2.0/sldr-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "1b3620741cc9e81fad1eaea7090d06593db6b5135218482a6d61199592311ab2"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/sldr/releases/download/v0.2.0/sldr-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a1cb4c8cfc172008cff9b58b2ff3dbe68f434999a7110005cd33267cfe23fce3"
    end
  end

  def install
    Dir.glob("*").each do |file|
      next if File.directory?(file)
      next unless File.executable?(file)
      bin.install file
    end
  end

  test do
    system "#{bin}/sldr", "--version"
  end
end
