# typed: false
# frozen_string_literal: true

class Cmfy < Formula
  desc "A Byteowlz tool"
  homepage "https://github.com/byteowlz/cmfy"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/cmfy/releases/download/v0.2.0/cmfy-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "f195b247cd04de5abf8cd75842bb2739bbe194661eca4b5da53e2d21f22ea005"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/cmfy/releases/download/v0.2.0/cmfy-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "6f4221006128470cffcd9bb623b39f8a901441268d3cf60eb744c25cd9b040d8"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/cmfy/releases/download/v0.2.0/cmfy-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dd11476a30c0a1b3b5add4ac502cb3f1e4f1f743a4df2b9b98de5e86f85077d1"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/cmfy/releases/download/v0.2.0/cmfy-v0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ab9483bcbe50e712ed2498a50522680687515eb36a2a814a996d0b3641c6df77"
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
    system "#{bin}/cmfy", "--version"
  end
end
