---
title: "RTCRtpReceiver: phương thức getSynchronizationSources()"
short-title: getSynchronizationSources()
slug: Web/API/RTCRtpReceiver/getSynchronizationSources
page-type: web-api-instance-method
browser-compat: api.RTCRtpReceiver.getSynchronizationSources
---

{{APIRef("WebRTC API")}}

Phương thức **`getSynchronizationSources()`** của giao diện {{domxref("RTCRtpReceiver")}} trả về một mảng các đối tượng, mỗi đối tượng tương ứng với một định danh SSRC (synchronization source) được `RTCRtpReceiver` hiện tại nhận trong mười giây gần nhất.

## Cú pháp

```js-nolint
getSynchronizationSources()
```

### Tham số

Không có.

### Giá trị trả về

Một mảng các đối tượng, mỗi đối tượng mô tả một trong các synchronization source đã cung cấp dữ liệu cho luồng đầu vào trong mười giây qua.
Các đối tượng này chứa các thuộc tính sau:

- `audioLevel`
  - : Một giá trị số thực từ 0.0 đến 1.0 chỉ mức âm thanh chứa trong gói RTP cuối cùng được phát từ synchronization source.

    Giá trị này nằm trên thang tuyến tính và được xác định theo đơn vị dBov, hoặc decibel (overload).
    Đây là biên độ tương đối so với điểm mà tại đó clipping âm thanh bắt đầu xảy ra.
    Giá trị 1.0 biểu thị 0 dBov (âm lượng tối đa), giá trị 0.0 biểu thị im lặng, và giá trị 0.5 biểu thị thay đổi xấp xỉ 6 dB SPL trong mức áp suất âm thanh từ 0 dBov.

    Giá trị này là bắt buộc và luôn xuất hiện.

- `rtpTimestamp` {{optional_inline}}
  - : RTP timestamp (một số nguyên {{domxref("DOMHighResTimeStamp")}}) của media.
    Dấu thời gian do nguồn tạo này cho biết thời điểm media trong gói này, được lên lịch phát tại thời điểm do `timestamp` chỉ định, được lấy mẫu hoặc tạo ban đầu.
    Nó có thể hữu ích cho mục đích sắp xếp thứ tự và đồng bộ hóa.

- `source` {{optional_inline}}
  - : Một giá trị số nguyên dương chỉ định định danh SSRC của synchronization source.
    Điều này định danh duy nhất nguồn của các gói RTP thuộc luồng cụ thể.

- `timestamp` {{optional_inline}}
  - : Một {{domxref("DOMHighResTimeStamp")}} cho biết thời điểm gần nhất mà một khung hình xuất phát từ nguồn này được chuyển tới {{domxref("MediaStreamTrack")}} của bộ nhận.

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}
