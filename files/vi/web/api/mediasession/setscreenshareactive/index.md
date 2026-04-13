---
title: "MediaSession: phương thức setScreenshareActive()"
short-title: setScreenshareActive()
slug: Web/API/MediaSession/setScreenshareActive
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.MediaSession.setScreenshareActive
---

{{APIRef("Media Session API")}}{{SeeCompatTable}}

Phương thức **`setScreenshareActive()`** của giao diện {{domxref("MediaSession")}} được sử dụng để thông báo cho tác nhân người dùng biết liệu màn hình chia sẻ của người dùng có đang được coi là hoạt động hay không.

Gọi phương thức này trên đối tượng {{domxref("navigator.mediaSession", "mediaSession")}} của đối tượng `navigator`.

Lưu ý rằng trạng thái của màn hình chia sẻ không được theo dõi trong chính {{domxref("MediaSession")}}, mà phải được theo dõi riêng.

## Cú pháp

```js-nolint
setScreenshareActive(active)
```

### Tham số

- `active`
  - : Một giá trị boolean cho biết liệu màn hình chia sẻ có được coi là đang hoạt động hay không.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Dưới đây là ví dụ cập nhật trạng thái hoạt động của màn hình chia sẻ của {{domxref('MediaSession')}} hiện tại, cũng như lắng nghe các yêu cầu thay đổi trạng thái màn hình chia sẻ với {{domxref("MediaSession.setActionHandler", "setActionHandler()")}}.

```js
let screenshareActive = false;

navigator.mediaSession.setCameraActive(cameraActive);

navigator.mediaSession.setActionHandler("togglescreenshare", () => {
  screenshareActive = !screenshareActive;
  navigator.mediaSession.setCameraActive(screenshareActive);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
