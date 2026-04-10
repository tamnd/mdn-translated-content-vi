---
title: "URLSearchParams: phương thức has()"
short-title: has()
slug: Web/API/URLSearchParams/has
page-type: web-api-instance-method
browser-compat: api.URLSearchParams.has
---

{{ApiRef("URL API")}} {{AvailableInWorkers}}

Phương thức **`has()`** của giao diện {{domxref("URLSearchParams")}} trả về một giá trị boolean cho biết tham số được chỉ định có tồn tại trong các tham số truy vấn hay không.

Một tên tham số và giá trị tùy chọn được dùng để khớp các tham số.
Nếu chỉ tên tham số được chỉ định, thì phương thức sẽ trả về `true` nếu bất kỳ tham số nào trong chuỗi truy vấn khớp với tên, và `false` nếu ngược lại.
Nếu cả tên tham số và giá trị đều được chỉ định, thì phương thức sẽ trả về `true` nếu một tham số khớp với cả tên và giá trị.

## Cú pháp

```js-nolint
has(name)
has(name, value)
```

### Tham số

- `name`
  - : Tên của tham số cần khớp.
- `value`
  - : Giá trị của tham số, cùng với tên đã cho, cần khớp.

### Giá trị trả về

Một giá trị boolean.

## Ví dụ

### Kiểm tra tham số có tên đã chỉ định

Ví dụ này cho thấy cách kiểm tra xem chuỗi truy vấn có bất kỳ tham số nào có một tên cụ thể không.

```js
const url = new URL("https://example.com?foo=1&bar=2&foo=3");
const params = new URLSearchParams(url.search);

// has() trả về true nếu tham số có trong chuỗi truy vấn
console.log(`bar?:\t${params.has("bar")}`);
console.log(`bark?:\t${params.has("bark")}`);
console.log(`foo?:\t${params.has("foo")}`);
```

Kết quả log bên dưới cho thấy các tham số `bar`, `bark`, và `foo` có tồn tại trong chuỗi truy vấn hay không.

```plain
bar?:  true
bark?: false
foo?:  true
```

### Kiểm tra tham số có tên và giá trị đã chỉ định

Ví dụ này cho thấy cách kiểm tra xem chuỗi truy vấn có tham số nào khớp với cả tên và giá trị cụ thể không.

```js
const url = new URL("https://example.com?foo=1&bar=2&foo=3");
const params = new URLSearchParams(url.search);

// has() trả về true nếu một tham số khớp với tên và giá trị có trong chuỗi truy vấn
console.log(`bar=1?:\t${params.has("bar", "1")}`);
console.log(`bar=2?:\t${params.has("bar", "2")}`);
console.log(`foo=4?:\t${params.has("foo", "4")}`);
```

Chỉ giá trị thứ hai ở trên là `true`, vì chỉ có tham số tên `bar` với giá trị `2` là khớp.

```plain
bar=1?: false
bar=2?: true
foo=4?: false
```

Nếu trình duyệt của bạn không hỗ trợ tùy chọn `value`, phương thức sẽ khớp theo tên, và tất cả kết quả sẽ là `true`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `URLSearchParams` trong `core-js`](https://github.com/zloirock/core-js#url-and-urlsearchparams)
