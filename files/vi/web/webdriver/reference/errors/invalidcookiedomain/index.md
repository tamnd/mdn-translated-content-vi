---
title: Miền cookie không hợp lệ
slug: Web/WebDriver/Reference/Errors/InvalidCookieDomain
page-type: webdriver-error
sidebar: webdriver
---

Lỗi **miền cookie không hợp lệ** là một [lỗi WebDriver](/en-US/docs/Web/WebDriver/Reference/Errors) xảy ra khi có một nỗ lực trái phép nhằm đặt một [cookie](/en-US/docs/Glossary/Cookie) dưới một [miền](/en-US/docs/Glossary/Domain) khác với miền của tài liệu hiện tại.

Trong WebDriver, không được phép đặt cookie cho các miền khác với miền của [ngữ cảnh duyệt web hiện tại](/en-US/docs/Glossary/Browsing_context)'s [tài liệu](/en-US/docs/Web/API/Document).

Lỗi này cũng sẽ xảy ra nếu tài liệu là _cookie-averse_, tức là tài liệu không được tải qua `http://`, `https://`, hoặc `ftp://`.

## Ví dụ

### Các miền khác

Nếu miền hiện tại là `example.com`, thì sẽ không thể [thêm cookie](/en-US/docs/Web/WebDriver/Reference/Commands/AddCookie) cho miền `example.org`:

```python
from selenium import webdriver
from selenium.common import exceptions

session = webdriver.Firefox()
session.get("https://example.com/")
try:
    cookie = {"name": "foo",
              "value": "bar",
              "domain": "example.org"}
    session.add_cookie(cookie)
except exceptions.InvalidCookieDomainException as e:
    print(e.message)
```

Kết quả:

```plain
InvalidCookieDomainException: https://example.org/
```

### Tài liệu cookie-averse

Lỗi này cũng có thể xảy ra khi bạn truy cập một tài liệu cookie-averse, chẳng hạn như một tệp trên ổ đĩa cục bộ:

```python
from selenium import webdriver
from selenium.common import exceptions

session = webdriver.Firefox()
session.get("file:///home/jdoe/document.html")
try:
    foo_cookie = {"name": "foo", "value": "bar"}
    session.add_cookie(foo_cookie)
except exceptions.InvalidCookieDomainException as e:
    print(e.message)
```

Kết quả:

```plain
InvalidCookieDomainException: Document is cookie-averse
```

## Xem thêm

- [Danh sách lỗi WebDriver](/en-US/docs/Web/WebDriver/Reference/Errors)
- Các lệnh WebDriver liên quan:
  - [Add Cookie](/en-US/docs/Web/WebDriver/Reference/Commands/AddCookie)
  - [Delete Cookie](/en-US/docs/Web/WebDriver/Reference/Commands/DeleteCookie)
  - [Delete All Cookies](/en-US/docs/Web/WebDriver/Reference/Commands/DeleteAllCookies)
  - [Get All Cookies](/en-US/docs/Web/WebDriver/Reference/Commands/GetAllCookies)
  - [Get Named Cookie](/en-US/docs/Web/WebDriver/Reference/Commands/GetNamedCookie)
