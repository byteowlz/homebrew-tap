# typed: false
# frozen_string_literal: true

class Ignr < Formula
  desc "generate gitignore files"
  homepage "https://github.com/byteowlz/ignr"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/ignr/releases/download/v0.1.2/ignr-v0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "e94b495edf116038ac053bdda8c6d3c917dad869275e833ae2ae4344af494aa6"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/ignr/releases/download/v0.1.2/ignr-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "d714925442815ea11270679ebb5f30af7cd0cdec03b1b042065f097797fc31fc"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/ignr/releases/download/v0.1.2/ignr-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d14f072b8b56bdca5c86fb113644d60da76c26884831d30a9079c48e76f4fecd"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/ignr/releases/download/v0.1.2/ignr-v0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0a116cc23002bfcb87e512340bace852cf8485c5c3dce808d87c9f48f1aa4ab9"
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
