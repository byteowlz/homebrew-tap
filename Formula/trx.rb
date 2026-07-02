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
      sha256 "1afdc2bebc053240223b10d39cfedf30ff08e9214dff59c9d687f4c3fc71b2a1"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/trx/releases/download/v0.6.3/trx-v0.6.3-aarch64-apple-darwin.tar.gz"
      sha256 "ab8d3fb8a335fa427260d5fbc7c6bb3054680eab05ad319160a12b9651f4a9cc"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/trx/releases/download/v0.6.3/trx-v0.6.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6994fc9a444da34c81f8b3d81f802ca052be82ba937d14b0c3e29f8e78a4ded4"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/trx/releases/download/v0.6.3/trx-v0.6.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "30a8d8c873c88c72fbdabcd2a9df07ae46a929c6f6bea5f67bb2a0d697cf75ba"
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
