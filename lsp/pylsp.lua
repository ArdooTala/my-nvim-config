return {
    cmd = { 'pylsp' },

    filetypes = { 'python' },

    single_file_support = true,

    root_markers = {
        'pyproject.toml',
        'setup.py',
        'setup.cfg',
        'requirements.txt',
        'Pipfile',
        '.git',
    },

 -- Debounce text changes slightly for performance
  flags = {
    debounce_text_changes = 200,
  },
  settings = {
    pylsp = {
      plugins = {
        -- Formatter options
        black = { enabled = true },
        autopep8 = { enabled = false },
        yapf = { enabled = false },
        
        -- Linter options
        pylint = { enabled = false, executable = "pylint" },
        pyflakes = { enabled = true },
        pycodestyle = { enabled = false },
        
        -- Type checker
        pylsp_mypy = { enabled = false },
        
        -- Auto-completion options
        jedi_completion = { fuzzy = true },
        
        -- Import sorting
        pyls_isort = { enabled = false },

        -- ==========================================================
        -- Completion & Navigation (Jedi / Rope)
        -- ==========================================================
        jedi_completion = {
          enabled = true,
          include_params = true,
          include_class_objects = true,
          include_function_objects = true,
          fuzzy = true,
        },
        jedi_hover = {
          enabled = true,
        },
        jedi_references = {
          enabled = true,
        },
        jedi_signature_help = {
          enabled = true,
        },
        jedi_symbols = {
          enabled = true,
          all_scopes = true,
        },
        rope_completion = {
          enabled = false, -- Usually jedi is preferred over rope for completion
        },
      },
    },
  },
}
