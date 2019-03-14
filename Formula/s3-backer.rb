class S3Backer < Formula
  desc "FUSE-based single file backing store via Amazon S3"
  homepage "https://github.com/archiecobbs/s3backer"
  url "https://s3.amazonaws.com/archie-public/s3backer/s3backer-1.5.0.tar.gz"
  sha256 "82d93c54acb1e85828b6b80a06e69a99c7e06bf6ee025dac720e980590d220d2"

  bottle do
    cellar :any
    sha256 "f75e20c85f2604d4f607628a0fe166e687d2d17b120b14a417b8ad47a9523531" => :mojave
    sha256 "2f3c95347ce448161e36012c2ec08c2ac3b2f4fcabb683b5018f0f8088560bdb" => :high_sierra
    sha256 "aa290ecca1c6d57252b80669f112eed4386f6b679ad92de4f3b7c5a0a575f54a" => :sierra
    sha256 "2c0b02a7f3d7bfd5902dafc64d54aba03dd2ab5f07441ad14089033146563793" => :el_capitan
  end

  depends_on "pkg-config" => :build
  depends_on "openssl"
  depends_on :osxfuse

  def install
    inreplace "configure", "-lfuse", "-losxfuse"
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system bin/"s3backer", "--version"
  end
end
