---
title: "Response: phương thức clone()"
short-title: clone()
slug: Web/API/Response/clone
page-type: web-api-instance-method
browser-compat: api.Response.clone
---

{{APIRef("Fetch API")}}{{AvailableInWorkers}}

Phương thức **`clone()`** của giao diện {{domxref("Response")}} tạo một bản sao của đối tượng phản hồi, giống hệt về mọi mặt nhưng được lưu trong một biến khác.

Giống như API nền tảng {{domxref("ReadableStream.tee")}}, {{domxref("Response.body", "body")}} của một `Response` đã clone sẽ báo backpressure theo tốc độ của consumer _nhanh hơn_ trong hai body, và dữ liệu chưa đọc sẽ được xếp hàng nội bộ trên `body` tiêu thụ chậm hơn mà không có giới hạn hay backpressure.
Backpressure là cơ chế mà consumer luồng dữ liệu làm chậm producer dữ liệu để không nạp lượng lớn dữ liệu vào bộ nhớ khi ứng dụng chưa cần dùng.
Nếu chỉ một nhánh đã clone được tiêu thụ, toàn bộ body sẽ bị đệm trong bộ nhớ.
Vì vậy, `clone()` là một cách để đọc một phản hồi hai lần theo thứ tự, nhưng bạn không nên dùng nó để đọc các body rất lớn song song với tốc độ rất khác nhau.

`clone()` ném ra {{jsxref("TypeError")}} nếu body phản hồi đã được dùng rồi.
Thực ra lý do chính của `clone()` là cho phép dùng nhiều lần các đối tượng body vốn chỉ dùng một lần.

## Cú pháp

```js-nolint
clone()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{domxref("Response")}}.

## Ví dụ

Trong ví dụ [Fetch Response clone](https://github.com/mdn/dom-examples/blob/main/fetch/fetch-response-clone/index.html) của chúng tôi ([chạy trực tiếp](https://mdn.github.io/dom-examples/fetch/fetch-response-clone/)), chúng ta tạo một đối tượng {{domxref("Request")}} mới bằng constructor {{domxref("Request.Request","Request()")}}, truyền vào một đường dẫn JPG.
Sau đó chúng ta fetch yêu cầu này bằng {{domxref("Window/fetch", "fetch()")}}.
Khi fetch thành công, chúng ta clone nó, trích blob từ cả hai phản hồi bằng hai lời gọi {{domxref("Response.blob")}}, tạo object URL từ các blob bằng {{domxref("URL.createObjectURL_static", "URL.createObjectURL()")}}, rồi hiển thị chúng trong hai phần tử {{htmlelement("img")}} riêng biệt.

```js
const image1 = document.querySelector(".img1");
const image2 = document.querySelector(".img2");

const myRequest = new Request("flowers.jpg");

fetch(myRequest).then((response) => {
  const response2 = response.clone();

  response.blob().then((myBlob) => {
    const objectURL = URL.createObjectURL(myBlob);
    image1.src = objectURL;
  });

  response2.blob().then((myBlob) => {
    const objectURL = URL.createObjectURL(myBlob);
    image2.src = objectURL;
  });
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
