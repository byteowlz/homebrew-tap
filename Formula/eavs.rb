# typed: false
# frozen_string_literal: true

class Eavs < Formula
  desc "A Byteowlz tool"
  homepage "https://github.com/byteowlz/eavs"
  version "0.5.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/eavs/releases/download/v0.5.14/eavs-v0.5.14-x86_64-apple-darwin.tar.gz"
      sha256 "52e14972dcce4007a17394809bb68d1a0d69fce6becca17b7f7e7a639d02f9f4"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/eavs/releases/download/v0.5.14/eavs-v0.5.14-aarch64-apple-darwin.tar.gz"
      sha256 "41d2e3bb8285dd93b6c0b069a29f7622570966a5c3dc0d6c2505feb41c95fc6a"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/eavs/releases/download/v0.5.14/eavs-v0.5.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5e96a9abc003ce1f5a328624efa9ac90aae080d0ec8e728a8400214efd79af6a"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/eavs/releases/download/v0.5.14/eavs-v0.5.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8abf993a97704b09068c0d519f4ca6169ca0fe27f0a29574de48e4d8fb62cebf"
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
