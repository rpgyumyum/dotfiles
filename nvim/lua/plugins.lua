-- Install Packer automatically if it's not installed(Bootstraping)
-- Hint: string concatenation is done by `..`

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer()


-- Reload configurations if we modify plugins.lua
-- Hint
--     <afile> - replaced with the filename of the buffer being manipulated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])


-- Install plugins here - `use ...`
-- Packer.nvim hints
--     after = string or list,           -- Specifies plugins to load before this plugin. See "sequencing" below
--     config = string or function,      -- Specifies code to run after this plugin is loaded
--     requires = string or list,        -- Specifies plugin dependencies. See "dependencies". 
--     ft = string or list,              -- Specifies filetypes which load this plugin.
--     run = string, function, or table, -- Specify operations to be run after successful installs/updates of a plugin
return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- Color schemes
    use  'tanvirtin/monokai.nvim'

    -- auto completion
    use { 'neovim/nvim-lspconfig' }
    use { 'hrsh7th/nvim-cmp', config = [[require('config.nvim-cmp')]] }    
    use { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' } 
    use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' }        -- buffer auto-completion
    use { 'hrsh7th/cmp-path', after = 'nvim-cmp' }          -- path auto-completion
    use { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' }       -- cmdline auto-completion
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'onsails/lspkind.nvim' -- VSCode

    use { 'williamboman/mason.nvim' }
    use { 'williamboman/mason-lspconfig.nvim'}


    -- nvim-treeuse 
    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional
      },
    }

    -- tree-sitter
        use {
            'nvim-treesitter/nvim-treesitter',
            run = function()
                local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
                ts_update()
            end,
        }
    use("HiPhish/nvim-ts-rainbow2")


    -- nvim terminal generation
    use {"NvChad/nvterm"}


    local custom_banner_planet ={
          [[                                                   ]],
          [[                                              ___  ]],
          [[                                           ,o88888 ]],
          [[                                        ,o8888888' ]],
          [[                  ,:o:o:oooo.        ,8O88Pd8888"  ]],
          [[              ,.::.::o:ooooOoOoO. ,oO8O8Pd888'"    ]],
          [[            ,.:.::o:ooOoOoOO8O8OOo.8OOPd8O8O"      ]],
          [[           , ..:.::o:ooOoOOOO8OOOOo.FdO8O8"        ]],
          [[          , ..:.::o:ooOoOO8O888O8O,COCOO"          ]],
          [[         , . ..:.::o:ooOoOOOO8OOOOCOCO"            ]],
          [[          . ..:.::o:ooOoOoOO8O8OCCCC"o             ]],
          [[             . ..:.::o:ooooOoCoCCC"o:o             ]],
          [[             . ..:.::o:o:,cooooCo"oo:o:            ]],
          [[          `   . . ..:.:cocoooo"'o:o:::'            ]],
          [[          .`   . ..::ccccoc"'o:o:o:::'             ]],
          [[         :.:.    ,c:cccc"':.:.:.:.:.'              ]],
          [[       ..:.:"'`::::c:"'..:.:.:.:.:.'               ]],
          [[     ...:.'.:.::::"'    . . . . .'                 ]],
          [[    .. . ....:."' `   .  . . ''                    ]],
          [[  . . . ...."'                                     ]],
          [[  .. . ."'                                         ]],
          [[ .                                                 ]],
          [[                                                   ]],
        }
    local custom_banner_nvim ={
          [[                                                                         ]],
          [[                               :                                         ]],
          [[ L.                     ,;    t#,                                        ]],
          [[ EW:        ,ft       f#i    ;##W.              t                        ]],
          [[ E##;       t#E     .E#t    :#L:WE              Ej            ..       : ]],
          [[ E###t      t#E    i#W,    .KG  ,#D  t      .DD.E#,          ,W,     .Et ]],
          [[ E#fE#f     t#E   L#D.     EE    ;#f EK:   ,WK. E#t         t##,    ,W#t ]],
          [[ E#t D#G    t#E :K#Wfff;  f#.     t#iE#t  i#D   E#t        L###,   j###t ]],
          [[ E#t  f#E.  t#E i##WLLLLt :#G     GK E#t j#f    E#t      .E#j##,  G#fE#t ]],
          [[ E#t   t#K: t#E  .E#L      ;#L   LW. E#tL#i     E#t     ;WW; ##,:K#i E#t ]],
          [[ E#t    ;#W,t#E    f#E:     t#f f#:  E#WW,      E#t    j#E.  ##f#W,  E#t ]],
          [[ E#t     :K#D#E     ,WW;     f#D#;   E#K:       E#t  .D#L    ###K:   E#t ]],
          [[ E#t      .E##E      .D#;     G#t    ED.        E#t :K#t     ##D.    E#t ]],
          [[ ..         G#E        tt      t     t          E#t ...      #G      ..  ]],
          [[             fE                                 ,;.          j           ]],
          [[              ,                                                          ]],
          [[                                                                         ]],
        }


    local custom_banner_gentoo ={

        [[]],
        [[]],
        [[]],
        [[]],
        [[]],
        [[]],
        [[]],
        [[]],
        [[]],
        [[]],
        [[]],
        [[]],
        [[]],
        [[]],
        [[                                           .                              ]],
        [[     .vir.                                d$b                             ]],
        [[  .d$$$$$$b.    .cd$$b.     .d$$b.   d$$$$$$$$$$$b  .d$$b.      .d$$b.    ]],
        [[  $$$$( )$$$b d$$$()$$$.   d$$$$$$$b Q$$$$$$$P$$$P.$$$$$$$b.  .$$$$$$$b.  ]],
        [[  Q$$$$$$$$$$B$$$$$$$$P"  d$$$PQ$$$$b.   $$$$.   .$$$P' `$$$ .$$$P' `$$$  ]],
        [[    "$$$$$$$P Q$$$$$$$b  d$$$P   Q$$$$b  $$$$b   $$$$b..d$$$ $$$$b..d$$$  ]],
        [[   d$$$$$$P"   "$$$$$$$$ Q$$$     Q$$$$  $$$$$   `Q$$$$$$$P  `Q$$$$$$$P   ]],
        [[  $$$$$$$P       `"""""   ""        ""   Q$$$P     "Q$$$P"     "Q$$$P"    ]],
        [[  `Q$$P"                                  """                             ]],
        [[]],
    }

    use {'glepnir/dashboard-nvim'}
    local db = require("dashboard")

    db.setup {
        theme = 'doom',
        config = {
            center = {
                {
                icon = "  ",
                desc = "New File",
                action = "e filename",
                shortcut = "SPC m",
                },
                {
                icon = "  ",
                desc = "Browse Files",
                action = "Telescope file_browser",
                shortcut = "SPC n",
                },
                {
                icon = "  ",
                desc = "Find Files",
                action = "Telescope find_files",
                shortcut = "SPC f",
                },
                {
                icon = "󰏫  ",
                desc = "Confgiure Neovim",
                action = "edit ~/.config/nvim/init.lua",
                shortcut = "SPC v",
                },
                {
                icon = "󰗼  ",
                desc = "Exit Neovim",
                action = "quit",
                }
            },



            header = custom_banner_gentoo,
            footer = {'',
            '"Those who do not move, do not notice their chains." ~ Rosa Luxemburg'
            },


        }
    }


    --commentary
    use ('tpope/vim-commentary')

    -- bottom bar
    --use ('vim-airline/vim-airline')

    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.3',
    -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }


    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use {'neoclide/coc.nvim', branch = 'release'}

    use {'majutsushi/tagbar'}

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
        require('packer').compile()
    end
end)



