---
title: "Response: thuộc tính status"
short-title: status
slug: Web/API/Response/status
page-type: web-api-instance-property
browser-compat: api.Response.status
---

{{APIRef("Fetch API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`status`** của giao diện {{domxref("Response")}} chứa các [HTTP status codes](/en-US/docs/Web/HTTP/Reference/Status) của phản hồi.

Ví dụ: `200` cho thành công, `404` nếu tài nguyên không tìm thấy.

## Giá trị

Một số nguyên không dấu.
Đây là một trong các [HTTP response status codes](/en-US/docs/Web/HTTP/Reference/Status).

Giá trị `0` được trả về cho phản hồi có {{domxref("Response.type", "type")}} là `opaque`, `opaqueredirect` hoặc `error`.

## Ví dụ

Trong ví dụ [Fetch Response](https://github.com/mdn/dom-examples/tree/main/fetch/fetch-response) của chúng tôi ([chạy trực tiếp](https://mdn.github.io/dom-examples/fetch/fetch-response/)), chúng ta tạo một đối tượng {{domxref("Request")}} mới bằng constructor {{domxref("Request.Request","Request()")}}, truyền vào một đường dẫn JPG.
Sau đó chúng ta fetch yêu cầu này bằng {{domxref("Window/fetch", "fetch()")}}, trích blob từ phản hồi bằng {{domxref("Response.blob")}}, tạo object URL từ nó bằng {{domxref("URL.createObjectURL_static", "URL.createObjectURL()")}}, rồi hiển thị nó trong {{htmlelement("img")}}.

Lưu ý rằng ở đầu khối `fetch()` chúng ta ghi giá trị `status` của phản hồi ra console.

```js
const myImage = document.querySelector("img");

const myRequest = new Request("flowers.jpg");

fetch(myRequest)
  .then((response) => {
    console.log("response.status =", response.status); // response.status = 200
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
