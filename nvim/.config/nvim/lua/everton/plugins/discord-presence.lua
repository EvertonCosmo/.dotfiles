return {
    'vyfor/cord.nvim',
    build = './build || .\\build',
    event = 'VeryLazy',
    opts = {

        display = {
            show_repository = false,
        }
    }, -- calls require('cord').setup()
}
