# typed: false
# frozen_string_literal: true

class Skdlr < Formula
  desc "Cross-platform task scheduler with native OS integration"
  homepage "https://github.com/byteowlz/skdlr"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/skdlr/releases/download/v0.3.0/skdlr-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "9d2bbf6b032e4e12a307a3f45d6be6dfefd605953a6ba2212a0881af7db4db10"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/skdlr/releases/download/v0.3.0/skdlr-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "8717e8708dd752d1101bb720aac8ebe3ecc9147ca6b80cdd45fd4a13401dc58c"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/skdlr/releases/download/v0.3.0/skdlr-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4c23846664cf831f594d707e1dbb4166d39ba5d6b04c8321082544a1a2a77439"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/skdlr/releases/download/v0.3.0/skdlr-v0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b1c09c120200980f8dec6f48293ff3de3e9238c6f2ca5034f20fd07c9b0fb1da"
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
