import argparse
import json
import os
import subprocess
from contextlib2 import contextmanager
from termcolor import colored


@contextmanager
def set_env(git_repo, git_dir):
    """Fetching git_repo/git_dir.git, cleanup files afterwards"""
    try:
        subprocess.call(['git', 'clone', '{}/{}.git'.format(git_repo, git_dir)])
        yield
    except Exception as e:
        print colored('>>> error fetching {git_repo}/{git_dir}, exception: {e}'.format(
            git_repo=git_repo, git_dir=git_dir, e=e), 'red')
    finally:
        subprocess.call(['rm', '-rf', git_dir])


class Installer(object):

    def __init__(self, **kwargs):
        self.config = kwargs
        self.git_repo = self.config['git_repo']
        self.git_dir = self.config['git_dir']
        self.config_files = self.config.get('config_files') or {}
        self.home_path = os.path.expanduser('~')

    def run(self):
        with set_env(self.git_repo, self.git_dir):
            self._config_vim()
            self._set_config_file()

            # additional editor options
            if self.config.get('editors'):
                if self.config['editors'].get('sublime'):
                    self._config_sublime()
                if self.config['editors'].get('install_vim'):
                    self._install_vim_74()

            # additional tool options
            if self.config.get('tools'):
                if self.config['tools'].get('bin'):
                    self._compile_tools_to_bin()
                if self.config['tools'].get('extra'):
                    self._install_extra_tools()

    def _install_vim_74(self):
        print colored('>>>> installing vim 7.4 to usr directory', 'green')
        pass

    def _config_sublime(self):
        print colored('>>>> copy sublime configs', 'green')
        pass

    def _compile_tools_to_bin(self):
        print colored('>>>> compiling scripts to bin', 'green')
        pass

    def _install_extra_tools(self):
        print colored('>>>> installing extra tools', 'green')
        pass

    def _config_vim(self):
        vundle_path = '{}/.vim/bundle/Vundle.vim'.format(self.home_path)
        if not os.path.exists(vundle_path):
            subprocess.call(('git clone https://github.com/VundleVim/Vundle.vim.git '
                             '{}/.vim/bundle/Vundle.vim').format(self.home_path), shell=True)
        subprocess.call('vim +PluginInstall +qall', shell=True)

    def _set_config_file(self):
        for source, dest in self.config_files.iteritems():
            subprocess.call('cp {dir}/{source} ~/{dest}'.format(
                dir=self.git_dir, source=source, dest=dest), shell=True)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument(
        '-c', '--config', required=True, help='config file to be loaded for install')
    args = parser.parse_args()

    with open(args.config, 'r') as f:
        configs = json.load(f)
        for config in configs:
            print colored('>>> installing from {}/{}\n'.format(
                config['git_repo'], config['git_dir']), 'green')
            Installer(**config).run()
