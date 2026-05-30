# typed: false
# frozen_string_literal: true

class Trx < Formula
  desc "lean issue tracker"
  homepage "https://github.com/byteowlz/trx"
  version "0.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/trx/releases/download/v0.6.1/trx-v0.6.1-x86_64-apple-darwin.tar.gz"
      sha256 "bb7d54f0beb6a456993a5a132cca132761a31bbd72b0b2391a317ecdcb6dcca9"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/trx/releases/download/v0.6.1/trx-v0.6.1-aarch64-apple-darwin.tar.gz"
      sha256 "87dec7118c1e4aa47042bda2124e7c71017a129754f0aeb0ebba2f053d0359b5"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/trx/releases/download/v0.6.1/trx-v0.6.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "80a0c59eab8165369cc779f9d09ad156efd5f97a4f6ac827f3c03bf077c3fb49"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/trx/releases/download/v0.6.1/trx-v0.6.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dbeecda0eb8652e0598f7f40a3fbec1015387ceac6e97380bcd2dc08e3ddd1c4"
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
