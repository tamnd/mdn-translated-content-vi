---
title: Chứng chỉ không an toàn
slug: Web/WebDriver/Reference/Errors/InsecureCertificate
page-type: webdriver-error
sidebar: webdriver
---

Lỗi **chứng chỉ không an toàn** là một [lỗi WebDriver](/en-US/docs/Web/WebDriver/Reference/Errors) xảy ra khi trình duyệt được điều khiển từ xa gặp bất kỳ cảnh báo chứng chỉ nào. Điều này thường là kết quả của việc [điều hướng](/en-US/docs/Web/WebDriver/Reference/Commands/NavigateTo) tới một trang web có [TLS certificate](/en-US/docs/Glossary/TLS) đã hết hạn hoặc không hợp lệ. Ví dụ về chứng chỉ không hợp lệ gồm chứng chỉ tự ký, bị thu hồi, và chứng chỉ không an toàn về mặt mật mã.

Trình duyệt web ngăn chặn và chặn lưu lượng tới các miền có chứng chỉ bị lỗi vì việc giao tiếp với máy chủ sẽ bị ảnh hưởng. Chúng tôi đặc biệt khuyến nghị sửa tình trạng chứng chỉ thay vì vô hiệu hóa kiểm tra chứng chỉ, ngay cả trong môi trường thử nghiệm.

WebDriver có cung cấp capability [`acceptInsecureCerts`](/en-US/docs/Web/WebDriver/Reference/Capabilities/acceptInsecureCerts) để vô hiệu hóa kiểm tra chứng chỉ trong suốt thời gian phiên, nhưng cần nhấn mạnh rằng việc sử dụng capability này rất không được khuyến khích và nhìn chung được xem là một điểm yếu của môi trường thử nghiệm.

## Ví dụ

Đây là điều sẽ xảy ra khi điều hướng tới một miền có chứng chỉ TLS tự ký bằng client Python:

```python
from selenium import webdriver
from selenium.common import exceptions

session = webdriver.Firefox()
try:
    session.get("https://self-signed.badssl.com/")
except exceptions.InsecureCertificateException as e:
    print("Hit insecure cert on {}".format(session.current_url))
```

Kết quả:

```plain
Hit an insecure cert on https://self-signed.badssl.com/
```

## Xem thêm

- Lệnh [Navigate To](/en-US/docs/Web/WebDriver/Reference/Commands/NavigateTo)
- [Capabilities](/en-US/docs/Web/WebDriver/Reference/Capabilities)
- [badssl.com](https://badssl.com/)
