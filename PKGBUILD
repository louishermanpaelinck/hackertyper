# Maintainer: Jonas Tranberg <jonastranberg93@gmail.com>
pkgname=hackertyper-terminal
pkgver=r6.f8732f9
pkgrel=1
pkgdesc="A clone of the Hacker-Typer for the terminal"

arch=('any')
url="https://github.com/naueramant/hackertyper-terminal"
license=('MIT')
makedepends=('git')
source=('git+https://github.com/naueramant/hackertyper-terminal.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/hackertyper-terminal/"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {

}