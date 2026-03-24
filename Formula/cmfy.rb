# typed: false
# frozen_string_literal: true

class Cmfy < Formula
  desc "A Byteowlz tool"
  homepage "https://github.com/byteowlz/cmfy"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/cmfy/releases/download/v0.2.1/cmfy-v0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "4f4ca2478c1c0e6fe3b2224385a373e991a01f81070e295cded2f0bfc5070852"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/cmfy/releases/download/v0.2.1/cmfy-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "d8e55bd52d7bf600a203d214fc7e2ced99fb8533192c78b34fdd39d3bdcb4812"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/cmfy/releases/download/v0.2.1/cmfy-v0.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "eb7892bbe5b462fd1743cbc58a527f0e22219fc944dcdcad246e4af659e28ed8"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/cmfy/releases/download/v0.2.1/cmfy-v0.2.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c9440363676ff52e96c389a50a46964ceea5220e5b5aa978cfa7177392864f7c"
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
