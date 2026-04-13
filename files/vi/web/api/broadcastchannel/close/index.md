---
title: "BroadcastChannel: phương thức close()"
short-title: close()
slug: Web/API/BroadcastChannel/close
page-type: web-api-instance-method
browser-compat: api.BroadcastChannel.close
---

{{APIRef("BroadCastChannel API")}} {{AvailableInWorkers}}

Phương thức **`close()`** của giao diện {{domxref("BroadcastChannel")}} chấm dứt kết nối tới kênh nền tảng tương ứng, cho phép đối tượng được bộ gom rác thu hồi.
Đây là một bước cần thiết vì trình duyệt không có cách nào khác để biết rằng kênh này không còn cần dùng nữa.

## Cú pháp

```js-nolint
close()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
// Kết nối tới một kênh
const bc = new BroadcastChannel("test_channel");

// Các thao tác khác (như postMessage, …)

// Khi hoàn tất, ngắt kết nối khỏi kênh
bc.close();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("BroadcastChannel")}}, giao diện mà phương thức này thuộc về.
