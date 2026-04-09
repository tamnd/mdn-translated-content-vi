---
title: "AbortSignal: thuộc tính aborted"
short-title: aborted
slug: Web/API/AbortSignal/aborted
page-type: web-api-instance-property
browser-compat: api.AbortSignal.aborted
---

{{APIRef("DOM")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`aborted`** trả về một giá trị cho biết liệu các thao tác bất đồng bộ mà tín hiệu đang giao tiếp có bị hủy (`true`) hay không (`false`).

## Giá trị

`true` (đã hủy) hoặc `false`

## Ví dụ

Trong đoạn mã sau, chúng ta tạo một đối tượng `AbortController` mới và lấy {{domxref("AbortSignal")}} của nó, có sẵn thông qua thuộc tính `signal`. Về sau, dùng thuộc tính `aborted`, chúng ta kiểm tra xem tín hiệu đã bị hủy hay chưa và ghi thông tin thích hợp ra console.

```js
const controller = new AbortController();
const signal = controller.signal;

// …

if (signal.aborted) {
  console.log("Request has been aborted");
} else {
  console.log("Request not aborted");
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Fetch API](/en-US/docs/Web/API/Fetch_API)
