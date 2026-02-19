# typed: false
# frozen_string_literal: true

class Eavs < Formula
  desc "A Byteowlz tool"
  homepage "https://github.com/byteowlz/eavs"
  version "0.5.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/eavs/releases/download/v0.5.12/eavs-v0.5.12-x86_64-apple-darwin.tar.gz"
      sha256 "881a541dd2c2706997f2db21b4b3b33f00ebd44fc71f49fded0f9d1689a0d0d5"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/eavs/releases/download/v0.5.12/eavs-v0.5.12-aarch64-apple-darwin.tar.gz"
      sha256 "b719d502ed2dcb2cd78b60c2c11f09c05ba968b420cdc14cd6cb51983dad8489"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/eavs/releases/download/v0.5.12/eavs-v0.5.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5e53d38d191f22eef15bd452ec190137877b5553e8e0820d41ece954c9a7da79"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/eavs/releases/download/v0.5.12/eavs-v0.5.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f984d5d33fff642470fe0420c59a5975f9dfd3fe0899d9558367a9eab262fcd9"
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
