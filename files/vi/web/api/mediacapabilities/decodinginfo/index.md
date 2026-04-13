---
title: "MediaCapabilities: phương thức decodingInfo()"
short-title: decodingInfo()
slug: Web/API/MediaCapabilities/decodingInfo
page-type: web-api-instance-method
browser-compat: api.MediaCapabilities.decodingInfo
---

{{APIRef("Media Capabilities API")}}{{AvailableInWorkers}}

Phương thức **`decodingInfo()`** của giao diện {{domxref("MediaCapabilities")}} trả về một promise được thực hiện với thông tin về mức độ tốt mà user agent có thể giải mã/hiển thị phương tiện với một cấu hình nhất định.

Đối tượng được giải quyết chứa ba thuộc tính boolean `supported`, `smooth`, và `powerefficient`, cho biết liệu việc giải mã phương tiện được mô tả có được hỗ trợ hay không, và nếu có, liệu việc giải mã có mượt mà và tiết kiệm điện hay không.

Phương thức cũng có thể được sử dụng để kiểm tra khả năng của user agent để giải mã phương tiện được mã hóa bằng hệ thống khóa, nhưng chỉ khi được gọi trong luồng chính và trong ngữ cảnh bảo mật. Nếu cấu hình được truyền trong thuộc tính `configuration.keySystemConfiguration` được hỗ trợ để giải mã dữ liệu, promise được giải quyết cũng bao gồm đối tượng {{domxref("MediaKeySystemAccess")}} có thể được sử dụng để tạo đối tượng {{domxref("MediaKeys")}} để thiết lập phát lại được mã hóa.

> [!NOTE]
> Gọi `decodingInfo()` với thuộc tính này có thể dẫn đến các hiệu ứng hiển thị cho người dùng, chẳng hạn như yêu cầu quyền truy cập vào một hoặc nhiều tài nguyên hệ thống. Do đó, hàm này chỉ nên được gọi khi ứng dụng sẵn sàng tạo và sử dụng đối tượng `MediaKeys` với cấu hình được cung cấp.

## Cú pháp

```js-nolint
decodingInfo(configuration)
```

### Tham số

- `configuration`
  - : Một đối tượng với thuộc tính `type`, _hoặc_ thuộc tính `video` hoặc `audio` chứa cấu hình của loại phù hợp, và tùy chọn `keySystemConfiguration` khi giải mã phương tiện được mã hóa bằng hệ thống khóa:
    - `type`
      - : Loại phương tiện đang được kiểm tra. Nhận một trong ba giá trị:
        - `file`
          - : Đại diện cho cấu hình được dùng cho phát lại tệp thuần.
        - `media-source`
          - : Đại diện cho cấu hình được dùng cho phát lại {{domxref("MediaSource")}}.
        - `webrtc`
          - : Đại diện cho cấu hình được dùng để nhận qua {{domxref("RTCPeerConnection")}} (không cho phép khi `keySystemConfiguration` được đặt).

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

    - `keySystemConfiguration` {{optional_inline}}
      - : Đối tượng chỉ định cấu hình hệ thống khóa cho phương tiện được mã hóa.

        > [!NOTE]
        > [`Navigator.requestMediaKeySystemAccess()`](/en-US/docs/Web/API/Navigator/requestMediaKeySystemAccess) nhận mảng một số loại dữ liệu tương tự trong đối số `supportedConfigurations` của nó.

        Nếu được chỉ định, [`type`](#type) phải là `media-source` hoặc `file` (không phải `webrtc`). Có các thuộc tính sau:
        - `keySystem`
          - : Chuỗi xác định hệ thống khóa phương tiện. Ví dụ `org.w3.clearkey` hoặc `com.widevine.alpha`.

        - `initDataType` {{optional_inline}}
          - : Chuỗi chỉ định tên loại dữ liệu của định dạng dữ liệu khởi tạo, chẳng hạn như `"cenc"`, `"keyids"` và `"webm"`.

        - `distinctiveIdentifier` {{optional_inline}}
          - : Chuỗi chỉ định liệu việc triển khai có thể sử dụng "định danh đặc biệt" cho bất kỳ hoạt động nào liên quan đến bất kỳ đối tượng nào được tạo từ cấu hình này. Các giá trị được phép:
            - `required`: Đối tượng trả về phải hỗ trợ tính năng này.
            - `optional`: Đối tượng trả về có thể hỗ trợ tính năng này. Đây là giá trị mặc định.
            - `not-allowed`: Đối tượng trả về không được hỗ trợ hoặc sử dụng tính năng này.

        - `persistentState` {{optional_inline}}
          - : Chuỗi chỉ định liệu đối tượng trả về có thể duy trì dữ liệu phiên hoặc bất kỳ loại trạng thái nào khác. Các giá trị được phép:
            - `required`: Đối tượng trả về phải hỗ trợ tính năng này.
            - `optional`: Đối tượng trả về có thể hỗ trợ tính năng này. Đây là giá trị mặc định.
            - `not-allowed`: Đối tượng trả về không được hỗ trợ hoặc sử dụng tính năng này. Chỉ có thể tạo các phiên "temporary" khi trạng thái liên tục không được phép.

        - `sessionTypes` {{optional_inline}}
          - : Mảng các chuỗi chỉ định các loại phiên phải được hỗ trợ. Các giá trị được phép:
            - `temporary`: Phiên mà giấy phép, khóa và bản ghi liên quan đến phiên không được duy trì.
            - `persistent-license`: Phiên mà giấy phép (và có thể dữ liệu liên quan) sẽ được duy trì.

        - `audio` {{optional_inline}}
          - : Cấu hình track hệ thống khóa âm thanh liên quan đến [`audio` configuration](#audio) ở trên.
            - `encryptionScheme`: Sơ đồ mã hóa liên quan đến loại nội dung, chẳng hạn `cenc`, `cbcs`, `cbcs-1-9`.
            - `robustness`: Mức độ mạnh mẽ liên quan đến loại nội dung.

        - `video` {{optional_inline}}
          - : Cấu hình track hệ thống khóa video liên quan đến [`video` configuration](#video) ở trên.
            - `encryptionScheme`: Sơ đồ mã hóa liên quan đến loại nội dung, chẳng hạn `cenc`, `cbcs`, `cbcs-1-9`.
            - `robustness`: Mức độ mạnh mẽ liên quan đến loại nội dung.

### Giá trị trả về

Một {{jsxref('Promise')}} được thực hiện với một đối tượng chứa các thuộc tính sau:

- `supported`
  - : `true` nếu nội dung phương tiện có thể được giải mã. Nếu không, là `false`.
- `smooth`
  - : `true` nếu việc phát lại phương tiện có thể được phát ở tốc độ khung hình được chỉ định mà không cần bỏ khung hình. Nếu không là `false`.
- `powerEfficient`
  - : `true` nếu việc phát lại phương tiện sẽ tiết kiệm điện. Nếu không, là `false`.
- `keySystemAccess`
  - : Một {{domxref("MediaKeySystemAccess")}} có thể được sử dụng để tạo đối tượng {{domxref("MediaKeys")}} để thiết lập phát lại được mã hóa, hoặc `null` nếu việc giải mã không được hỗ trợ với cấu hình được cung cấp.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném nếu `configuration` truyền vào phương thức `decodingInfo()` không hợp lệ.

- `InvalidStateError` {{domxref("DOMException")}}
  - : Phương thức được gọi trong worker khi [`configuration.keySystemConfiguration`](#keysystemconfiguration) được định nghĩa.

- `SecurityError` {{domxref("DOMException")}}
  - : Phương thức được gọi ngoài ngữ cảnh bảo mật và [`configuration.keySystemConfiguration`](#keysystemconfiguration) được định nghĩa.

## Ghi chú sử dụng

### So sánh với Navigator.requestMediaKeySystemAccess()

`decodingInfo()` và phương thức {{domxref("Navigator.requestMediaKeySystemAccess()")}} của [Encrypted Media Extensions API](/en-US/docs/Web/API/Encrypted_Media_Extensions_API) phản ánh các cách tiếp cận khác nhau về cơ bản để chọn cấu hình giải mã phương tiện được mã hóa.

Tham số cấu hình cho `Navigator.requestMediaKeySystemAccess()` nhận một mảng các cấu hình có thể và cho phép hệ thống chọn cái nó cho là phù hợp.

Ngược lại, `decodingInfo()` nhận một cấu hình mỗi lần. Kỳ vọng là người gọi sẽ thực thi `decodingInfo()` nhiều lần, bắt đầu với các cấu hình ưa thích nhất và dừng ngay khi tìm thấy cấu hình đáp ứng yêu cầu ứng dụng về mượt mà, tiết kiệm điện hoặc cả hai. Nói cách khác, quyết định chọn lựa được giao cho người gọi.

## Ví dụ

### Lấy thông tin giải mã cho tệp phương tiện không được mã hóa

Ví dụ này cho thấy cách tạo cấu hình phương tiện cho tệp âm thanh và sử dụng nó trong `MediaCapabilities.decodingInfo()`.

```css hidden
#log {
  height: 100px;
  overflow: scroll;
  padding: 0.5rem;
  border: 1px solid black;
}
```

```html hidden
<pre id="log"></pre>
```

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

```js
// Create media configuration to be tested
const audioConfig = {
  type: "file", // or 'media-source' or 'webrtc'
  audio: {
    contentType: "audio/ogg; codecs=vorbis", // valid content type
    channels: 2, // audio channels used by the track
    bitrate: 132700, // number of bits used to encode 1s of audio
    samplerate: 5200, // number of audio samples making up that 1s.
  },
};

// check support and performance
navigator.mediaCapabilities.decodingInfo(audioConfig).then((result) => {
  if (result.supported) {
    log(
      `The audio configuration is supported${result.smooth ? ", smooth" : ", not smooth"}${result.powerEfficient ? ", power efficient" : ", not power efficient"}.`,
    );
  } else {
    log("The audio configuration is not supported");
  }
});
```

Tương tự, đoạn mã dưới đây cho thấy cấu hình cho tệp video.

```js
const videoConfig = {
  type: "file",
  video: {
    contentType: "video/webm;codecs=vp8", // valid content type
    width: 800, // width of the video
    height: 600, // height of the video
    bitrate: 10000, // number of bits used to encode 1s of video
    framerate: 30, // number of frames making up that 1s.
  },
};

// check support and performance
navigator.mediaCapabilities.decodingInfo(videoConfig).then((result) => {
  if (result.supported) {
    log(
      `The video configuration is supported${result.smooth ? ", smooth" : ", not smooth"}${result.powerEfficient ? ", power efficient" : ", not power efficient"}.`,
    );
  } else {
    log("The video configuration is not supported");
  }
});
```

{{EmbedLiveSample("Getting decoding information for unencrypted media files")}}

### Lấy thông tin giải mã cho phương tiện được mã hóa

Ví dụ này cho thấy cách bạn có thể sử dụng `decodingInfo()` để chọn cấu hình phương tiện cho nội dung được mã hóa.

```css hidden
#log {
  height: 100px;
  overflow: scroll;
  padding: 0.5rem;
  border: 1px solid black;
}
```

```html hidden
<pre id="log"></pre>
```

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

```js
const encryptedMediaConfig = {
  type: "media-source", // or 'file'
  audio: {
    contentType: "audio/webm; codecs=opus",
    channels: 2, // audio channels used by the track
    bitrate: 132700, // number of bits used to encode 1s of audio
    samplerate: 48000, // number of audio samples making up that 1s.
  },
  video: {
    contentType: 'video/webm; codecs="vp09.00.10.08"',
    width: 800, // width of the video
    height: 600, // height of the video
    bitrate: 10000, // number of bits used to encode 1s of video
    framerate: 30, // number of frames making up that 1s.
  },
  keySystemConfiguration: {
    keySystem: "org.w3.clearkey",
    initDataType: "webm",
    distinctiveIdentifier: "required",
  },
};
```

```js
getDecodingInfo(encryptedMediaConfig);

async function getDecodingInfo(mediaConfig) {
  const result = await navigator.mediaCapabilities.decodingInfo(mediaConfig);
  console.log(result);
  if (!result.supported) {
    log("This encrypted media configuration is not supported.");
    return;
  }

  // keySystemAccess is returned if decoding encrypted media is supported
  // This can be used to decrypt and playback the media
  if (!result.keySystemAccess) {
    log("Encrypted media support is not available.");
    return;
  }

  log(
    `The encrypted media configuration is supported${result.smooth ? ", smooth" : ", not smooth"}${result.powerEfficient ? ", power efficient" : ", not power efficient"}.`,
  );
}
```

{{EmbedLiveSample("Getting decoding information for encrypted media")}}

### Lặp qua thông tin giải mã cho phương tiện được mã hóa

Ví dụ trước cho thấy cách bạn có thể sử dụng `decodingInfo()` để lấy thông tin cho một cấu hình. Trong thực tế, phương thức thường được gọi lặp đi lặp lại với nhiều cấu hình, chọn cấu hình được hỗ trợ đầu tiên đáp ứng tiêu chí của ứng dụng cho việc phát mượt mà hoặc tiết kiệm điện.

```js
const capabilitiesPromises = orderedMediaConfigs.map((mediaConfig) =>
  navigator.mediaCapabilities.decodingInfo(mediaConfig),
);
```

```js
// Assume this app wants a supported && smooth config.
let bestConfig = null;
let nonSmoothConfig = null;
for await (const mediaCapabilityInfo of capabilitiesPromises) {
  if (!mediaCapabilityInfo.supported) continue;

  if (!mediaCapabilityInfo.smooth) {
    nonSmoothConfig = mediaCapabilityInfo;
    continue;
  }

  bestConfig = mediaCapabilityInfo;
  break;
}
```

```js
let keys = null;
if (bestConfig) {
  keys = await bestConfig.keySystemAccess.createMediaKeys();
  // … use keys to decode media using best config
} else if (nonSmoothConfig) {
  console.log(
    "No smooth configs found. Using lowest resolution configuration!",
  );
  keys = await nonSmoothConfig.keySystemAccess.createMediaKeys();
  // … use keys to decode media using lowest framerate config
} else {
  console.log("No supported configs!");
  // Fail!
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("MediaCapabilities.encodingInfo()")}}
- {{domxref("HTMLMediaElement.canPlayType()")}} cho file
- {{domxref("MediaSource.isTypeSupported_static", "MediaSource.isTypeSupported()")}} cho media-source
- {{domxref("Navigator.requestMediaKeySystemAccess()")}}
