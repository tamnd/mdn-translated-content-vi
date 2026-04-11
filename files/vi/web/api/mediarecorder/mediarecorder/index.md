---
title: "MediaRecorder: hàm khởi tạo MediaRecorder()"
short-title: MediaRecorder()
slug: Web/API/MediaRecorder/MediaRecorder
page-type: web-api-constructor
browser-compat: api.MediaRecorder.MediaRecorder
---

{{APIRef("MediaStream Recording")}}

Hàm khởi tạo **`MediaRecorder()`** tạo ra một đối tượng {{domxref("MediaRecorder")}} mới sẽ ghi lại một {{domxref("MediaStream")}} được chỉ định.

Đối tượng có thể được cấu hình tùy chọn để ghi bằng container phương tiện cụ thể (loại tệp), và hơn nữa, có thể chỉ định chính xác codec và cấu hình codec bằng cách chỉ định [tham số `codecs`](/en-US/docs/Web/Media/Guides/Formats/codecs_parameter).

## Cú pháp

```js-nolint
new MediaRecorder(stream)
new MediaRecorder(stream, options)
```

### Tham số

- `stream`
  - : {{domxref("MediaStream")}} sẽ được ghi lại. Nguồn phương tiện này có thể đến từ luồng được tạo bằng {{domxref("MediaDevices.getUserMedia", "navigator.mediaDevices.getUserMedia()")}} hoặc từ phần tử {{HTMLElement("audio")}}, {{HTMLElement("video")}} hoặc {{HTMLElement("canvas")}}.
- `options` {{optional_inline}}
  - : Đối tượng từ điển có thể chứa các thuộc tính sau:
    - `mimeType` {{optional_inline}}
      - : Loại MIME chỉ định định dạng cho phương tiện kết quả; bạn có thể chỉ định định dạng container (trình duyệt sẽ chọn codec ưa thích cho audio và/hoặc video), hoặc bạn có thể [dùng tham số `codecs`](/en-US/docs/Web/Media/Guides/Formats/codecs_parameter) và/hoặc tham số `profiles` để cung cấp thông tin chi tiết về codec nào cần dùng và cách cấu hình chúng. Ứng dụng có thể kiểm tra trước nếu `mimeType` được hỗ trợ bởi {{Glossary("user agent")}} bằng cách gọi {{domxref("MediaRecorder.isTypeSupported_static", "MediaRecorder.isTypeSupported()")}}. Mặc định là chuỗi rỗng.
    - `audioBitsPerSecond` {{optional_inline}}
      - : Tốc độ bit đã chọn cho thành phần âm thanh của phương tiện.
    - `videoBitsPerSecond` {{optional_inline}}
      - : Tốc độ bit đã chọn cho thành phần video của phương tiện.
    - `bitsPerSecond` {{optional_inline}}
      - : Tốc độ bit đã chọn cho cả thành phần âm thanh và video của phương tiện. Có thể chỉ định thay thế hai thuộc tính trên. Nếu được chỉ định cùng với một trong hai thuộc tính trên, thuộc tính này sẽ được dùng cho cái không được chỉ định.
    - `audioBitrateMode` {{optional_inline}}
      - : Chế độ tốc độ bit nên được dùng để mã hóa âm thanh. Có thể là `constant`, cho biết bộ ghi nên mã hóa ở tốc độ bit cố định, hoặc `variable`, cho biết bộ ghi nên mã hóa bằng tốc độ bit biến thiên, cho phép dùng nhiều dung lượng hơn cho các tín hiệu phức tạp và ít hơn cho các tín hiệu ít phức tạp hơn. Mặc định là `variable`.
    - `videoKeyFrameIntervalDuration` {{optional_inline}}
      - : Khoảng thời gian danh nghĩa giữa các khung hình chính trong luồng video được mã hóa. {{glossary("user agent")}} kiểm soát việc tạo khung hình chính dựa trên tùy chọn này và tùy chọn `videoKeyFrameIntervalCount`.
    - `videoKeyFrameIntervalCount` {{optional_inline}}
      - : Khoảng cách tính theo số khung hình giữa các khung hình chính trong luồng video được mã hóa. {{glossary("user agent")}} kiểm soát việc tạo khung hình chính dựa trên tùy chọn này cũng như tùy chọn `videoKeyFrameIntervalDuration`.

    > [!NOTE]
    > Nếu không chỉ định giá trị bit per second cho video và/hoặc âm thanh, mặc định được áp dụng cho video là 2.5Mbps, trong khi mặc định cho âm thanh là thích ứng, tùy thuộc vào tần số lấy mẫu và số kênh.

    > [!NOTE]
    > Độ phân giải video, tốc độ khung hình và các cài đặt tương tự được chỉ định dưới dạng ràng buộc khi gọi {{domxref("MediaDevices.getUserMedia", "getUserMedia()")}}, không phải ở đây trong MediaStream Recording API.

### Ngoại lệ

- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném ra nếu loại MIME được chỉ định không được tác nhân người dùng hỗ trợ.

## Ví dụ

Ví dụ này cho thấy cách tạo bộ ghi phương tiện cho một luồng được chỉ định, trong đó tốc độ bit âm thanh được đặt là 128 Kbit/giây và tốc độ bit video là 2.5 Mbit/giây. Dữ liệu phương tiện đã ghi sẽ được lưu trữ trong bộ đệm MP4 (vì vậy nếu bạn thu thập các đoạn dữ liệu phương tiện và lưu chúng vào đĩa, chúng sẽ ở trong tệp MP4).

```js
if (navigator.mediaDevices.getUserMedia) {
  const constraints = { audio: true, video: true };
  const chunks = [];

  const onSuccess = (stream) => {
    const options = {
      audioBitsPerSecond: 128000,
      videoBitsPerSecond: 2500000,
      mimeType: "video/mp4",
    };
    const mediaRecorder = new MediaRecorder(stream, options);
    m = mediaRecorder;

    // …
  };
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng MediaStream Recording API](/en-US/docs/Web/API/MediaStream_Recording_API/Using_the_MediaStream_Recording_API)
- [Web Dictaphone](https://mdn.github.io/dom-examples/media/web-dictaphone/): MediaRecorder + getUserMedia + Web Audio API visualization demo, bởi [Chris Mills](https://github.com/chrisdavidmills) ([mã nguồn trên GitHub](https://github.com/mdn/dom-examples/tree/main/media/web-dictaphone).)
- [simpl.info MediaStream Recording demo](https://simpl.info/mediarecorder/), bởi [Sam Dutton](https://github.com/samdutton).
- {{domxref("MediaDevices.getUserMedia")}}
