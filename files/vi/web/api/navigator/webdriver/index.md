---
title: "Navigator: thuộc tính webdriver"
short-title: webdriver
slug: Web/API/Navigator/webdriver
page-type: web-api-instance-property
browser-compat: api.Navigator.webdriver
---

{{APIRef("WebDriver")}}

Thuộc tính chỉ đọc **`webdriver`**
của giao diện {{domxref("navigator")}} cho biết liệu tác nhân người dùng có
được điều khiển bằng tự động hóa.

Nó xác định một cách tiêu chuẩn để các tác nhân người dùng hợp tác thông báo cho tài liệu rằng nó
được điều khiển bởi [WebDriver](/en-US/docs/Web/WebDriver), chẳng hạn, do đó
đường dẫn mã thay thế có thể được kích hoạt trong quá trình tự động hóa.

Thuộc tính `navigator.webdriver` là đúng khi ở:

- Chrome
  - : Cờ `--enable-automation` hoặc `--headless` được sử dụng hoặc cờ
    Cờ `--remote-debugging-port` chỉ định cổng 0 được sử dụng.
- Firefox
  - : Tùy chọn `marionette.enabled` hoặc cờ `--marionette` là
    đã qua.

## Giá trị

{{JSxRef("Boolean")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}
