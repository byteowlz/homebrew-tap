# typed: false
# frozen_string_literal: true

class Tmz < Formula
  desc "making MS teams barely bearable"
  homepage "https://github.com/byteowlz/tmz"
  version "0.2.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/tmz/releases/download/v0.2.6/tmz-v0.2.6-x86_64-apple-darwin.tar.gz"
      sha256 "6e70a3fd3bc9ff0aa2d193b5b2aadea5de5f2aa0603a2f2e833a544b8c025960"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/tmz/releases/download/v0.2.6/tmz-v0.2.6-aarch64-apple-darwin.tar.gz"
      sha256 "0adf12d5a5e8c93b8fbae9364b58abde3104ac0f18cc1e8cfce9fd4429a7b67d"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/tmz/releases/download/v0.2.6/tmz-v0.2.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cd63a2d1f2111e0a5cc6df9b01bfbdba8fff65475573d3117d69e68b694da190"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/tmz/releases/download/v0.2.6/tmz-v0.2.6-aarch64-unknown-linux-gnu.tar.gz"
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
    system "#{bin}/tmz", "--version"
  end
end
