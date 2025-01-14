# typed: false
# frozen_string_literal: true

require File.expand_path("../Abstract/abstract-php-extension", __dir__)

# Class for Pdo_sqlsrv Extension
class PdoSqlsrvAT72 < AbstractPhpExtension
  init
  desc "pdo_sqlsrv PHP extension"
  homepage "https://github.com/Microsoft/msphpsql"
  url "https://pecl.php.net/get/pdo_sqlsrv-5.9.0.tgz"
  sha256 "0fce417b33879fdae3d50cc1aa5b284ab12662147ea2206fa6e1fadde8b48c58"
  head "https://github.com/Microsoft/msphpsql.git"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/shivammathur/extensions"
    rebuild 1
    sha256 cellar: :any,                 arm64_monterey: "889f7eb4917884593ff015232e8e493a5af60abe5dfa981899668220453c15aa"
    sha256 cellar: :any,                 arm64_big_sur:  "9cd167fc763476a386b8790605d2a2136b293b2fc5a832a5949896534bdcc1cb"
    sha256 cellar: :any,                 monterey:       "a99b4830211ea17aeea76e1456bc79805455bb5896fab872f2286996bc1ff54f"
    sha256 cellar: :any,                 big_sur:        "3179bd2b50b4e38c6fbc71e013e2b0e231330b7efc934178bf0c8c2b720db23d"
    sha256 cellar: :any,                 catalina:       "a8443e5639e6675b72aff7edf083fdccf3f3fc116e1398774799137f5e50a974"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "012b63bbeaf118e5568e8a37ec20ae726a6f7b2af2ecddc2b41aceee6776c059"
  end

  depends_on "unixodbc"

  def install
    Dir.chdir "pdo_sqlsrv-#{version}"
    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig, "--with-pdo_sqlsrv"
    system "make"
    prefix.install "modules/#{extension}.so"
    write_config_file
    add_include_files
  end
end
