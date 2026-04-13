---
title: Response
slug: Web/API/Response
page-type: web-api-interface
browser-compat: api.Response
---

{{APIRef("Fetch API")}}{{AvailableInWorkers}}

Giao diện **`Response`** của [Fetch API](/en-US/docs/Web/API/Fetch_API) biểu diễn phản hồi của một yêu cầu.

Bạn có thể tạo một đối tượng `Response` mới bằng constructor {{domxref("Response.Response", "Response()")}}, nhưng thường bạn sẽ gặp `Response` được trả về từ một thao tác API khác, chẳng hạn service worker {{domxref("FetchEvent.respondWith")}} hoặc một lời gọi đơn giản tới {{domxref("Window/fetch", "fetch()")}}.

## Constructor

- {{domxref("Response.Response","Response()")}}
  - : Tạo một đối tượng `Response` mới.

## Thuộc tính thể hiện

- {{domxref("Response.body")}} {{ReadOnlyInline}}
  - : Một {{domxref("ReadableStream")}} chứa nội dung thân phản hồi.
- {{domxref("Response.bodyUsed")}} {{ReadOnlyInline}}
  - : Lưu một giá trị boolean cho biết phần thân phản hồi đã được dùng hay chưa.
- {{domxref("Response.headers")}} {{ReadOnlyInline}}
  - : Đối tượng {{domxref("Headers")}} gắn với phản hồi.
- {{domxref("Response.ok")}} {{ReadOnlyInline}}
  - : Một giá trị boolean cho biết phản hồi có thành công hay không, tức mã trạng thái nằm trong khoảng `200` đến `299`.
- {{domxref("Response.redirected")}} {{ReadOnlyInline}}
  - : Cho biết phản hồi có phải là kết quả của chuyển hướng hay không, tức danh sách URL của nó có nhiều hơn một mục.
- {{domxref("Response.status")}} {{ReadOnlyInline}}
  - : Mã trạng thái của phản hồi. (Mã thành công sẽ là `200`.)
- {{domxref("Response.statusText")}} {{ReadOnlyInline}}
  - : Thông báo trạng thái tương ứng với mã trạng thái. (Ví dụ: `OK` cho `200`.)
- {{domxref("Response.type")}} {{ReadOnlyInline}}
  - : Kiểu của phản hồi, ví dụ `basic`, `cors`.
- {{domxref("Response.url")}} {{ReadOnlyInline}}
  - : URL của phản hồi.

## Phương thức tĩnh

- {{domxref("Response.error_static","Response.error()")}}
  - : Trả về một đối tượng `Response` mới gắn với lỗi mạng.
- {{domxref("Response.redirect_static", "Response.redirect()")}}
  - : Trả về một phản hồi mới với URL khác.
- {{domxref("Response.json_static", "Response.json()")}}
  - : Trả về một đối tượng `Response` mới để trả về dữ liệu JSON đã cho.

## Phương thức thể hiện

- {{domxref("Response.arrayBuffer()")}}
  - : Trả về một promise giải quyết với biểu diễn {{jsxref("ArrayBuffer")}} của phần thân phản hồi.
- {{domxref("Response.blob()")}}
  - : Trả về một promise giải quyết với biểu diễn {{domxref("Blob")}} của phần thân phản hồi.
- {{domxref("Response.bytes()")}}
  - : Trả về một promise giải quyết với biểu diễn {{jsxref("Uint8Array")}} của phần thân phản hồi.
- {{domxref("Response.clone()")}}
  - : Tạo một bản sao của đối tượng `Response`.
- {{domxref("Response.formData()")}}
  - : Trả về một promise giải quyết với biểu diễn {{domxref("FormData")}} của phần thân phản hồi.
- {{domxref("Response.json()")}}
  - : Trả về một promise giải quyết với kết quả phân tích văn bản thân phản hồi dưới dạng {{jsxref("JSON")}}.
- {{domxref("Response.text()")}}
  - : Trả về một promise giải quyết với biểu diễn văn bản của phần thân phản hồi.

## Ví dụ

### Tải một hình ảnh

Trong ví dụ [fetch cơ bản](https://github.com/mdn/dom-examples/tree/main/fetch/basic-fetch) của chúng tôi ([chạy trực tiếp](https://mdn.github.io/dom-examples/fetch/basic-fetch/)), chúng ta dùng một lời gọi `fetch()` đơn giản để lấy một hình ảnh và hiển thị nó trong phần tử {{htmlelement("img")}}.
Lời gọi `fetch()` trả về một promise, promise này giải quyết thành đối tượng `Response` gắn với thao tác tải tài nguyên.

Bạn sẽ thấy rằng vì chúng ta đang yêu cầu một hình ảnh, chúng ta cần chạy {{domxref("Response.blob")}} để phản hồi có đúng kiểu MIME.

```js
const image = document.querySelector(".my-image");
fetch("flowers.jpg")
  .then((response) => {
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }
    return response.blob();
  })
  .then((blob) => {
    const objectURL = URL.createObjectURL(blob);
    image.src = objectURL;
  })
  .catch((error) => {
    console.error("Error fetching the image:", error);
  });
```

Bạn cũng có thể dùng constructor {{domxref("Response.Response", "Response()")}} để tạo đối tượng `Response` tùy chỉnh của riêng mình:

```js
const response = new Response();
```

### Lời gọi PHP

Ở đây chúng ta gọi một file chương trình PHP tạo ra chuỗi JSON và hiển thị kết quả dưới dạng một giá trị JSON.

```js
// Hàm lấy JSON bằng PHP
const getJSON = async () => {
  // Tạo đối tượng Response
  const response = await fetch("getJSON.php");
  if (response.ok) {
    // Lấy giá trị JSON từ phần thân phản hồi
    return response.json();
  }
  throw new Error("*** PHP file not found");
};

// Gọi hàm và ghi giá trị hoặc thông báo lỗi ra console
getJSON()
  .then((result) => console.log(result))
  .catch((error) => console.error(error));
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ServiceWorker API](/en-US/docs/Web/API/Service_Worker_API)
- [HTTP access control (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- [HTTP](/en-US/docs/Web/HTTP)
