---
title: "Document: thuộc tính pictureInPictureEnabled"
short-title: pictureInPictureEnabled
slug: Web/API/Document/pictureInPictureEnabled
page-type: web-api-instance-property
browser-compat: api.Document.pictureInPictureEnabled
---

{{APIRef("Picture-in-Picture API")}}

Thuộc tính chỉ đọc **`pictureInPictureEnabled`** của giao diện {{domxref("Document")}} cho biết liệu chế độ hình trong hình có khả dụng hay không.

Chế độ hình trong hình khả dụng theo mặc định trừ khi được chỉ định khác bởi [Permissions-Policy](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy/picture-in-picture).

Mặc dù thuộc tính này là chỉ đọc, nó sẽ không ném lỗi nếu bị sửa đổi (ngay cả trong strict mode); setter là một thao tác rỗng và sẽ bị bỏ qua.

## Giá trị

Một giá trị boolean, là `true` nếu video có thể vào chế độ hình trong hình và được hiển thị trong cửa sổ nổi bằng cách gọi {{domxref("HTMLVideoElement.requestPictureInPicture()")}}. Nếu chế độ hình trong hình không khả dụng, giá trị này là `false`.

## Ví dụ

Trong ví dụ này, trước khi cố gắng vào chế độ hình trong hình cho một phần tử {{htmlElement("video")}}, giá trị của `pictureInPictureEnabled` được kiểm tra, để tránh thực hiện cuộc gọi nếu tính năng không khả dụng.

```js
function requestPictureInPicture() {
  if (document.pictureInPictureEnabled) {
    videoElement.requestPictureInPicture();
  } else {
    console.log("Trình duyệt của bạn hiện không thể sử dụng hình trong hình");
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
- {{DOMxRef("Document.exitPictureInPicture()")}}
- {{DOMxRef("Document.pictureInPictureElement")}}
- {{CSSxRef(":picture-in-picture")}}
