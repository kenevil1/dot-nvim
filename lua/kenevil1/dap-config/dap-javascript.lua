local M = {}

function M.setup()

    local dap_install = require "dap-install"
    dap_install.config("jsnode", {})

end

return M
