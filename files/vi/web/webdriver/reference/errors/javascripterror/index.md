---
title: Lỗi JavaScript
slug: Web/WebDriver/Reference/Errors/JavaScriptError
page-type: webdriver-error
sidebar: webdriver
---

Lỗi **JavaScript** là một [lỗi WebDriver](/en-US/docs/Web/WebDriver/Reference/Errors) xảy ra khi một script do người dùng cung cấp không thể thực thi.

Nguyên nhân cơ bản của lỗi thực thi thường được cung cấp trong thông báo lỗi, cùng với stacktrace do công cụ JavaScript trong trình duyệt cung cấp.

## Ví dụ

Hãy xem script được chèn sau đây, script này cố gắng sử dụng một biến chưa được định nghĩa. Trong JavaScript, điều này thường khiến một lỗi `ReferenceError` được ném ra. WebDriver bắt lỗi này và tuần tự hóa nó thành một lỗi JavaScript:

```python
from selenium import webdriver
from selenium.common import exceptions

session = webdriver.Firefox()
try:
    session.execute_script("return foo")
except exceptions.JavascriptException as e:
    print(e.message)
```

Kết quả:

```plain
JavascriptException: ReferenceError: foo is not defined
```

## Xem thêm

- [Danh sách lỗi WebDriver](/en-US/docs/Web/WebDriver/Reference/Errors)
- Các lệnh liên quan:
  - [Execute Script](/en-US/docs/Web/WebDriver/Reference/Commands/ExecuteScript)
  - [Execute Async Script](/en-US/docs/Web/WebDriver/Reference/Commands/ExecuteAsyncScript)
