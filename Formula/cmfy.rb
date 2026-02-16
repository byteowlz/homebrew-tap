# typed: false
# frozen_string_literal: true

class Cmfy < Formula
  desc "A flexible ComfyUI CLI"
  homepage "https://github.com/byteowlz/cmfy"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/cmfy/releases/download/v0.1.0/cmfy-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "7f4f00d35f97f533cc2c85a41ea44ed009b5ac2352234acddfafb01a52412dca"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/cmfy/releases/download/v0.1.0/cmfy-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "5db53ea68f8fab20c499e595ba468f99fb5574c40abff1935dbfac5109f08b7c"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/cmfy/releases/download/v0.1.0/cmfy-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1884702bc9c0aef8ef8fe8687588703f068ee3398d4132875ecc6a740e5b17e9"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/cmfy/releases/download/v0.1.0/cmfy-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7b561d5c03dfc4989744d9c051cef10cbf0f621a87658c3d27186e556f379901"
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
    system "#{bin}/cmfy", "--version"
  end
end
