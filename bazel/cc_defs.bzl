def cc_library(**attrs):
    """Bazel cc_library rule.

    https://docs.bazel.build/versions/master/be/c-cpp.html#cc_library

    Args:
      **attrs: Rule attributes
    """

    # buildifier: disable=native-cc
    native.cc_library(**attrs)
