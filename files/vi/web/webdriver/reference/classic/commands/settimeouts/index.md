---
title: Set Timeouts
slug: Web/WebDriver/Reference/Classic/Commands/SetTimeouts
page-type: webdriver-command
browser-compat: webdriver.classic.SetTimeouts
sidebar: webdriver
---

Lệnh _Set Timeouts_ của API [WebDriver](/en-US/docs/Web/WebDriver) đặt các timeout gắn với phiên hiện tại. Các khoảng [session timeout](/en-US/docs/Web/WebDriver/Reference/Classic/Timeouts) kiểm soát những hành vi như timeout cho [script injection](/en-US/docs/Web/WebDriver/Reference/Classic/Timeouts#script), [document navigation](/en-US/docs/Web/WebDriver/Reference/Classic/Timeouts#pageload), và [element retrieval](/en-US/docs/Web/WebDriver/Reference/Classic/Timeouts#implicit).

## Cú pháp

| Method                                               | URI template                     |
| ---------------------------------------------------- | -------------------------------- |
| [`POST`](/en-US/docs/Web/HTTP/Reference/Methods/GET) | `/session/{session id}/timeouts` |

### Tham số URL

- `session id`
  - : Định danh của phiên.

### Dữ liệu gửi lên

Dữ liệu đầu vào là một đối tượng [`Timeouts`](/en-US/docs/Web/WebDriver/Reference/Classic/Timeouts):

- `implicit`
  - : Thời gian tính bằng mili giây để thử lại [element location strategy](/en-US/docs/Web/WebDriver/Reference/WebElement) khi tìm phần tử. Mặc định là 0, nghĩa là chiến lược chỉ được chạy một lần.
- `pageLoad`
  - : Thời gian tính bằng mili giây để đợi tài liệu tải xong. Theo mặc định, WebDriver sẽ đợi năm phút (hoặc 300.000 ms).
- `script`
  - : Các script được chèn bằng [Execute Script](/en-US/docs/Web/WebDriver/Reference/Commands/ExecuteScript) hoặc [Execute Async Script](/en-US/docs/Web/WebDriver/Reference/Commands/ExecuteAsyncScript) sẽ chạy cho đến khi chạm đến thời lượng script timeout, cũng được tính bằng mili giây. Sau đó script sẽ bị ngắt và một [script timeout error](/en-US/docs/Web/WebDriver/Reference/Errors/ScriptTimeoutError) sẽ được trả về. Mặc định là 30 giây (hoặc 30.000 ms).

### Lỗi

- [Invalid session ID](/en-US/docs/Web/WebDriver/Reference/Errors/InvalidSessionID)
  - : Phiên không tồn tại.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Đối tượng [`Timeouts`](/en-US/docs/Web/WebDriver/Reference/Classic/Timeouts)
- [List of WebDriver commands](/en-US/docs/Web/WebDriver/Reference/Classic/Commands)
