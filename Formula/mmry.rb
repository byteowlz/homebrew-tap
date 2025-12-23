# typed: false
# frozen_string_literal: true

class Mmry < Formula
  desc "A lean, local-first memory management system for humans and AI agents"
  homepage "https://github.com/byteowlz/mmry"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/mmry/releases/download/v0.7.0/mmry-v0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER_WILL_BE_UPDATED_ON_RELEASE"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/mmry/releases/download/v0.7.0/mmry-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER_WILL_BE_UPDATED_ON_RELEASE"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/mmry/releases/download/v0.7.0/mmry-v0.7.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "PLACEHOLDER_WILL_BE_UPDATED_ON_RELEASE"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/mmry/releases/download/v0.7.0/mmry-v0.7.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "PLACEHOLDER_WILL_BE_UPDATED_ON_RELEASE"
    end
  end

  def install
    bin.install "mmry"
    bin.install "mmry-mcp"
    bin.install "mmry-tui"
    bin.install "mmry-service"
  end

  test do
    system "#{bin}/mmry", "--version"
  end
end
