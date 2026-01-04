# typed: false
# frozen_string_literal: true

class Hmr < Formula
  desc "Home Assistant CLI"
  homepage "https://github.com/byteowlz/hmr"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/hmr/releases/download/v0.4.0/hmr-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "9ac0c04fb2a3ddd3c70c29d5d08cc3c9d88df4396cb418431ccb661f963fe790"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/hmr/releases/download/v0.4.0/hmr-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "b52bf3d929a21523d08bd41613387a0690eb38a9a6f82c7b5da12910de4c0dad"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hmr/releases/download/v0.4.0/hmr-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2efca53dc709f9db89f9fafd2543f2709a6a2e1883938d6b0d0ac38961518721"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hmr/releases/download/v0.4.0/hmr-v0.4.0-aarch64-unknown-linux-gnu.tar.gz"
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
    system "#{bin}/hmr", "--version"
  end
end
