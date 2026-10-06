# typed: false
# frozen_string_literal: true

class Sldr < Formula
  desc "A Byteowlz tool"
  homepage "https://github.com/byteowlz/sldr"
  version "0.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/sldr/releases/download/v0.10.0/sldr-v0.10.0-x86_64-apple-darwin.tar.gz"
      sha256 "8fcd7455522a7acd21e7adf9fe5eb98e58416ace48a0ecb78db42e4f8413a984"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/sldr/releases/download/v0.10.0/sldr-v0.10.0-aarch64-apple-darwin.tar.gz"
      sha256 "e1599436e9b3447c44365ddc0b37153cc61c953fedb3388ea99a6f1ccf807ff2"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/sldr/releases/download/v0.10.0/sldr-v0.10.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e83bdb8fa35039d0adf6274cfb9dfd89da72b5c34f1e45e09e9c31bc74ca1e3d"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/sldr/releases/download/v0.10.0/sldr-v0.10.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a6ef5bd375bb15946f40bc752298422a756274124d4653775e3c3e5669723308"
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
