# typed: false
# frozen_string_literal: true

class Trx < Formula
  desc "lean issue tracker"
  homepage "https://github.com/byteowlz/trx"
  version "0.8.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/trx/releases/download/v0.8.2/trx-v0.8.2-x86_64-apple-darwin.tar.gz"
      sha256 "31a74adc8124e68973a934a51d1657fa782a59f73dff7f7766e6f9ce343957d5"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/trx/releases/download/v0.8.2/trx-v0.8.2-aarch64-apple-darwin.tar.gz"
      sha256 "2f6a2fd9cac3b7d0bf3cef9c11202168b7068635a2be9195da9cf9b181323c0b"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/trx/releases/download/v0.8.2/trx-v0.8.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "78714a0edc35c8b8df5e607f44c545074f1f53b9f231624ee623ebadbd410a4a"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/trx/releases/download/v0.8.2/trx-v0.8.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "565b0d206bdd4a414b378438dffe865fd031dd70a5dcaa181d50d86653431571"
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
    system "#{bin}/trx", "--version"
  end
end
