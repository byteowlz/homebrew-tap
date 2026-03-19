# typed: false
# frozen_string_literal: true

class Hstry < Formula
  desc "a unified history for all your agents"
  homepage "https://github.com/byteowlz/hstry"
  version "0.5.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.9/hstry-v0.5.9-x86_64-apple-darwin.tar.gz"
      sha256 "909c9bf91919dd13bf04906b25fe1c367446a1588898236e71e3519274a676f4"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.9/hstry-v0.5.9-aarch64-apple-darwin.tar.gz"
      sha256 "68da4eaf530a2a15c52ee652fb2c94eccb32163bdfb2c5ff67cb14b4d5ac8b85"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.9/hstry-v0.5.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7866f448afbc79f547f41097ad74fb78ab581781717ea9cd5a85bb946f5a85e9"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.9/hstry-v0.5.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1b84844269f8748575f64637563e47758baf3bd26786d88d2044e480f0f90df7"
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
