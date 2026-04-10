---
title: "URLSearchParams: phương thức delete() method"
short-title: delete()
slug: Web/API/URLSearchParams/delete
page-type: web-api-instance-method
browser-compat: api.URLSearchParams.delete
---

{{ApiRef("URL API")}} {{AvailableInWorkers}}

Phương thức **`delete()`** của giao diện {{domxref("URLSearchParams")}} xóa các tham số được chỉ định và (các) giá trị liên kết của chúng khỏi danh sách tất cả các tham số truy vấn.

Một tên tham số và giá trị tùy chọn được dùng để khớp các tham số.
Nếu chỉ tên tham số được chỉ định, thì tất cả các tham số truy vấn khớp với tên đó sẽ bị xóa cùng với các giá trị liên kết của chúng.
Nếu cả tên tham số và giá trị đều được chỉ định, thì tất cả các tham số truy vấn khớp với cả tên và giá trị sẽ bị xóa.

## Cú pháp

```js-nolint
delete(name)
delete(name, value)
```

### Tham số

- `name`
  - : Tên của các tham số cần xóa.
- `value` {{optional_inline}}
  - : Giá trị mà các tham số phải khớp, cùng với tên đã cho, để bị xóa.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Xóa tất cả các tham số có tên đã chỉ định

Ví dụ này cho thấy cách xóa tất cả các tham số truy vấn (và giá trị) có một tên cụ thể.

```js
const url = new URL("https://example.com?foo=1&bar=2&foo=3");
const params = new URLSearchParams(url.search);
console.log(`Chuỗi truy vấn (trước):\t ${params}`);
params.delete("foo");
console.log(`Chuỗi truy vấn (sau):\t ${params}`);
```

Kết quả log bên dưới cho thấy tất cả các tham số có tên là `foo` đều bị xóa.

```plain
Chuỗi truy vấn (trước):  foo=1&bar=2&foo=3
Chuỗi truy vấn (sau):   bar=2
```

### Xóa các tham số có tên và giá trị đã chỉ định

Ví dụ này cho thấy cách xóa các tham số truy vấn khớp với một tên và giá trị cụ thể.

```js
const url = new URL("https://example.com?foo=1&bar=2&foo=3&foo=1");
const params = new URLSearchParams(url.search);
console.log(`Chuỗi truy vấn (trước):\t ${params}`);
params.delete("foo", "1");
console.log(`Chuỗi truy vấn (sau):\t ${params}`);
```

Tất cả các tham số khớp với cả `name` và `value` sẽ bị xóa (không có lý do gì để chỉ định hai tham số có cùng tên và giá trị như ví dụ trên).

```plain
Chuỗi truy vấn (trước):  foo=1&bar=2&foo=3&foo=1
Chuỗi truy vấn (sau):   bar=2&foo=3
```

Nếu trình duyệt của bạn hỗ trợ tùy chọn `value`, chuỗi "sau" sẽ là `bar=2&foo=3`.
Ngược lại, kết quả sẽ giống như ví dụ trước (`bar=2`).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `URLSearchParams` trong `core-js`](https://github.com/zloirock/core-js#url-and-urlsearchparams)
