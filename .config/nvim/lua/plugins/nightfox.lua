
function Time_in_hour()
    return tonumber(os.date("%H"))
end

-- local current_time = Time_in_hour()

return {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,

    config = function()
        require("nightfox").setup({
            options = {
                -- transparent = true,
            }
        })

        -- Use current_time to set colorscheme based on the hour
        -- if current_time > 7 and current_time < 19 then
        --     vim.cmd("colorscheme kanagawa-lotus")
        -- else
        --     vim.cmd("colorscheme carbonfox")
        -- end
    end
}

