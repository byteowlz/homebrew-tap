# typed: false
# frozen_string_literal: true

class Eavs < Formula
  desc "A Byteowlz tool"
  homepage "https://github.com/byteowlz/eavs"
  version "0.6.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/eavs/releases/download/v0.6.2/eavs-v0.6.2-x86_64-apple-darwin.tar.gz"
      sha256 "0d36dc9737e82e611100d14e7387c288b933e02deede6b00cd4960f99e501faa"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/eavs/releases/download/v0.6.2/eavs-v0.6.2-aarch64-apple-darwin.tar.gz"
      sha256 "bffc764aabd95ba2b095a3b99de3f01e647af8fb0d40ab06c7b3eed32fa0a6eb"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/eavs/releases/download/v0.6.2/eavs-v0.6.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c6c7e8322eaa8eddb4ac537e26f2e37556e918ac434d52400d9a1f963b8ab2d8"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/eavs/releases/download/v0.6.2/eavs-v0.6.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7f42eefdd4bde278b3a52dd17c42c8683b45718c38f2cbed59fbbffad3f8ef5b"
    end
  end

  def install
    # Install all binaries found in the archive
    Dir.glob("*").each do |file|
      next if File.directory?(file)
      next unless File.executable?(file)
      bin.install file
    end
  end

  test do
    system "#{bin}/eavs", "--version"
  end
end
