git config --global user.name 'Viktor Vlasov'
git config --global user.email 'viktorvlasovsiberian@gmail.com'

git config --global core.autocrlf input
git config --global core.quotepath false
git config --global diff.tool 'vimdiff'
git config --global merge.tool 'vimdiff'
git config --global core.pager 'delta --keep-plus-minus-markers --plus-color="#012800" --minus-color="#340001"'
git config --global interactive.diffFilter 'delta --color-only'

git config --global push.default simple
