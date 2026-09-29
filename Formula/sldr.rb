# typed: false
# frozen_string_literal: true

class Sldr < Formula
  desc "A Byteowlz tool"
  homepage "https://github.com/byteowlz/sldr"
  version "0.9.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/sldr/releases/download/v0.9.1/sldr-v0.9.1-x86_64-apple-darwin.tar.gz"
      sha256 "99b8c979e2374a5b2f6e8e211a4c2320b265099b198fdb46858c7ec8014bc1ba"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/sldr/releases/download/v0.9.1/sldr-v0.9.1-aarch64-apple-darwin.tar.gz"
      sha256 "6a3de442ea9d65e7a6e6841b8841afe5c61a5fecfb597cd22463e32e422b5a4b"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/sldr/releases/download/v0.9.1/sldr-v0.9.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "88ec1ce3c819c26e2a325166198c0c71f9753232bb81df30a31fe0b1769e1f16"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/sldr/releases/download/v0.9.1/sldr-v0.9.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c188bd22ebc1c2ad88a91de4fa97d26046b5ae395e35228ae4346d64cb885906"
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
    system "#{bin}/sldr", "--version"
  end
end
