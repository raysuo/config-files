return {
    cmd = { 'qmlls' },
    filetypes = { 'qml' },
    root_dir = require('lspconfig.util').root_pattern('CMakeLists.txt', '.git'),
}
