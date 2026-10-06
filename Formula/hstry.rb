# typed: false
# frozen_string_literal: true

class Hstry < Formula
  desc "a unified history for all your agents"
  homepage "https://github.com/byteowlz/hstry"
  version "0.5.27"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.27/hstry-v0.5.27-x86_64-apple-darwin.tar.gz"
      sha256 "86af76c3a081e7c23a793a984b84e5872c7c57b9550ddf910d01a98bfafc36f9"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.27/hstry-v0.5.27-aarch64-apple-darwin.tar.gz"
      sha256 "19f6c18e3d411d0577fe6e0a4da5d79bc5829b2c8cba63fc17ac3e9b70c1c457"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.27/hstry-v0.5.27-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7e0ad1428349140ad5167cd07e9fe4ce9d65d1ab5773752c92df1446dfe6a8cd"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.27/hstry-v0.5.27-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "14b05adf25ddb7c7570f4a0afa06f44d3a7afbbba01b47c6dda226303be7c1e7"
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
    system "#{bin}/hstry", "--version"
  end
end
