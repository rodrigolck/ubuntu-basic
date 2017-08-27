#!/bin/bash

# Import SublimeText 3 repository
sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo apt install -y sublime-text git meld

# Import GITAWARE, to make the visualization of the branches and infos easier
cd
git clone git://github.com/jimeh/git-aware-prompt.git .bash/git-aware-prompt
echo export GITAWAREPROMPT='~/.bash/git-aware-prompt' >> ~/.bashrc
echo 'source "${GITAWAREPROMPT}/main.sh"' >> ~/.bashrc
echo 'export PS1="\${debian_chroot:+(\$debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "' >> ~/.bashrc

# Plugin that helps to see the diff
echo '#!/usr/bin/python' > ~/diff.py
echo -e "\nimport sys\nimport os\n\nos.system('meld \"%s\" \"%s\"' % (sys.argv[2], sys.argv[5]))" >> ~/diff.py
git config --global diff.external ~/diff.py
chmod +x ~/diff.py
