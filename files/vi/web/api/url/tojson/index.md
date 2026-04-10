---
title: "URL: phương thức toJSON()"
short-title: toJSON()
slug: Web/API/URL/toJSON
page-type: web-api-instance-method
browser-compat: api.URL.toJSON
---

{{APIRef("URL API")}} {{AvailableInWorkers}}

Phương thức **`toJSON()`** của giao diện {{domxref("URL")}} trả về một chuỗi chứa phiên bản đã được serialize của URL, mặc dù trong thực tế nó có vẻ có cùng tác dụng với {{domxref("URL.toString()")}}.

## Cú pháp

```js-nolint
toJSON()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi.

## Ví dụ

```js
const url = new URL(
  "https://developer.mozilla.org/en-US/docs/Web/API/URL/toString",
);
url.toJSON(); // nên trả về URL dưới dạng chuỗi
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `URL.prototype.toJSON` trong `core-js`](https://github.com/zloirock/core-js#url-and-urlsearchparams)
