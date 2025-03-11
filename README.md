此脚本 backupYourTerminal.sh 用于备份和还原终端环境。以下是使用说明：

#### 1. 备份终端环境

运行 backupYourTerminal.sh 脚本以生成一个名为 resumeYourTerminal.sh 的脚本，该脚本包含了恢复终端环境所需的所有步骤。

```bash
./backupYourTerminal.sh
```

#### 2. 还原终端环境

在需要还原终端环境时，运行生成的 resumeYourTerminal.sh 脚本。

```bash
./resumeYourTerminal.sh
```

#### 详细步骤

1. **检查Homebrew是否安装**：
   - 如果未安装Homebrew，脚本将提示用户先安装Homebrew。

2. **获取已安装的Homebrew包列表**：
   - 脚本会获取当前系统中已安装的所有Homebrew包。

3. **生成 resumeYourTerminal.sh 脚本**：
   - 该脚本包含以下步骤：
     - 安装Homebrew（如果尚未安装）。
     - 安装Zsh并设置为默认shell。
     - 安装Oh My Zsh。
     - 安装所有已安装的Homebrew包。
     - 安装Node.js和CocoaPods。
     - 安装rbenv和ruby-build。
     - 初始化rbenv并安装最新的3.1.x或更高版本的Ruby。
     - 重新加载 `.zshrc` 文件。

4. **设置生成的脚本为可执行**：
   - 脚本会自动设置 resumeYourTerminal.sh 为可执行文件。

#### 注意事项
- 运行 resumeYourTerminal.sh 脚本后，建议重新启动终端以应用所有更改。

通过以上步骤，您可以轻松备份和还原您的终端环境配置。
