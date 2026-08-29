# typed: false
# frozen_string_literal: true

class Hstry < Formula
  desc "a unified history for all your agents"
  homepage "https://github.com/byteowlz/hstry"
  version "0.5.21"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.21/hstry-v0.5.21-x86_64-apple-darwin.tar.gz"
      sha256 "9ea83d09626c859643108cdbcb02cc1421f7e19f03c6f3790be08a9f37142448"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.21/hstry-v0.5.21-aarch64-apple-darwin.tar.gz"
      sha256 "27364e74980f1390dc50fefe1bbc16f5feda06b4b8abf789f446c56f6c82b6ba"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.21/hstry-v0.5.21-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d3d8a4569a7f9cb36f5eb819daa05e43557338e268b196c536e3a37b150997f4"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.21/hstry-v0.5.21-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "78a8e089cb5ec0ba2fa5e614a8c9266318bf12b556ddc8a320bbbc9f9ffd001d"
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
