# typed: false
# frozen_string_literal: true

class Sldr < Formula
  desc "A Byteowlz tool"
  homepage "https://github.com/byteowlz/sldr"
  version "0.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/sldr/releases/download/v0.6.1/sldr-v0.6.1-x86_64-apple-darwin.tar.gz"
      sha256 "e867332dca8973e25096622fdecfa67d2fb364c8045339289a444e02283411bb"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/sldr/releases/download/v0.6.1/sldr-v0.6.1-aarch64-apple-darwin.tar.gz"
      sha256 "2aa7bc0ae84e0bd3c83c7773bf794416bd975173ed39ab8dd1e7e8ab2daea58b"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/sldr/releases/download/v0.6.1/sldr-v0.6.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "085c3a7031301d122349e45bc2947161579389916f24a5e99a9c659847a5e410"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/sldr/releases/download/v0.6.1/sldr-v0.6.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c36a805e14ab91f5d269bc6927622f92445f0b09d1cc9fb3ef4eb877639da175"
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
    system "#{bin}/sldr", "--version"
  end
end
