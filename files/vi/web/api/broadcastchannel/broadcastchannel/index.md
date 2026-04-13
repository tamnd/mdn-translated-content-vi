---
title: "BroadcastChannel: hàm tạo BroadcastChannel()"
short-title: BroadcastChannel()
slug: Web/API/BroadcastChannel/BroadcastChannel
page-type: web-api-constructor
browser-compat: api.BroadcastChannel.BroadcastChannel
---

{{APIRef("BroadCastChannel API")}} {{AvailableInWorkers}}

Hàm tạo **`BroadcastChannel()`** tạo một {{domxref("BroadcastChannel")}} mới và kết nối nó với kênh nền tảng tương ứng.

## Cú pháp

```js-nolint
new BroadcastChannel(channelName)
```

### Tham số

- `channelName`
  - : Một chuỗi biểu diễn tên của kênh; chỉ có một kênh duy nhất mang tên này cho mọi {{glossary("browsing context", "browsing contexts")}} có cùng {{glossary("origin")}}.

## Ví dụ

```js
// tạo một kênh mới lắng nghe kênh "internal_notification".

const bc = new BroadcastChannel("internal_notification");
bc.postMessage("New listening connected!");
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("BroadcastChannel")}}, giao diện mà hàm tạo này thuộc về.
