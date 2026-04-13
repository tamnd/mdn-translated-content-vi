---
title: "MediaCapabilities: phương thức encodingInfo()"
short-title: encodingInfo()
slug: Web/API/MediaCapabilities/encodingInfo
page-type: web-api-instance-method
browser-compat: api.MediaCapabilities.encodingInfo
---

{{APIRef("Media Capabilities API")}}{{AvailableInWorkers}}

Phương thức **`encodingInfo()`** của giao diện {{domxref("MediaCapabilities")}} trả về một promise được thực hiện với khả năng mã hóa phương tiện của cấu hình phương tiện được kiểm tra. Promise chứa ba thuộc tính boolean `supported`, `smooth`, và `powerefficient`, mô tả mức độ tương thích của thiết bị với loại phương tiện.

## Cú pháp

```js-nolint
encodingInfo(configuration)
```

### Tham số

- `configuration`
  - : Một đối tượng với thuộc tính `type` và _hoặc_ thuộc tính `video` hoặc `audio` chứa cấu hình của loại phù hợp:
    - `type`
      - : Loại phương tiện đang được kiểm tra. Nhận một trong hai giá trị:
        - `record`
          - : Đại diện cho cấu hình ghi phương tiện, ví dụ sử dụng {{domxref("MediaRecorder")}}.
        - `webrtc`
          - : Đại diện cho cấu hình được truyền qua phương tiện điện tử (ví dụ sử dụng {{domxref("RTCPeerConnection")}}). **Lưu ý:** Firefox sử dụng `transmission` cho loại này, và `webrtc` không hoạt động.
        - `transmission` {{non-standard_inline}}
          - : Từ đồng nghĩa của `webrtc` để sử dụng trong Firefox.

    - `video`
      - : Đối tượng cấu hình cho nguồn phương tiện video. Có các thuộc tính sau:
        - `contentType`
          - : Chuỗi chứa loại MIME video hợp lệ, và (tùy chọn) tham số [`codecs`](/en-US/docs/Web/Media/Guides/Formats/codecs_parameter).
        - `width`
          - : Chiều rộng của video.
        - `height`
          - : Chiều cao của video.
        - `bitrate`
          - : Số bit được sử dụng để mã hóa một giây của tệp video.
        - `framerate`
          - : Số khung hình tạo nên một giây phát lại video.

    - `audio`
      - : Đối tượng cấu hình cho nguồn phương tiện âm thanh. Có các thuộc tính sau:
        - `contentType`
          - : Chuỗi chứa loại MIME âm thanh hợp lệ, và (tùy chọn) tham số [`codecs`](/en-US/docs/Web/Media/Guides/Formats/codecs_parameter).
        - `channels`
          - : Số kênh được sử dụng bởi track âm thanh.
        - `bitrate`
          - : Số bit được sử dụng để mã hóa một giây của tệp âm thanh.
        - `samplerate`
          - : Số mẫu âm thanh tạo nên một giây của tệp âm thanh.

### Giá trị trả về

Một {{jsxref('Promise')}} được thực hiện với một đối tượng chứa ba thuộc tính Boolean:

- `supported`
  - : `true` nếu nội dung phương tiện có thể được mã hóa. Nếu không, là `false`.
- `smooth`
  - : `true` nếu việc phát lại phương tiện sẽ mượt mà (chất lượng cao). Nếu không là `false`.
- `powerEfficient`
  - : `true` nếu việc phát lại phương tiện sẽ tiết kiệm điện. Nếu không, là `false`.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném nếu `configuration` truyền vào phương thức `encodingInfo()` không hợp lệ, có thể vì loại không phải video hoặc audio, `contentType` không phải loại MIME codec hợp lệ, hoặc có lỗi khác trong cấu hình phương tiện.

## Ví dụ

```js
// Create media configuration to be tested
const mediaConfig = {
  type: "record", // or 'transmission'
  video: {
    contentType: "video/webm;codecs=vp8.0", // valid content type
    width: 1920, // width of the video
    height: 1080, // height of the video
    bitrate: 120000, // number of bits used to encode 1s of video
    framerate: 48, // number of frames making up that 1s.
  },
};

// check support and performance
navigator.mediaCapabilities.encodingInfo(mediaConfig).then((result) => {
  console.log(
    `This configuration is ${result.supported ? "" : "not "}supported,`,
  );
  console.log(`${result.smooth ? "" : "not "}smooth, and`);
  console.log(`${result.powerEfficient ? "" : "not "}power efficient.`);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("MediaCapabilities.decodingInfo()")}}
