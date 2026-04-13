---
title: "URLSearchParams: thuộc tính size"
short-title: size
slug: Web/API/URLSearchParams/size
page-type: web-api-instance-property
browser-compat: api.URLSearchParams.size
---

{{APIRef("URL API")}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`size`** của giao diện {{domxref("URLSearchParams")}} cho biết tổng số mục tham số truy vấn.

## Giá trị

Một số cho biết tổng số mục tham số truy vấn trong đối tượng {{domxref("URLSearchParams")}}.

## Ví dụ

### Lấy số lượng mục tham số truy vấn

Bạn có thể lấy tổng số mục tham số truy vấn như sau:

```js
const searchParams = new URLSearchParams("c=4&a=2&b=3&a=1");
searchParams.size; // 4
```

Lưu ý rằng tham số `a` được cung cấp hai lần, nhưng `size` trả về số lượng tất cả các mục (4) chứ không phải 3. Để lấy số lượng khóa duy nhất, bạn có thể dùng {{jsxref("Set")}}, ví dụ:

```js
[...new Set(searchParams.keys())].length; // 3
```

### Kiểm tra xem có tham số truy vấn tồn tại không

Thuộc tính `size` hữu ích để kiểm tra xem có bất kỳ tham số truy vấn nào hay không:

```js
const url = new URL("https://example.com?foo=1&bar=2");

if (url.searchParams.size) {
  console.log("URL có tham số truy vấn!");
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("URL.searchParams")}}
- [Polyfill của `URLSearchParams` trong `core-js`](https://github.com/zloirock/core-js#url-and-urlsearchparams)
