# typed: false
# frozen_string_literal: true

class Hstry < Formula
  desc "a unified history for all your agents"
  homepage "https://github.com/byteowlz/hstry"
  version "0.5.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.3/hstry-v0.5.3-x86_64-apple-darwin.tar.gz"
      sha256 "c8f51f956fc0c08689d0f57bb4513d5b7f1e124cdff90958ce8d2a176581fb2a"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.3/hstry-v0.5.3-aarch64-apple-darwin.tar.gz"
      sha256 "72086b69376b9bd716ab6f86a1d15cd8de5c920748d65ad06d78fd4b3a1e8b4f"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.3/hstry-v0.5.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "87e4eaa8e23e2cbb9b0a98dbb05b215762effc9f770faa0b4e087c8c56afefa3"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.3/hstry-v0.5.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "13ec3e33ac28d2c8f5b7322e372e5c952287254d57401a3e1f25093f8237ddeb"
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
