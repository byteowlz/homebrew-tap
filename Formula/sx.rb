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
      sha256 "ec54744e938d8ca6703e3b0779a67c08472582145337b0d3107467f853e2fcfc"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/sx/releases/download/v2.5.0/sx-v2.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "cf1b8cf3baa477eae1825d52358ca311ca420b53adf53897c641d882daa6ce48"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/sx/releases/download/v2.5.0/sx-v2.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "668c920d27f32d27d4226b3ac1816820bc22da1c8356714af1820c392c7c66af"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/sx/releases/download/v2.5.0/sx-v2.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2a69bc7af43511f7c3b822e682a79db0b40c1080da60929754401b8faa33775c"
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
