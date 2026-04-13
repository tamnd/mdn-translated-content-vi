---
title: "XMLHttpRequest: thuộc tính response"
short-title: response
slug: Web/API/XMLHttpRequest/response
page-type: web-api-instance-property
browser-compat: api.XMLHttpRequest.response
---

{{APIRef("XMLHttpRequest API")}} {{AvailableInWorkers("window_and_worker_except_service")}}

Thuộc tính {{domxref("XMLHttpRequest")}} **`response`** trả về nội dung phần thân phản hồi dưới dạng {{jsxref("ArrayBuffer")}}, {{domxref("Blob")}}, {{domxref("Document")}}, một {{jsxref("Object")}} JavaScript, hoặc một chuỗi, tùy thuộc vào giá trị của thuộc tính {{domxref("XMLHttpRequest.responseType", "responseType")}} của yêu cầu.

## Giá trị

Một đối tượng phù hợp dựa trên giá trị của {{domxref("XMLHttpRequest.responseType", "responseType")}}. Bạn có thể yêu cầu dữ liệu được cung cấp dưới một định dạng cụ thể bằng cách thiết lập giá trị của `responseType` sau khi gọi {{domxref("XMLHttpRequest.open", "open()")}} để khởi tạo yêu cầu nhưng trước khi gọi {{domxref("XMLHttpRequest.send", "send()")}} để gửi yêu cầu đến máy chủ.

Giá trị là `null` nếu yêu cầu chưa hoàn tất hoặc không thành công, với ngoại lệ là khi đọc dữ liệu văn bản sử dụng `responseType` là `"text"` hoặc chuỗi rỗng (`""`), phản hồi có thể chứa phản hồi cho đến thời điểm hiện tại trong khi yêu cầu vẫn ở trạng thái `LOADING` {{domxref("XMLHttpRequest.readyState", "readyState")}} (3).

## Ví dụ

Ví dụ này trình bày một hàm `load()`, hàm này tải và xử lý một trang từ máy chủ. Nó hoạt động bằng cách tạo một đối tượng {{domxref("XMLHttpRequest")}} và tạo một trình lắng nghe cho các sự kiện {{domxref("XMLHttpRequest/readystatechange_event", "readystatechange")}} sao cho khi `readyState` thay đổi thành `DONE` (4), `response` được lấy và truyền vào hàm callback được cung cấp cho `load()`.

Nội dung được xử lý dưới dạng dữ liệu văn bản thô (vì không có gì ghi đè {{domxref("XMLHttpRequest.responseType", "responseType")}} mặc định ở đây).

```js
const url = "somePage.html"; // Một trang cục bộ

function load(url, callback) {
  const xhr = new XMLHttpRequest();

  xhr.onreadystatechange = () => {
    if (xhr.readyState === 4) {
      callback(xhr.response);
    }
  };

  xhr.open("GET", url, true);
  xhr.send("");
}
```

## Các đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng XMLHttpRequest](/en-US/docs/Web/API/XMLHttpRequest_API/Using_XMLHttpRequest)
- Lấy dữ liệu text và HTML/XML: {{domxref("XMLHttpRequest.responseText")}} và {{domxref("XMLHttpRequest.responseXML")}}
