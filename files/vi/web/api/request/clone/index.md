---
title: "Request: phương thức clone()"
short-title: clone()
slug: Web/API/Request/clone
page-type: web-api-instance-method
browser-compat: api.Request.clone
---

{{APIRef("Fetch API")}}{{AvailableInWorkers}}

Phương thức **`clone()`** của giao diện {{domxref("Request")}} tạo một bản sao của đối tượng `Request` hiện tại.

## Cú pháp

```js-nolint
clone()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng `Request` mới, là bản sao của request hiện tại.

## Ví dụ

```js
const request = new Request("flowers.jpg");
const copy = request.clone();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Request.Request", "Request()")}}
