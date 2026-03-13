# typed: false
# frozen_string_literal: true

class Hstry < Formula
  desc "a unified history for all your agents"
  homepage "https://github.com/byteowlz/hstry"
  version "0.5.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.6/hstry-v0.5.6-x86_64-apple-darwin.tar.gz"
      sha256 "f79403bbb9969440c5f037a4365d2a5b38f48f3c103a11958b4ba0d8fb59c022"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.6/hstry-v0.5.6-aarch64-apple-darwin.tar.gz"
      sha256 "3a587a3269a47a5ac52aac26c2990c972d9e9d5e6321cd9b6384046611f571b6"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.6/hstry-v0.5.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b35b37e00795b2b0e33d552044a980175c20c6916bfbde755cd027c05a777c1c"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.6/hstry-v0.5.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "21ca021c45ec9fe517c640048cbd96228dcb65690294a430c5087ca19e2f6882"
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
    system "#{bin}/hstry", "--version"
  end
end
