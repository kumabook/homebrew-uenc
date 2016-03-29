# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md

class Uenc < Formula
  desc "Simple command line url encoder and decoder"
  homepage "https://github.com/kumabook/uenc"
  url "https://bintray.com/artifact/download/kumabook/homebrew/uenc/0.1.2/uenc-0.1.2.zip"
  version "0.1.2"
  sha256 "39d07d3bc6a4a2d4250808b3d995a1ef536b5b9978b14e2d72fc7330aff216fe"

  def install
    bin.install 'uenc'
    bin.install 'udec'
  end

  test do
    raw     = "12345/@+-"
    encoded = "12345%2F%40%2B-"
    File.write("raw"    , raw)
    File.write("encoded", encoded)
    assert_equal "#{encoded}\n", pipe_output("#{bin}/uenc #{raw}")
    assert_equal encoded       , pipe_output("cat raw | #{bin}/uenc")
    assert_equal "#{raw}\n"    , pipe_output("#{bin}/udec #{encoded}")
    assert_equal raw           , pipe_output("cat encoded | #{bin}/udec")
  end
end
