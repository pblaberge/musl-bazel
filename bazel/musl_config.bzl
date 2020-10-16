def _remove_extensions(file_list):
    rv = {}
    for f in file_list:
        if (f.extension == "c" or f.extension == "s" or f.extension == "S"):
            rv[f.path[:-2]] = f
        else:
            rv[f.path] = f
    return rv

def _remove_arch(file_dict, arch):
    rv = {}
    for f in file_dict:
        idx = f.find(arch + "/")
        if (idx == -1):
            rv[f] = file_dict[f]
            continue
        rv[f[:idx] + f[idx + len(arch) + 1:]] = file_dict[f]
    return rv

def _musl_srcs(ctx):
    if ctx.attr.arch == "":
        return ctx.srcs

    srcs_no_ext = _remove_extensions(ctx.files.srcs)
    arch_srcs_no_ext = _remove_arch(_remove_extensions(ctx.files.arch_srcs), ctx.attr.arch)

    filtered_srcs = []
    for f_s in srcs_no_ext:
        if (f_s not in arch_srcs_no_ext):
            filtered_srcs.append(srcs_no_ext[f_s])

    rv = depset(filtered_srcs + ctx.files.arch_srcs)
    return [DefaultInfo(files = rv)]

musl_srcs = rule(
    implementation = _musl_srcs,
    attrs = {
        "srcs": attr.label_list(allow_files = True, mandatory = True),
        "arch_srcs": attr.label_list(allow_files = True, mandatory = True),
        "arch": attr.string(mandatory = True),
    },
)
