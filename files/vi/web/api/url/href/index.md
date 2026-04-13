---
title: "URL: thuộc tính href"
short-title: href
slug: Web/API/URL/href
page-type: web-api-instance-property
browser-compat: api.URL.href
---

{{ApiRef("URL API")}} {{AvailableInWorkers}}

Thuộc tính **`href`** của giao diện {{domxref("URL")}} là một chuỗi chứa toàn bộ URL.

## Giá trị

Một chuỗi.

## Ví dụ

### URL đầy đủ với đường dẫn

```js
const url = new URL(
  "https://developer.mozilla.org/en-US/docs/Web/API/URL/href",
);
console.log(url.href); // https://developer.mozilla.org/en-US/docs/Web/API/URL/href
```

### URL chỉ có origin

Với các [scheme phân cấp](https://www.rfc-editor.org/rfc/rfc3986#section-1.2.3) như `https:`, pathname luôn phải không rỗng. Khi URL không có path (ví dụ, chỉ có origin), bộ phân tích URL sẽ đặt pathname thành `"/"`, vì vậy `href` sẽ bao gồm một dấu gạch chéo cuối. Xem thuộc tính {{domxref("URL/pathname", "pathname")}} để biết thêm chi tiết.

```js
const url = new URL("https://developer.mozilla.org");
console.log(url.href); // https://developer.mozilla.org/
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("URL")}} mà thuộc tính này thuộc về.
- {{domxref("URL.pathname")}}
