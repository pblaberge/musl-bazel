# Building

Add to your workspace:

> load("@musl-libc//:workspace_definitions.bzl", "musl_libc_dependencies")
> 
> musl_libc_dependencies()

You can depend on musl libc with label @musl//:c