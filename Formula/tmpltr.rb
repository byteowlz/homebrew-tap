# typed: false
# frozen_string_literal: true

class Tmpltr < Formula
  desc "A Byteowlz tool"
  homepage "https://github.com/byteowlz/tmpltr"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/tmpltr/releases/download/v0.3.1/tmpltr-v0.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "f26a7e868f3884eb70582a6f8e439139715b9b98db036c242e5c3b02f0fff108"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/tmpltr/releases/download/v0.3.1/tmpltr-v0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "7f5c7b02ff2aff5e24223bd92b7fd9f0f1fa20cb4e1b678ebab1bef20777dcc7"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/tmpltr/releases/download/v0.3.1/tmpltr-v0.3.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "26e8882bddbef2a1803f20e9a913f06815daa1bda80e3d6c6f9f54addbc694a0"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/tmpltr/releases/download/v0.3.1/tmpltr-v0.3.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0079d084cdfacb4b2f2a8ed5c3618c5d768e3273cc8d5c69a0d648c0126e2d0b"
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
    system "#{bin}/tmpltr", "--version"
  end
end
