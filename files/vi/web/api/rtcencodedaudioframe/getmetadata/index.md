---
title: "RTCEncodedAudioFrame: getMetadata() method"
short-title: getMetadata()
slug: Web/API/RTCEncodedAudioFrame/getMetadata
page-type: web-api-instance-method
browser-compat: api.RTCEncodedAudioFrame.getMetadata
---

{{APIRef("WebRTC")}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`getMetadata()`** của giao diện {{domxref("RTCEncodedAudioFrame")}} trả về một đối tượng chứa siêu dữ liệu liên kết với khung.

Điều này bao gồm thông tin về khung, chẳng hạn như bộ mã hóa âm thanh được sử dụng, nguồn đồng bộ hóa và các nguồn đóng góp, và số thứ tự (cho các khung đến).

## Cú pháp

```js-nolint
getMetadata()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng với các thuộc tính sau:

- `audioLevel`
  - : Một số đại diện cho mức âm thanh của khung này. Giá trị nằm trong khoảng từ 0 đến 1 bao gồm (tuyến tính), trong đó 1.0 đại diện cho 0 dBov ([decibel tương đối với toàn thang (DBFS)](https://en.wikipedia.org/wiki/DBFS)), 0 đại diện cho im lặng, và 0.5 đại diện cho khoảng 6 dB SPL thay đổi trong [mức áp suất âm](https://en.wikipedia.org/wiki/Sound_pressure#Sound_pressure_level) từ 0 dBov. Giá trị được chuyển đổi từ phạm vi -127 đến 0 được chỉ định trong [RFC6464](https://www.rfc-editor.org/rfc/rfc6464) qua phương trình `10^(-rfc_level/20)`. Nếu phần mở rộng header RFC6464 không có trong các gói nhận của khung, `audioLevel` sẽ là `undefined`.
- `captureTime`
  - : Một {{domxref("DOMHighResTimeStamp")}} chỉ ra thời gian chụp của khung tương đối với {{domxref("Performance.timeOrigin")}}.
- `contributingSources`
  - : Một {{jsxref("Array")}} các nguồn (ssrc) đã đóng góp cho khung. Hãy xem xét trường hợp của một ứng dụng hội nghị kết hợp âm thanh từ nhiều người dùng. `synchronizationSource` sẽ bao gồm ssrc của ứng dụng, trong khi `contributingSources` sẽ bao gồm các giá trị ssrc của tất cả các nguồn âm thanh riêng lẻ.
- `mimeType`
  - : Một chuỗi chứa {{glossary("MIME type")}} của codec được sử dụng, chẳng hạn như "audio/opus".
- `payloadType`
  - : Một giá trị số nguyên dương trong phạm vi từ 0 đến 127 mô tả định dạng của payload RTP. Ánh xạ giá trị sang định dạng được định nghĩa trong {{rfc("3550")}}, và cụ thể hơn là [Mục 6: Định nghĩa Payload Type](https://www.rfc-editor.org/rfc/rfc3551#section-6) của {{rfc("3551")}}.
- `receiveTime`
  - : Một {{domxref("DOMHighResTimeStamp")}} chỉ ra dấu thời gian của gói cuối cùng nhận được của một khung đến (từ {{domxref("RTCRtpReceiver")}}) được sử dụng để tạo ra khung phương tiện này, tương đối với {{domxref("Performance.timeOrigin")}}.
- `rtpTimestamp`
  - : Một số nguyên dương phản ánh thời điểm lấy mẫu của octet đầu tiên trong gói dữ liệu RTP (xem {{rfc("3550")}}).
- `sequenceNumber`
  - : Số thứ tự của một khung âm thanh đến (không được dùng cho các khung đi) có thể dùng để tái tạo thứ tự gửi gốc của các khung. Đây là số từ 0 đến 32767. Lưu ý rằng trong khi các số được phân bổ tuần tự khi gửi, chúng sẽ tràn ở 32767 và khởi động lại từ 0. Do đó để so sánh hai số thứ tự khung, để xác định cái nào được giả định là sau cái nào, bạn phải sử dụng [số học số serial](https://en.wikipedia.org/wiki/Serial_number_arithmetic).
- `synchronizationSource`
  - : Một giá trị số nguyên dương chỉ ra nguồn đồng bộ hóa ("ssrc") của luồng các gói RTP được mô tả bởi khung này. Một nguồn có thể là một microphone, hoặc một ứng dụng mixer kết hợp nhiều nguồn. Tất cả các gói từ cùng một nguồn chia sẻ cùng một nguồn thời gian và không gian thứ tự, do đó có thể được sắp xếp tương đối với nhau. Lưu ý rằng hai khung có cùng giá trị đề cập đến cùng một nguồn.

## Ví dụ

### Lấy siêu dữ liệu khung

[WebRTC encoded transform](/en-US/docs/Web/API/WebRTC_API/Using_Encoded_Transforms) này cho thấy cách bạn có thể lấy siêu dữ liệu khung trong hàm `transform()` và ghi nhật ký nó.

```js
addEventListener("rtctransform", (event) => {
  const transform = new TransformStream({
    async transform(encodedFrame, controller) {
      // Lấy siêu dữ liệu và ghi nhật ký
      const frameMetaData = encodedFrame.getMetadata();
      console.log(frameMetaData);

      // Thêm khung vào hàng đợi mà không sửa đổi
      controller.enqueue(encodedFrame);
    },
  });
  event.transformer.readable
    .pipeThrough(transform)
    .pipeTo(event.transformer.writable);
});
```

Đối tượng kết quả từ một microphone cục bộ có thể trông giống như đối tượng dưới đây. Lưu ý rằng không có nguồn đóng góp vì chỉ có một nguồn, và không có `sequenceNumber` vì đây là khung đi.

```json
{
  "captureTime": 19745.400000000373,
  "contributingSources": [],
  "mimeType": "audio/opus",
  "payloadType": 111,
  "rtpTimestamp": 1786045165,
  "synchronizationSource": 3365032712,
  "audioLevel": 0.001584893192461114
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using WebRTC Encoded Transforms](/en-US/docs/Web/API/WebRTC_API/Using_Encoded_Transforms)
