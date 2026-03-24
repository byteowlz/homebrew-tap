# typed: false
# frozen_string_literal: true

class Sldr < Formula
  desc "A Byteowlz tool"
  homepage "https://github.com/byteowlz/sldr"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/sldr/releases/download/v0.2.1/sldr-v0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "7d05df8f4efe69ff14883292afb4e0fd3b4b1d28390811e2bb45318a2975f090"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/sldr/releases/download/v0.2.1/sldr-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "f0bd4bdc87f9f148d777b563a7df5487205cf40be16680ffa18a70435cf91b10"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/sldr/releases/download/v0.2.1/sldr-v0.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9ec7cac20634e4eea8bf8c31be34f3844aed2662891dcc4382b810e60652d66a"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/sldr/releases/download/v0.2.1/sldr-v0.2.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1b8b11f02b34c0c53c8e95462e1971990bac35f51892f94809cf5d25ef73af4f"
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
    system "#{bin}/sldr", "--version"
  end
end
