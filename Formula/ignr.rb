# typed: false
# frozen_string_literal: true

class Ignr < Formula
  desc "generate gitignore files"
  homepage "https://github.com/byteowlz/ignr"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/ignr/releases/download/v0.1.1/ignr-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "15d9c12e8841fe25044433ccfe984e6ce0738f42196800fc6353efdfe6cf823f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/ignr/releases/download/v0.1.1/ignr-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "df179d86c94a4fb24b8adbc54ea27d01ee30c1291b823575b415865cfb97e541"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/ignr/releases/download/v0.1.1/ignr-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7d8207d253fe9d608287b3630af1f362886519045b4dc33654e514060620ffa5"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/ignr/releases/download/v0.1.1/ignr-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "21a50ed2bd7077375e73fa42425920e0aa33ea85a17d69c114719a3ad5503ae4"
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
    system "#{bin}/ignr", "--version"
  end
end
