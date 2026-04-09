---
title: Phương thức không xác định
slug: Web/WebDriver/Reference/Errors/UnknownMethod
page-type: webdriver-error
sidebar: webdriver
---

Lỗi **phương thức không xác định** là một [lỗi WebDriver](/en-US/docs/Web/WebDriver/Reference/Errors) xảy ra khi driver không nhận ra [phương thức yêu cầu HTTP](/en-US/docs/Web/HTTP/Reference/Methods) được dùng cho điểm cuối.

WebDriver cung cấp một API phần lớn theo kiểu REST, và không phải tất cả các điểm cuối trong API này đều có các phương thức `GET`, `POST`, và `DELETE`. Lỗi này xảy ra khi bạn cố gọi một điểm cuối bằng một phương thức yêu cầu HTTP mà nó không hỗ trợ.

## Ví dụ

Lệnh New Session cung cấp một điểm cuối yêu cầu `POST` cho phép bạn tạo các phiên WebDriver mới:

```bash
% curl -d '{}' http://localhost:4444/session
{"sessionId":"d4605710-5a4e-4d64-a52a-778bb0c31e00","value":{"XULappId":"{ec8030f7-c20a-464f-9b0e-13a3a9e97384}","acceptSslCerts":false,"appBuildId":"20160913030425","browserName":"firefox","browserVersion":"51.0a1","command_id":1,"platform":"LINUX","platformName":"linux","platformVersion":"4.9.0-1-amd64","processId":17474,"proxy":{},"raisesAccessibilityExceptions":false,"rotatable":false,"specificationLevel":0,"takesElementScreenshot":true,"takesScreenshot":true,"version":"51.0a1"}}
```

Nó cũng triển khai phương thức `DELETE` để kết thúc một phiên:

```bash
% curl -X DELETE http://localhost:4444/session/d4605710-5a4e-4d64-a52a-778bb0c31e00
{}
```

Nhưng ví dụ, nó không cung cấp phương thức `GET`, và do đó yêu cầu này sẽ trả về lỗi phương thức không xác định:

```bash
% curl http://localhost:4444/session/650f9df3-740e-314c-958d-307e41752fae
{"value":{"error":"unknown command","message":"GET /session/650f9df3-740e-314c-958d-307e41752fae did not match a known command","stacktrace":""}}%
```

## Xem thêm

- [Danh sách lỗi WebDriver](/en-US/docs/Web/WebDriver/Reference/Errors)
- [Danh sách lệnh WebDriver](/en-US/docs/Web/WebDriver/Reference/Classic/Commands)
