# typed: false
# frozen_string_literal: true

class Mmry < Formula
  desc "A Byteowlz tool"
  homepage "https://github.com/byteowlz/mmry"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/mmry/releases/download/v0.8.0/mmry-v0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "a80230d715c2dde15bcdbaf10c467faa16db764c66306850ee9c1fde03064957"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/mmry/releases/download/v0.8.0/mmry-v0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "b305e911dfce84011ab95519f47b14cacc832c256b4b68bfcf0df6f539bf3c8c"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/mmry/releases/download/v0.8.0/mmry-v0.8.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "713276207309d5a2ea27e5792a4027694f818bae680d0e22bca89c2d534353d6"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/mmry/releases/download/v0.8.0/mmry-v0.8.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
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
