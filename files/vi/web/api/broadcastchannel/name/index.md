---
title: "BroadcastChannel: thuộc tính name"
short-title: name
slug: Web/API/BroadcastChannel/name
page-type: web-api-instance-property
browser-compat: api.BroadcastChannel.name
---

{{APIRef("BroadCastChannel API")}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`name`** của giao diện {{domxref("BroadcastChannel")}} trả về một chuỗi dùng để nhận diện duy nhất kênh đã cho bằng tên của nó. Tên này được truyền vào hàm tạo {{domxref("BroadcastChannel.BroadcastChannel", "BroadcastChannel()")}} khi tạo đối tượng, vì vậy đây là thuộc tính chỉ đọc.

## Giá trị

Một chuỗi.

## Ví dụ

```js
// Kết nối tới một kênh
const bc = new BroadcastChannel("test_channel");

// Các thao tác khác (như postMessage, …)

// Ghi tên kênh ra console
console.log(bc.name); // "test_channel"

// Khi hoàn tất, ngắt kết nối khỏi kênh
bc.close();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("BroadcastChannel")}}, giao diện mà thuộc tính này thuộc về.
