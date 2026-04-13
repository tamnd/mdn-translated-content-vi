---
title: "Request: thuộc tính integrity"
short-title: integrity
slug: Web/API/Request/integrity
page-type: web-api-instance-property
browser-compat: api.Request.integrity
---

{{APIRef("Fetch API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`integrity`** của giao diện {{domxref("Request")}} chứa giá trị [subresource integrity](/en-US/docs/Web/Security/Defenses/Subresource_Integrity) của request.

## Giá trị

Giá trị đã được truyền vào làm đối số `options.integrity` khi tạo `Request`.

Nếu chưa chỉ định integrity, thuộc tính sẽ trả về `''`.

## Ví dụ

Trong đoạn mã sau, chúng ta tạo một request mới bằng constructor {{domxref("Request/Request", "Request()")}} rồi đọc integrity của request. Vì request được tạo mà không có integrity cụ thể, thuộc tính trả về một chuỗi rỗng.

```js
const myRequest = new Request("flowers.jpg");
console.log(myRequest.integrity); // ""
```

Trong ví dụ dưới đây, request được tạo với một giá trị integrity cụ thể, nên thuộc tính trả về đúng giá trị đó. Lưu ý rằng không có bước kiểm tra hợp lệ nào với giá trị integrity; thuộc tính trả về chính xác thứ đã được truyền vào.

```js
const myRequest = new Request("flowers.jpg", {
  integrity: "sha256-abc123",
});
console.log(myRequest.integrity); // "sha256-abc123"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ServiceWorker API](/en-US/docs/Web/API/Service_Worker_API)
- [HTTP access control (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- [HTTP](/en-US/docs/Web/HTTP)
