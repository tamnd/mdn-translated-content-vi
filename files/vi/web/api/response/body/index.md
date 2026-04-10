---
title: "Response: thuộc tính body"
short-title: body
slug: Web/API/Response/body
page-type: web-api-instance-property
browser-compat: api.Response.body
---

{{APIRef("Fetch API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`body`** của giao diện {{domxref("Response")}} là một {{domxref("ReadableStream")}} của nội dung thân phản hồi.

## Giá trị

Một {{domxref("ReadableStream")}}, hoặc [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) đối với bất kỳ đối tượng `Response` nào được [khởi tạo](/en-US/docs/Web/API/Response/Response) với thuộc tính [`body`](/en-US/docs/Web/API/Response/Response#body) là null, hoặc đối với bất kỳ [phản hồi HTTP](/en-US/docs/Web/HTTP/Guides/Messages#http_responses) thực tế nào không có [body](/en-US/docs/Web/HTTP/Guides/Messages#response_body).

Luồng này là một [readable byte stream](/en-US/docs/Web/API/Streams_API/Using_readable_byte_streams), hỗ trợ đọc zero-copy bằng {{domxref("ReadableStreamBYOBReader")}}.

> [!NOTE]
> Các trình duyệt hiện tại thực tế chưa tuân thủ yêu cầu của spec là đặt thuộc tính `body` thành `null` đối với phản hồi không có body, chẳng hạn phản hồi cho yêu cầu [`HEAD`](/en-US/docs/Web/HTTP/Reference/Methods/HEAD) hoặc phản hồi [`204 No Content`](/en-US/docs/Web/HTTP/Reference/Status/204).

## Ví dụ

### Sao chép một hình ảnh

Trong ví dụ [simple stream pump](https://mdn.github.io/dom-examples/streams/simple-pump/) của chúng tôi, chúng ta fetch một hình ảnh, truy cập luồng của phản hồi qua `response.body`, tạo một reader bằng {{domxref("ReadableStream.getReader()", "ReadableStream.getReader()")}}, rồi đẩy các chunk của luồng đó vào một readable stream tùy chỉnh thứ hai, qua đó tạo ra một bản sao tương tự của hình ảnh.

```js
const image = document.getElementById("target");

// Fetch hình ảnh gốc
fetch("./tortoise.png")
  // Lấy body dưới dạng ReadableStream
  .then((response) => response.body)
  .then((body) => {
    const reader = body.getReader();

    return new ReadableStream({
      start(controller) {
        return pump();

        function pump() {
          return reader.read().then(({ done, value }) => {
            // Khi không còn dữ liệu cần đọc, đóng stream
            if (done) {
              controller.close();
              return;
            }

            // Đưa chunk dữ liệu tiếp theo vào stream đích của chúng ta
            controller.enqueue(value);
            return pump();
          });
        }
      },
    });
  })
  .then((stream) => new Response(stream))
  .then((response) => response.blob())
  .then((blob) => URL.createObjectURL(blob))
  .then((url) => console.log((image.src = url)))
  .catch((err) => console.error(err));
```

### Tạo BYOB reader

Trong ví dụ này, chúng ta tạo một {{domxref("ReadableStreamBYOBReader")}} từ body bằng {{domxref("ReadableStream.getReader()", "ReadableStream.getReader({mode: 'byob'})")}}. Sau đó có thể dùng reader này để thực hiện truyền dữ liệu phản hồi theo kiểu zero-copy.

```js
async function getProducts(url) {
  const response = await fetch(url);
  const reader = response.body.getReader({ mode: "byob" });
  // đọc phản hồi
}

getProducts(
  "https://mdn.github.io/learning-area/javascript/apis/fetching-data/can-store/products.json",
);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Fetch API](/en-US/docs/Web/API/Fetch_API)
- [Streams API](/en-US/docs/Web/API/Streams_API)
- [ServiceWorker API](/en-US/docs/Web/API/Service_Worker_API)
