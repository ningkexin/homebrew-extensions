# typed: false
# frozen_string_literal: true

require File.expand_path("../Abstract/abstract-php-extension", __dir__)

# Class for Uuid Extension
class UuidAT56 < AbstractPhpExtension
  init
  desc "Uuid PHP extension"
  homepage "https://github.com/php/pecl-networking-uuid"
  url "https://pecl.php.net/get/uuid-1.0.5.tgz"
  sha256 "f762c53cfdc408f015384188c174b503a734b59d7be82738b89ec3ffd3e6b8f4"
  head "https://github.com/php/pecl-networking-uuid.git", branch: "master"
  license "LGPL-2.1-only"

  bottle do
    root_url "https://ghcr.io/v2/shivammathur/extensions"
    sha256 cellar: :any,                 arm64_monterey: "94a8612ef072ecf2caf2863dabfa8424da514596ea2c4311474f7ca9a43783e5"
    sha256 cellar: :any,                 arm64_big_sur:  "018111e9ffb6b71e0b7fcca6cdff33c2e5e352f35e668ba805dcebb03f9c6b08"
    sha256 cellar: :any,                 monterey:       "51bac70303e9639a0586e8022e638fe91e1c392d243fbf29b9ebaa106a07931d"
    sha256 cellar: :any,                 big_sur:        "40c4bf9e704f9bec958334b562e909cb0d297dc3570649811eafdd13e72768a8"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "046eed04ced266750613dbe22c0df1eca13a50625e7b91997cc12a28d634337b"
  end

  def uuid_dependency
    if OS.linux?
      "util-linux"
    else
      "e2fsprogs"
    end
  end

  on_macos do
    depends_on "e2fsprogs"
  end

  on_linux do
    depends_on "util-linux"
  end

  def install
    args = %W[
      --with-uuid=#{Formula[uuid_dependency].opt_prefix}
    ]
    Dir.chdir "uuid-#{version}"
    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig, *args
    system "make"
    prefix.install "modules/#{extension}.so"
    write_config_file
    add_include_files
  end
end
