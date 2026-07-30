# typed: false
# frozen_string_literal: true

class Skdlr < Formula
  desc "Cross-platform task scheduler with native OS integration"
  homepage "https://github.com/byteowlz/skdlr"
  version "0.2.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/skdlr/releases/download/v0.2.8/skdlr-v0.2.8-x86_64-apple-darwin.tar.gz"
      sha256 "c514543b1287446426108e76a0728480613402bf42c650530a5dd7de67d75926"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/skdlr/releases/download/v0.2.8/skdlr-v0.2.8-aarch64-apple-darwin.tar.gz"
      sha256 "9c0017f9f5d1f2427987fc874b4a0946924bb3869d8d291550e4a6131a38f04a"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/skdlr/releases/download/v0.2.8/skdlr-v0.2.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6979fc4d66aeadff86457c64459d3f2746c84288794a0092b55099d86412467e"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/skdlr/releases/download/v0.2.8/skdlr-v0.2.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a07bc145640ab3899794e41360e5b1a362ef9385ff30de706d65fbb09692fa10"
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
    system "#{bin}/skdlr", "--version"
  end
end
