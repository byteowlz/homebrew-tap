# typed: false
# frozen_string_literal: true

class Tmpltr < Formula
  desc "A Byteowlz tool"
  homepage "https://github.com/byteowlz/tmpltr"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/tmpltr/releases/download/v0.3.0/tmpltr-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "9333230c5b5012e461eb8d9c661d1f6116f1b00bc5f9455b591de7015672faca"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/tmpltr/releases/download/v0.3.0/tmpltr-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "c3b6ea2a6bc8c76b2978066138cce1dc6f02898119dc9612ecf58cae575e0767"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/tmpltr/releases/download/v0.3.0/tmpltr-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a3d28b3428916257bf28e01431a5bcadeb7780941e58f49e7d60664bcf63ac47"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/tmpltr/releases/download/v0.3.0/tmpltr-v0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6a2484ee0d6f9a0d6c7fc1faad21fb6d9a3ce35e4081867bd6ba505b70b2f5e1"
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
