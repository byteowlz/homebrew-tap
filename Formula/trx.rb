# typed: false
# frozen_string_literal: true

class Trx < Formula
  desc "lean issue tracker"
  homepage "https://github.com/byteowlz/trx"
  version "0.6.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/trx/releases/download/v0.6.3/trx-v0.6.3-x86_64-apple-darwin.tar.gz"
      sha256 "a0f39d97585adff7daf62638f239528a77a5ac885a02306833d383b7cb455a59"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/trx/releases/download/v0.6.3/trx-v0.6.3-aarch64-apple-darwin.tar.gz"
      sha256 "b494415197ebb0970876b3b802b61a39ba8c9fd699c0545217fa42b32ff0cebe"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/trx/releases/download/v0.6.3/trx-v0.6.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0237437cd30ead32f8f5511912ed118596e2107ed9b9cf955cba5b31dacab4ea"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/trx/releases/download/v0.6.3/trx-v0.6.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "42a502f114ff206e2d32e674e817030afd7af298cfec442fec6309d2e200acf3"
    end
  end

  def install
    # byt-packaged tarballs stage executables under bin/; older flat
    # tarballs keep them at the archive root. Support both.
    if Dir.exist?("bin")
      bin.install Dir["bin/*"]
    else
      Dir.glob("*").each do |file|
        next if File.directory?(file)
        next unless File.executable?(file)
        bin.install file
      end
    end
  end

  test do
    system "#{bin}/trx", "--version"
  end
end
