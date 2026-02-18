# typed: false
# frozen_string_literal: true

class Tmz < Formula
  desc "making MS teams barely bearable"
  homepage "https://github.com/byteowlz/tmz"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/tmz/releases/download/v0.2.1/tmz-v0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "4f8fe926e540f4355393d0aff4de4003048db2857daf4b23f6d27c1217a6dac5"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/tmz/releases/download/v0.2.1/tmz-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "36d69101da842ef0b1562ef7f4e6caf97b8f91ff68317c8ed7575161b96e0d8b"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/tmz/releases/download/v0.2.1/tmz-v0.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "23fe9f6abfafbf939a693e1d2f2e5c89f9e6c0c7f419cdd1a5c05d36ccea576b"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/tmz/releases/download/v0.2.1/tmz-v0.2.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
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
    system "#{bin}/tmz", "--version"
  end
end
