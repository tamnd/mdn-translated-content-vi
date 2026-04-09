---
title: "Blob: phương thức bytes()"
short-title: bytes()
slug: Web/API/Blob/bytes
page-type: web-api-instance-method
browser-compat: api.Blob.bytes
---

{{APIRef("File API")}}{{AvailableInWorkers}}

Phương thức **`bytes()`** của giao diện {{domxref("Blob")}} trả về một {{jsxref("Promise")}} được resolve với một {{jsxref("Uint8Array")}} chứa nội dung của blob dưới dạng một mảng byte.

## Cú pháp

```js-nolint
bytes()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} được hoàn thành với một đối tượng {{jsxref("Uint8Array")}} chứa dữ liệu của blob.

### Ngoại lệ

Phương thức sẽ reject {{jsxref("Promise")}} trả về nếu, chẳng hạn, bộ đọc dùng để lấy dữ liệu blob ném ra ngoại lệ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
