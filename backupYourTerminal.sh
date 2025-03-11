#!/bin/bash

# 文件名: backupYourTerminal

# 检查Homebrew是否安装
if ! command -v brew &> /dev/null; then
  echo "Homebrew 未安装。请先安装 Homebrew。"
  exit 1
fi

# 获取已安装的Homebrew包列表
brew_list=$(brew list)

# 生成resumeYourTerminal脚本
cat <<EOL > resumeYourTerminal.sh
#!/bin/bash

# 安装Homebrew（如果尚未安装）
if ! command -v brew &> /dev/null; then
  echo "Homebrew 未安装。正在安装 Homebrew..."
  /bin/bash -c "\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# 安装Zsh
echo "正在安装 Zsh..."
brew install zsh

# 设置Zsh为默认shell
echo "设置 Zsh 为默认 shell..."
chsh -s /bin/zsh

# 安装Oh My Zsh
echo "正在安装 Oh My Zsh..."
sh -c "\$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 安装已安装的Homebrew包
echo "正在安装已安装的 Homebrew 包..."
EOL

for package in $brew_list; do
  echo "brew install $package" >> resumeYourTerminal.sh
done

# 安装node和cocoapods
cat <<EOL >> resumeYourTerminal.sh

# 安装node和cocoapods
echo "正在安装 node 和 cocoapods..."
brew install node
brew install cocoapods

# 安装rbenv和ruby-build
echo "正在安装 rbenv 和 ruby-build..."
brew install rbenv
brew install ruby-build

# 初始化rbenv
echo 'export PATH="\$HOME/.rbenv/bin:\$PATH"' >> ~/.zshrc
echo 'eval "\$(rbenv init -)"' >> ~/.zshrc
export PATH="\$HOME/.rbenv/bin:\$PATH"
eval "\$(rbenv init -)"

# 获取最新的3.1.x或更高版本的Ruby
latest_ruby_version=\$(rbenv install --list | grep -E '^  3\.[1-9]\.[0-9]+' | tail -1 | tr -d ' ')

# 安装并设置最新的3.1.x或更高版本的Ruby
echo "正在安装 Ruby \$latest_ruby_version..."
rbenv install \$latest_ruby_version
rbenv global \$latest_ruby_version
rbenv rehash

# 重新加载.zshrc
echo "重新加载 .zshrc 文件..."
source ~/.zshrc

echo "终端环境配置完成！请重新启动终端以应用所有更改。"
EOL

# 设置生成的脚本为可执行
chmod +x resumeYourTerminal.sh

echo "终端环境备份完成！运行 resumeYourTerminal.sh 脚本以还原终端环境。"