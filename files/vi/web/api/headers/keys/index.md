---
title: "Headers: phương thức keys()"
short-title: keys()
slug: Web/API/Headers/keys
page-type: web-api-instance-method
browser-compat: api.Headers.keys
---

{{APIRef("Fetch API")}} {{AvailableInWorkers}}

Phương thức **`Headers.keys()`** trả về một {{jsxref("Iteration_protocols",'iterator')}} cho phép duyệt qua tất cả các khóa có trong đối tượng này. Các khóa là các đối tượng {{jsxref("String")}}.

## Cú pháp

```js-nolint
keys()
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

// Display the keys
for (const key of myHeaders.keys()) {
  console.log(key);
}
```

Kết quả là:

```plain
content-type
vary
```

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ServiceWorker API](/en-US/docs/Web/API/Service_Worker_API)
- [HTTP access control (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- [HTTP](/en-US/docs/Web/HTTP)
