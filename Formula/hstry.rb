# typed: false
# frozen_string_literal: true

class Hstry < Formula
  desc "a unified history for all your agents"
  homepage "https://github.com/byteowlz/hstry"
  version "0.5.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.16/hstry-v0.5.16-x86_64-apple-darwin.tar.gz"
      sha256 "bba451e36df11820a34df37e996d312089c2033ffba24ffcabc33a7f850d3a6c"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.16/hstry-v0.5.16-aarch64-apple-darwin.tar.gz"
      sha256 "b93ea536801481b8a1a148fc52e2fddb12ceb5270166904e1a984278366205d8"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.16/hstry-v0.5.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d6e5c970888cf8839720b4fd1b21bc347fe35d2a4866485fc7c2b4226b0f896f"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.16/hstry-v0.5.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d3899bb30caf9499359084050147dde1cd4b47f503d0c13dafd0f49dda543a91"
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
