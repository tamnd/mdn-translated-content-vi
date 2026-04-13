---
title: "Response: thuộc tính url"
short-title: url
slug: Web/API/Response/url
page-type: web-api-instance-property
browser-compat: api.Response.url
---

{{APIRef("Fetch API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`url`** của giao diện {{domxref("Response")}} chứa URL của phản hồi.
Giá trị của thuộc tính `url` sẽ là URL cuối cùng thu được sau mọi chuyển hướng.

## Giá trị

Một chuỗi.

## Ví dụ

Trong ví dụ [Fetch Response](https://github.com/mdn/dom-examples/tree/main/fetch/fetch-response) của chúng tôi ([chạy trực tiếp](https://mdn.github.io/dom-examples/fetch/fetch-response/)), chúng ta tạo một đối tượng {{domxref("Request")}} mới bằng constructor {{domxref("Request.Request","Request()")}}, truyền vào một đường dẫn JPG.
Sau đó chúng ta fetch yêu cầu này bằng {{domxref("Window/fetch", "fetch()")}}, trích blob từ phản hồi bằng {{domxref("Response.blob")}}, tạo object URL từ nó bằng {{domxref("URL.createObjectURL_static", "URL.createObjectURL()")}}, rồi hiển thị nó trong {{htmlelement("img")}}.

Lưu ý rằng ở đầu khối `fetch()` chúng ta ghi `URL` của phản hồi ra console.

```js
const myImage = document.querySelector("img");

const myRequest = new Request("flowers.jpg");

fetch(myRequest)
  .then((response) => {
    console.log("response.url =", response.url); // response.url = https://mdn.github.io/dom-examples/fetch/fetch-response/flowers.jpg
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
