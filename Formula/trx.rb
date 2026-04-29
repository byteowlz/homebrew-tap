# typed: false
# frozen_string_literal: true

class Trx < Formula
  desc "lean issue tracker"
  homepage "https://github.com/byteowlz/trx"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/trx/releases/download/v0.4.1/trx-v0.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "66df1fb3a205ed06b8037635c92d188deb290b302155c50e65f1f387ffa88a6f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/trx/releases/download/v0.4.1/trx-v0.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "ca805850a2bea24d444e871b72731d542273b8cadc484a7f2dd26e7a0b8587bb"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/trx/releases/download/v0.4.1/trx-v0.4.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0c014a489876f7654d88cce3d18dbab226263aad522a0862a86ebefb1a5944b6"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/trx/releases/download/v0.4.1/trx-v0.4.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3822af9a94aa916d7d7e9c76f2cff1214e76c7ec904ba3f46feb59c584ea851f"
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
