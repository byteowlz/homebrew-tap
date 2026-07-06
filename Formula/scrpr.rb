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
      sha256 "60346c6d26222c486b1487741942a83e26fd591c26315241ff39aa5875807157"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/scrpr/releases/download/v1.1.1/scrpr-v1.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "5f93c8e8702f892858f6559da8fbd8e248007589bb37e7307faf4c8bce695df9"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/scrpr/releases/download/v1.1.1/scrpr-v1.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a06ca42a8a5951470ef3fab83ca8148464ae842bc5d52b17c083f780a30b3f3d"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/scrpr/releases/download/v1.1.1/scrpr-v1.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4c851081317c7eaac540a79c8896782bb37e6711cf1ec6d865257bb1739e429f"
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
