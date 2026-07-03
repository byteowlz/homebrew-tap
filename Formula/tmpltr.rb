# typed: false
# frozen_string_literal: true

class Tmpltr < Formula
  desc "A Byteowlz tool"
  homepage "https://github.com/byteowlz/tmpltr"
  version "0.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/tmpltr/releases/download/v0.3.2/tmpltr-v0.3.2-x86_64-apple-darwin.tar.gz"
      sha256 "0a94af98057db7abf1225e377bce90b5174469e3095d6e4aff374dfd3a134581"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/tmpltr/releases/download/v0.3.2/tmpltr-v0.3.2-aarch64-apple-darwin.tar.gz"
      sha256 "bbadeeb9e05d092085c653c70a2f19a5c303ee0453ea60c9e853a9367a2747a2"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/tmpltr/releases/download/v0.3.2/tmpltr-v0.3.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4adb6f828fd8cda9f1a5796491a77f52405ec64818021a04bf5dca64ac52c937"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/tmpltr/releases/download/v0.3.2/tmpltr-v0.3.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fd9ddbb31b1baf6f155bd67795e881d75c58e870961e201cac4722b51222cac0"
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
    system "#{bin}/tmpltr", "--version"
  end
end
