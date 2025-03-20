return {
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        menu = {
          auto_show = false,
        },
      },
    },
  },
  {
    "snacks.nvim",
    opts = {
      indent = {
        enabled = true,
        indent = {
          only_scope = true, -- only show indent guides of the scope
          only_current = true, -- only show indent guides in the current window
        },
      },
      dashboard = {
        preset = {
          header = [[
@@@  @@@  @@@@@@@@  @@@@@@@  @@@@@@@  @@@
@@@  @@@  @@@@@@@@  @@@@@@@  @@@@@@@  @@@
@@!  @@@  @@!         @@!      @@!    @@!
!@!  @!@  !@!         !@!      !@!    !@!
@!@  !@!  @!!!:!      @!!      @!!    !!@
!@!  !!!  !!!!!:      !!!      !!!    !!!
:!:  !!:  !!:         !!:      !!:    !!:
 ::!!:!   :!:         :!:      :!:    :!:
  ::::     :: ::::     ::       ::     ::
   :      : :: ::      :        :     :

]],
        },
      },
    },
  },
}
