# typed: false
# frozen_string_literal: true

class Sldr < Formula
  desc "A Byteowlz tool"
  homepage "https://github.com/byteowlz/sldr"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/sldr/releases/download/v0.7.0/sldr-v0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "844ecc9c1f251e37681d1402f637eb79131c7a3b790a19307cbe4625b49f2c32"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/sldr/releases/download/v0.7.0/sldr-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "1d8019b42b75a74d476c2c949898d00d686a27ab7d00a267ebb54eaa1de7ec10"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/sldr/releases/download/v0.7.0/sldr-v0.7.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4667b3382e3753021177484f73c372b041440c50e055e6649724bc3df753d4f1"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/sldr/releases/download/v0.7.0/sldr-v0.7.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "421a47298875de91a77b7d7259ed15ee2e0c073d220bbfda7c14cfe69948217b"
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
    system "#{bin}/sldr", "--version"
  end
end
