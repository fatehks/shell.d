alias eg='env|grep -i'
alias psg='ps -aux|grep -i'
alias aag='alias|grep -i'

alias lg='ls -laF --color=never|grep -i'
alias ls='ls --color=auto'
alias lf='ls -F'
alias laf='ls -aF'
alias ltr='ls -latrF --color=auto'
alias ll='ls -latr'
alias l='ls -l'
alias llh='ls -latrh'

alias kssh="kitty +kitten ssh"


alias instancedns="aws ec2 describe-instances --query 'Reservations[*].Instances[*].[PrivateIpAddress, PublicIpAddress, PublicDnsName]' --output text --instance-ids" 
