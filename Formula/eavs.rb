# typed: false
# frozen_string_literal: true

class Eavs < Formula
  desc "A Byteowlz tool"
  homepage "https://github.com/byteowlz/eavs"
  version "0.7.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/eavs/releases/download/v0.7.3/eavs-v0.7.3-x86_64-apple-darwin.tar.gz"
      sha256 "1af95ab6c0f9b6db561d6bf23e29cffad1eb64aa298b77f776e34d68178d5f81"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/eavs/releases/download/v0.7.3/eavs-v0.7.3-aarch64-apple-darwin.tar.gz"
      sha256 "6a2d8dc1d2b20b9dcf18cac6916aff5d0656d99f5b0433b6a0f72b364046e460"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/eavs/releases/download/v0.7.3/eavs-v0.7.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e257d199d07027838b9044e91ccd17e91138f549b7d3deb55af98d09489eb15a"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/eavs/releases/download/v0.7.3/eavs-v0.7.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c1faa84baace756b9013be7cf86accaf3c514715deb2d23deb71ab54735d08f9"
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
    system "#{bin}/eavs", "--version"
  end
end
