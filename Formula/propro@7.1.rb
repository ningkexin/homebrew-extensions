# typed: false
# frozen_string_literal: true

require File.expand_path("../Abstract/abstract-php-extension", __dir__)

# Class for Propro Extension
class ProproAT71 < AbstractPhpExtension
  init
  desc "Propro PHP extension"
  homepage "https://github.com/m6w6/ext-propro"
  url "https://pecl.php.net/get/propro-2.1.0.tgz"
  sha256 "7bba0653d90cd8f61816e13ac6c0f7102b4a16dc4c4e966095a121eeb4ae8271"
  head "https://github.com/m6w6/ext-propro.git"
  license "BSD-2-Clause"
  revision 1

  bottle do
    root_url "https://ghcr.io/v2/shivammathur/extensions"
    rebuild 2
    sha256 cellar: :any_skip_relocation, arm64_monterey: "8ff982fd0ab94a9b95b45a65ea80622e28861209608826aa125a6cad94a8032e"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "a0ff5d394daef1d1ef8f23fd28b6516d727df7315870ff4c70728eadb4843e2d"
    sha256 cellar: :any_skip_relocation, monterey:       "4f89ce6b63f814f58d1ea2857586c269cc066d4c53a0d97ecbbf242e67febc57"
    sha256 cellar: :any_skip_relocation, big_sur:        "dce45e1df710d4ddd7fef47e99493ee93d32307e4cc3401dcb99d07d7d90dc28"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "23729e6f95aeb578d0adea2524e33e5c31165ca7a907e2569a76d0ec96a77413"
  end

  def install
    Dir.chdir "propro-#{version}"
    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig, "--enable-propro"
    system "make"
    prefix.install "modules/#{extension}.so"
    write_config_file
    add_include_files
  end
end
