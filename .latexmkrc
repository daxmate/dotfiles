# ==============================================================
# latexmk 配置文件 — 完整选项参考
# 每个选项包含: 用途说明 | 可设置的值 | 默认值
# 去掉行首的 ## 即可启用某个选项
# 路径相对于项目目录（编译时的当前目录），除非写绝对路径
# ==============================================================

# ======================== 1. PDF 输出与编译引擎 ========================

## PDF 生成模式
##   0 - 不生成 PDF（仅 DVI）
##   1 - pdflatex → PDF
##   2 - latex → dvips → ps2pdf → PDF（传统 PS 路线）
##   3 - latex → dvipdf → PDF
##   4 - lualatex → PDF
##   5 - xelatex → PDF
## 值: 0 | 1 | 2 | 3 | 4 | 5
## 默认: 1（若未指定）
$pdf_mode = 4;

## 编译引擎命令模板（%O = 额外选项, %S = 源文件名, %D = 输出文件名）
## 此处只写必须的额外开关，通用设置在 $latex 系列变量里
$lualatex = 'lualatex -synctex=1 %O -shell-escape %S';

## 若使用 xelatex，取消下面注释
## $xelatex = 'xelatex -synctex=1 %O -shell-escape %S';

## 若使用 pdflatex，取消下面注释
## $pdflatex = 'pdflatex -synctex=1 %O -shell-escape %S';

## 引擎额外参数（追加到 %O 位置，全局通用）
## 常用: -interaction=nonstopmode（遇到错误继续编译）
##       -halt-on-error（一有错就停）
##       -file-line-error（错误信息带文件名:行号）
## 值: 任意 tex 引擎支持的参数
## 默认: 空
# $latex = '-interaction=nonstopmode';

# ======================== 2. 输出目录管理 ========================

## 将所有生成文件（.aux, .log, .synctex.gz, .out, .toc 以及 PDF）
## 放到 build/ 目录下，保持源码目录干净
## 值: 任意目录名（相对于项目目录）
## 默认: 空（当前目录）
$out_dir = 'build';

## 仅将辅助文件（.aux, .log, .toc 等中间文件）放到指定目录，
## PDF 仍留在当前目录
## 如果同时设置了 $out_dir 和 $aux_dir，$aux_dir 优先用于中间文件
## 值: 任意目录名 | undef
## 默认: undef（跟 PDF 同一目录）
## $aux_dir = 'build';

# ======================== 3. 自动重复编译 ========================

## 最大自动重复编译次数
## latexmk 会自动检测辅助文件变化（.aux, .toc, .bbl 等）
## 自动重跑解决 "rerun to get cross-references right" 问题
## 值: 正整数
## 默认: 5
# $max_repeat = 5;

## 最小重复次数（有时即使没有变化，biber/makeindex 也需要至少两次）
## 值: 正整数
## 默认: 1
# $min_repeat = 1;

## 重复时强制等待的秒数（避免磁盘 IO 延迟导致误判）
## 值: 0-*
## 默认: 0
# $repeat_wait = 2;

# ======================== 4. 连续预览模式 (pvc) ========================

## 启用连续预览模式（watch 文件变化自动重编）
## 配合 $pdf_previewer 使用
## 值: true | false
## 默认: false
## $pvc = 1;

## PDF 预览器（仅在 pvc 模式或指定 -pv 时有效）
## 常用值: skim, open, evince, okular, atril
## macOS: 'open -a Skim' 或 'open'
## 值: 任意 shell 命令（%O = 选项, %S = 输出的 PDF 路径）
## 默认: 根据操作系统自动选择
## $pdf_previewer = 'open -a Skim';

## 预览失败时保留临时 PDF（用于调试预览器）
## 值: true | false
## 默认: false
## $pvc_view_file = 1;

## 在 pvc 模式下，是否在每次都启动新预览器进程
## false = 复用已有进程（需要预览器支持）
## 值: true | false
## 默认: false
## $new_viewer = 0;

## pvc 模式的文件变化轮询间隔（秒）
## 值: 0.5-*
## 默认: 2.0
## $pvc_interval = 2.0;

## 忽略哪些文件的修改（不触发重编）
## 值: 正则表达式列表
## 默认: 空
## @pvc_ignore_files = (qr/\.tmp$/);

# ======================== 5. 日志与诊断 ========================

## 启用诊断输出（详细显示 latexmk 内部判断逻辑）
## 值: true | false
## 默认: false
## $diagnostics = 1;

## 日志级别
## 值: 'debug' | 'info' | 'warning' | 'error' | 'fatal'
## 默认: 'info'
## $log_level = 'info';

## 静默日志文件警告（不把 .log 中的 warnings 输出到终端）
## 值: true | false
## 默认: false
## $silence_logfile_warnings = 1;

## 在终端显示 .log 文件中的 warnings
## 值: true | false
## 默认: true
## $show_logfile_warnings = 1;

# ======================== 6. BibTeX / Biber ========================

## BibTeX 命令
## 较新项目推荐用 biblatex + biber
## 值: 任意 shell 命令
## 默认: 'bibtex %O %S'
## $bibtex = 'bibtex %O %S';

## Biber 命令（biblatex 后端）
## 值: 任意 shell 命令
## 默认: 'biber %O %S'
## $biber = 'biber %O %S';

## 禁止 bibtex/biber（项目无参考文献时加速）
## 值: true | false
## 默认: false
## $no_bib = 1;

# ======================== 7. 索引与术语表 ========================

## makeindex 命令（生成 .idx → .ind）
## 值: 任意 shell 命令
## 默认: 'makeindex %O -o %D %S'
## $makeindex = 'makeindex %O -o %D %S';

## makeindex 的 .ist 样式文件（无则用默认）
## 值: 文件名
## 默认: 空
## $makeindex_style = 'myindex.ist';

## mendex 命令（日文索引）
## 值: 任意 shell 命令
## 默认: 'mendex %O -o %D %S'
## $mendex = 'mendex %O -o %D %S';

## xindy 命令（更强大的索引工具，支持多语言排序）
## 值: 任意 shell 命令
## 默认: 不使用
## $xindy = 'xindy %O -o %D %S';

## 术语表（glossaries 包）
## 值: 任意 shell 命令
## 默认: 'makeglossaries %O %S'
## $makeglossaries = 'makeglossaries %O %S';

# ======================== 8. 文件清理 ========================

## 清理模式
##   0 - 不清除
##   1 - 仅清除 $clean_ext 中列出的扩展名
##   2 - 清除所有生成文件（相当于 clean all）
## 值: 0 | 1 | 2
## 默认: 2
$cleanup_mode = 2;

## 自定义清除文件扩展名（cleanup_mode=1 时生效）
## 不会清除 $out_dir 中的 PDF，除非把扩展名加到这里
## 默认清除列表: .aux .bbl .blg .dvi .fdb_latexmk .fls
##                    .glo .gls .idx .ilg .ind .lof .log .lot
##                    .out .run.xml .synctex.gz .toc
## @clean_ext = ('.aux', '.log', '.bbl', '.blg', '.run.xml');

## 强制保留的文件（即使匹配清理规则也不删）
## @clean_keep = ('main.pdf', 'main.tex');

## 保留 $out_dir 中的 PDF（latexmk -c 时保 PDF，-C 仍全删）
## 值: true | false
## 默认: false（-C 时会删 PDF）
## $keep_pdf = 1;

# ======================== 9. 编码与特殊字符 ========================

## 默认输入编码（仅在非 UTF-8 项目时需要）
## 现代 LaTeX 用 \usepackage[utf8]{inputenc}，无需此设置
## 值: 任何编码名
## 默认: 'utf8'
## $default_encoding = 'utf8';

## PDF 文档信息（标题/作者等）的编码
## 值: 编码名
## 默认: 同 $default_encoding
## $document_encoding = 'utf8';

# ======================== 10. 外部命令与钩子 ========================

## 编译前执行的 shell 命令
## 可用占位符: %T = tex 文件（无扩展名）, %R = 根文件名
## 值: shell 命令字符串
## 默认: 空
## $pre_tex_cmd = 'echo "Starting compilation..."';

## 编译后执行的 shell 命令
## 值: shell 命令字符串
## 默认: 空
## $post_tex_cmd = 'echo "Done!"';

## 编译文件前后执行的外部程序（更灵活的替代）
## 例如: 自动转存 SVG 图片、运行 Python 脚本生成图表
## @extra_commands = ('inkscape -D -z --file=diagram.svg --export-pdf=diagram.pdf');

## 设置环境变量
## %ENV{'TEXINPUTS'} = '.:/path/to/texinputs:';
## %ENV{'BIBINPUTS'} = '.:/path/to/bib:';
## %ENV{'BSTINPUTS'}  = '.:/path/to/bst:';
## %ENV{'OPENTYPEFONTS'} = '.:/path/to/fonts:';

# ======================== 11. 退出行为 ========================

## 成功编译后自动退出 latexmk（适用于 CI/CD）
## 值: true | false
## 默认: false
## $auto_quit = 1;

## 编译失败后自动退出（不等待用户输入）
## 值: true | false
## $failure_quit = 1;
## 默认: false

# ======================== 12. 杂项 ========================

## 自定义暂停/错误处理（非交互模式时遇到错误的行为）
##   0 - 暂停并提示
##   1 - 忽略错误继续
##   2 - 出错即停止
## 值: 0 | 1 | 2
## 默认: 0
## $force_silent = 0;

## 睡眠间隔（秒），用于 watch 文件修改的内部轮询
## 值: 0.5-*
## 默认: 2
## $sleep_time = 2;

## fork 子进程编译（更快启动新的编译实例）
## 某些系统上可能不稳定
## 值: true | false
## 默认: true
## $fork = 1;

## 允许 latexmk 在作业中删除生成的文件
## 值: true | false
## 默认: true
## $allow_subdir_creation = 1;

## 编译依赖追踪文件（.fdb_latexmk）的格式
## 值: 'internal' | 'make' | 'make_old'
## 默认: 'internal'
## $fdb_format = 'internal';

## 手动指定主文件（不指定则自动检测）
## 目录中有多个 .tex 文件时，指定主入口文件（不含扩展名）
## $root_filename = 'main';
