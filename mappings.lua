-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- Select yanked text
    ["vv"] = { "`[v`]", desc = "Select yanked text" },
    -- Testing
    ["<leader>r"] = { name = "Test" },
    ["<leader>rr"] = { "<cmd>lua require('neotest').run.run()<cr>", desc = "Run nearest test"},
    ["<leader>ro"] = { "<cmd>lua require('neotest').output.open({enter=true})<cr>", desc = "Open output window"},
    ["<leader>rp"] = { "<cmd>lua require('neotest').output_panel.toggle()<cr>", desc = "Toggle output panel"},
    ["<leader>rc"] = { "<cmd>lua require('neotest').output_panel.clear()<cr>", desc = "Clear output panel"},
    ["<leader>rs"] = { "<cmd>lua require('neotest').summary.toggle()<cr>", desc = "Toggle summary window"},
    ["<leader>r["] = { "<cmd>lua require('neotest').jump.prev({status='failed'})<cr>", desc = "Prev failure"},
    ["<leader>r]"] = { "<cmd>lua require('neotest').jump.next({status='failed'})<cr>", desc = "Next failure"},
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr) require("astronvim.utils.buffer").close(bufnr) end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    -- Package info
    ["<leader>n"] = { name = "Package Info" },
    ["<leader>nd"] = { "<cmd>lua require('package-info').delete()<cr>", desc = "Delete" },
    ["<leader>np"] = { "<cmd>lua require('package-info').change_version()<cr>", desc = "Change Version" },
    ["<leader>ni"] = { "<cmd>lua require('package-info').install()<cr>", desc = "Install" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
