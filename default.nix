{ stdenv, bash
, flex, bison
, openssl, gnutls }:

stdenv.mkDerivation {
  pname = "charybdis";
  version = "3.5.7";

  src = ./.;

  configureFlags = [
    "--enable-epoll"
    "--enable-ipv6"
    "--enable-openssl=${openssl.dev}"
    "--with-program-prefix=charybdis-"
    "--sysconfdir=/etc/charybdis"
  ];

  nativeBuildInputs = [ bison flex ];
  buildInputs = [ openssl gnutls ];
}
