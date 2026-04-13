---
title: "Headers: phương thức values()"
short-title: values()
slug: Web/API/Headers/values
page-type: web-api-instance-method
browser-compat: api.Headers.values
---

{{APIRef("Fetch API")}} {{AvailableInWorkers}}

Phương thức **`Headers.values()`** trả về một {{jsxref("Iteration_protocols",'iterator')}} cho phép duyệt qua tất cả các giá trị có trong đối tượng này. Các giá trị là các đối tượng {{jsxref("String")}}.

## Cú pháp

```js-nolint
values()
```

### Tham số

Không có.

### Giá trị trả về

Trả về một {{jsxref("Iteration_protocols","iterator")}}.

## Ví dụ

```js
// Create a test Headers object
const myHeaders = new Headers();
myHeaders.append("Content-Type", "text/xml");
myHeaders.append("Vary", "Accept-Language");

// Display the values
for (const value of myHeaders.values()) {
  console.log(value);
}
```

Kết quả là:

```plain
text/xml
Accept-Language
```

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ServiceWorker API](/en-US/docs/Web/API/Service_Worker_API)
- [HTTP access control (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- [HTTP](/en-US/docs/Web/HTTP)
