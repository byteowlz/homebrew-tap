# typed: false
# frozen_string_literal: true

class Hstry < Formula
  desc "a unified history for all your agents"
  homepage "https://github.com/byteowlz/hstry"
  version "0.5.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.4/hstry-v0.5.4-x86_64-apple-darwin.tar.gz"
      sha256 "e437e003858807f6a54c2c199738714044ae9d43107de84e2c1bcf305dfd9930"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.4/hstry-v0.5.4-aarch64-apple-darwin.tar.gz"
      sha256 "edb7481d26d059ec54af2e2a8cc85fa2aa3ba4e0d1d5e52f78f65a475877f0b8"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.4/hstry-v0.5.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "041dc9f8f920ae00c9df0296ef40d9e2388a70a676ce3300879e579f851001c6"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.4/hstry-v0.5.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "45c31598bef4988adcbac3a8e6eedd4acb6330e1de0c831f7b91a4aade73cc8e"
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
