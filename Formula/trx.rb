# typed: false
# frozen_string_literal: true

class Trx < Formula
  desc "lean issue tracker"
  homepage "https://github.com/byteowlz/trx"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/trx/releases/download/v0.5.1/trx-v0.5.1-x86_64-apple-darwin.tar.gz"
      sha256 "3cdc9d0d5bc61eba1430f344d874cc3e35f5addbacb09a424cc507ff07d63d0e"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/trx/releases/download/v0.5.1/trx-v0.5.1-aarch64-apple-darwin.tar.gz"
      sha256 "1ea431ea3b9339fa732a045417d5a1c56f5a8c2548781e13033998981e147e01"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/trx/releases/download/v0.5.1/trx-v0.5.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8ac078e0b0c0c05b09e4fb3df7dc30b8ebd89366661a79f835a30f4e0ed14128"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/trx/releases/download/v0.5.1/trx-v0.5.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0218b5050cff523ea367830614d6d42d3d70719d44f7a67731458ceaad7a9871"
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
