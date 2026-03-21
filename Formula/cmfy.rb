# typed: false
# frozen_string_literal: true

class Cmfy < Formula
  desc "A Byteowlz tool"
  homepage "https://github.com/byteowlz/cmfy"
  version "0.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/cmfy/releases/download/v0.2.3/cmfy-v0.2.3-x86_64-apple-darwin.tar.gz"
      sha256 "f3643958bc213e6fc282f334fb9b89579eadd65be1a98ca1025abc14859f5727"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/cmfy/releases/download/v0.2.3/cmfy-v0.2.3-aarch64-apple-darwin.tar.gz"
      sha256 "7950c4e778debde9255a2a87ea5d9d7ca0c99c94929d047dd194a4775aaa77d4"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/cmfy/releases/download/v0.2.3/cmfy-v0.2.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a8df5e3c48813aae4dff40811a3ff262a2a5fd1e4930a719a2893c87c39e2519"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/cmfy/releases/download/v0.2.3/cmfy-v0.2.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "67bcd1e5be12d079ca6cd810edfc7e07cbc6a769ed6199db239f8f75ed633b1e"
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
