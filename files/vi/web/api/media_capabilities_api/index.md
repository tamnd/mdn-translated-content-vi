---
title: Media Capabilities API
slug: Web/API/Media_Capabilities_API
page-type: web-api-overview
browser-compat: api.MediaCapabilities
---

{{DefaultAPISidebar("Media Capabilities API")}}{{AvailableInWorkers}}

**Media Capabilities API** cho phép các nhà phát triển xác định khả năng giải mã và mã hóa của thiết bị, cung cấp thông tin như liệu media có được hỗ trợ hay không và liệu việc phát lại có mượt mà và tiết kiệm điện năng hay không.

## Khái niệm

Có rất nhiều codec video và âm thanh. Các trình duyệt khác nhau hỗ trợ các loại media khác nhau và các loại media mới liên tục được phát triển. Với Media Capabilities API, các nhà phát triển có thể đảm bảo mỗi người dùng đạt được tốc độ bit và tiết kiệm dung lượng tốt nhất cho khả năng trình duyệt, thiết bị và hệ điều hành của họ.

Việc thiết bị sử dụng giải mã phần cứng hay phần mềm ảnh hưởng đến mức độ mượt mà và tiết kiệm điện năng khi giải mã video. Media Capabilities API cho phép các nhà phát triển xác định codec nào được hỗ trợ và tệp media sẽ hoạt động hiệu quả như thế nào về cả độ mượt mà lẫn tiêu thụ điện năng.

Media Capabilities API cung cấp các tính năng mạnh mẽ hơn so với các API khác như {{DOMxref("MediaRecorder.isTypeSupported_static", "MediaRecorder.isTypeSupported()")}} hay {{DOMxRef("HTMLMediaElement.canPlayType()")}}, vốn chỉ xử lý hỗ trợ chung của trình duyệt mà không tính đến hiệu suất.

Để kiểm tra hỗ trợ, độ mượt mà và tiết kiệm điện cho việc mã hóa và giải mã nội dung video hoặc âm thanh, hãy sử dụng các phương thức {{DOMxRef("MediaCapabilities.encodingInfo()","encodingInfo()")}} và {{DOMxRef("MediaCapabilities.decodingInfo()","decodingInfo()")}} của giao diện {{DOMxRef("MediaCapabilities")}}.

## Giao diện

- {{DOMxRef("MediaCapabilities")}}
  - : Cung cấp thông tin về khả năng giải mã của thiết bị, hệ thống và trình duyệt dựa trên codec, cấu hình, độ phân giải và tốc độ bit. Thông tin này có thể được dùng để cung cấp luồng media tối ưu cho người dùng và xác định liệu việc phát lại có mượt mà và tiết kiệm điện năng hay không.

### Mở rộng sang các giao diện khác

- {{domxref("Navigator.mediaCapabilities")}} {{readonlyinline}}
  - : Một đối tượng {{domxref("MediaCapabilities")}} có thể cung cấp thông tin về khả năng giải mã và mã hóa cho một định dạng media và khả năng đầu ra nhất định.
- {{DOMxRef("WorkerNavigator.mediaCapabilities")}} {{readonlyinline}}
  - : Một đối tượng {{domxref("MediaCapabilities")}} có thể cung cấp thông tin về khả năng giải mã và mã hóa cho một định dạng media và khả năng đầu ra nhất định.

## Ví dụ

### Phát hiện hỗ trợ tệp âm thanh và hiệu suất dự kiến

Ví dụ này định nghĩa cấu hình âm thanh rồi kiểm tra xem tác nhân người dùng có hỗ trợ giải mã cấu hình media đó hay không, và liệu nó có hoạt động tốt về độ mượt mà và tiết kiệm điện năng hay không.

```js
if ("mediaCapabilities" in navigator) {
  const audioFileConfiguration = {
    type: "file",
    audio: {
      contentType: "audio/mp3",
      channels: 2,
      bitrate: 132700,
      samplerate: 5200,
    },
  };

  navigator.mediaCapabilities
    .decodingInfo(audioFileConfiguration)
    .then((result) => {
      console.log(
        `This configuration is ${result.supported ? "" : "not "}supported,`,
      );
      console.log(`${result.smooth ? "" : "not "}smooth, and`);
      console.log(`${result.powerEfficient ? "" : "not "}power efficient.`);
    })
    .catch(() => {
      console.log(`decodingInfo error: ${contentType}`);
    });
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phương thức [canPlayType()](/en-US/docs/Web/API/HTMLMediaElement/canPlayType) của [HTMLMediaElement](/en-US/docs/Web/API/HTMLMediaElement)
- Phương thức [isTypeSupported()](/en-US/docs/Web/API/MediaSource/isTypeSupported_static) của [MediaSource](/en-US/docs/Web/API/MediaSource)
- [Sử dụng Media Capabilities API](/en-US/docs/Web/API/Media_Capabilities_API/Using_the_Media_Capabilities_API)
