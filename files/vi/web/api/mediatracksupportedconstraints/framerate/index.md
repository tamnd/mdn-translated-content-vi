---
title: "MediaTrackSupportedConstraints: frameRate property"
short-title: frameRate
slug: Web/API/MediaTrackSupportedConstraints/frameRate
page-type: web-api-instance-property
browser-compat: api.MediaStreamTrack.applyConstraints.frameRate_constraint
---

{{APIRef("Media Capture and Streams")}}

Thuộc tính **`frameRate`** của từ điển {{domxref("MediaTrackSupportedConstraints")}} là giá trị Boolean chỉ đọc có mặt (và được đặt thành `true`) trong đối tượng được trả về bởi {{domxref("MediaDevices.getSupportedConstraints()")}} khi và chỉ khi {{Glossary("user agent")}} hỗ trợ ràng buộc {{domxref("MediaTrackConstraints.frameRate","frameRate")}}.

Nếu ràng buộc không được hỗ trợ, nó không được đưa vào danh sách, vì vậy giá trị này sẽ không bao giờ là `false`.

Ràng buộc `frameRate` có thể được sử dụng để thiết lập giới hạn trên và dưới chấp nhận được về tốc độ khung hình video cho một rãnh video mới, hoặc để chỉ định tốc độ khung hình chính xác phải được cung cấp để yêu cầu thành công. Kiểm tra giá trị của thuộc tính này cho phép bạn xác định xem user agent có cho phép ràng buộc cấu hình rãnh video theo tốc độ khung hình hay không. Xem [ví dụ](#ví dụ) để biết cách sử dụng.

## Giá trị

Thuộc tính này có mặt trong từ điển nếu user agent hỗ trợ ràng buộc `frameRate`. Nếu thuộc tính không có mặt, user agent không cho phép chỉ định giới hạn về tốc độ khung hình cho các rãnh video.

> [!NOTE]
> Nếu thuộc tính này có mặt, giá trị của nó luôn là `true`.

## Ví dụ

Ví dụ đơn giản này kiểm tra xem trình duyệt của bạn có hỗ trợ ràng buộc tốc độ khung hình khi yêu cầu các rãnh video hay không.

### JavaScript

```js
const result = document.getElementById("result");
const supported = navigator.mediaDevices.getSupportedConstraints().frameRate;
result.textContent = supported ? "Được hỗ trợ!" : "Không được hỗ trợ!";
```

### HTML

```html
<div id="result"></div>
```

### CSS

```css
#result {
  font:
    14px "Arial",
    sans-serif;
}
```

### Kết quả

Kết quả, cho biết trình duyệt của bạn có hỗ trợ ràng buộc `frameRate` hay không, là:

{{ EmbedLiveSample('Ví dụ', 600, 80) }}

Mặc dù ví dụ này đơn giản, bạn có thể thay thế đầu ra "Được hỗ trợ" so với "Không được hỗ trợ" đơn giản bằng code để cung cấp các phương thức thay thế để trình bày thông tin âm thanh hình ảnh bạn muốn chia sẻ với người dùng hoặc xử lý khác.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [API Ghi và phát Media](/en-US/docs/Web/API/Media_Capture_and_Streams_API)
- {{domxref("MediaDevices.getSupportedConstraints()")}}
- {{domxref("MediaTrackSupportedConstraints")}}
- {{domxref("MediaStreamTrack")}}
