# typed: false
# frozen_string_literal: true

class Mmry < Formula
  desc "A Byteowlz tool"
  homepage "https://github.com/byteowlz/mmry"
  version "0.10.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/mmry/releases/download/v0.10.3/mmry-v0.10.3-x86_64-apple-darwin.tar.gz"
      sha256 ""
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/mmry/releases/download/v0.10.3/mmry-v0.10.3-aarch64-apple-darwin.tar.gz"
      sha256 "3ce7aa38856af158543d2ee0a7e5afd6fc56a92134e873d5dc3dd4428b4827f7"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/mmry/releases/download/v0.10.3/mmry-v0.10.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f0b347a66b377ef255d68a75226e61a6d8b46f5af833bb956926de1431f7872e"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/mmry/releases/download/v0.10.3/mmry-v0.10.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2a550eea0760a8d7824b7865897a8f2850767a7b0401dee13f1cc74374631f6e"
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
    system "#{bin}/mmry", "--version"
  end
end
