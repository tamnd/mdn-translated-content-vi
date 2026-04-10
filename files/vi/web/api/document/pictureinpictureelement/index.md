---
title: "Document: thuộc tính pictureInPictureElement"
short-title: pictureInPictureElement
slug: Web/API/Document/pictureInPictureElement
page-type: web-api-instance-property
browser-compat: api.Document.pictureInPictureElement
---

{{APIRef("Picture-in-Picture API")}}

Thuộc tính chỉ đọc **`pictureInPictureElement`** của giao diện {{domxref("Document")}} trả về {{ domxref("Element") }} đang được trình bày ở chế độ hình trong hình trong tài liệu này, hoặc `null` nếu chế độ hình trong hình hiện không được sử dụng.

Mặc dù thuộc tính này là chỉ đọc, nó sẽ không ném lỗi nếu bị sửa đổi (ngay cả trong strict mode); setter là một thao tác rỗng và sẽ bị bỏ qua.

## Giá trị

Một tham chiếu đến đối tượng {{domxref("Element")}} hiện đang ở chế độ hình trong hình.

Trả về `null` nếu tài liệu không có phần tử liên kết nào ở chế độ hình trong hình. Ví dụ: không có phần tử hình trong hình, hoặc phần tử là từ một iframe.

## Ví dụ

Ví dụ này trình bày một hàm, `exitPictureInPicture()`, kiểm tra giá trị trả về bởi `pictureInPictureElement`. Nếu tài liệu đang ở chế độ hình trong hình (`pictureInPictureElement` không phải `null`), [`Document.exitPictureInPicture()`](/en-US/docs/Web/API/Document/exitPictureInPicture) được chạy để thoát khỏi chế độ hình trong hình.

```js
function exitPictureInPicture() {
  if (document.pictureInPictureElement) {
    document.exitPictureInPicture();
  }
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("HTMLVideoElement.requestPictureInPicture()")}}
- {{DOMxRef("HTMLVideoElement.disablePictureInPicture")}}
- {{DOMxRef("Document.pictureInPictureEnabled")}}
- {{DOMxRef("Document.exitPictureInPicture()")}}
- {{CSSxRef(":picture-in-picture")}}
