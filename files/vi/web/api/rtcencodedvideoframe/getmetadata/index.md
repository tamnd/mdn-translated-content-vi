---
title: "RTCEncodedVideoFrame: phương thức getMetadata()"
short-title: getMetadata()
slug: Web/API/RTCEncodedVideoFrame/getMetadata
page-type: web-api-instance-method
browser-compat: api.RTCEncodedVideoFrame.getMetadata
---

{{APIRef("WebRTC")}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`getMetadata()`** của giao diện {{domxref("RTCEncodedVideoFrame")}} trả về một đối tượng chứa metadata liên kết với khung.

Thông tin này bao gồm các thông tin về khung, chẳng hạn như kích thước, mã hóa video, các khung khác cần thiết để tạo một hình ảnh đầy đủ, timestamp và các thông tin khác.

## Cú pháp

```js-nolint
getMetadata()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng với các thuộc tính sau:

- `contributingSources`
  - : Một {{jsxref("Array")}} các nguồn (ssrc) đã đóng góp vào khung.
    Hãy xem xét trường hợp của một ứng dụng hội nghị kết hợp âm thanh và video từ nhiều người dùng.
    `synchronizationSource` sẽ bao gồm ssrc của ứng dụng, trong khi `contributingSources` sẽ bao gồm các giá trị ssrc của tất cả các nguồn video và âm thanh riêng lẻ.
- `dependencies`
  - : Một {{jsxref("Array")}} các số nguyên dương cho biết frameId của các khung mà khung này phụ thuộc vào.
    Đối với khung chính (key frame), mảng này sẽ rỗng, vì khung chính chứa tất cả thông tin cần thiết để tạo hình ảnh.
    Đối với delta frame, mảng này sẽ liệt kê tất cả các khung cần thiết để render khung này.
    Loại khung có thể được xác định bằng {{domxref("RTCEncodedVideoFrame.type")}}.
- `frameId`
  - : Một giá trị số nguyên dương cho biết id của khung này.
- `height`
  - : Một số nguyên dương cho biết chiều cao của khung.
    Giá trị tối đa là 65535.
- `mimeType`
  - : Một chuỗi chứa {{glossary("MIME type")}} của codec được sử dụng, chẳng hạn như "video/VP8".
- `payloadType`
  - : Một giá trị số nguyên dương trong khoảng từ 0 đến 127 mô tả định dạng của RTP payload.
    Ánh xạ các giá trị đến định dạng được định nghĩa trong RFC3550.
- `receiveTime`
  - : Một {{domxref("DOMHighResTimeStamp")}} cho biết timestamp của gói tin nhận được cuối cùng của một khung đến (từ một {{domxref("RTCRtpReceiver")}}) được sử dụng để tạo ra khung media này, tương đối so với {{domxref("Performance.timeOrigin")}}.
- `rtpTimestamp`
  - : Một số nguyên dương phản ánh thời điểm lấy mẫu của octet đầu tiên trong gói dữ liệu RTP (xem {{rfc("3550")}}).
- `spatialIndex`
  - : Một số nguyên dương cho biết chỉ số không gian của khung.
    Một số codec cho phép tạo các lớp khung với các lớp độ phân giải khác nhau.
    Các khung ở các lớp cao hơn có thể được loại bỏ có chọn lọc để giảm tốc độ bit khi cần, trong khi vẫn duy trì chất lượng video chấp nhận được.
- `synchronizationSource`
  - : Một giá trị số nguyên dương cho biết nguồn đồng bộ hóa ("ssrc") của luồng gói RTP được mô tả bởi khung video được mã hóa này.
    Nguồn có thể là camera, microphone, hoặc một ứng dụng mixer nào đó kết hợp nhiều nguồn.
    Tất cả các gói từ cùng một nguồn chia sẻ cùng nguồn thời gian và không gian chuỗi, do đó có thể được sắp xếp theo thứ tự tương đối với nhau.
    Lưu ý hai khung có cùng giá trị tham chiếu đến cùng một nguồn (để biết thêm thông tin xem [`RTCInboundRtpStreamStats.ssrc`](/en-US/docs/Web/API/RTCInboundRtpStreamStats/ssrc)).
- `temporalIndex`
  - : Một số nguyên dương cho biết chỉ số thời gian của khung.
    Một số codec nhóm các khung theo lớp, dựa trên việc loại bỏ một khung có ngăn các khung khác được giải mã hay không.
    Các khung ở các lớp cao hơn có thể được loại bỏ có chọn lọc để giảm tốc độ bit khi cần, trong khi vẫn duy trì chất lượng video chấp nhận được.
- `width`
  - : Một số nguyên dương cho biết chiều rộng của khung.
    Giá trị tối đa là 65535.

## Ví dụ

Ví dụ này về triển khai [WebRTC encoded transform](/en-US/docs/Web/API/WebRTC_API/Using_Encoded_Transforms) cho thấy cách bạn có thể lấy metadata của khung trong hàm `transform()` và ghi log nó.

```js
addEventListener("rtctransform", (event) => {
  const transform = new TransformStream({
    async transform(encodedFrame, controller) {
      // Get the metadata and log
      const frameMetaData = encodedFrame.getMetadata();
      console.log(frameMetaData);

      // Enqueue the frame without modifying
      controller.enqueue(encodedFrame);
    },
  });
  event.transformer.readable
    .pipeThrough(transform)
    .pipeTo(event.transformer.writable);
});
```

Đối tượng kết quả từ một webcam cục bộ có thể trông như ví dụ bên dưới.
Lưu ý rằng không có nguồn đóng góp vì chỉ có một nguồn.

```json
{
  "contributingSources": [],
  "mimeType": "video/VP8",
  "payloadType": 96,
  "rtpTimestamp": 2503280194,
  "synchronizationSource": 1736709460,
  "dependencies": [],
  "frameId": 1,
  "height": 240,
  "spatialIndex": 0,
  "temporalIndex": 0,
  "width": 320
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using WebRTC Encoded Transforms](/en-US/docs/Web/API/WebRTC_API/Using_Encoded_Transforms)
