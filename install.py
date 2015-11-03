#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import argparse
import subprocess

GIT_FOLDER = 'dotfile'
GIT_REPO = 'git@github.com:cl1337/{}.git'.format(GIT_FOLDER)


class Installer(object):

    def __init__(self):
        parser = argparse.ArgumentParser()
        parser.add_argument(
            '-e', '--env', action='store', choices=['dev', 'local'],
            required=True,
        )
        parser.add_argument(
            '-v', action='store_true', help='install vim 7.4 and 7.4 plugins',
        )
        parser.add_argument(
            '-s', action='store_true', help='install sublime configs in local'
        )
        subprocess.call('cd ~', shell=True)
        self.home_path = subprocess.check_output('pwd')[:-1]
        self.args = parser.parse_args()

    def env_context(git_repo, git_folder):
        def decorator(func):
            def wrapper(*args, **kwargs):
                cmd_git_clone = 'git clone {}'.format(git_repo)
                subprocess.call(cmd_git_clone, shell=True)
                func(*args, **kwargs)
                cmd_cleanup = 'rm -rf {}'.format(git_folder)
                subprocess.call(cmd_cleanup, shell=True)
                subprocess.call('cd -', shell=True)
            return wrapper
        return decorator

    @env_context(GIT_REPO, GIT_FOLDER)
    def run(self):
        self._dev_core()

    def _install_vim(self):
        pass

    def _run_cmd(self, cmd):
        cmd_list = cmd.split()
        subprocess.call(cmd_list)

    def _config_vim(self, vim_profile):
        vundle_path = '{}/.vim/bundle/Vundle.vim'.format(self.home_path)
        cmd_vimrc_cp = 'cp {}/vim/{} {}/.vimrc'.format(
            GIT_FOLDER, vim_profile, self.home_path
        )
        cmd_clone_vundle = (
            'git clone https://github.com/VundleVim/Vundle.vim.git'
            ' {}/.vim/bundle/Vundle.vim'
        ).format(self.home_path)
        cmd_vim_install_plugin = 'vim +PluginInstall +qall'
        subprocess.call(cmd_vimrc_cp, shell=True)
        if not os.path.exists(vundle_path):
            subprocess.call(cmd_clone_vundle, shell=True)
        subprocess.call(cmd_vim_install_plugin, shell=True)
        with open('{}/.vimrc'.format(self.home_path), 'a') as f:
            f.write('colorscheme gruvbox')

    def _config_bash(self):
        cmd_bash_cp = 'cp {}/bash_profile {}/.bash_profile'.format(
            GIT_FOLDER, self.home_path,
        )
        cmd_source_bash = 'source {}/.bash_profile'.format(self.home_path)
        subprocess.call(cmd_bash_cp, shell=True)
        subprocess.call(cmd_source_bash, shell=True)

    def _config_zsh(self):
        pass

    def _config_tmux(self):
        cmd_tmux_cp = 'cp {}/tmux.conf {}/.tmux.conf'.format(
            GIT_FOLDER, self.home_path,
        )
        subprocess.call(cmd_tmux_cp, shell=True)

    def _dev_core(self):
        self._config_bash()
        self._config_tmux()
        self._config_vim('vimrc.basic')


if __name__ == '__main__':
    installer = Installer()
    installer.run()
