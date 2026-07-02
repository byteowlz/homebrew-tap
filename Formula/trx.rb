# typed: false
# frozen_string_literal: true

class Trx < Formula
  desc "lean issue tracker"
  homepage "https://github.com/byteowlz/trx"
  version "0.6.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/trx/releases/download/v0.6.3/trx-v0.6.3-x86_64-apple-darwin.tar.gz"
      sha256 "2fffaa16e684b695c0beba7622e952e97585e9eea5889903a7f1b5828711306e"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/trx/releases/download/v0.6.3/trx-v0.6.3-aarch64-apple-darwin.tar.gz"
      sha256 "7631c43d16140d0cf2126e5a94f397e558e50d2756bd1708873de055d2a1dfac"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/trx/releases/download/v0.6.3/trx-v0.6.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2501ba3e24cdb2056e66f8b88aab91a47844b456ba9fa320e62bdaa6c1ef393b"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/trx/releases/download/v0.6.3/trx-v0.6.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2b402b92af544578a63e61ecd4e7ef8c85218cb7e02735b60af62d749d2f6a91"
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
