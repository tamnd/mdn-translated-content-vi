---
title: "XMLHttpRequest: phương thức abort()"
short-title: abort()
slug: Web/API/XMLHttpRequest/abort
page-type: web-api-instance-method
browser-compat: api.XMLHttpRequest.abort
---

{{APIRef("XMLHttpRequest API")}} {{AvailableInWorkers("window_and_worker_except_service")}}

Phương thức **`XMLHttpRequest.abort()`** hủy bỏ yêu cầu nếu nó đã được gửi. Khi một yêu cầu bị hủy, {{domxref("XMLHttpRequest.readyState", "readyState")}} của nó được thay đổi thành `XMLHttpRequest.UNSENT` (0) và mã {{domxref("XMLHttpRequest.status", "status")}} của yêu cầu được đặt thành 0.

Nếu yêu cầu vẫn đang tiến hành (`readyState` không phải là `XMLHttpRequest.DONE` hoặc `XMLHttpRequest.UNSENT`), một sự kiện {{domxref("XMLHttpRequest/readystatechange_event", "readystatechange")}}, {{domxref("XMLHttpRequestEventTarget/abort_event", "abort")}}, và một sự kiện {{domxref("XMLHttpRequestEventTarget/loadend_event", "loadend")}} được dispatch, theo thứ tự đó. Đối với yêu cầu đồng bộ, không có sự kiện nào được dispatch và một lỗi sẽ được ném thay thế.

## Cú pháp

```js-nolint
abort()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Ví dụ này bắt đầu tải nội dung từ trang chủ MDN, sau đó do một số điều kiện, hủy quá trình truyền bằng cách gọi `abort()`.

```js
const xhr = new XMLHttpRequest();
const method = "GET";
const url = "https://developer.mozilla.org/";
xhr.open(method, url, true);

xhr.send();

if (OH_NOES_WE_NEED_TO_CANCEL_RIGHT_NOW_OR_ELSE) {
  xhr.abort();
}
```

## Các đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng XMLHttpRequest](/en-US/docs/Web/API/XMLHttpRequest_API/Using_XMLHttpRequest)
