# typed: false
# frozen_string_literal: true

class Eavs < Formula
  desc "A Byteowlz tool"
  homepage "https://github.com/byteowlz/eavs"
  version "0.5.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/eavs/releases/download/v0.5.5/eavs-v0.5.5-x86_64-apple-darwin.tar.gz"
      sha256 "cc173007ab0802ed21ffe93ff01b87018a1a3cafaaf8e5b8d1d24a0836b73d12"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/eavs/releases/download/v0.5.5/eavs-v0.5.5-aarch64-apple-darwin.tar.gz"
      sha256 "5b749bebb41c2f886d01fa4ab5bbc360de8d083c1eb70da78ee32706da73e3a4"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/eavs/releases/download/v0.5.5/eavs-v0.5.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b95ab31cc6c63128e933293f18f9d4783fa7887a8bf6d8f111c6a506a9800d60"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/eavs/releases/download/v0.5.5/eavs-v0.5.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3f2c8dae9e4e300806f8620d2b62884e97ca65f46bd8b4b9970d603a989d372e"
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
    system "#{bin}/eavs", "--version"
  end
end
