# typed: false
# frozen_string_literal: true

class Hstry < Formula
  desc "a unified history for all your agents"
  homepage "https://github.com/byteowlz/hstry"
  version "0.5.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.10/hstry-v0.5.10-x86_64-apple-darwin.tar.gz"
      sha256 "7b66f1ea1fa9ff2ac569ee64809fcf29f7a337ee1d12c0cc897ea9cd9765ce1f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.10/hstry-v0.5.10-aarch64-apple-darwin.tar.gz"
      sha256 "d2016cd73ec55eee11b586543d1682fb5f504cacd0438ad3c7c52d4e9cdae633"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.10/hstry-v0.5.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "876eafede508539bb74502499b08f40af0889bff394259f9d178a64ad438f2ab"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.10/hstry-v0.5.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "86662c0fdb5e4138dc32cad6fa36fa9649069555eae7ad17b888b82c97ab4f37"
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
