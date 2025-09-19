以下是为您准备的关于 scanf 和 printf 的 Markdown Marp 幻灯片源码。它包含了基本用法、格式说明符、示例代码以及重要注意事项。
---
marp: true
theme: default
paginate: true
header: "C语言输入输出：scanf & printf"
footer: "CS100 Recitation"
---

<!-- 第一页：标题页 -->
# C语言标准输入输出
## scanf() 与 printf() 函数详解

@Your.Name
ShanghaiTech University

---

<!-- 第二页：目录 -->
## 内容提要

1.  **`printf` 函数**：格式化输出
2.  **`scanf` 函数**：格式化输入
3.  **格式说明符详解**
4.  **常见陷阱与注意事项**
5.  **总结与练习**

---

<!-- 第三页：printf 简介 -->
## 1. printf 函数

**功能**：向标准输出设备（通常是屏幕）打印格式化的文本。

**基本语法**：
c
include <stdio.h> // 必须包含头文件

int printf(const char *format, ...);

*   **`format`**：字符串，包含要打印的文本和**格式控制说明符**。
*   **`...`**：可变参数，其数量和类型必须与 `format` 中的格式控制说明符匹配。

---

<!-- 第四页：printf 格式符 -->
## printf 常用格式控制符

| 说明符 | 用途                  | 示例                 |
| :----- | :-------------------- | :------------------- |
| `%d`   | 输出有符号十进制整数    | `printf("%d", 10);`    |
| `%f`   | 输出单精度浮点数        | `printf("%f", 3.14f);` |
| `%lf`  | 输出双精度浮点数        | `printf("%lf", 3.14);` |
| `%c`   | 输出单个字符            | `printf("%c", 'A');`    |
| `%s`   | 输出字符串              | `printf("%s", "Hello");`|
| `%p`   | 输出指针地址            | `printf("%p", &var);`  |

---

<!-- 第五页：printf 示例 -->
## printf 示例代码

c
include <stdio.h>

int main() {
    int age = 20;
    float height = 1.75f;
    char grade = 'A';
    char name[] = "Li Hua";
    
    printf("Hello, my name is %s.\n", name);
    printf("I am %d years old and %.2f meters tall.\n", age, height);
    printf("I got an %c in the last exam.\n", grade);
    return 0;
}


**输出**：

Hello, my name is Li Hua.
I am 20 years old and 1.75 meters tall.
I got an A in the last exam.


---

<!-- 第六页：scanf 简介 -->
## 2. scanf 函数

**功能**：从标准输入设备（通常是键盘）读取格式化的输入。

**基本语法**：
c
include <stdio.h> // 必须包含头文件

int scanf(const char *format, ...);

*   **`format`**：格式控制字符串，指定要读取的数据类型。
*   **`...`**：可变参数，必须是**变量的地址**（使用 `&` 取地址操作符，字符串数组名称本身即是地址）。

---

<!-- 第七页：scanf 格式符 -->
## scanf 常用格式控制符

| 说明符 | 用途                  | 示例                   |
| :----- | :-------------------- | :--------------------- |
| `%d`   | 读取有符号十进制整数    | `scanf("%d", &num);`     |
| `%f`   | 读取单精度浮点数        | `scanf("%f", &score);`   |
| `%lf`  | 读取双精度浮点数        | `scanf("%lf", &pi);`     |
| `%c`   | 读取单个字符            | `scanf("%c", &ch);`      |
| `%s`   | 读取字符串（遇空白停止）  | `scanf("%s", str);`      |

**注意**：除 `%s`（字符串存储在字符数组中）外，其他基本类型变量前**必须**加 `&`。

---

<!-- 第八页：scanf 示例 -->
## scanf 示例代码

c
include <stdio.h>

int main() {
    int num1, num2;
    double price;
    char ch;
    
    printf("Enter two integers and a double: ");
    scanf("%d %d %lf", &num1, &num2, &price);
    printf("You entered: %d, %d, %.2f\n", num1, num2, price);
    
    printf("Enter a character: ");
    scanf(" %c", &ch); // 注意%c前的空格，用于吸收换行符
    printf("You entered: %c\n", ch);
    
    return 0;
}


---

<!-- 第九页：注意事项 -->
## 3. 重要注意事项

1.  **`&` 运算符**：对于 `int`, `float`, `char` 等基本类型变量，**必须**使用 `&` 获取其地址。**错误示例**：`scanf("%d", num);` (会导致未定义行为)。
2.  **缓冲区残留**：读取字符 (`%c`) 前，若前面有输入，换行符 `\n` 可能被读入。**解决方法**：在 `%c` 前加一个空格，如 `" %c"`，以吸收所有空白字符。
3.  **`scanf` 的返回值**：返回成功读取的数据项个数。可用于检查输入是否正确。
    c
    if (scanf("%d %d", &a, &b) != 2) { 
        printf("Input error! Please enter two integers.\n");
        // 清理输入缓冲区等后续处理
    }


---

<!-- 第十页：总结 -->
## 4. 总结

*   **`printf`** 用于**输出**。格式控制符指定如何显示数据。变量直接作为参数传递。
*   **`scanf`** 用于**输入**。格式控制符指定如何解读输入的数据。**必须**传递变量的**地址**（使用 `&` 运算符）。
*   **核心原则**：格式控制字符串中的说明符必须与后续参数的类型严格匹配。始终注意输入缓冲区的问题，尤其是在混合输入时。

---

<!-- 第十一页：练习 -->
## 5. 练习

尝试编写一个程序，完成以下功能：
1.  提示用户输入姓名（字符串）、年龄（整数）和平均绩点（浮点数）。
2.  使用 `scanf` 读取这些输入。
3.  使用 `printf` 格式化输出一句介绍语，例如：
    "Hello, [姓名]! You are [年龄] years old and your GPA is [GPA]."

---

<!-- 最后一页 -->
# Q&A
## Thank You!


使用说明

1.  保存：将上述代码复制到一个以 .md 为后缀的文件中，例如 scanf_printf_slides.md。
2.  预览与转换：
    ◦   在 VS Code 中安装 Marp for VS Code 插件后，即可直接预览幻灯片效果，并支持导出为 PDF、PPTX、HTML 等格式。

    ◦   或者使用 Marp CLI 命令行工具进行转换（例如 marp scanf_printf_slides.md -o output.pdf）。

3.  主题修改：您可以通过修改文档开头的 theme: default 来切换主题，Marp 常用主题有 default, gaia, uncover。
4.  内容调整：您可以根据实际教学需要，随意增删或修改幻灯片中的内容。

希望这份幻灯片能对您的教学有所帮助！