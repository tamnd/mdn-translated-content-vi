---
title: Get Element Attribute
slug: Web/WebDriver/Reference/Classic/Commands/GetElementAttribute
page-type: webdriver-command
browser-compat: webdriver.classic.GetElementAttribute
sidebar: webdriver
---

Lệnh _Get Element Attribute_ của API [WebDriver](/en-US/docs/Web/WebDriver) trả về thuộc tính của [phần tử web](/en-US/docs/Web/WebDriver/Reference/WebElement) được tham chiếu. Ví dụ, nếu phần tử là một {{HTMLElement("img")}}, thuộc tính được trả về là `"//TODO"`, tương đương với việc gọi {{domxref("Element.getAttribute")}} trên phần tử đó. Với tài liệu XML/XHTML, cách viết hoa có thể khác.

## Cú pháp

| Method | URI template                                                  |
| ------ | ------------------------------------------------------------- |
| `GET`  | `/session/{session id}/element/{element id}/attribute/{name}` |

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
from selenium import webdriver

session = webdriver.Firefox()
session.get("https://google.com/?hl=en")
search_box = session.find_element_by_id("q")

print(search_box.get_attribute("id"))
```

Output:

```plain
q
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
