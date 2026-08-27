# typed: false
# frozen_string_literal: true

class Trx < Formula
  desc "lean issue tracker"
  homepage "https://github.com/byteowlz/trx"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/trx/releases/download/v0.7.0/trx-v0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "f008b6c8f28792bd4bdb318172377c44fdb8eaaccc00c5037c88787cd7e88d27"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/trx/releases/download/v0.7.0/trx-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "1c7e8fc27c2b16430c030fa50db6fc2c300c018bab8ee8cc32961462952f2f70"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/trx/releases/download/v0.7.0/trx-v0.7.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3c95bb43448e5b48122e02f3623d4aa6a23c3774ab08cdcea2578a0838262cb0"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/trx/releases/download/v0.7.0/trx-v0.7.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0508d43bcd3762fef5809f13c624fe6ac4f0cc3c4754bb75f8a76d6f2c70a949"
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
