---
title: "Navigator: phương thức requestMediaKeySystemAccess()"
short-title: requestMediaKeySystemAccess()
slug: Web/API/Navigator/requestMediaKeySystemAccess
page-type: web-api-instance-method
browser-compat: api.Navigator.requestMediaKeySystemAccess
---

{{APIRef("Encrypted Media Extensions")}}{{SecureContext_Header}}

Phương thức **`requestMediaKeySystemAccess()`** của giao diện {{domxref("Navigator")}} trả về {{jsxref('Promise')}} cung cấp đối tượng {{domxref('MediaKeySystemAccess')}} có thể được sử dụng để truy cập hệ thống khóa phương tiện cụ thể, sau đó có thể được sử dụng để tạo khóa để giải mã luồng phương tiện.

Phương pháp này là một phần của [Encrypted Media Extensions API](/en-US/docs/Web/API/Encrypted_Media_Extensions_API), mang đến sự hỗ trợ cho phương tiện được mã hóa và video được bảo vệ DRM cho web.

Phương pháp này có thể có những tác động mà người dùng có thể nhìn thấy như yêu cầu quyền truy cập vào một hoặc nhiều tài nguyên hệ thống.
Hãy cân nhắc điều đó khi quyết định thời điểm gọi `requestMediaKeySystemAccess()`; bạn không muốn những yêu cầu đó xảy ra vào những thời điểm bất tiện.
Theo nguyên tắc chung, hàm này chỉ nên được gọi khi đến lúc tạo và sử dụng đối tượng {{domxref("MediaKeys")}} bằng cách gọi phương thức {{domxref("MediaKeySystemAccess.createMediaKeys", "createMediaKeys()")}} của đối tượng {{domxref("MediaKeySystemAccess")}} được trả về.

## Cú pháp

```js-nolint
requestMediaKeySystemAccess(keySystem, supportedConfigurations)
```

### Thông số

- `keySystem`
  - : Một chuỗi xác định hệ thống khóa.
    Ví dụ: `com.example.some-system` hoặc `org.w3.clearkey`.
- `supportedConfigurations`
  - : {{jsxref('Array')}} không trống của các đối tượng phù hợp với đối tượng được trả về bởi {{domxref("MediaKeySystemAccess.getConfiguration")}}.
    Phần tử đầu tiên có cấu hình phù hợp sẽ được sử dụng.

Mỗi đối tượng có thể có các thuộc tính sau:

> [!LƯU Ý]
> `videoCapabilities` hoặc `audioCapabilities` có thể trống, nhưng không được cả hai!

    - `label` {{optional_inline}}
      - : Nhãn tùy chọn cho cấu hình, mặc định là `""`.
        Nhãn này được giữ nguyên cho các cấu hình được tìm nạp bằng {{domxref("MediaKeySystemAccess.getConfiguration")}}
    - `initDataTypes`
      - : Một mảng các chuỗi cho biết tên kiểu dữ liệu cho các định dạng dữ liệu khởi tạo được hỗ trợ (mặc định là một mảng trống).
        Những tên này là những tên như `"cenc"`, `"keyids"` và `"webm"` được xác định trong [Encrypted Media Extensions Initialization Data Format Registry](https://w3c.github.io/encrypted-media/format-registry/initdata/).
    - `audioCapabilities`
      - : Một loạt các khả năng âm thanh được hỗ trợ.
        Nếu mảng trống thì loại nội dung không hỗ trợ khả năng âm thanh.

Mỗi đối tượng trong mảng có các thuộc tính sau: - `contentType` - : Một chuỗi biểu thị loại MIME phương tiện của tài nguyên phương tiện, chẳng hạn như `"audio/mp4;codecs=\"mp4a.40.2\"`.
Lưu ý rằng chuỗi trống không hợp lệ và nếu định nghĩa loại MIME bao gồm các tham số, chẳng hạn như `codecs`, thì các tham số này cũng phải được đưa vào. - `encryptionScheme` - : Lược đồ mã hóa liên quan đến loại nội dung, chẳng hạn như `cenc`, `cbcs`, `cbcs-1-9`.
Giá trị này phải được đặt bởi một ứng dụng (mặc định là `null`, cho biết rằng mọi sơ đồ mã hóa đều có thể được sử dụng). - `robustness` - : Mức độ mạnh mẽ liên quan đến loại nội dung.
Chuỗi trống cho biết mọi khả năng giải mã và giải mã loại nội dung đều được chấp nhận.

- `videoCapabilities` - : Một loạt các khả năng video được hỗ trợ.
  Các đối tượng trong mảng có dạng giống như trong `audioCapabilities`.

- `distinctiveIdentifier` - : Một chuỗi cho biết liệu việc triển khai có thể sử dụng "số nhận dạng đặc biệt" (hoặc số nhận dạng cố định đặc biệt) cho bất kỳ hoạt động nào được liên kết với bất kỳ đối tượng nào được tạo từ cấu hình này hay không.
  Các giá trị được phép là: - `required` - : Đối tượng trả về phải hỗ trợ tính năng này. - `optional` - : Đối tượng trả về có thể hỗ trợ tính năng này.
  Đây là mặc định - `not-allowed` - : Đối tượng trả về không được hỗ trợ hoặc sử dụng tính năng này.

- `persistentState` - : Một chuỗi cho biết liệu đối tượng được trả về có phải có khả năng duy trì dữ liệu phiên hay bất kỳ loại trạng thái nào khác hay không.
  Các giá trị giống như đối với `distinctiveIdentifier` và có cùng ý nghĩa: `required`, `optional` (mặc định), `not-allowed`.
  Chỉ có thể tạo các phiên "tạm thời" khi không cho phép trạng thái liên tục.

- `sessionTypes` - : Một chuỗi các chuỗi cho biết loại phiên phải được hỗ trợ.
  Các giá trị được phép bao gồm: - `temporary` - : Phiên mà giấy phép, (các) khóa và bản ghi hoặc dữ liệu liên quan đến phiên không được duy trì.
  Ứng dụng không cần quản lý việc lưu trữ như vậy.
  Việc triển khai phải hỗ trợ tùy chọn này và đây là tùy chọn mặc định. - `persistent-license` - : Phiên mà giấy phép (và có thể cả dữ liệu khác liên quan đến phiên) sẽ được duy trì.
  Bản ghi về giấy phép và các khóa liên quan vẫn tồn tại ngay cả khi giấy phép bị hủy, cung cấp chứng thực rằng giấy phép và (các) khóa chứa trong đó không còn có thể sử dụng được bởi khách hàng.

### Giá trị trả về

{{jsxref('Promise')}} đáp ứng đối tượng {{domxref('MediaKeySystemAccess')}} đại diện cho cấu hình hệ thống khóa phương tiện được mô tả bởi `keySystem` và `supportedConfigurations`.

### Ngoại lệ

Trong trường hợp có lỗi, {{jsxref('Promise')}} được trả về sẽ bị từ chối cùng với {{domxref('DOMException')}} có tên cho biết loại lỗi nào đã xảy ra.

- `NotSupportedError` {{domxref("DOMException")}}
  - : `keySystem` đã chỉ định không được nền tảng hoặc trình duyệt hỗ trợ hoặc không có cấu hình nào do `supportedConfigurations` chỉ định có thể được đáp ứng (ví dụ: nếu không có `codecs` nào được chỉ định trong `contentType`).
- `SecurityError` {{domxref("DOMException")}}
  - : Việc sử dụng tính năng này đã bị [`Permissions-Policy: encrypted-media`](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy/encrypted-media) chặn.
- {{jsxref("TypeError")}}
  - : `keySystem` là một chuỗi trống hoặc mảng `supportedConfigurations` trống.

## Ví dụ

Ví dụ bên dưới cho thấy cách bạn có thể sử dụng `requestMediaKeySystemAccess()`, chỉ định cấu hình và hệ thống chính.

```js
const clearKeyOptions = [
  {
    initDataTypes: ["keyids", "webm"],
    audioCapabilities: [
      { contentType: 'audio/webm; codecs="opus"' },
      { contentType: 'audio/webm; codecs="vorbis"' },
    ],
    videoCapabilities: [
      { contentType: 'video/webm; codecs="vp9"' },
      { contentType: 'video/webm; codecs="vp8"' },
    ],
  },
];

navigator
  .requestMediaKeySystemAccess("org.w3.clearkey", clearKeyOptions)
  .then((keySystemAccess) => {
    /* use the access to get create keys */
  });
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [Encrypted Media Extensions API](/en-US/docs/Web/API/Encrypted_Media_Extensions_API)
- [Media Capture and Streams API](/en-US/docs/Web/API/Media_Capture_and_Streams_API)
- [WebRTC API](/en-US/docs/Web/API/WebRTC_API)
- {{domxref("MediaCapabilities.decodingInfo()")}}
