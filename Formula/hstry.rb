# typed: false
# frozen_string_literal: true

class Hstry < Formula
  desc "a unified history for all your agents"
  homepage "https://github.com/byteowlz/hstry"
  version "0.5.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.11/hstry-v0.5.11-x86_64-apple-darwin.tar.gz"
      sha256 "01daf429ebe044d17c6e93cc96919a82ba91d7b02d1cbafc6463e0a4e22614de"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.11/hstry-v0.5.11-aarch64-apple-darwin.tar.gz"
      sha256 "b392f83da756d38d5bfdb57936354b59933c4f074a6bf5114c5c3dee1e999035"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.11/hstry-v0.5.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b114a6aed93d4150037010b191ba63357866dc913ee1ca45dcc0675743c8c4d3"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.11/hstry-v0.5.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4e37d33f01fc7de96cac6642ace03dcd90827ccba4f0e04aa74c990c043953b1"
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
