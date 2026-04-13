---
title: "URL: phương thức toString()"
short-title: toString()
slug: Web/API/URL/toString
page-type: web-api-instance-method
browser-compat: api.URL.toString
---

{{ApiRef("URL API")}} {{AvailableInWorkers}}

Phương thức **`toString()`** của giao diện {{domxref("URL")}} trả về một chuỗi chứa toàn bộ URL. Nó thực chất là phiên bản chỉ đọc của {{domxref("URL.href")}}.

## Cú pháp

```js-nolint
toString()
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
url.toString(); // nên trả về URL dưới dạng chuỗi
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("URL")}} mà thuộc tính này thuộc về.
