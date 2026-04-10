---
title: "Headers: constructor Headers()"
short-title: Headers()
slug: Web/API/Headers/Headers
page-type: web-api-constructor
browser-compat: api.Headers.Headers
---

{{APIRef("Fetch API")}} {{AvailableInWorkers}}

Constructor **`Headers()`** tạo một đối tượng {{domxref("Headers")}} mới.

## Cú pháp

```js-nolint
new Headers()
new Headers(init)
```

### Tham số

- `init` {{optional_inline}}
  - : Một object chứa bất kỳ [HTTP headers](/en-US/docs/Web/HTTP/Reference/Headers) nào bạn muốn dùng để khởi tạo trước đối tượng `Headers`. Đây có thể là một object literal đơn giản với các giá trị {{jsxref("String")}}, một mảng các cặp tên-giá trị, trong đó mỗi cặp là một mảng chuỗi gồm 2 phần tử; hoặc một đối tượng `Headers` có sẵn. Trong trường hợp cuối cùng, đối tượng `Headers` mới sẽ sao chép dữ liệu từ đối tượng `Headers` hiện có.

## Ví dụ

Tạo một đối tượng `Headers` rỗng là rất đơn giản:

```js
const myHeaders = new Headers(); // Currently empty
```

Bạn có thể thêm một header vào đó bằng {{domxref("Headers.append")}}:

```js
myHeaders.append("Content-Type", "image/jpeg");
myHeaders.get("Content-Type"); // Returns 'image/jpeg'
```

Hoặc bạn có thể thêm các header mong muốn ngay khi đối tượng `Headers` được tạo. Trong đoạn mã sau, chúng ta tạo một đối tượng {{domxref("Headers")}} mới và thêm một số header bằng cách truyền object khởi tạo vào constructor:

```js
const httpHeaders = {
  "Content-Type": "image/jpeg",
  "X-My-Custom-Header": "Zeke are cool",
};
const myHeaders = new Headers(httpHeaders);
```

Bây giờ bạn có thể tạo một đối tượng `Headers` khác, truyền đối tượng `Headers` đầu tiên làm object khởi tạo:

```js
const secondHeadersObj = new Headers(myHeaders);
secondHeadersObj.get("Content-Type"); // Would return 'image/jpeg' — it inherits it from the first headers object
```

Bạn cũng có thể thêm các header mong muốn ngay khi đối tượng `Headers` được tạo bằng cách dùng mảng hai chiều để thêm nhiều header có cùng giá trị. Trong đoạn mã sau, chúng ta tạo một đối tượng {{domxref("Headers")}} mới với nhiều header `Set-Cookie` bằng cách truyền một mảng khởi tạo vào constructor:

```js
const headers = [
  ["Set-Cookie", "greeting=hello"],
  ["Set-Cookie", "name=world"],
];
const myHeaders = new Headers(headers);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ServiceWorker API](/en-US/docs/Web/API/Service_Worker_API)
- [HTTP access control (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- [HTTP](/en-US/docs/Web/HTTP)
