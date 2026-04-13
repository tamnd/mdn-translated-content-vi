---
title: "MediaSession: phương thức setCameraActive()"
short-title: setCameraActive()
slug: Web/API/MediaSession/setCameraActive
page-type: web-api-instance-method
browser-compat: api.MediaSession.setCameraActive
---

{{APIRef("Media Session API")}}

Phương thức **`setCameraActive()`** của giao diện {{domxref("MediaSession")}} được sử dụng để thông báo cho tác nhân người dùng biết liệu camera của người dùng có được coi là đang hoạt động hay không.

Gọi phương thức này trên đối tượng {{domxref("navigator.mediaSession", "mediaSession")}} của đối tượng `navigator`.

Lưu ý rằng trạng thái của camera không được theo dõi trong chính {{domxref("MediaSession")}}, mà phải được theo dõi riêng.

## Cú pháp

```js-nolint
setCameraActive(active)
```

### Tham số

- `active`
  - : Một giá trị boolean cho biết liệu camera có được coi là đang hoạt động hay không.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Dưới đây là ví dụ cập nhật trạng thái hoạt động của camera của {{domxref('MediaSession')}} hiện tại, cũng như lắng nghe các yêu cầu thay đổi trạng thái camera với {{domxref("MediaSession.setActionHandler", "setActionHandler()")}}.

```js
let cameraActive = false;

navigator.mediaSession.setCameraActive(cameraActive);

navigator.mediaSession.setActionHandler("togglecamera", () => {
  cameraActive = !cameraActive;
  navigator.mediaSession.setCameraActive(cameraActive);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
