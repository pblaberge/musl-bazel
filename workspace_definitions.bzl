load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def _repositories():
    http_archive(
        name = "musl",
        strip_prefix = "musl-1.2.1",
        build_file = "@musl-libc//bazel:BUILD.musl",
        sha256 = "fbcc59576985564b81ddff53beb7ea45b43db99e2a20fb408b6ae8c570e23b8f",
        urls = [
            "https://git.musl-libc.org/cgit/musl/snapshot/musl-1.2.1.tar.gz",
        ],
    )

def musl_libc_dependencies():
    _repositories()
