---
title: acceptInsecureCerts
slug: Web/WebDriver/Reference/Capabilities/acceptInsecureCerts
page-type: webdriver-capability
sidebar: webdriver
---

Capability **`acceptInsecureCerts`** cho biết liệu các [chứng chỉ TLS](/en-US/docs/Glossary/TLS) đã hết hạn hoặc không hợp lệ có được kiểm tra khi [điều hướng](/en-US/docs/Web/WebDriver/Reference/Commands/NavigateTo) hay không. Khi capability có giá trị false, một lỗi [insecure certificate](/en-US/docs/Web/WebDriver/Reference/Errors/InsecureCertificate) sẽ được trả về khi quá trình điều hướng gặp các domain có vấn đề về chứng chỉ. Ngược lại, các chứng chỉ tự ký hoặc không hợp lệ khác sẽ được trình duyệt ngầm tin cậy khi điều hướng. Capability này có hiệu lực trong suốt vòng đời của session.

## Ví dụ

Sử dụng capability `acceptInsecureCerts` bạn có thể bỏ qua, hoặc ngầm tin cậy, các chứng chỉ TLS mà dịch vụ chứng chỉ trong trình duyệt không tin cậy:

```python
from selenium import webdriver
from selenium.common import exceptions

session = webdriver.Firefox(capabilities={"acceptInsecureCerts": True})
session.get("https://self-signed.badssl.com/")
print(session.current_url)
```

Kết quả:

```url
https://self-signed.badssl.com/
```

## Xem thêm

- [Danh sách WebDriver capabilities](/en-US/docs/Web/WebDriver/Reference/Capabilities)
- Lệnh [Navigate To](/en-US/docs/Web/WebDriver/Reference/Commands/NavigateTo)
- Lệnh [New Session](/en-US/docs/Web/WebDriver/Reference/Commands/NewSession)
