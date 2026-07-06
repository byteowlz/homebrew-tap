# typed: false
# frozen_string_literal: true

class Mmry < Formula
  desc "A Byteowlz tool"
  homepage "https://github.com/byteowlz/mmry"
  version "0.13.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/mmry/releases/download/v0.13.4/mmry-v0.13.4-x86_64-apple-darwin.tar.gz"
      sha256 "4637e0fbbfea985d23d3cb6b2e97411b5964bb8ff1b8f91e1714f6e575068ed0"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/mmry/releases/download/v0.13.4/mmry-v0.13.4-aarch64-apple-darwin.tar.gz"
      sha256 "7a2038bb50e3be09d95cbbbc5e1d31c8e2cb84ebc90d11a62eb604691fe32a64"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/mmry/releases/download/v0.13.4/mmry-v0.13.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f594337751447c8324a184fe6f38013385f0bcf2a2e23601e08b67fe9b249112"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/mmry/releases/download/v0.13.4/mmry-v0.13.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cdbdd4f1de92c39565497c712932c1988b3945b7586e7b4a230c791cf02acc5e"
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
    system "#{bin}/mmry", "--version"
  end
end
