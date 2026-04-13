---
title: "MessageEvent: thuộc tính data"
short-title: data
slug: Web/API/MessageEvent/data
page-type: web-api-instance-property
browser-compat: api.MessageEvent.data
---

{{APIRef("HTML DOM")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`data`** của giao diện {{domxref("MessageEvent")}} đại diện cho dữ liệu được gửi bởi người phát thông điệp.

## Giá trị

Dữ liệu được gửi bởi người phát thông điệp; có thể là bất kỳ kiểu dữ liệu nào, tùy thuộc vào nguồn gốc của sự kiện này.

## Ví dụ

```js
myWorker.onmessage = (e) => {
  result.textContent = e.data;
  console.log("Message received from worker");
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("ExtendableMessageEvent")}} — tương tự giao diện này nhưng được sử dụng trong các giao diện cần cung cấp thêm tính linh hoạt cho các tác giả.
