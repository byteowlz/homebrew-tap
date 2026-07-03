# typed: false
# frozen_string_literal: true

class Sx < Formula
  desc "use searxng from the command line"
  homepage "https://github.com/byteowlz/sx"
  version "2.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/sx/releases/download/v2.4.2/sx-v2.4.2-x86_64-apple-darwin.tar.gz"
      sha256 "7d47e02ba623db6df2899e7e1b2034c06b975f4846dd7469a851ff0fdbb4cbae"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/sx/releases/download/v2.4.2/sx-v2.4.2-aarch64-apple-darwin.tar.gz"
      sha256 "b2958c63bb4370c2e4316e6e9ce7c97b3626ca0fea0e265feec473d514c36f7b"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/sx/releases/download/v2.4.2/sx-v2.4.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3e59ee5233456f0cf5efd7ac443e536fbc944a1dd1891caf19fe1da149a3442f"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/sx/releases/download/v2.4.2/sx-v2.4.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a2ccaea4da8676cf73e631e5eda6895518435bbd2feb1d2a3ca9bff3af55e8a3"
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
