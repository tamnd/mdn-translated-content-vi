---
title: "Response: thuộc tính statusText"
short-title: statusText
slug: Web/API/Response/statusText
page-type: web-api-instance-property
browser-compat: api.Response.statusText
---

{{APIRef("Fetch API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`statusText`** của giao diện {{domxref("Response")}} chứa thông báo trạng thái tương ứng với mã trạng thái HTTP trong {{domxref("Response.status")}}.

Ví dụ: đây sẽ là `OK` cho status code `200`, `Continue` cho `100`, `Not Found` cho `404`.

## Giá trị

Một {{jsxref("String")}} chứa thông báo trạng thái HTTP gắn với phản hồi.
Giá trị mặc định là `""`.

Xem [HTTP response status codes](/en-US/docs/Web/HTTP/Reference/Status) để biết danh sách mã và thông báo trạng thái tương ứng.
Lưu ý rằng HTTP/2 [không hỗ trợ](https://fetch.spec.whatwg.org/#concept-response-status-message) status message.

## Ví dụ

Trong ví dụ [Fetch Response](https://github.com/mdn/dom-examples/tree/main/fetch/fetch-response) của chúng tôi ([chạy trực tiếp](https://mdn.github.io/dom-examples/fetch/fetch-response/)), chúng ta tạo một đối tượng {{domxref("Request")}} mới bằng constructor {{domxref("Request.Request","Request()")}}, truyền vào một đường dẫn JPG.
Sau đó chúng ta fetch yêu cầu này bằng {{domxref("Window/fetch", "fetch()")}}, trích blob từ phản hồi bằng {{domxref("Response.blob")}}, tạo object URL từ nó bằng {{domxref("URL.createObjectURL_static", "URL.createObjectURL()")}}, rồi hiển thị nó trong {{htmlelement("img")}}.

Lưu ý rằng ở đầu khối `fetch()` chúng ta ghi giá trị `statusText` của phản hồi ra console.

```js
const myImage = document.querySelector("img");

const myRequest = new Request("flowers.jpg");

fetch(myRequest)
  .then((response) => {
    console.log("response.statusText =", response.statusText); // response.statusText = "OK"
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
