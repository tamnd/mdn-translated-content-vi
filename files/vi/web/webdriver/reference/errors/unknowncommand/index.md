---
title: Lệnh không xác định
slug: Web/WebDriver/Reference/Errors/UnknownCommand
page-type: webdriver-error
sidebar: webdriver
---

Lỗi **lệnh không xác định** là một [lỗi WebDriver](/en-US/docs/Web/WebDriver/Reference/Errors) xảy ra khi driver không nhận ra lệnh/điểm cuối HTTP.

## Ví dụ

Điểm cuối `/session/{session id}/foo` không tồn tại, và sẽ trả về lỗi lệnh không xác định cùng với mã trạng thái HTTP [`404 Not Found`](/en-US/docs/Web/HTTP/Reference/Status/404):

```bash
curl -i -d '{}' http://localhost:4444/session/foo
```

```http
HTTP/1.1 404 Not Found
Connection: close
Content-Type: application/json; charset=utf-8
Cache-Control: no-cache
Content-Length: 113
Date: Fri, 30 Mar 2018 15:30:51 GMT

{"value":{"error":"unknown command","message":"POST /session/asd did not match a known command","stacktrace":""}}
```

## Xem thêm

- [Danh sách lỗi WebDriver](/en-US/docs/Web/WebDriver/Reference/Errors)
- [Danh sách lệnh WebDriver](/en-US/docs/Web/WebDriver/Reference/Classic/Commands)
