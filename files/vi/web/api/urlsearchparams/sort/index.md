---
title: "URLSearchParams: phương thức sort()"
short-title: sort()
slug: Web/API/URLSearchParams/sort
page-type: web-api-instance-method
browser-compat: api.URLSearchParams.sort
---

{{APIRef("URL API")}} {{AvailableInWorkers}}

Phương thức **`URLSearchParams.sort()`** sắp xếp tất cả các cặp khóa/giá trị có trong đối tượng này tại chỗ và trả về `undefined`. Các cặp khóa/giá trị được sắp xếp theo giá trị của {{glossary("UTF-16", "mã UTF-16")}} của các khóa. Phương thức này sử dụng thuật toán sắp xếp ổn định (tức là thứ tự tương đối giữa các cặp khóa/giá trị có cùng khóa sẽ được giữ nguyên).

## Cú pháp

```js-nolint
sort()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
// Tạo đối tượng URLSearchParams kiểm thử
const searchParams = new URLSearchParams("c=4&a=2&b=3&a=1");

// Sắp xếp các cặp khóa/giá trị
searchParams.sort();

// Hiển thị chuỗi truy vấn đã sắp xếp
console.log(searchParams.toString());
```

Kết quả là:

```plain
a=2&a=1&b=3&c=4
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
