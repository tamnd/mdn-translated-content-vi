---
title: "MediaSession: phương thức setMicrophoneActive()"
short-title: setMicrophoneActive()
slug: Web/API/MediaSession/setMicrophoneActive
page-type: web-api-instance-method
browser-compat: api.MediaSession.setMicrophoneActive
---

{{APIRef("Media Session API")}}

Phương thức **`setMicrophoneActive()`** của giao diện {{domxref("MediaSession")}} được sử dụng để thông báo cho tác nhân người dùng biết liệu microphone của người dùng có đang được coi là đang tắt tiếng hay không.

Gọi phương thức này trên đối tượng {{domxref("navigator.mediaSession", "mediaSession")}} của đối tượng `navigator`.

Lưu ý rằng trạng thái của microphone không được theo dõi trong chính {{domxref("MediaSession")}}, mà phải được theo dõi riêng.

## Cú pháp

```js-nolint
setMicrophoneActive(active)
```

### Tham số

- `active`
  - : Một giá trị boolean cho biết liệu microphone có được coi là đang tắt tiếng hay không.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Dưới đây là ví dụ cập nhật trạng thái tắt tiếng của microphone của {{domxref('MediaSession')}} hiện tại, cũng như lắng nghe các yêu cầu thay đổi trạng thái tắt tiếng với {{domxref("MediaSession.setActionHandler", "setActionHandler()")}}.

```js
let microphoneActive = false;

navigator.mediaSession.setMicrophoneActive(microphoneActive);

navigator.mediaSession.setActionHandler("togglemicrophone", () => {
  microphoneActive = !microphoneActive;
  navigator.mediaSession.setMicrophoneActive(microphoneActive);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
