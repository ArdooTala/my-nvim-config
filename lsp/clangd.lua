return {
    cmd = { 'clangd' },

    filetypes = { 'c', 'cpp', 'cppm', 'objc', 'objcpp' },

    root_markers = { 'compile_commands.json', 'CMakeLists.txt', '.git', },
    single_file_support = true,
    capabilities = {
        textDocument = {
            completion = {
                editsNearCursor = true,
            },
        },
        offsetEncoding = { 'utf-8', 'utf-16' },
    },
}
