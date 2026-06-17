# typed: false
# frozen_string_literal: true

class Sldr < Formula
  desc "A Byteowlz tool"
  homepage "https://github.com/byteowlz/sldr"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/sldr/releases/download/v0.5.0/sldr-v0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "9cc4d574fb9ad41f1d4db7ca4cf08b9e2c9bcc8d4493669e9cfd33ce8e2e475c"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/sldr/releases/download/v0.5.0/sldr-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "0683eeb842c2619caedcbf709530ca297b86c8850439bfe1ca777016f903ac8e"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/sldr/releases/download/v0.5.0/sldr-v0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "03f8e48f3e2d0f8e49590fc3cd07cd439eef7d9a861abe2ba44bad9b6b12aef0"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/sldr/releases/download/v0.5.0/sldr-v0.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "36104219966854a257d413f035c2ca5bb5f85b9c646b2612d72803fa646a1578"
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
