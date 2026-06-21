# typed: false
# frozen_string_literal: true

class Sldr < Formula
  desc "A Byteowlz tool"
  homepage "https://github.com/byteowlz/sldr"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/sldr/releases/download/v0.6.0/sldr-v0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "81943fd054bf87f6ed7e0061a4d094b051ad86e4687e7575bc4c83bc50664c03"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/sldr/releases/download/v0.6.0/sldr-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "cae762ce73352c693a17bed953b9341afe7a743e9b60bc7c9919105cb859e09b"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/sldr/releases/download/v0.6.0/sldr-v0.6.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6c4d2e0cb55c0ba68776fb1f6482afd2dfa76aebb5555afd848d2196618eb9f4"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/sldr/releases/download/v0.6.0/sldr-v0.6.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "640b73804647f15aca5eb1a1174a60452b6df7b7d4eb91b9bd93e008724eaf73"
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
    system "#{bin}/sldr", "--version"
  end
end
