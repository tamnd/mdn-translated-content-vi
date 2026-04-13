---
title: "MediaTrackSupportedConstraints: noiseSuppression property"
short-title: noiseSuppression
slug: Web/API/MediaTrackSupportedConstraints/noiseSuppression
page-type: web-api-instance-property
browser-compat: api.MediaStreamTrack.applyConstraints.noiseSuppression_constraint
---

{{APIRef("Media Capture and Streams")}}

Thuộc tính **`noiseSuppression`** của từ điển {{domxref("MediaTrackSupportedConstraints")}} là giá trị Boolean chỉ đọc có mặt (và được đặt thành `true`) trong đối tượng được trả về bởi {{domxref("MediaDevices.getSupportedConstraints()")}} khi và chỉ khi {{Glossary("user agent")}} hỗ trợ ràng buộc **`noiseSuppression`**. Nếu ràng buộc không được hỗ trợ, nó không được đưa vào danh sách, vì vậy giá trị này sẽ không bao giờ là `false`.

Bạn có thể truy cập từ điển các ràng buộc được hỗ trợ bằng cách gọi `navigator.mediaDevices.getSupportedConstraints()`.

Ràng buộc `noiseSuppression` cho biết trình duyệt có cung cấp khả năng tự động kiểm soát độ khuếch đại (âm lượng) trên các rãnh phương tiện hay không; điều này rõ ràng phụ thuộc vào việc thiết bị riêng lẻ có hỗ trợ kiểm soát độ khuếch đại tự động hay không.

## Giá trị

Thuộc tính này có mặt trong từ điển (và giá trị của nó luôn là `true`) nếu user agent hỗ trợ ràng buộc `noiseSuppression` (và do đó hỗ trợ triệt tiếng ồn trên các rãnh âm thanh). Nếu thuộc tính không có mặt, thuộc tính này bị thiếu trong từ điển các ràng buộc được hỗ trợ và bạn sẽ nhận được {{jsxref("undefined")}} nếu bạn cố gắng xem giá trị của nó.

## Ví dụ

Ví dụ này hiển thị xem trình duyệt của bạn có hỗ trợ ràng buộc `noiseSuppression` hay không.

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
  navigator.mediaDevices.getSupportedConstraints().noiseSuppression;
result.textContent = supported ? "Được hỗ trợ!" : "Không được hỗ trợ!";
```

### Kết quả

{{ EmbedLiveSample('Ví dụ', 600, 80) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [API Ghi và phát Media](/en-US/docs/Web/API/Media_Capture_and_Streams_API)
- {{domxref("MediaDevices.getSupportedConstraints()")}}
- {{domxref("MediaTrackSupportedConstraints")}}
- {{domxref("MediaStreamTrack")}}
