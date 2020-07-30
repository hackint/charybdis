{ stdenv, bash
, flex, bison
, openssl, gnutls, zlib }:

stdenv.mkDerivation {
  pname = "charybdis";
  version = "3.5.7";

  src = ./.;

  configureFlags = [
    "--enable-epoll"
    "--enable-ipv6"
    "--with-zlib-path=${zlib.dev}/lib"
    "--enable-openssl=${openssl.dev}"
    "--with-program-prefix=charybdis-"
    "--sysconfdir=/etc/charybdis"
  ];

  nativeBuildInputs = [ bison flex ];
  buildInputs = [ openssl gnutls zlib ];
}
