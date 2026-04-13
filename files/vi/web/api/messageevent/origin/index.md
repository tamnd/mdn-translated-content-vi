---
title: "MessageEvent: thuộc tính origin"
short-title: origin
slug: Web/API/MessageEvent/origin
page-type: web-api-instance-property
browser-compat: api.MessageEvent.origin
---

{{APIRef("HTML DOM")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`origin`** của giao diện {{domxref("MessageEvent")}} là một chuỗi đại diện cho nguồn gốc của người phát thông điệp.

## Giá trị

Một chuỗi đại diện cho nguồn gốc.

## Ví dụ

```js
myWorker.onmessage = (e) => {
  result.textContent = e.data;
  console.log("Message received from worker");
  console.log(e.origin);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("ExtendableMessageEvent")}} — tương tự giao diện này nhưng được sử dụng trong các giao diện cần cung cấp thêm tính linh hoạt cho các tác giả.
