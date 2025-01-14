# typed: false
# frozen_string_literal: true

require File.expand_path("../Abstract/abstract-php-extension", __dir__)

# Class for Protobuf Extension
class ProtobufAT73 < AbstractPhpExtension
  init
  desc "Protobuf PHP extension"
  homepage "https://github.com/protocolbuffers/protobuf"
  url "https://pecl.php.net/get/protobuf-3.22.1.tgz"
  sha256 "20848c1a14cc32b6f40fb265ea13aef43032384d8352be63b34ca6287cbd52c4"
  head "https://github.com/protocolbuffers/protobuf.git"
  license "BSD-3-Clause"

  bottle do
    root_url "https://ghcr.io/v2/shivammathur/extensions"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "6eb964f93fe59dcace8eafdf85236c704edb45c79e761233c60bbe1089cb0c55"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "2f3f13eb9143e9617c3a75c3da4e2122fb2da4e1b1c259291a08d274dbd9928e"
    sha256 cellar: :any_skip_relocation, monterey:       "6538b83ee7ecbd633fb563e77ecda16bbafeb6cfebe46ff165222513d85c7eda"
    sha256 cellar: :any_skip_relocation, big_sur:        "92f5b66b40d8abd86cfe59b767b9f071c178d6f6b5ffd9fff029eee6c852c03b"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "ad01a7491f577a6d67d314a85b01e19dd9daa111bc6456bc9559bc5647b99149"
  end

  def install
    Dir.chdir "protobuf-#{version}"
    safe_phpize
    system "./configure", "--enable-protobuf"
    system "make"
    prefix.install "modules/#{extension}.so"
    write_config_file
  end

  def caveats
    <<~EOS
      Copyright 2008 Google Inc.  All rights reserved.

      Redistribution and use in source and binary forms, with or without
      modification, are permitted provided that the following conditions are
      met:

          * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
          * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following disclaimer
      in the documentation and/or other materials provided with the
      distribution.
          * Neither the name of Google Inc. nor the names of its
      contributors may be used to endorse or promote products derived from
      this software without specific prior written permission.

      THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
      "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
      LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
      A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
      OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
      SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
      LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
      DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
      THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
      (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
      OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

      Code generated by the Protocol Buffer compiler is owned by the owner
      of the input file used when generating it.  This code is not
      standalone and requires a support library to be linked with it.  This
      support library is itself covered by the above license.

      To finish installing #{extension} for PHP #{php_version}:
        * #{config_filepath} was created,"
          do not forget to remove it upon extension removal."
        * Validate installation by running php -m
    EOS
  end
end
