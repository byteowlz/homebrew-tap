# typed: false
# frozen_string_literal: true

class Eavs < Formula
  desc "A Byteowlz tool"
  homepage "https://github.com/byteowlz/eavs"
  version "0.8.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/eavs/releases/download/v0.8.1/eavs-v0.8.1-x86_64-apple-darwin.tar.gz"
      sha256 "b645233f0116461e32ce1c791ec6cf62fc41ccc247106898405d7a90c3de98f8"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/eavs/releases/download/v0.8.1/eavs-v0.8.1-aarch64-apple-darwin.tar.gz"
      sha256 "24de3fca31872f8473e1249d32cea224f0fa3ba431d2fbf557c6e3de18f55585"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/eavs/releases/download/v0.8.1/eavs-v0.8.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "46eaa48ba7f8787cf055a94b01700c52651bcb686194479e77231b779f1060ef"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/eavs/releases/download/v0.8.1/eavs-v0.8.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9b97714fcfa3038067cb4a729c3d53d21610044d94c577338890c057b47a6f0c"
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
