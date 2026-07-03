# typed: false
# frozen_string_literal: true

class Sldr < Formula
  desc "A Byteowlz tool"
  homepage "https://github.com/byteowlz/sldr"
  version "0.8.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/sldr/releases/download/v0.8.1/sldr-v0.8.1-x86_64-apple-darwin.tar.gz"
      sha256 "a7f0f4aacb8e066841c30e05180deb010af62506ccee0d92ac88971ccb455101"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/sldr/releases/download/v0.8.1/sldr-v0.8.1-aarch64-apple-darwin.tar.gz"
      sha256 "aaf331bbee8fdac6769ccd05a559b208b8e1f8bd2f83e45b83ae54a15b7900fc"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/sldr/releases/download/v0.8.1/sldr-v0.8.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1713552e3506057952993f718ecaa99fa186ae3b076f97838958dff3342a6aa1"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/sldr/releases/download/v0.8.1/sldr-v0.8.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "35b27d0c724219b2d8ac3da54dd8c7e99968c4bf84581b2305d351eb0cdafd26"
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
