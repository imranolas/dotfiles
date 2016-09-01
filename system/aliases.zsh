# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null)
then
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias la='gls -A --color'
fi

if $(apm &>/dev/null)
then
  alias apm-install="apm install --packages-file ~/.atom/.packages"
  alias apm-save="apm list --installed --bare > ~/.atom/.packages"
fi
