# typed: false
# frozen_string_literal: true

class Trx < Formula
  desc "lean issue tracker"
  homepage "https://github.com/byteowlz/trx"
  version "0.7.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/trx/releases/download/v0.7.1/trx-v0.7.1-x86_64-apple-darwin.tar.gz"
      sha256 "9389bafcebc9eafe11e1e7ab5c8b86683017f19958e96804f59c6f24b94429e0"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/trx/releases/download/v0.7.1/trx-v0.7.1-aarch64-apple-darwin.tar.gz"
      sha256 "c49824b9a3128990cff4a7a51738f0c032d6e37d48201b5e97b67c477e44a838"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/trx/releases/download/v0.7.1/trx-v0.7.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0ced702fd9bbe633fbe5dc13aca0b4364db88ef01695b7422f17b3c2edfad0ec"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/trx/releases/download/v0.7.1/trx-v0.7.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c4b63f1796e1f36b8a079e8731cbab8c7670b80cc7559d763484dff74a564b8e"
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
