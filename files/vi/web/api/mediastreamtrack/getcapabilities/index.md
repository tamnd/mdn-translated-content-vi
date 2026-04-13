---
title: "MediaStreamTrack: phương thức getCapabilities()"
short-title: getCapabilities()
slug: Web/API/MediaStreamTrack/getCapabilities
page-type: web-api-instance-method
browser-compat: api.MediaStreamTrack.getCapabilities
---

{{APIRef("Media Capture and Streams")}}

Phương thức **`getCapabilities()`** của
giao diện {{domxref("MediaStreamTrack")}} trả về một đối tượng mô tả các giá trị được chấp nhận hoặc phạm vi giá trị cho mỗi thuộc tính có thể ràng buộc của `MediaStreamTrack` được liên kết, dựa trên nền tảng và {{Glossary("user agent")}}.

Khi bạn biết khả năng của trình duyệt, tập lệnh của bạn có thể sử dụng
{{domxref("MediaStreamTrack.applyConstraints", "applyConstraints()")}} để yêu cầu
track được cấu hình để khớp với các cài đặt lý tưởng hoặc chấp nhận được. Xem [Khả năng, ràng buộc và cài đặt](/vi/docs/Web/API/Media_Capture_and_Streams_API/Constraints) để biết chi tiết về cách làm việc với các thuộc tính có thể ràng buộc.

## Cú pháp

```js-nolint
getCapabilities()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng `MediaTrackCapabilities` chỉ định giá trị được chấp nhận hoặc phạm vi giá trị được hỗ trợ cho mỗi thuộc tính có thể ràng buộc của tác nhân người dùng. Lưu ý rằng không phải mọi thuộc tính đều xuất hiện trên mọi track, các thành viên khả dụng phụ thuộc vào việc track là âm thanh hay video. Đối tượng này có thể chứa các thành viên sau:

Cho cả track âm thanh và video:

- `deviceId`
  - : Một chuỗi xác định thiết bị thu nhận.
- `groupId`
  - : Một chuỗi nhóm các thiết bị liên quan.

> [!NOTE]
> Vì lý do lịch sử, hai thuộc tính này là chuỗi thay vì một mảng chuỗi như tất cả các khả năng khác.

Chỉ cho track âm thanh:

- `autoGainControl`
  - : Một mảng các boolean. Nếu nguồn không thể điều khiển tăng tự động, một giá trị `false` duy nhất được báo cáo. Nếu không thể tắt điều khiển tăng tự động, một giá trị `true` duy nhất được báo cáo. Nếu tập lệnh có thể điều khiển tính năng này, nguồn báo cáo cả `true` và `false`.
- `channelCount`
  - : Một đối tượng phạm vi, chứa thuộc tính `min` và `max` (cả hai chứa một số nguyên không âm), mô tả số kênh được hỗ trợ.
- `echoCancellation`
  - : Một mảng các boolean hoặc chuỗi cho biết liệu hủy tiếng vọng có được hỗ trợ hay không. Nếu nguồn không thể hủy tiếng vọng, một giá trị `false` duy nhất được báo cáo. Nếu nguồn có thể hủy tiếng vọng, thì mảng bắt đầu bằng `true`. Nếu tập lệnh có thể điều khiển tính năng này, thì mảng bắt đầu bằng `true, false`. Ngoài ra, nếu nguồn cho phép điều khiển các nguồn âm thanh nào sẽ được hủy, mảng cũng bao gồm các giá trị `"all"` và/hoặc `"remote-only"`.
- `latency`
  - : Một đối tượng phạm vi, chứa thuộc tính `min` và `max` (cả hai chứa một số), mô tả lượng độ trễ dự tính bằng giây từ khi âm thanh bắt đầu đến khi dữ liệu trở nên khả dụng.
- `noiseSuppression`
  - : Một mảng các boolean cho biết liệu khử tiếng ồn có khả dụng hay không. Nếu nguồn không thể khử tiếng ồn, một giá trị `false` duy nhất được báo cáo. Nếu không thể tắt khử tiếng ồn, một giá trị `true` duy nhất được báo cáo. Nếu tập lệnh có thể điều khiển tính năng này, nguồn báo cáo cả `true` và `false`.
- `sampleRate`
  - : Một đối tượng phạm vi, chứa thuộc tính `min` và `max` (cả hai chứa một số nguyên không âm), mô tả phạm vi tốc độ mẫu âm thanh được hỗ trợ.
- `sampleSize`
  - : Một đối tượng phạm vi, chứa thuộc tính `min` và `max` (cả hai chứa một số nguyên không âm), mô tả phạm vi kích thước mẫu tuyến tính được hỗ trợ bằng bit.

Chỉ cho track video:

- `aspectRatio`
  - : Một đối tượng phạm vi, chứa thuộc tính `min` và `max` (cả hai chứa một số), mô tả phạm vi tỷ lệ khung hình video được hỗ trợ (chiều rộng chia cho chiều cao).
- `facingMode`
  - : Một mảng các chuỗi cho biết hướng máy ảnh. Xem {{domxref("MediaTrackConstraints.facingMode")}} để biết các giá trị được hỗ trợ. Trên một số thiết bị, nhiều hơn một hướng máy ảnh có thể được báo cáo; ví dụ: trong một giải pháp hiện diện từ xa cao cấp với nhiều máy ảnh hướng về phía người dùng, một máy ảnh bên trái người dùng có thể báo cáo cả `"left"` và `"user"`.
- `frameRate`
  - : Một đối tượng phạm vi, chứa thuộc tính `min` và `max` (cả hai chứa một số), mô tả phạm vi khung hình mỗi giây được hỗ trợ.
- `height`
  - : Một đối tượng phạm vi, chứa thuộc tính `min` và `max` (cả hai chứa một số nguyên không âm), mô tả phạm vi chiều cao được hỗ trợ bằng pixel.
- `width`
  - : Một đối tượng phạm vi, chứa thuộc tính `min` và `max` (cả hai chứa một số nguyên không âm), mô tả phạm vi chiều rộng được hỗ trợ bằng pixel.
- `resizeMode`
  - : Một mảng các chuỗi cho biết cách tác nhân người dùng có thể suy ra độ phân giải mong muốn từ độ phân giải máy ảnh. Xem {{domxref("MediaTrackConstraints.resizeMode")}} để biết các giá trị được hỗ trợ. Giá trị `"none"` luôn được bao gồm.

Để biết thêm thông tin về ý nghĩa của mỗi thuộc tính, xem {{domxref("MediaTrackConstraints")}}.

## Ví dụ

Đoạn mã sau đây sẽ yêu cầu người dùng cấp quyền truy cập vào máy ảnh và micro cục bộ của họ. Sau khi được cấp quyền, các đối tượng `MediaTrackCapabilities` sẽ được ghi vào bảng điều khiển mô tả khả năng của mỗi {{domxref("MediaStreamTrack")}}:

```js
navigator.mediaDevices
  .getUserMedia({ video: true, audio: true })
  .then((stream) => {
    const tracks = stream.getTracks();
    tracks.map((t) => console.log(t.getCapabilities()));
  });
```

Một đối tượng khả năng ví dụ trông như thế này:

```json
{
  "autoGainControl": [true, false],
  "channelCount": {
    "max": 1,
    "min": 1
  },
  "deviceId": "jjxEMqxIhGdryqbTjDrXPWrkjy55Vte70kWpMe3Lge8=",
  "echoCancellation": [true, false],
  "groupId": "o2tZiEj4MwOdG/LW3HwkjpLm1D8URat4C5kt742xrVQ=",
  "noiseSuppression": [true, false]
}
```

Nội dung chính xác của đối tượng sẽ phụ thuộc vào trình duyệt và phần cứng phương tiện.

## Đặc tả kỹ thuật

{{Specifications}}

## Hỗ trợ trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("InputDeviceInfo.getCapabilities()")}}, cũng trả về một đối tượng `MediaTrackCapabilities`.
