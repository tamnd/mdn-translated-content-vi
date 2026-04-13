---
title: "Headers: phương thức entries()"
short-title: entries()
slug: Web/API/Headers/entries
page-type: web-api-instance-method
browser-compat: api.Headers.entries
---

{{APIRef("Fetch API")}} {{AvailableInWorkers}}

Phương thức **`Headers.entries()`** trả về một {{jsxref("Iteration_protocols",'iterator')}} cho phép duyệt qua tất cả các cặp khóa/giá trị có trong đối tượng này. Cả khóa và giá trị của mỗi cặp đều là các đối tượng {{jsxref("String")}}.

## Cú pháp

```js-nolint
entries()
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

// Display the key/value pairs
for (const pair of myHeaders.entries()) {
  console.log(`${pair[0]}: ${pair[1]}`);
}
```

Kết quả là:

```plain
content-type: text/xml
vary: Accept-Language
```

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ServiceWorker API](/en-US/docs/Web/API/Service_Worker_API)
- [HTTP access control (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- [HTTP](/en-US/docs/Web/HTTP)
