---
title: "Document: releaseCapture() method"
short-title: releaseCapture()
slug: Web/API/Document/releaseCapture
page-type: web-api-instance-method
status:
  - non-standard
browser-compat: api.Document.releaseCapture
---

{{ApiRef("DOM")}}{{Non-standard_header}}

Phương thức **`releaseCapture()`** giải phóng chế độ bắt chuột nếu
hiện đang được bật trên một phần tử trong tài liệu này.
Sau khi chế độ bắt chuột được giải phóng, các sự kiện chuột sẽ không còn được chuyển tất cả đến phần tử đang bật chế độ bắt.

Để bật chế độ bắt chuột trên một phần tử, gọi {{domxref("element.setCapture()")}}.

## Cú pháp

```js-nolint
releaseCapture()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Xem [ví dụ](/en-US/docs/Web/API/Element/setCapture#examples) của
{{domxref("element.setCapture()")}}.

## Đặc tả kỹ thuật

Không nằm trong bất kỳ đặc tả nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("element.setCapture()")}}
