class Catimg < Formula
  desc "Insanely fast image printing in your terminal"
  homepage "https://github.com/posva/catimg"
  url "https://github.com/posva/catimg/archive/2.5.0.tar.gz"
  sha256 "8bbeeb18d4a5531dd8b86b130cc823cb9d0942f7b6e7013de70c251259a3a922"
  head "https://github.com/posva/catimg.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "d2a0ff1ae2c6f1946f162703cad1563c35ab93234758f7b18a268026b07040f6" => :mojave
    sha256 "db1ad25fc273bee78a2920f4fd5cec756c1d37a1e3a3bd1e88f95109dc88525c" => :high_sierra
    sha256 "77826c8737fe10c660d830cfd1f1effd26f4c5957b9f1a907ae70537bf4be2f7" => :sierra
  end

  depends_on "cmake" => :build

  def install
    system "cmake", "-DMAN_OUTPUT_PATH=#{man1}", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    system "#{bin}/catimg", test_fixtures("test.png")
  end
end
