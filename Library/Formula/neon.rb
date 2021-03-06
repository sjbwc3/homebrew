require 'formula'

class Neon < Formula
  url 'http://www.webdav.org/neon/neon-0.29.6.tar.gz'
  sha1 'ae1109923303f67ed3421157927bc4bc29c58961'
  homepage 'http://www.webdav.org/neon/'

  depends_on 'pkg-config' => :build

  keg_only :provided_by_osx,
            "Compiling newer versions of Subversion on 10.6 require this newer neon."

  option :universal

  def install
    ENV.universal_binary if build.universal?
    ENV.enable_warnings
    system "./configure", "--prefix=#{prefix}",
                          "--disable-debug",
                          "--enable-shared",
                          "--disable-static",
                          "--with-ssl"
    system "make install"
  end
end
