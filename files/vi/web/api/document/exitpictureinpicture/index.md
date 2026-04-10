---
title: "Document: phương thức exitPictureInPicture()"
short-title: exitPictureInPicture()
slug: Web/API/Document/exitPictureInPicture
page-type: web-api-instance-method
browser-compat: api.Document.exitPictureInPicture
---

{{APIRef("Picture-in-Picture API")}}

Phương thức **`exitPictureInPicture()`** của giao diện {{domxref("Document")}} yêu cầu một video chứa trong tài liệu này, hiện đang nổi, được đưa ra khỏi chế độ hình trong hình, khôi phục trạng thái trước đó của màn hình. Điều này thường đảo ngược hiệu ứng của một lệnh gọi trước đó đến {{domxref("HTMLVideoElement.requestPictureInPicture()")}}.

## Cú pháp

```js-nolint
exitPictureInPicture()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}}, sẽ được phân giải một khi {{Glossary("user agent")}} hoàn tất việc thoát khỏi chế độ hình trong hình. Nếu xảy ra lỗi khi cố thoát khỏi chế độ toàn màn hình, trình xử lý `catch()` của promise sẽ được gọi.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu `document.pictureInPictureElement` là `null`.

## Ví dụ

Ví dụ này khiến tài liệu hiện tại thoát khỏi chế độ hình trong hình bất cứ khi nào nhấp chuột trong đó.

```js
document.onclick = (event) => {
  if (document.pictureInPictureElement) {
    document
      .exitPictureInPicture()
      .then(() => console.log("Tài liệu đã thoát khỏi chế độ hình trong hình"))
      .catch((err) => console.error(err));
  } else {
    video.requestPictureInPicture();
  }
};
```

Lưu ý rằng nếu bạn muốn theo dõi video nào trên trang của bạn hiện đang phát ở chế độ hình trong hình, bạn nên lắng nghe các sự kiện `enterpictureinpicture` và `exitpictureinpicture` trên (các) phần tử {{DOMxRef("HTMLVideoElement")}} liên quan. Ngoài ra, bạn có thể kiểm tra xem {{DOMxRef("Document.pictureInPictureElement")}} có tham chiếu đến phần tử {{DOMxRef("HTMLVideoElement")}} hiện tại không.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("HTMLVideoElement.requestPictureInPicture()")}}
- {{DOMxRef("HTMLVideoElement.disablePictureInPicture")}}
- {{DOMxRef("Document.pictureInPictureEnabled")}}
- {{DOMxRef("Document.pictureInPictureElement")}}
- {{CSSxRef(":picture-in-picture")}}
- [Các sự kiện Picture-in-Picture](/en-US/docs/Web/API/Picture-in-Picture_API#events)
