---
title: "URLSearchParams: phương thức values()"
short-title: values()
slug: Web/API/URLSearchParams/values
page-type: web-api-instance-method
browser-compat: api.URLSearchParams.values
---

{{APIRef("URL API")}} {{AvailableInWorkers}}

Phương thức **`values()`** của giao diện {{domxref("URLSearchParams")}} trả về một {{jsxref("Iteration_protocols",'iterator')}} cho phép lặp qua tất cả các giá trị có trong đối tượng này. Các giá trị là chuỗi.

## Cú pháp

```js-nolint
values()
```

### Tham số

Không có.

### Giá trị trả về

Trả về một {{jsxref("Iteration_protocols","iterator")}}.

## Ví dụ

Ví dụ sau truyền một chuỗi truy vấn URL vào constructor `URLSearchParams`, sau đó dùng iterator do `values()` trả về để in các giá trị ra console.

```js
const searchParams = new URLSearchParams("key1=value1&key2=value2");

for (const value of searchParams.values()) {
  console.log(value);
}
```

Kết quả là:

```plain
value1
value2
```

Ví dụ này làm gần như tương tự như trên, nhưng trước tiên ép iterator thành một mảng.

```js
const searchParams = new URLSearchParams("key1=value1&key2=value2");

console.log(Array.from(searchParams.values()));
```

Kết quả là:

```plain
['value1', 'value2']
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("URL")}}.
