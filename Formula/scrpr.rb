# typed: false
# frozen_string_literal: true

class Scrpr < Formula
  desc "Get main text from websites in the cli"
  homepage "https://github.com/byteowlz/scrpr"
  version "1.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/scrpr/releases/download/v1.3.0/scrpr-v1.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "0de59d148ed5e2ea49c4352c4c1a8d672f467b1385de187bb439ac32bcce590e"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/scrpr/releases/download/v1.3.0/scrpr-v1.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "345e86217295b75db06eff25fd2249754807b51c54cd7e48b47917d64385e15b"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/scrpr/releases/download/v1.3.0/scrpr-v1.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b2f5ea913a842c830bff5fa7bf2f805a4fae10060086f78db8412d8614118fc3"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/scrpr/releases/download/v1.3.0/scrpr-v1.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3f6c46235738031a3c5a555fbace8ffe162b49c52962cdbd2a5afefdf19f21cd"
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
    system "#{bin}/scrpr", "--version"
  end
end
