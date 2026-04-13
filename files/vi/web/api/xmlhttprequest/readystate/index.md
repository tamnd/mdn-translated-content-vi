---
title: "XMLHttpRequest: thuộc tính readyState"
short-title: readyState
slug: Web/API/XMLHttpRequest/readyState
page-type: web-api-instance-property
browser-compat: api.XMLHttpRequest.readyState
---

{{APIRef("XMLHttpRequest API")}} {{AvailableInWorkers("window_and_worker_except_service")}}

Thuộc tính **XMLHttpRequest.readyState** trả về trạng thái mà một client XMLHttpRequest đang ở. Một client XHR tồn tại trong một trong các trạng thái sau:

| Giá trị | Trạng thái         | Mô tả                                                              |
| ------- | ------------------ | ------------------------------------------------------------------ |
| `0`     | `UNSENT`           | Client đã được tạo. Phương thức `open()` chưa được gọi.            |
| `1`     | `OPENED`           | Phương thức `open()` đã được gọi.                                  |
| `2`     | `HEADERS_RECEIVED` | Phương thức `send()` đã được gọi, tiêu đề và trạng thái đã sẵn sàng.|
| `3`     | `LOADING`          | Đang tải xuống; `responseText` chứa dữ liệu một phần.              |
| `4`     | `DONE`             | Hoạt động đã hoàn tất.                                             |

- UNSENT
  - : Client XMLHttpRequest đã được tạo, nhưng phương thức open() chưa được gọi.
- OPENED
  - : Phương thức open() đã được gọi. Trong trạng thái này, các tiêu đề yêu cầu có thể được thiết lập bằng phương thức [setRequestHeader()](/en-US/docs/Web/API/XMLHttpRequest/setRequestHeader) và phương thức [send()](/en-US/docs/Web/API/XMLHttpRequest/send) có thể được gọi để bắt đầu quá trình tải.
- HEADERS_RECEIVED
  - : Phương thức send() đã được gọi, tất cả các chuyển hướng (nếu có) đã được theo dõi và các tiêu đề phản hồi đã được nhận.
- LOADING
  - : Phần thân phản hồi đang được nhận. Nếu [`responseType`](/en-US/docs/Web/API/XMLHttpRequest/responseType) là "text" hoặc chuỗi rỗng, [`responseText`](/en-US/docs/Web/API/XMLHttpRequest/responseText) sẽ chứa văn bản phản hồi một phần khi đang tải.
- DONE
  - : Hoạt động tải đã hoàn tất. Điều này có thể có nghĩa là quá trình truyền dữ liệu đã hoàn tất thành công hoặc thất bại.

## Ví dụ

```js
const xhr = new XMLHttpRequest();
console.log("UNSENT", xhr.readyState); // readyState sẽ là 0

xhr.open("GET", "/api", true);
console.log("OPENED", xhr.readyState); // readyState sẽ là 1

xhr.onprogress = () => {
  console.log("LOADING", xhr.readyState); // readyState sẽ là 3
};

xhr.onload = () => {
  console.log("DONE", xhr.readyState); // readyState sẽ là 4
};

xhr.send(null);
```

## Các đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
