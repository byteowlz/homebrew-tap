# typed: false
# frozen_string_literal: true

class Eavs < Formula
  desc "A Byteowlz tool"
  homepage "https://github.com/byteowlz/eavs"
  version "0.7.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/eavs/releases/download/v0.7.1/eavs-v0.7.1-x86_64-apple-darwin.tar.gz"
      sha256 "6032ec042045e72f662dece0f57646f6a2b7a97df14a3e9530d58d9fafb435f8"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/eavs/releases/download/v0.7.1/eavs-v0.7.1-aarch64-apple-darwin.tar.gz"
      sha256 "86c53d4a1ca64176b00ad7f32dd5fda102ac638e61c7376e9197fd6d5bb84c67"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/eavs/releases/download/v0.7.1/eavs-v0.7.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "12b6d87e5e9962f78da99e70f6ed85f6994e17efbce50653e43644f3ae19e8c5"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/eavs/releases/download/v0.7.1/eavs-v0.7.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1c6530cb142fdc9def189f618f553f1a3346cef2d1ab225980da3811ad106129"
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
