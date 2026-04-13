---
title: "SharedStorageSelectURLOperation: phương thức run()"
short-title: run()
slug: Web/API/SharedStorageSelectURLOperation/run
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.SharedStorageSelectURLOperation.run
---

{{APIRef("Shared Storage API")}}{{deprecated_header}}

Phương thức **`run()`** của giao diện {{domxref("SharedStorageSelectURLOperation")}} xác định cấu trúc mà phương thức `run()` được định nghĩa bên trong thao tác URL Selection output gate phải tuân theo.

## Cú pháp

```js-nolint
run(urls, data)
```

### Tham số

- `urls`
  - : Mảng các đối tượng đại diện cho các URL được chọn bởi thao tác URL Selection. Mỗi đối tượng chứa hai thuộc tính:
    - `url`
      - : Chuỗi đại diện cho URL.
    - `reportingMetadata` {{optional_inline}}
      - : Đối tượng chứa các thuộc tính trong đó tên là các loại sự kiện và giá trị là các URL trỏ đến đích báo cáo.
- `data`
  - : Đối tượng đại diện cho bất kỳ dữ liệu nào cần thiết để thực thi thao tác.

### Giá trị trả về

Một {{jsxref("Promise")}} được hoàn thành với một số xác định chỉ số mảng của URL được chọn bởi thao tác.

## Ví dụ

Xem trang chính {{domxref("SharedStorageSelectURLOperation")}} để biết ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Shared Storage API](/en-US/docs/Web/API/Shared_Storage_API)
