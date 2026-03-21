# typed: false
# frozen_string_literal: true

class Cmfy < Formula
  desc "A Byteowlz tool"
  homepage "https://github.com/byteowlz/cmfy"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/cmfy/releases/download/v0.2.2/cmfy-v0.2.2-x86_64-apple-darwin.tar.gz"
      sha256 "8ec041ce22b9dc7622ba5401daab94fc03d279e4600743d143e747acdb5b8301"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/cmfy/releases/download/v0.2.2/cmfy-v0.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "55e29697bcfa611d432b4fd900c62380d1a854c6eb1f4587f02e2f6b2b3b502b"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/cmfy/releases/download/v0.2.2/cmfy-v0.2.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "662692df08c4f80542cd82c0d6fc1e5c3aed5c8a9b92f003dd69b72a2b5e483e"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/cmfy/releases/download/v0.2.2/cmfy-v0.2.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "13d851a99b9c358cf3cd1a2110668e899404017570cb5da5d4c264292e4d216b"
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
    system "#{bin}/cmfy", "--version"
  end
end
