# typed: false
# frozen_string_literal: true

class Mmry < Formula
  desc "A Byteowlz tool"
  homepage "https://github.com/byteowlz/mmry"
  version "0.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/mmry/releases/download/v0.11.0/mmry-v0.11.0-x86_64-apple-darwin.tar.gz"
      sha256 ""
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/mmry/releases/download/v0.11.0/mmry-v0.11.0-aarch64-apple-darwin.tar.gz"
      sha256 "c134d9b6f7d166c9d2ebdc8c5689fdabdae6f3eef1aed0aa0be06fccb4810a91"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/mmry/releases/download/v0.11.0/mmry-v0.11.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5ece330a769aee72670a40f0af7c852947e40b36980bfd8b4947744a8204fece"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/mmry/releases/download/v0.11.0/mmry-v0.11.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9d187b70b104e13139c566af8e44f349a7490beed4e57bd27a93472f4d00de13"
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
    system "#{bin}/mmry", "--version"
  end
end
