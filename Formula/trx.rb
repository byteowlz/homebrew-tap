# typed: false
# frozen_string_literal: true

class Trx < Formula
  desc "lean issue tracker"
  homepage "https://github.com/byteowlz/trx"
  version "0.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/trx/releases/download/v0.6/trx-v0.6-x86_64-apple-darwin.tar.gz"
      sha256 "1409007e0e8f2b8132e26688ddb2c9afd405236b1cf367ad9686b98d6ad3e08d"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/trx/releases/download/v0.6/trx-v0.6-aarch64-apple-darwin.tar.gz"
      sha256 "115c37b95f49ac06f7642f5417b9a775eb0b60df46cff5462c048520c42bf39d"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/trx/releases/download/v0.6/trx-v0.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bfafcce72b6ebdbe8d808a51f3c4b1a28c07d85868c38f516e0c28438c4780f6"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/trx/releases/download/v0.6/trx-v0.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5c3b6a1c87c5790029b755bcc8d75dba4350108bd3f8f30a2348f04ad20810f8"
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
