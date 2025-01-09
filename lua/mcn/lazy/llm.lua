return {
    "huggingface/llm.nvim",
    enabled = false,
    opts = {},

    config = function()
        local llm = require("llm")

        llm.setup({
            backend = "ollama",
            model = "qwen2.5-coder:14b",
            url = "http://localhost:11434",
            request_body = {
                options = {
                    temperature = 0.2,
                    top_p = 0.95,
                }
            },
            fim = {
                enabled = true,
                prefix = "<fim_prefix>",
                middle = "<fim_middle>",
                suffix = "<fim_suffix>",
            },
            debounce_ms = 150,
            accept_keymap = "<Tab>",
            dismiss_keymap = "<S-Tab>",
            tls_skip_verify_insecure = false,
            lsp = {
                bin_path = nil,
                host = nil,
                port = nil,
                cmd_env = nil,
                version = "0.5.3",
            },
            tokenizer = nil,
            context_window = 400,
            enable_suggestions_on_startup = true,
            enable_suggestions_on_files = "*",
            disable_url_path_completion = false,
        })
    end
}
