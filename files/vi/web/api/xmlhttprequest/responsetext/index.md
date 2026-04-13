---
title: "XMLHttpRequest: thuộc tính responseText"
short-title: responseText
slug: Web/API/XMLHttpRequest/responseText
page-type: web-api-instance-property
browser-compat: api.XMLHttpRequest.responseText
---

{{APIRef("XMLHttpRequest API")}} {{AvailableInWorkers("window_and_worker_except_service")}}

Thuộc tính chỉ đọc {{domxref("XMLHttpRequest")}} **`responseText`** trả về văn bản nhận được từ máy chủ sau khi một yêu cầu được gửi.

## Giá trị

Một chuỗi chứa dữ liệu văn bản nhận được bằng `XMLHttpRequest` hoặc `""` nếu yêu cầu thất bại hoặc nếu chưa có nội dung nào được nhận.

Khi xử lý một yêu cầu không đồng bộ, giá trị của `responseText` luôn có nội dung hiện tại nhận được từ máy chủ, ngay cả khi nó chưa đầy đủ vì dữ liệu chưa được nhận hoàn toàn.

Bạn biết toàn bộ nội dung đã được nhận khi giá trị của {{domxref("XMLHttpRequest.readyState", "readyState")}} trở thành `XMLHttpRequest.DONE` (`4`), và {{domxref("XMLHttpRequest.status", "status")}} trở thành 200 (`"OK"`).

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném nếu {{domxref("XMLHttpRequest.responseType")}} không được đặt thành chuỗi rỗng hoặc `"text"`. Vì thuộc tính `responseText` chỉ hợp lệ cho nội dung văn bản, bất kỳ giá trị nào khác là điều kiện lỗi.

## Ví dụ

```js
const xhr = new XMLHttpRequest();
xhr.open("GET", "/server", true);

// Nếu được chỉ định, responseType phải là chuỗi rỗng hoặc "text"
xhr.responseType = "text";

xhr.onload = () => {
  if (xhr.readyState === xhr.DONE) {
    if (xhr.status === 200) {
      console.log(xhr.response);
      console.log(xhr.responseText);
    }
  }
};

xhr.send(null);
```

## Các đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
