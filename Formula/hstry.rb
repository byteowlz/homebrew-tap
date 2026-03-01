# typed: false
# frozen_string_literal: true

class Hstry < Formula
  desc "a unified history for all your agents"
  homepage "https://github.com/byteowlz/hstry"
  version "0.5.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.3/hstry-v0.5.3-x86_64-apple-darwin.tar.gz"
      sha256 "c5bc944ff5ee2c638e8e199fadf5c95f3cf26d1be94f37333651bc3a0bfa59de"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.3/hstry-v0.5.3-aarch64-apple-darwin.tar.gz"
      sha256 "e4ec2990e3c655a64115eadbbb89551d6e8e5a7f3dc8e364264e66e9661ff337"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.3/hstry-v0.5.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "69daff13a7689161c760e185b6ed02a23a101db115604e0e7a08d37fa8193896"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.3/hstry-v0.5.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1a65b29ff7dc6333b3e017014053bc9e908d61eff560a38e4ece6a42198db62e"
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
