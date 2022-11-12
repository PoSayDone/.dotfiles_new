local M = {}

M.new_hlgroups = {
    -- pywal
    systemAccent = { fg = "#CB9D6D" },

    -- Neorg
    NeorgCodeBlock = { bg = "black2" },

    -- unordered lists
    NeorgUnorderedList1 = { fg = "grey_fg" },
    NeorgUnorderedList2 = { fg = "grey_fg" },
    NeorgUnorderedList3 = { fg = "grey_fg" },
    NeorgUnorderedList4 = { fg = "grey_fg" },
    NeorgUnorderedList5 = { fg = "grey_fg" },
    NeorgUnorderedList6 = { fg = "grey_fg" },

    -- headings
    NeorgHeading1Title = { fg = "white", bold = true },
    NeorgHeading1Prefix = { fg = "white", bold = true },

    NeorgHeading2Title = { fg = "red", bold = true },
    NeorgHeading2Prefix = { fg = "red", bold = true },

    NeorgHeading3Title = { fg = "green", bold = true },
    NeorgHeading3Prefix = { fg = "green", bold = true },

    NeorgHeading4Title = { fg = "blue", bold = true },
    NeorgHeading4Prefix = { fg = "blue", bold = true },

    NeorgHeading5Title = { fg = "purple", bold = true },
    NeorgHeading5Prefix = { fg = "purple", bold = true },

    NeorgHeading6Title = { fg = "yellow", bold = true },
    NeorgHeading6Prefix = { fg = "yellow", bold = true },

    NeorgMarkUpBold = {
        fg = "red",
        bold = true,
    },

    FakeLineNr = {
        fg = "black",
        bg = "black",
    },
}

M.overriden_hlgroups = {
    TSVariable = {
        fg = "red",
    },

    TSOperator = {
        fg = "teal",
    },

    TSRepeat = {
        fg = 'purple',
        italic = true,
    },

    TSFunction = {
        italic = true,
    },

    TSMethod = {
        italic = true,
    },

    TSConditional = {
        fg = "dark_purple",
        italic = true,
    },

    TSKeywordOperator = {
        fg = "dark_purple",
        italic = true,
    },

    NvimTreeNormal = {
        bg = "black"
    },

    NvimTreeNormalNC = {
        bg = "black"
    },

    NvimTreeWinSeparator = {
        bg = "black",
        fg = "black",
    },

    Type = { italic = true },
    SpecialComment = { italic = true },
    TSAttribute = { italic = true },
    TSParameter = { italic = true },
    TSLabel = { italic = true },
    TSVariableBuiltin = { italic = true },
    TSTagAttribute = { italic = true },
}

return M
