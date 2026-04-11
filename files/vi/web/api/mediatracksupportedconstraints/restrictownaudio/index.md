---
title: "MediaTrackSupportedConstraints: restrictOwnAudio property"
short-title: restrictOwnAudio
slug: Web/API/MediaTrackSupportedConstraints/restrictOwnAudio
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.MediaStreamTrack.applyConstraints.restrictOwnAudio_constraint
---

{{APIRef("Media Capture and Streams")}}{{SeeCompatTable}}

Thuộc tính **`restrictOwnAudio`** của từ điển {{domxref("MediaTrackSupportedConstraints")}} là giá trị boolean chỉ đọc có mặt (và được đặt thành `true`) trong đối tượng được trả về bởi {{domxref("MediaDevices.getSupportedConstraints()")}} khi và chỉ khi {{Glossary("user agent")}} hỗ trợ ràng buộc `restrictOwnAudio`. Nếu ràng buộc không được hỗ trợ, nó không được đưa vào danh sách, vì vậy giá trị này sẽ không bao giờ là `false`.

Bạn có thể truy cập từ điển các ràng buộc được hỗ trợ bằng cách gọi {{domxref("MediaDevices.getSupportedConstraints()", "navigator.mediaDevices.getSupportedConstraints()")}}.

## Giá trị

Thuộc tính này có mặt trong từ điển (và giá trị của nó luôn là `true`) nếu user agent hỗ trợ ràng buộc `restrictOwnAudio`. Nếu thuộc tính không có mặt, thuộc tính này bị thiếu trong từ điển các ràng buộc được hỗ trợ và bạn sẽ nhận được {{jsxref("undefined")}} nếu bạn cố gắng truy cập giá trị của nó.

## Ví dụ

```html hidden
<div id="result"></div>
```

```css hidden
#result {
  font:
    14px "Arial",
    sans-serif;
}
```

```js
const result = document.getElementById("result");
const supported =
  navigator.mediaDevices.getSupportedConstraints().restrictOwnAudio;
result.textContent = supported ? "Được hỗ trợ!" : "Không được hỗ trợ!";
```

### Kết quả

{{EmbedLiveSample('Ví dụ', 600, 80)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [API Ghi và phát Media](/en-US/docs/Web/API/Media_Capture_and_Streams_API)
- {{domxref("MediaDevices.getSupportedConstraints()")}}
- {{domxref("MediaTrackSupportedConstraints")}}
- {{domxref("MediaStreamTrack")}}
