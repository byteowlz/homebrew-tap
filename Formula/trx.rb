# typed: false
# frozen_string_literal: true

class Trx < Formula
  desc "lean issue tracker"
  homepage "https://github.com/byteowlz/trx"
  version "0.8.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/trx/releases/download/v0.8.1/trx-v0.8.1-x86_64-apple-darwin.tar.gz"
      sha256 "ed19fb9b49f9420a1db0214ebdca3afebb187a63374693ad948177c0594b78b4"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/trx/releases/download/v0.8.1/trx-v0.8.1-aarch64-apple-darwin.tar.gz"
      sha256 "e936c226f37dac9ecac50d8d2cacaf7d6669ba2836cdefdb8613e6d5b50857eb"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/trx/releases/download/v0.8.1/trx-v0.8.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e90c3e61c29ff7f8890ad81e0861a39648adf841d3ea9311d882294b33a7dc30"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/trx/releases/download/v0.8.1/trx-v0.8.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "388c7f2f03dae2a430d13627b5eea9aec834ef859b84ff5b67d4551e6a3d13e4"
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
