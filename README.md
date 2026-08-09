

# tex2uni.nvim

`tex2uni.nvim` is a Neovim plugin for TeX-to-Unicode conversion in Neovim.

![tex2uni demo](tex2uni.gif)

## Feature

- Converts LaTeX-like abbreviations into Unicode characters.

### Distributor

You can use a distributor to distribute a prefix to a sequence of characters.

The default distributor character is `#` and can be changed with the `abbreviations.distributor` option. Set this option to the empty string `""` to disable.

If the prefix is empty, the abbreviation is left unchanged. Eg. `\#foo` is *not* distributed to `\foo` and is rather directly converted to `♯foo`.

Example: `\bf#Set` will be distributed to `\bfS\bfe\bft` and converted to 𝐒𝐞𝐭.

## Installation

With `lazy.nvim`:

```lua
return {
  {
    "Zeta611/tex2uni.nvim",
    opts = {
      ft = { "*.{tex,v}" }, -- enable for specific filetypes
      abbreviations = {
        extra = {
          ["pure"] = "⌜$CURSOR⌝", -- add custom abbreviations
        },
      },
    },
  },
}
```

## Acknowledgements

I have packaged this with permission from [LimitEpsilon](https://github.com/LimitEpsilon), who originally wrote this, who again extracted the TeX-to-unicode conversion routine from [lean.nvim](https://github.com/Julian/lean.nvim).
