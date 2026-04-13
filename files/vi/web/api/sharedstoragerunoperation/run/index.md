---
title: "SharedStorageRunOperation: phương thức run()"
short-title: run()
slug: Web/API/SharedStorageRunOperation/run
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.SharedStorageRunOperation.run
---

{{APIRef("Shared Storage API")}}{{deprecated_header}}

Phương thức **`run()`** của giao diện {{domxref("SharedStorageRunOperation")}} xác định cấu trúc mà phương thức `run()` được định nghĩa bên trong thao tác Run output gate phải tuân theo.

## Cú pháp

```js-nolint
run(data)
```

### Tham số

- `data`
  - : Đối tượng đại diện cho bất kỳ dữ liệu nào cần thiết để thực thi thao tác.

### Giá trị trả về

Một {{jsxref("Promise")}} được hoàn thành với `undefined`.

## Ví dụ

Xem trang chính {{domxref("SharedStorageRunOperation")}} để biết ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Shared Storage API](/en-US/docs/Web/API/Shared_Storage_API)
