# typed: false
# frozen_string_literal: true

class Hstry < Formula
  desc "a unified history for all your agents"
  homepage "https://github.com/byteowlz/hstry"
  version "0.5.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.13/hstry-v0.5.13-x86_64-apple-darwin.tar.gz"
      sha256 "b34df9ba95ae8ffa6ac4d090c2d56d824a07d9556ae4d0606d7f7b3b57c2513c"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.13/hstry-v0.5.13-aarch64-apple-darwin.tar.gz"
      sha256 "f015f05c5bd1bdc9a51f6f2013e83719beaa6c42c130918a5f5ee82fec88a348"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.13/hstry-v0.5.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8e5963687caada944ee4b50e73dcb545e2fc9ffd73beea7564b1b727028e6292"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.13/hstry-v0.5.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b61b51fe19080e2c54db94851451051154d75aa0e9f94554abc3ceaa44000791"
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
    system "#{bin}/hstry", "--version"
  end
end
