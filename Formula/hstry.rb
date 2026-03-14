# typed: false
# frozen_string_literal: true

class Hstry < Formula
  desc "a unified history for all your agents"
  homepage "https://github.com/byteowlz/hstry"
  version "0.5.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.7/hstry-v0.5.7-x86_64-apple-darwin.tar.gz"
      sha256 "478b365dbb07cdf151ae4c2a863db14c79bb6125dc2b4199344e0bacb00fcab7"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.7/hstry-v0.5.7-aarch64-apple-darwin.tar.gz"
      sha256 "38aa7c735073ded1ad3d869728426ff86e426ecfa44b83b159054b7ba0022844"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.7/hstry-v0.5.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1ec735d6305c7edf170e8ea94ecbfb10448181797a10d97bc98810ae6dd17e42"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.7/hstry-v0.5.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d13ffef3d489fa92bbdec23a74d6eda6827636d33f74b7355fcae8ec505cfa79"
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
