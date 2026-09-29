# typed: false
# frozen_string_literal: true

class Hstry < Formula
  desc "a unified history for all your agents"
  homepage "https://github.com/byteowlz/hstry"
  version "0.5.26"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.26/hstry-v0.5.26-x86_64-apple-darwin.tar.gz"
      sha256 "f308fea5bbd553dcbdd8703aa16d5ca1892a08bf704aa19ba4b2ceda34b2f70a"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.26/hstry-v0.5.26-aarch64-apple-darwin.tar.gz"
      sha256 "f56a7d99ff79f5d27bc29df1ec2c544b323b48bcff5d8da5fb3c46deb30808a5"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.26/hstry-v0.5.26-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3c97a80d521f489e0e513c1f1ed5c6ef732702c000c2d16b74411f03e72d04fb"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.26/hstry-v0.5.26-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "828ef62c44465d154a523b001dcc8e2bdbff8815732d7e1ca1ec06545c4e7cc4"
    end
  end

  def install
    # byt-packaged tarballs stage executables under bin/; older flat
    # tarballs keep them at the archive root. Support both.
    if Dir.exist?("bin")
      bin.install Dir["bin/*"]
    else
      Dir.glob("*").each do |file|
        next if File.directory?(file)
        next unless File.executable?(file)
        bin.install file
      end
    end
  end

  test do
    system "#{bin}/hstry", "--version"
  end
end
