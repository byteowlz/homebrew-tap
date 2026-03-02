# typed: false
# frozen_string_literal: true

class Hstry < Formula
  desc "a unified history for all your agents"
  homepage "https://github.com/byteowlz/hstry"
  version "0.5.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.5/hstry-v0.5.5-x86_64-apple-darwin.tar.gz"
      sha256 "65315c63305d5b7407034007abd6169c8bd5b76542108674e0a62b8a3c89976e"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.5/hstry-v0.5.5-aarch64-apple-darwin.tar.gz"
      sha256 "cf19c833ba5be762ea70e82850f63e38fb3980ed0c9f119cdb24ee89ab2bd312"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.5/hstry-v0.5.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "240b03ac3ce0a853d19efef6956e085ac25ffb9b95481aa2c8b407030d940f88"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.5/hstry-v0.5.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "af6c5bde4f16ef096172314f93065b84ad417bdd9fc284ded7961d1a03e6944f"
    end
  end

  def install
    # Install all binaries found in the archive
    Dir.glob("*").each do |file|
      next if File.directory?(file)
      next unless File.executable?(file)
      bin.install file
    end
  end

  test do
    system "#{bin}/hstry", "--version"
  end
end
