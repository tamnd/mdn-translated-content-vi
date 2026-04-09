---
title: "Clients: phương thức get()"
short-title: get()
slug: Web/API/Clients/get
page-type: web-api-instance-method
browser-compat: api.Clients.get
---

{{APIRef("Service Workers API")}}{{AvailableInWorkers("service")}}

Phương thức **`get()`** của giao diện
{{domxref("Clients")}} lấy một client service worker khớp với `id`
đã cho và trả về nó trong một {{jsxref("Promise")}}.

## Cú pháp

```js-nolint
get(id)
```

### Tham số

- `id`
  - : Một chuỗi biểu diễn id của client mà bạn muốn lấy.

### Giá trị trả về

Một {{jsxref("Promise")}} được phân giải thành một đối tượng {{domxref("Client")}} hoặc
`undefined`.

## Ví dụ

```js
self.clients.get(id).then((client) => {
  self.clients.openWindow(client.url);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
