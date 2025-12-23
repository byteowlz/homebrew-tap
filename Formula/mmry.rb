# typed: false
# frozen_string_literal: true

class Mmry < Formula
  desc "A Byteowlz tool"
  homepage "https://github.com/byteowlz/mmry"
  version "0.7.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/mmry/releases/download/v0.7.1/mmry-v0.7.1-x86_64-apple-darwin.tar.gz"
      sha256 "af38d406e8e796096cb5eefcfc9f87ce330615462aa74d3bce260a269047edbe"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/mmry/releases/download/v0.7.1/mmry-v0.7.1-aarch64-apple-darwin.tar.gz"
      sha256 "45b0df41072fa1d5d68400f7b35ebaa05b9e8b1d3de587de639836a1f6e6fb50"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/mmry/releases/download/v0.7.1/mmry-v0.7.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "db12e4f7a14dc49085deb154dc5025f8ec46f07dd25acd8d3c9bbb9a70ae47a6"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/mmry/releases/download/v0.7.1/mmry-v0.7.1-aarch64-unknown-linux-gnu.tar.gz"
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
