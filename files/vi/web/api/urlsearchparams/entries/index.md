---
title: "URLSearchParams: phương thức entries()"
short-title: entries()
slug: Web/API/URLSearchParams/entries
page-type: web-api-instance-method
browser-compat: api.URLSearchParams.entries
---

{{APIRef("URL API")}} {{AvailableInWorkers}}

Phương thức **`entries()`** của giao diện {{domxref("URLSearchParams")}} trả về một {{jsxref("Iteration_protocols",'iterator')}} cho phép lặp qua tất cả các cặp khóa/giá trị có trong đối tượng này. Iterator trả về các cặp khóa/giá trị theo đúng thứ tự chúng xuất hiện trong chuỗi truy vấn. Khóa và giá trị của mỗi cặp đều là chuỗi.

## Cú pháp

```js-nolint
entries()
```

### Tham số

Không có.

### Giá trị trả về

Trả về một {{jsxref("Iteration_protocols","iterator")}}.

## Ví dụ

```js
// Tạo đối tượng URLSearchParams kiểm thử
const searchParams = new URLSearchParams("key1=value1&key2=value2");

// Hiển thị các cặp khóa/giá trị
for (const [key, value] of searchParams.entries()) {
  console.log(`${key}, ${value}`);
}
```

Kết quả là:

```plain
key1, value1
key2, value2
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("URL")}}.
