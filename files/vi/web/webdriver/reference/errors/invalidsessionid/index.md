---
title: ID phiên không hợp lệ
slug: Web/WebDriver/Reference/Errors/InvalidSessionID
page-type: webdriver-error
sidebar: webdriver
---

Lỗi **ID phiên không hợp lệ** là một [lỗi WebDriver](/en-US/docs/Web/WebDriver/Reference/Errors) xảy ra khi máy chủ không nhận ra mã định danh phiên duy nhất. Điều này xảy ra nếu [phiên đã bị xóa](/en-US/docs/Web/WebDriver/Reference/Commands/DeleteSession) hoặc nếu ID phiên không hợp lệ.

## Ví dụ

### Xóa phiên một cách tường minh

Một phiên WebDriver được xóa tường minh khi thoát:

```python
from selenium import webdriver
from selenium.common import exceptions

session = webdriver.Firefox()
print("Current session is {}".format(session.session_id))
session.quit()

try:
    session.get("https://mozilla.org")
except exceptions.InvalidSessionIdException as e:
    print(e.message)
```

Kết quả:

```plain
Current session is 46197c16-8373-469b-bc56-4c4d9e4132b4
No active session with ID 46197c16-8373-469b-bc56-4c4d9e4132b4
```

### Xóa phiên ngầm

Phiên cũng có thể bị _xóa ngầm_ nếu bạn đóng cửa sổ hoặc tab cuối cùng:

```python
from selenium import webdriver
from selenium.common import exceptions

session = webdriver.Firefox()
print("Current session is {}".format(session.session_id))

# đóng cửa sổ/tab hiện tại
session.close()

try:
    session.get("https://mozilla.org")
except exceptions.InvalidSessionIdException as e:
    print(e.message)
```

Kết quả:

```plain
Current session is 46197c16-8373-469b-bc56-4c4d9e4132b4
No active session with ID 46197c16-8373-469b-bc56-4c4d9e4132b4
```

## Xem thêm

- [Danh sách lỗi WebDriver](/en-US/docs/Web/WebDriver/Reference/Errors)
- [Phiên chưa được tạo](/en-US/docs/Web/WebDriver/Reference/Errors/SessionNotCreated)
- Các lệnh WebDriver liên quan:
  - [New Session](/en-US/docs/Web/WebDriver/Reference/Commands/NewSession)
  - [Delete Session](/en-US/docs/Web/WebDriver/Reference/Commands/DeleteSession)
