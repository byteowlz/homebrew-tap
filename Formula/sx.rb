# typed: false
# frozen_string_literal: true

class Sx < Formula
  desc "use searxng from the command line"
  homepage "https://github.com/byteowlz/sx"
  version "2.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/sx/releases/download/v2.5.0/sx-v2.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "69f1c2d4dc919c5c90a28ec05b224758856df69090f982a1248b776d04fd56e2"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/sx/releases/download/v2.5.0/sx-v2.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "e6ee86e8bae8d41e2ac3686f069d046de7be2f3623bd880e54bac440c2fb2538"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/sx/releases/download/v2.5.0/sx-v2.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7fbb48578c737d60dadaeae1c9181ba208c8e5e2f4451d0a7799289c98d36e58"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/sx/releases/download/v2.5.0/sx-v2.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cf40b0f3a1599ce01386871bf45484b4087a3ced5974579d0203aadfa427807f"
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
    system "#{bin}/sx", "--version"
  end
end
