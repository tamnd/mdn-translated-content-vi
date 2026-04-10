---
title: "Document: thuộc tính fullscreen"
short-title: fullscreen
slug: Web/API/Document/fullscreen
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.Document.fullscreen
---

{{APIRef("Fullscreen API")}}{{Deprecated_Header}}

Thuộc tính chỉ đọc **`fullscreen`** đã lỗi thời của giao diện {{domxref("Document")}} báo cáo liệu tài liệu có đang hiển thị nội dung ở chế độ toàn màn hình hay không.

Mặc dù thuộc tính này là chỉ đọc, nó sẽ không ném lỗi nếu bị sửa đổi (ngay cả trong strict mode); setter là một thao tác rỗng và sẽ bị bỏ qua.

> [!NOTE]
> Vì thuộc tính này đã lỗi thời, bạn có thể xác định xem chế độ toàn màn hình có đang hoạt động trên tài liệu hay không bằng cách kiểm tra xem {{DOMxRef("Document.fullscreenElement")}} có khác `null` không.

## Giá trị

Một giá trị Boolean là `true` nếu tài liệu đang hiển thị một phần tử ở chế độ toàn màn hình; ngược lại, giá trị là `false`.

## Ví dụ

Hàm đơn giản này báo cáo xem chế độ toàn màn hình có đang hoạt động hay không, sử dụng thuộc tính `fullscreen` đã lỗi thời.

```js
function isDocumentInFullScreenMode() {
  return document.fullscreen;
}
```

Ví dụ tiếp theo, mặt khác, sử dụng thuộc tính `fullscreenElement` hiện tại để xác định điều tương tự:

```js
function isDocumentInFullScreenMode() {
  return document.fullscreenElement !== null;
}
```

Nếu `fullscreenElement` không phải là `null`, điều này trả về `true`, cho biết chế độ toàn màn hình đang hoạt động.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Fullscreen API](/en-US/docs/Web/API/Fullscreen_API)
- [Hướng dẫn sử dụng Fullscreen API](/en-US/docs/Web/API/Fullscreen_API/Guide)
- {{DOMxRef("Document.fullscreenEnabled")}}
