# typed: false
# frozen_string_literal: true

class Scrpr < Formula
  desc "Get main text from websites in the cli"
  homepage "https://github.com/byteowlz/scrpr"
  version "1.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/scrpr/releases/download/v1.1.2/scrpr-v1.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "8387c9604f4d7fe405cb15e4b9208d01e47df82b3691ef99d3afc070c78e7460"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/scrpr/releases/download/v1.1.2/scrpr-v1.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "2931b2a0332a79df1cc5561e8863c7674de2acdfe9024f7618bc30634d0dcd2a"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/scrpr/releases/download/v1.1.2/scrpr-v1.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "be4df1ee799b8679e8de4431ae46203bb7f03be042e5226b5c3ac5453b8d7fa6"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/scrpr/releases/download/v1.1.2/scrpr-v1.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "204fad2d156f44d44a8118b2e31ef3cd6d0976db7a1470c45cb76cd40590d424"
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
