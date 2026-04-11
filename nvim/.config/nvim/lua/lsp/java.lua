local M = {}

function M.setup()
  local home = os.getenv("HOME")
  local jdtls_base = home .. "/.local/share/nvim/mason/packages/jdtls"
  local workspace_path = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
  local config_path = jdtls_base .. "/config_linux"
  local launcher_path = vim.fn.glob(jdtls_base .. "/plugins/org.eclipse.equinox.launcher_*.jar")

  -- Create workspace directory
  vim.fn.mkdir(workspace_path, "p")

  local config = {
    cmd = {
      "java",
      "-Declipse.application=org.eclipse.jdt.ls.core.id1",
      "-Dosgi.bundles.defaultStartLevel=4",
      "-Declipse.product=org.eclipse.jdt.ls.core.product",
      "-Dlog.level=WARNING",
      "-Xmx1g",
      "--add-modules=ALL-SYSTEM",
      "--add-opens",
      "java.base/java.util=ALL-UNNAMED",
      "--add-opens",
      "java.base/java.lang=ALL-UNNAMED",
      "-jar",
      launcher_path,
      "-configuration",
      config_path,
      "-data",
      workspace_path,
    },

    root_dir = vim.fs.dirname(
      vim.fs.find({ ".git", "mvnw", "gradlew", "pom.xml" }, { upward = true })[1] or vim.fn.getcwd()
    ),

    settings = {
      java = {
        configuration = {
          runtimes = {
            {
              name = "JavaSE-21",
              path = "/usr/lib/jvm/java-21-openjdk",
            },
          },
        },
        progressReports = {
          enabled = false,
        },
        notifications = {
          enabled = false,
        },
      },
    },

    init_options = {
      extendedClientCapabilities = {
        progressReportProvider = false,
        classFileContentsSupport = false,
        generateToStringPromptSupport = true,
        hashCodeEqualsPromptSupport = true,
        advancedOrganizeImportsSupport = true,
        advancedGenerateAccessorsSupport = true,
        generateConstructorsPromptSupport = true,
        generateDelegateMethodsPromptSupport = true,
        moveRefactoringSupport = true,
        overrideMethodsPromptSupport = true,
      },
    },

    -- nvim-jdtls still accepts on_attach — it calls it directly after start_or_attach.
    -- We piggyback on the shared lsp.on_attach logic and also enable inlay hints.
    -- The global LspAttach autocmd (autocmds.lua) handles keymaps for Java too,
    -- so here we only need what jdtls-specific setup requires.
    on_attach = function(client, bufnr)
      vim.defer_fn(function()
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
      end, 100)
    end,
  }

  require("jdtls").start_or_attach(config)
end

return M
