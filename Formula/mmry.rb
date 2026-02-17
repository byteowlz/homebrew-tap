# typed: false
# frozen_string_literal: true

class Mmry < Formula
  desc "A Byteowlz tool"
  homepage "https://github.com/byteowlz/mmry"
  version "0.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/mmry/releases/download/v0.9.0/mmry-v0.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "9304471d73cb43172cd0b24cb799f4cb19155d08cad17abf5188cd0f03385872"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/mmry/releases/download/v0.9.0/mmry-v0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "3da72fc133666ccc2aa60476447dff192dd8a2f40382060376d2d103a21fdac7"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/mmry/releases/download/v0.9.0/mmry-v0.9.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b85c942d740435f524f65615d6b98781ca597c71a9e6f17c9212b98f9b293682"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/mmry/releases/download/v0.9.0/mmry-v0.9.0-aarch64-unknown-linux-gnu.tar.gz"
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
