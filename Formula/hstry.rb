# typed: false
# frozen_string_literal: true

class Hstry < Formula
  desc "a unified history for all your agents"
  homepage "https://github.com/byteowlz/hstry"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.1/hstry-v0.5.1-x86_64-apple-darwin.tar.gz"
      sha256 "df71fc17729cfe668704f2a93d257fafb919c309da8ee39754ce540bbc572cd2"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.1/hstry-v0.5.1-aarch64-apple-darwin.tar.gz"
      sha256 "8be16f0ac10a3b8b3cd1994f808391f2510ac7de6cc96fe47a157d5595878c40"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.1/hstry-v0.5.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3a2a0901e91158698816f6a1c019de0219a1f1be5099a9fd122a3e917338282d"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.1/hstry-v0.5.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "91c6448435ee45e8753cd4e571e08845586f3f06c60ca1bb255359ce3053a7bb"
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
