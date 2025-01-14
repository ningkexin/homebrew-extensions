# typed: false
# frozen_string_literal: true

require File.expand_path("../Abstract/abstract-php-extension", __dir__)

# Class for Mailparse Extension
class MailparseAT71 < AbstractPhpExtension
  init
  desc "Mailparse PHP extension"
  homepage "https://github.com/php/pecl-mail-mailparse"
  url "https://pecl.php.net/get/mailparse-3.1.3.tgz"
  sha256 "8659ca62dc9a4d7d15f07f97a0e2142cb58251c8e772cd36669ec740d2292471"
  head "https://github.com/php/pecl-mail-mailparse.git"
  license "PHP-3.01"

  bottle do
    root_url "https://ghcr.io/v2/shivammathur/extensions"
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "ec140ecb4d0a4f1d7b86d6759de45fc6dba30dfbfe3f806a8d2a29f687374daf"
    sha256 cellar: :any_skip_relocation, big_sur:       "ba3c58056bfdabe108e8e194192a526b991428adf17ac465eb6e2fbe53a7ddf4"
    sha256 cellar: :any_skip_relocation, catalina:      "9c1aa15e9e894d3bb05c222f1a5a38c2317b1ab27f3c82bd1093b4dd09056d7f"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "f90707ad4084b15f144aa2c5c0f0c4babb06669d66dd2230d83456ae11480121"
  end

  def install
    Dir.chdir "mailparse-#{version}"
    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig, "--enable-mailparse"
    system "make"
    prefix.install "modules/#{extension}.so"
    write_config_file
    add_include_files
  end
end
