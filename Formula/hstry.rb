# typed: false
# frozen_string_literal: true

class Hstry < Formula
  desc "a unified history for all your agents"
  homepage "https://github.com/byteowlz/hstry"
  version "0.5.20"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.20/hstry-v0.5.20-x86_64-apple-darwin.tar.gz"
      sha256 "5dc84bbd4427ef99593051517821dd490814a85cdc404935e474fee60dd27f91"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.20/hstry-v0.5.20-aarch64-apple-darwin.tar.gz"
      sha256 "356efd19c0147201076ff4e6843286f8eb4ac4f6f38c215fd4201ee180d18e8b"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.20/hstry-v0.5.20-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "77cb4ed23dec1979c782a19e1c77a427576579f7857f0b349bb3982ce2de45b3"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.20/hstry-v0.5.20-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6909cade997b7c19f091502135296d1727fd0a632fc3a95b3fcf247caf7aeb72"
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
