---
title: Get Element Tag Name
slug: Web/WebDriver/Reference/Classic/Commands/GetElementTagName
page-type: webdriver-command
browser-compat: webdriver.classic.GetElementTagName
sidebar: webdriver
---

Lệnh _Get Element Tag Name_ của API [WebDriver](/en-US/docs/Web/WebDriver) trả về tên thẻ của [phần tử web](/en-US/docs/Web/WebDriver/Reference/WebElement) được tham chiếu. Ví dụ, nếu phần tử là một {{HTMLElement("img")}}, tên thẻ được trả về là `"IMG"`, tương đương với việc gọi {{domxref("Element.tagName")}} trên phần tử đó. Với tài liệu XML/XHTML, cách viết hoa có thể khác.

## Cú pháp

| Method | URI template                                      |
| ------ | ------------------------------------------------- |
| `GET`  | `/session/{session id}/element/{element id}/name` |

### Tham số URL

- `session id`
  - : Định danh của phiên.
- `element id`
  - : Định danh của [phần tử web](/en-US/docs/Web/WebDriver/Reference/WebElement) cần lấy tên thẻ.

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
search_box = driver.find_element_by_id("q")

print(search_box.tag_name)
```

Output:

```plain
INPUT
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
