---
title: Get Element Property
slug: Web/WebDriver/Reference/Classic/Commands/GetElementProperty
page-type: webdriver-command
browser-compat: webdriver.classic.GetElementProperty
sidebar: webdriver
---

Lệnh _Get Element Property_ của API [WebDriver](/en-US/docs/Web/WebDriver) trả về thuộc tính của [phần tử web](/en-US/docs/Web/WebDriver/Reference/WebElement) được tham chiếu. Với `<input value=foo>` khi người dùng đổi giá trị thành `bar`, thuộc tính được trả về sẽ là `bar` thay vì giá trị ban đầu `foo`. Điều này tương đương với việc truy cập thuộc tính trên phần tử.

## Cú pháp

| Method | URI template                                                 |
| ------ | ------------------------------------------------------------ |
| `GET`  | `/session/{session id}/element/{element id}/property/{name}` |

### Tham số URL

- `session id`
  - : Định danh của phiên.
- `element id`
  - : Định danh của [phần tử web](/en-US/docs/Web/WebDriver/Reference/WebElement) cần lấy tên thẻ.
- `name`
  - : Định danh của thuộc tính của [phần tử web](/en-US/docs/Web/WebDriver/Reference/WebElement) cần lấy.

### Lỗi

- [Session not created](/en-US/docs/Web/WebDriver/Reference/Errors/SessionNotCreated)
  - : Phiên không tồn tại.
- [No such window](/en-US/docs/Web/WebDriver/Reference/Errors/NoSuchWindow)
  - : Đối tượng [`window`](/en-US/docs/Web/API/Window) đã bị loại bỏ, cho biết tab hoặc cửa sổ đã bị đóng.
- [Unexpected alert open](/en-US/docs/Web/WebDriver/Reference/Errors/UnexpectedAlertOpen)
  - : Một lời nhắc của người dùng, chẳng hạn như [`window.alert`](/en-US/docs/Web/API/Window/alert), chặn việc thực thi lệnh cho đến khi nó được xử lý.

## Ví dụ

Python:

```python
import urllib

from selenium import webdriver

def inline(doc):
    return "data:text/html;charset=utf-8,{}".format(urllib.quote(doc))

session = webdriver.Firefox()
session.get(inline("<input value=foo>"))
textbox = driver.find_element_by_tag_name("input")
textbox.send_keys("bar")

print(text_box.get_attribute("value"))
print(text_box.get_property("value"))
```

Output:

```plain
foo
bar
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Get Element Attribute](/en-US/docs/Web/WebDriver/Reference/Classic/Commands/GetElementAttribute) command
- _[What is the difference between properties and attributes?](https://stackoverflow.com/questions/6003819/what-is-the-difference-between-properties-and-attributes-in-html)_ trên Stack Overflow
