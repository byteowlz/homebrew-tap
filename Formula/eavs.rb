# typed: false
# frozen_string_literal: true

class Eavs < Formula
  desc "A Byteowlz tool"
  homepage "https://github.com/byteowlz/eavs"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/eavs/releases/download/v0.7.0/eavs-v0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "7abbc56d6120c7b341da09e9ad4ab4fd6035d3330f499406c04ac97134324d06"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/eavs/releases/download/v0.7.0/eavs-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "76b60326666af3b911a171b8f71b038e2e719f7546f76b5e84c3bb235326e04c"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/eavs/releases/download/v0.7.0/eavs-v0.7.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cbf541afa6b4d56ef1302910e6ee2deec92a66d51bbed4729f5d5bf9f70f4ec5"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/eavs/releases/download/v0.7.0/eavs-v0.7.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4df3efd4d4a58ea5894312e96062838c741002b833caaa2321e474937f1e5249"
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
