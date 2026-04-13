---
title: Console API
slug: Web/API/Console_API
page-type: web-api-overview
browser-compat: api.console
---

{{DefaultAPISidebar("Console API")}} {{AvailableInWorkers}}

Console API cung cấp các chức năng giúp nhà phát triển thực hiện các tác vụ gỡ lỗi, chẳng hạn như ghi log thông báo hoặc giá trị của biến tại những điểm xác định trong mã, hoặc đo thời gian để một thao tác hoàn tất.

## Khái niệm và cách dùng

Console API ban đầu chủ yếu là một API độc quyền, với việc các trình duyệt khác nhau tự triển khai nó, dù theo những cách không nhất quán. [Đặc tả Console API](https://console.spec.whatwg.org/) được tạo ra để định nghĩa hành vi nhất quán, và cuối cùng tất cả trình duyệt hiện đại đều đã thống nhất triển khai hành vi này, dù một số cách triển khai vẫn có thêm các hàm độc quyền riêng. Tìm hiểu thêm tại:

- [Cách triển khai của Google Chrome DevTools](https://developer.chrome.com/docs/devtools/console/api/)
- [Cách triển khai của Safari DevTools](https://webkit.org/web-inspector/console-object-api/)

Cách dùng rất đơn giản: đối tượng {{domxref("console")}} chứa nhiều phương thức mà bạn có thể gọi để thực hiện các tác vụ gỡ lỗi cơ bản, nhìn chung tập trung vào việc ghi lại nhiều giá trị khác nhau vào [Web Console](https://firefox-source-docs.mozilla.org/devtools-user/web_console/index.html) của trình duyệt.

Cho đến nay, phương thức được dùng phổ biến nhất là {{domxref("console/log_static", "console.log()")}}, được dùng để ghi log giá trị hiện tại chứa trong một biến cụ thể.

## Giao diện

- {{domxref("console")}}
  - : Cung cấp các chức năng gỡ lỗi cơ bản, bao gồm ghi log, dấu vết ngăn xếp, bộ định thời và bộ đếm.

## Ví dụ

```js
let myString = "Hello world";

// Xuất "Hello world" ra console
console.log(myString);
```

Xem trang tham chiếu [console](/en-US/docs/Web/API/console) để biết thêm ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Tools](https://firefox-source-docs.mozilla.org/devtools-user/index.html)
- [Web Console](https://firefox-source-docs.mozilla.org/devtools-user/web_console/index.html) — cách Web Console trong Firefox xử lý các lời gọi console API
- [about:debugging](https://firefox-source-docs.mozilla.org/devtools-user/about_colon_debugging/index.html) — cách xem đầu ra console khi mục tiêu gỡ lỗi là một thiết bị di động
