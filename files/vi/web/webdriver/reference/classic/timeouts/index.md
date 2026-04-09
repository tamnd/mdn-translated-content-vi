---
title: Thời gian chờ WebDriver classic
short-title: Thời gian chờ
slug: Web/WebDriver/Reference/Classic/Timeouts
page-type: reference
sidebar: webdriver
---

Liên quan đến một phiên [WebDriver](/en-US/docs/Web/WebDriver) là nhiều định nghĩa timeout kiểm soát hành vi cho [chèn script](#script), [điều hướng tài liệu](#pageload), và [truy xuất phần tử](#implicit).

Bạn sẽ thấy _[timeouts object](#payload)_ được dùng trong một vài ngữ cảnh khác nhau. Nó có thể được dùng làm cấu hình khi [tạo một phiên mới](/en-US/docs/Web/WebDriver/Reference/Commands/NewSession) thông qua [capabilities](/en-US/docs/Web/WebDriver/Reference/Capabilities), nó được trả về như một phần của các capability đã khớp và có hiệu lực sau khi phiên được tạo, và nó được dùng làm đầu vào và đầu ra cho các lệnh [Set Timeouts](/en-US/docs/Web/WebDriver/Reference/Classic/Commands/SetTimeouts) và [Get Timeouts](/en-US/docs/Web/WebDriver/Reference/Classic/Commands/GetTimeouts).

Giá trị mặc định có thể được ghi đè khi [tạo phiên](/en-US/docs/Web/WebDriver/Reference/Commands/NewSession) và sẽ có hiệu lực cho đến khi phiên bị đóng. Nếu bạn gọi [Set Timeouts](/en-US/docs/Web/WebDriver/Reference/Classic/Commands/SetTimeouts) trong vòng đời của phiên, các giá trị mặc định sẽ bị ghi đè và có hiệu lực trong toàn bộ thời gian tồn tại của phiên hoặc cho đến khi [Set Timeouts](/en-US/docs/Web/WebDriver/Reference/Classic/Commands/SetTimeouts) được gọi lại.

## Payload

**timeouts object** là một JSON Object mô tả giá trị timeout của phiên hiện tại, hoặc được dùng làm đầu vào khi cấu hình các timeout:

- `implicit`
  - : Thời gian tính bằng mili giây để thử lại [chiến lược định vị phần tử](/en-US/docs/Web/WebDriver/Reference/WebElement) khi tìm một phần tử. Mặc định là 0, nghĩa là chiến lược chỉ chạy một lần.
- `pageLoad`
  - : Thời gian tính bằng mili giây để chờ tài liệu tải xong. Mặc định WebDriver sẽ chờ năm phút (hoặc 300.000 ms).
- `script`
  - : Các script được chèn bằng [Execute Script](/en-US/docs/Web/WebDriver/Reference/Commands/ExecuteScript) hoặc [Execute Async Script](/en-US/docs/Web/WebDriver/Reference/Commands/ExecuteAsyncScript) sẽ chạy cho đến khi hết thời lượng timeout của script, cũng được tính bằng mili giây. Khi đó script sẽ bị ngắt và một [lỗi script timeout](/en-US/docs/Web/WebDriver/Reference/Errors/ScriptTimeoutError) sẽ được trả về. Mặc định là 30 giây (hoặc 30.000 ms).

Khi object này được dùng làm đầu vào cho lệnh [Set Timeouts](/en-US/docs/Web/WebDriver/Reference/Classic/Commands/SetTimeouts) hoặc là một phần của [timeouts capability](/en-US/docs/Web/WebDriver/Reference/Capabilities) khi [tạo một phiên mới](/en-US/docs/Web/WebDriver/Reference/Commands/NewSession), tất cả các trường đều là tùy chọn. Điều này có nghĩa là bạn có thể cấu hình riêng lẻ từ không đến nhiều giá trị thời lượng timeout, hoặc tất cả cùng lúc.

Khi nó được driver trả về, dù là bởi [Get Timeouts](/en-US/docs/Web/WebDriver/Reference/Classic/Commands/GetTimeouts) hay trong matched capabilities từ [việc tạo một phiên](/en-US/docs/Web/WebDriver/Reference/Commands/NewSession), tất cả các trường sẽ đều hiện diện.

## Ví dụ

### Đặt timeout khi tạo phiên

Bạn có thể ghi đè các timeout mặc định của phiên bằng cách cung cấp một [timeouts capabilities object](/en-US/docs/Web/WebDriver/Reference/Capabilities) khi bắt đầu một phiên WebDriver mới:

```python
import urllib

from selenium import webdriver

def inline(doc):
    return "data:text/html;charset=utf-8,{}".format(urllib.quote(doc))

session = webdriver.Firefox(capabilities={"timeouts": {"implicit": 4500}})
session.get(inline("""
    <h1>Example</h1>

    <script>
      // Inserts <p> below <h1> after 2.5 seconds:
      setTimeout(() => {
        const delayedElement = document.createElement("p");
        const h1 = document.querySelector("h1");
        document.body.insertAfter(delayedElement, h1);
      }, 2500);
    </script>
    """)

# This will cause the driver to wait 4.5 seconds
# for #foo to appear in the DOM:
delayed_element = session.find_element_by_tag_name("p")
```

### Đặt và lấy timeout trong lúc chạy

Timeout cũng có thể được đặt trong lúc chạy bằng lệnh Set Timeouts. Chúng sẽ ghi đè các timeout hiện tại của phiên và sẽ có hiệu lực trong toàn bộ thời gian tồn tại của phiên hoặc cho đến khi lệnh cùng tên được gọi lại:

```python
from selenium import webdriver

session = webdriver.Firefox()

session.set_timeouts({"implicit": 4.5})
print(session.get_timeouts)
```

Kết quả đầu ra sẽ tính bằng giây vì đây là đơn vị thời gian thường dùng trong Python:

```json
{ "implicit": 4.5, "script": 300, "pageLoad": 30000 }
```
