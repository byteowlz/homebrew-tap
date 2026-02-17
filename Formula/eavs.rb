# typed: false
# frozen_string_literal: true

class Eavs < Formula
  desc "Unified API gateway for LLM providers with virtual API keys and usage tracking"
  homepage "https://github.com/byteowlz/eavs"
  version "0.5.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/eavs/releases/download/v0.5.2/eavs-v0.5.2-x86_64-apple-darwin.tar.gz"
      sha256 "TBD"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/eavs/releases/download/v0.5.2/eavs-v0.5.2-aarch64-apple-darwin.tar.gz"
      sha256 "TBD"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/eavs/releases/download/v0.5.2/eavs-v0.5.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "TBD"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/eavs/releases/download/v0.5.2/eavs-v0.5.2-aarch64-unknown-linux-gnu.tar.gz"
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
    system "#{bin}/eavs", "--version"
  end
end
