---
title: Hết thời gian chờ script
slug: Web/WebDriver/Reference/Errors/ScriptTimeout
page-type: webdriver-error
sidebar: webdriver
---

Lỗi **hết thời gian chờ script** là một [lỗi WebDriver](/en-US/docs/Web/WebDriver/Reference/Errors) xảy ra khi một script do người dùng cung cấp không hoàn tất trước khi thời lượng hết thời gian chờ script của phiên kết thúc.

Thời lượng hết thời gian chờ script là một khả năng có thể cấu hình, nghĩa là bạn có thể thay đổi khoảng thời gian trước khi driver ngắt một script được chèn. Theo mặc định, driver sẽ chờ 30 giây trước khi ngắt script và trả về lỗi hết thời gian chờ script, nhưng thời lượng này có thể được kéo dài, rút ngắn, hoặc đặt thành vô thời hạn.

Nếu thời lượng hết thời gian chờ script của phiên được đặt thành vô thời hạn bằng cách dùng giá trị `null`, bạn có nguy cơ đưa phiên vào trạng thái không thể khôi phục. Hãy lưu ý rằng điều này phải được dùng thận trọng.

## Ví dụ

Hãy xem script bất đồng bộ sau đây, script này sẽ giải quyết promise, hoặc gọi callback, sau khi đã trôi qua 35 giây:

```python
from selenium import webdriver
from selenium.common import exceptions

session = webdriver.Firefox()
try:
    session.execute_script("""
        let [resolve] = arguments;
        setTimeout(resolve, 35000);
        """)
except exceptions.ScriptTimeoutException as e:
    print(e.message)
```

Kết quả:

```plain
ScriptTimeoutException: Timed out after 35000 ms
```

Tuy nhiên, bạn có thể _kéo dài_ thời lượng chờ script mặc định của phiên bằng cách dùng capabilities nếu bạn có một script mà bạn dự đoán sẽ mất nhiều thời gian hơn:

```python
from selenium import webdriver
from selenium.common import exceptions

session = webdriver.Firefox(capabilities={"alwaysMatch": {"timeouts": {"script": 150000}}})
session.execute_script("""
    let [resolve] = arguments;
    setTimeout(resolve, 35000);
    """)
print("finished successfully")
```

Kết quả:

```plain
finished successfully
```

## Xem thêm

- [Danh sách lỗi WebDriver](/en-US/docs/Web/WebDriver/Reference/Errors)
- Các lệnh và kiểu liên quan:
  - [JavaScript error](/en-US/docs/Web/WebDriver/Reference/Errors/JavaScriptError)
  - [Execute Script](/en-US/docs/Web/WebDriver/Reference/Commands/ExecuteScript)
  - [Execute Async Script](/en-US/docs/Web/WebDriver/Reference/Commands/ExecuteAsyncScript)
