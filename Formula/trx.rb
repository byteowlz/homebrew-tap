# typed: false
# frozen_string_literal: true

class Trx < Formula
  desc "lean issue tracker"
  homepage "https://github.com/byteowlz/trx"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/trx/releases/download/v0.5.0/trx-v0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "38c195779d5f4447b30f73a8ddbc1884a1c90ff513030fc7da8b7ed5716cda11"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/trx/releases/download/v0.5.0/trx-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "00185f8df8761379c40683e58e565c6878e3517f86891ce2d43aacc617439463"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/trx/releases/download/v0.5.0/trx-v0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0d201f9eecda734885be93a3653074c493be6f99163af96b48e9ae9e2f5e67e2"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/trx/releases/download/v0.5.0/trx-v0.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3bd0bd73a8a3bd9a2b712a4e5cc8bf01b3d5d42c4bd11357c251e00697faf6f0"
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
    system "#{bin}/trx", "--version"
  end
end
