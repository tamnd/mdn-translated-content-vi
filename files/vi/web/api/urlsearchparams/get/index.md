---
title: "URLSearchParams: phương thức get()"
short-title: get()
slug: Web/API/URLSearchParams/get
page-type: web-api-instance-method
browser-compat: api.URLSearchParams.get
---

{{ApiRef("URL API")}} {{AvailableInWorkers}}

Phương thức **`get()`** của giao diện {{domxref("URLSearchParams")}} trả về giá trị đầu tiên gắn với tham số truy vấn đã cho.

## Cú pháp

```js-nolint
get(name)
```

### Tham số

- `name`
  - : Tên của tham số cần trả về.

### Giá trị trả về

Một chuỗi nếu tham số truy vấn đã cho tồn tại; ngược lại, **`null`**.

## Ví dụ

Nếu URL trang của bạn là `https://example.com/?name=Jonathan&age=18`, bạn có thể phân tích các tham số 'name' và 'age' bằng cách dùng:

```js
let params = new URLSearchParams(document.location.search);
let name = params.get("name"); // là chuỗi "Jonathan"
let age = parseInt(params.get("age"), 10); // là số 18
```

Yêu cầu một tham số không có trong chuỗi truy vấn sẽ trả về **`null`**:

```js
let address = params.get("address"); // null
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
