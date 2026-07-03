# typed: false
# frozen_string_literal: true

class Ignr < Formula
  desc "generate gitignore files"
  homepage "https://github.com/byteowlz/ignr"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/ignr/releases/download/v0.1.3/ignr-v0.1.3-x86_64-apple-darwin.tar.gz"
      sha256 "5b766d53e589a63d61830b2989f2432a43cd04528281923b21d13a476bb33bd3"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/ignr/releases/download/v0.1.3/ignr-v0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "1036f1e4dd92f897931f750a1aa8a0d7eb9896585d11222eff35197d6ba7714e"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/ignr/releases/download/v0.1.3/ignr-v0.1.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f9f941697b58cd2f94adf3e12d62f5cc3481fefa208983759e37cf3895973d6f"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/ignr/releases/download/v0.1.3/ignr-v0.1.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fdd23c268f8a24e0851ca1cba0ec84675072f75036e12d683db2af9d95a42a43"
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
    system "#{bin}/ignr", "--version"
  end
end
