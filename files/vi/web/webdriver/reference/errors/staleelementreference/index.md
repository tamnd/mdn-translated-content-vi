---
title: Tham chiếu phần tử đã cũ
slug: Web/WebDriver/Reference/Errors/StaleElementReference
page-type: webdriver-error
sidebar: webdriver
---

Lỗi **tham chiếu phần tử đã cũ** là một [lỗi WebDriver](/en-US/docs/Web/WebDriver/Reference/Errors) xảy ra vì [phần tử web](/en-US/docs/Web/WebDriver/Reference/WebElement) được tham chiếu không còn được gắn vào [DOM](/en-US/docs/Glossary/DOM).

Mỗi phần tử DOM được WebDriver biểu diễn bằng một tham chiếu định danh duy nhất, được gọi là một _[phần tử web](/en-US/docs/Web/WebDriver/Reference/WebElement)_.
Tham chiếu phần tử web là một {{Glossary("UUID")}} được dùng để thực thi các lệnh nhắm đến các phần tử cụ thể, chẳng hạn như [lấy tên thẻ của một phần tử](/en-US/docs/Web/WebDriver/Reference/Classic/Commands/GetElementTagName) và [truy xuất một thuộc tính](/en-US/docs/Web/WebDriver/Reference/Classic/Commands/GetElementProperty) từ phần tử đó.

Khi một phần tử không còn được gắn vào DOM, tức là nó đã bị xóa khỏi tài liệu hoặc tài liệu đã thay đổi, phần tử đó được xem là _cũ_. Ví dụ, tình trạng cũ xảy ra khi bạn có một tham chiếu phần tử web và tài liệu mà nó được lấy từ đó điều hướng sang trang khác.

## Ví dụ

### Điều hướng tài liệu

Khi điều hướng, mọi tham chiếu phần tử web tới tài liệu trước đó sẽ bị loại bỏ cùng với tài liệu. Điều này sẽ khiến mọi tương tác tiếp theo với [phần tử web](/en-US/docs/Web/WebDriver/Reference/WebElement) thất bại với lỗi tham chiếu phần tử đã cũ:

```python
import urllib

from selenium import webdriver
from selenium.common import exceptions

def inline(doc):
    return "data:text/html;charset=utf-8,{}".format(urllib.quote(doc))

session = webdriver.Firefox()
session.get(inline("<strong>foo</strong>"))
foo = session.find_element_by_css_selector("strong")

session.get(inline("<i>bar</i>"))
try:
    foo.tag_name
except exceptions.StaleElementReferenceException as e:
    print(e)
```

Kết quả:

```plain
StaleElementReferenceException: The element reference of e75a1764-ff73-40fa-93c1-08cb90394b65 is stale either the element is no longer attached to the DOM, it is not in the current frame context, or the document has been refreshed
```

### Xóa nút

Khi một nút tài liệu bị xóa khỏi DOM, tham chiếu phần tử web của nó sẽ bị vô hiệu hóa. Điều này cũng sẽ khiến mọi tương tác tiếp theo với [phần tử web](/en-US/docs/Web/WebDriver/Reference/WebElement) thất bại với lỗi tham chiếu phần tử đã cũ:

```python
import urllib

from selenium import webdriver
from selenium.common import exceptions

def inline(doc):
    return "data:text/html;charset=utf-8,{}".format(urllib.quote(doc))

session = webdriver.Firefox()
session.get(inline("<button>foo</button>"))
button = session.find_element_by_css_selector("button")
session.execute_script("""
    let [button] = arguments;
    button.remove();
    """, script_args=(button,))

try:
    button.click()
except exceptions.StaleElementReferenceException as e:
    print(e)
```

Kết quả:

```plain
StaleElementReferenceException: The element reference of e75a1764-ff73-40fa-93c1-08cb90394b65 is stale either the element is no longer attached to the DOM, it is not in the current frame context, or the document has been refreshed
```

## Xem thêm

- [WebElement](/en-US/docs/Web/WebDriver/Reference/WebElement)
- Các lệnh liên quan:
  - [Find Element](/en-US/docs/Web/WebDriver/Reference/Commands/FindElement)
  - [Find Elements](/en-US/docs/Web/WebDriver/Reference/Commands/FindElements)
  - [Find Element From Element](/en-US/docs/Web/WebDriver/Reference/Commands/FindElementFromElement)
  - [Find Elements From Element](/en-US/docs/Web/WebDriver/Reference/Commands/FindElementsFromElement)
