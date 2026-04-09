---
title: Đối số không hợp lệ
slug: Web/WebDriver/Reference/Errors/InvalidArgument
page-type: webdriver-error
sidebar: webdriver
---

Lỗi **đối số không hợp lệ** là một [lỗi WebDriver](/en-US/docs/Web/WebDriver/Reference/Errors) xảy ra khi các đối số được truyền cho một [lệnh](/en-US/docs/Web/WebDriver/Reference/Classic/Commands) không hợp lệ hoặc bị định dạng sai.

Lỗi đối số không hợp lệ có thể được so sánh với [`TypeError`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypeError) trong [JavaScript](/en-US/docs/Web/JavaScript), vì chúng có thể xảy ra với rất nhiều API khi giá trị đầu vào không đúng kiểu mong đợi hoặc bị định dạng sai theo một cách nào đó. Xem các ràng buộc về kiểu và giới hạn cho từng [lệnh WebDriver](/en-US/docs/Web/WebDriver/Reference/Classic/Commands).

## Ví dụ

Ví dụ, không thể đặt kích thước cửa sổ thành một giá trị âm:

```python
from selenium import webdriver
from selenium.common import exceptions

session = webdriver.Firefox()
try:
    session.set_window_size(-100, 0)
except exceptions.InvalidArgumentException as e:
    print(e.message)
```

Kết quả:

```plain
InvalidArgumentException: Expected -100 to be >= 0
```

## Xem thêm

- [Danh sách lỗi WebDriver](/en-US/docs/Web/WebDriver/Reference/Errors)
- [Danh sách lệnh WebDriver](/en-US/docs/Web/WebDriver/Reference/Classic/Commands)
