---
title: "Response: thuộc tính headers"
short-title: headers
slug: Web/API/Response/headers
page-type: web-api-instance-property
browser-compat: api.Response.headers
---

{{APIRef("Fetch API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`headers`** của giao diện {{domxref("Response")}} chứa đối tượng {{domxref("Headers")}} gắn với phản hồi.

## Giá trị

Một đối tượng {{domxref("Headers")}}.

## Ví dụ

Trong ví dụ [Fetch Response](https://github.com/mdn/dom-examples/tree/main/fetch/fetch-response) của chúng tôi ([chạy trực tiếp](https://mdn.github.io/dom-examples/fetch/fetch-response/)), chúng ta tạo một đối tượng {{domxref("Request")}} mới bằng constructor {{domxref("Request.Request","Request()")}}, truyền vào một đường dẫn JPG.
Sau đó chúng ta fetch yêu cầu này bằng {{domxref("Window/fetch", "fetch()")}}, trích blob từ phản hồi bằng {{domxref("Response.blob")}}, tạo object URL từ nó bằng {{domxref("URL.createObjectURL_static", "URL.createObjectURL()")}}, rồi hiển thị nó trong phần tử {{htmlelement("img")}}.

Lưu ý rằng ở đầu khối `fetch()`, chúng ta ghi response headers ra console.

```js
const myImage = document.querySelector("img");

const myRequest = new Request("flowers.jpg");

fetch(myRequest)
  .then((response) => {
    console.log("response.headers =", response.headers);
    return response.blob();
  })
  .then((myBlob) => {
    const objectURL = URL.createObjectURL(myBlob);
    myImage.src = objectURL;
  });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ServiceWorker API](/en-US/docs/Web/API/Service_Worker_API)
- [HTTP access control (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- [HTTP](/en-US/docs/Web/HTTP)
