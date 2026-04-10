---
title: "Response: constructor Response()"
short-title: Response()
slug: Web/API/Response/Response
page-type: web-api-constructor
browser-compat: api.Response.Response
---

{{APIRef("Fetch API")}}{{AvailableInWorkers}}

Constructor **`Response()`** tạo một đối tượng {{domxref("Response")}} mới.

## Cú pháp

```js-nolint
new Response()
new Response(body)
new Response(body, options)
```

### Tham số

- `body` {{optional_inline}}
  - : Một đối tượng xác định phần thân của phản hồi. Có thể là `null` (giá trị mặc định), hoặc một trong các kiểu sau:
    - {{domxref("Blob")}}
    - {{jsxref("ArrayBuffer")}}
    - {{jsxref("TypedArray")}}
    - {{jsxref("DataView")}}
    - {{domxref("FormData")}}
    - {{domxref("ReadableStream")}}
    - {{domxref("URLSearchParams")}}
    - {{jsxref("String")}}
    - chuỗi literal

- `options` {{optional_inline}}
  - : Một object tùy chọn chứa bất kỳ thiết lập tùy biến nào bạn muốn áp dụng cho phản hồi, hoặc một object rỗng (giá trị mặc định). Các tùy chọn có thể có:
    - `status`
      - : Mã trạng thái của phản hồi.
        Giá trị mặc định là `200`.
    - `statusText`
      - : Thông báo trạng thái gắn với mã trạng thái, chẳng hạn `"OK"`.
        Giá trị mặc định là `""`.
    - `headers`
      - : Bất kỳ header nào bạn muốn thêm vào phản hồi, chứa trong một object {{domxref("Headers")}} hoặc object literal gồm các cặp khóa/giá trị {{jsxref("String")}} (xem [HTTP headers](/en-US/docs/Web/HTTP/Reference/Headers) để tham khảo).
        Mặc định là rỗng.

## Ví dụ

Trong ví dụ [Fetch Response](https://github.com/mdn/dom-examples/tree/main/fetch/fetch-response) của chúng tôi (xem [chạy trực tiếp](https://mdn.github.io/dom-examples/fetch/fetch-response/)), chúng ta tạo một đối tượng {{domxref("Response")}} mới bằng constructor, truyền vào một {{domxref("Blob")}} làm body và một object khởi tạo chứa `status` và `statusText` tùy biến:

```js
const myBlob = new Blob();
const myOptions = { status: 200, statusText: "SuperSmashingGreat!" };
const myResponse = new Response(myBlob, myOptions);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ServiceWorker API](/en-US/docs/Web/API/Service_Worker_API)
- [HTTP access control (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- [HTTP](/en-US/docs/Web/HTTP)
