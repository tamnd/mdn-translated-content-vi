---
title: "URLSearchParams: phương thức keys()"
short-title: keys()
slug: Web/API/URLSearchParams/keys
page-type: web-api-instance-method
browser-compat: api.URLSearchParams.keys
---

{{APIRef("URL API")}} {{AvailableInWorkers}}

Phương thức **`keys()`** của giao diện {{domxref("URLSearchParams")}} trả về một {{jsxref("Iteration_protocols",'iterator')}} cho phép lặp qua tất cả các khóa có trong đối tượng này. Các khóa là chuỗi.

## Cú pháp

```js-nolint
keys()
```

### Tham số

Không có.

### Giá trị trả về

Trả về một {{jsxref("Iteration_protocols","iterator")}}.

## Ví dụ

```js
// Tạo đối tượng URLSearchParams kiểm thử
const searchParams = new URLSearchParams("key1=value1&key2=value2");

// Hiển thị các khóa
for (const key of searchParams.keys()) {
  console.log(key);
}
```

Kết quả là:

```plain
key1
key2
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("URL")}}.
