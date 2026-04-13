---
title: "Request: thuộc tính mode"
short-title: mode
slug: Web/API/Request/mode
page-type: web-api-instance-property
browser-compat: api.Request.mode
---

{{APIRef("Fetch API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`mode`** của giao diện {{domxref("Request")}} chứa chế độ của request, ví dụ `cors`, `no-cors`, `same-origin` hoặc `navigate`. Thuộc tính này được dùng để xác định liệu request cross-origin có dẫn tới response hợp lệ hay không và những thuộc tính nào của response có thể đọc được.

Để tạo một request với một chế độ cụ thể, hãy truyền giá trị mong muốn vào tùy chọn {{domxref("RequestInit", "", "mode")}} của constructor {{domxref("Request.Request()")}}.

Lưu ý rằng việc đặt một số chế độ nhất định, đặc biệt là `no-cors`, sẽ áp đặt các hạn chế lên phương thức và header của request có thể được dùng, đồng thời ngăn JavaScript truy cập header hoặc body của response. Xem tài liệu về {{domxref("RequestInit", "", "mode")}} để biết thêm chi tiết.

## Giá trị

Một trong các giá trị sau:

- `same-origin`
  - : Không cho phép request cross-origin. Nếu gửi request tới origin khác khi đặt chế độ này, kết quả sẽ là lỗi.

- `no-cors`
  - : Tắt CORS cho request cross-origin. Response là _opaque_, nghĩa là header và body của nó không khả dụng cho JavaScript.

- `cors`
  - : Nếu request là cross-origin thì sẽ dùng cơ chế [Cross-Origin Resource Sharing (CORS)](/en-US/docs/Web/HTTP/Guides/CORS).

- `navigate`
  - : Chế độ hỗ trợ điều hướng. Giá trị `navigate` chỉ được dùng cho điều hướng HTML. Request điều hướng chỉ được tạo trong lúc điều hướng giữa các tài liệu.

### Chế độ mặc định

Request có thể được khởi tạo theo nhiều cách khác nhau, và chế độ của một request phụ thuộc vào cách cụ thể mà nó được khởi tạo.

Ví dụ, khi một đối tượng `Request` được tạo bằng constructor {{domxref("Request.Request", "Request()")}}, giá trị của thuộc tính `mode` của `Request` đó sẽ được đặt thành `cors`.

Tuy nhiên, với các request được tạo ngoài constructor {{domxref("Request.Request", "Request()")}}, thường dùng `no-cors` làm chế độ; ví dụ, với tài nguyên nhúng mà request được khởi tạo từ markup, trừ khi có thuộc tính [`crossorigin`](/en-US/docs/Web/HTML/Reference/Attributes/crossorigin), request trong hầu hết trường hợp sẽ được thực hiện bằng chế độ `no-cors` - tức là với các phần tử {{HTMLElement("link")}} hoặc {{HTMLElement("script")}} (trừ khi dùng với module), hoặc các phần tử {{HTMLElement("img")}}, {{HTMLElement("audio")}}, {{HTMLElement("video")}}, {{HTMLElement("object")}}, {{HTMLElement("embed")}} hoặc {{HTMLElement("iframe")}}.

## Ví dụ

Trong đoạn mã sau, chúng ta tạo một request mới bằng constructor {{domxref("Request.Request", "Request()")}} rồi lưu chế độ request vào một biến:

```js
const myRequest = new Request("flowers.jpg");
const myMode = myRequest.mode; // returns "cors" by default
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ServiceWorker API](/en-US/docs/Web/API/Service_Worker_API)
- [HTTP access control (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- [HTTP](/en-US/docs/Web/HTTP)
