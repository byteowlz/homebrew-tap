# typed: false
# frozen_string_literal: true

class Scrpr < Formula
  desc "Get main text from websites in the cli"
  homepage "https://github.com/byteowlz/scrpr"
  version "1.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/scrpr/releases/download/v1.1.1/scrpr-v1.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "019ef571e015f5c747e190272ad4aaad48a7661abc2351eef968196d7d29ab57"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/scrpr/releases/download/v1.1.1/scrpr-v1.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "5f4fd8dc9a8b635b712642d4bd68b7caf7d5761a820dce230ffc7b97184ca413"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/scrpr/releases/download/v1.1.1/scrpr-v1.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ffc93f0ffd1f8e2300c1fbe676733d8a8176bb28b111e3e1d66451e450c49310"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/scrpr/releases/download/v1.1.1/scrpr-v1.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "155733c76ad7d399d3b5c0b0e80628d476912cd0fe70d701b575552a4c2368ef"
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
