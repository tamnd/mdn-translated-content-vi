---
title: "AudioContext: hàm tạo AudioContext()"
short-title: AudioContext()
slug: Web/API/AudioContext/AudioContext
page-type: web-api-constructor
browser-compat: api.AudioContext.AudioContext
---

{{APIRef("Web Audio API")}}

Hàm tạo **`AudioContext()`** tạo một đối tượng {{domxref("AudioContext")}} mới, đối tượng này biểu diễn một đồ thị xử lý âm thanh được tạo thành từ các mô-đun âm thanh liên kết với nhau, mỗi mô-đun được biểu diễn bởi một {{domxref("AudioNode")}}.

## Syntax

```js-nolint
new AudioContext()
new AudioContext(options)
```

### Parameters

- `options` {{optional_inline}}
  - : Một đối tượng dùng để cấu hình ngữ cảnh. Các thuộc tính khả dụng gồm:
    - `latencyHint` {{optional_inline}}
      - : Kiểu phát lại mà ngữ cảnh sẽ được dùng cho, dưới dạng chuỗi dựng sẵn (`"balanced"`, `"interactive"` hoặc `"playback"`) hoặc một số thực dấu phẩy động kép chỉ ra độ trễ tối đa mong muốn của ngữ cảnh, tính bằng giây.
        User agent có thể đáp ứng yêu cầu này hoặc không;
        hãy kiểm tra giá trị của {{domxref("AudioContext.baseLatency")}} để xác định độ trễ thực sau khi tạo ngữ cảnh.
        - `"balanced"`: Trình duyệt cân bằng giữa độ trễ đầu ra âm thanh và mức tiêu thụ điện năng khi chọn giá trị độ trễ.
        - `"interactive"` (giá trị mặc định): Âm thanh tham gia vào các phần tử tương tác, chẳng hạn như phản hồi thao tác của người dùng hoặc cần trùng khớp với tín hiệu thị giác như hành động trong video hay trò chơi.
          Trình duyệt chọn độ trễ thấp nhất có thể mà không gây lỗi giật âm thanh. Điều này có thể cần mức tiêu thụ điện năng cao hơn.
        - `"playback"`: Trình duyệt chọn độ trễ giúp tối đa hóa thời gian phát lại bằng cách giảm mức tiêu thụ điện năng, đổi lại là độ trễ cao hơn.
          Hữu ích cho việc phát không tương tác, chẳng hạn như phát nhạc.
    - `sampleRate` {{optional_inline}}
      - : Chỉ định tốc độ lấy mẫu dùng cho ngữ cảnh mới. Giá trị này phải là một số thực dấu phẩy động biểu thị tốc độ lấy mẫu, tính bằng mẫu trên giây, để cấu hình cho ngữ cảnh mới;
        ngoài ra, giá trị đó phải được {{domxref("AudioBuffer.sampleRate")}} hỗ trợ.
        Giá trị thường nằm trong khoảng từ 8.000 Hz đến 96.000 Hz; giá trị mặc định sẽ thay đổi tùy theo thiết bị đầu ra, nhưng 44.100 Hz là tốc độ lấy mẫu phổ biến nhất.
        Nếu thuộc tính `sampleRate` không có trong `options`, hoặc không truyền `options` khi tạo audio context,
        tốc độ lấy mẫu ưu tiên của thiết bị đầu ra của ngữ cảnh mới sẽ được dùng theo mặc định.
    - `sinkId` {{optional_inline}} {{Experimental_Inline}}
      - : Chỉ định sink ID của thiết bị đầu ra âm thanh sẽ dùng cho `AudioContext`. Giá trị này có thể thuộc một trong các kiểu sau:
        - Một chuỗi biểu diễn sink ID, ví dụ được lấy qua thuộc tính `deviceId` của các đối tượng {{domxref("MediaDeviceInfo")}} được trả về bởi {{domxref("MediaDevices.enumerateDevices()")}}.
        - Một đối tượng biểu diễn các tùy chọn khác nhau cho sink ID. Hiện tại, đối tượng này chỉ có một thuộc tính là `type` với giá trị `none`. Thiết lập tham số này khiến âm thanh được xử lý mà không phát qua bất kỳ thiết bị đầu ra âm thanh nào.

### Return value

Một thể hiện {{domxref("AudioContext")}} mới.

### Exceptions

- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném ra nếu `sampleRate` được chỉ định không được ngữ cảnh hỗ trợ.

## Usage notes

Đặc tả không đi quá sâu vào các chi tiết như user agent nên hỗ trợ bao nhiêu audio context, hoặc yêu cầu độ trễ tối thiểu hay tối đa (nếu có), vì vậy các chi tiết này có thể khác nhau giữa các trình duyệt. Hãy nhớ kiểm tra các giá trị đó nếu chúng quan trọng với bạn.

Đặc biệt, đặc tả không chỉ ra số lượng audio context tối đa hoặc tối thiểu có thể được mở cùng lúc, vì vậy điều này được để cho từng trình duyệt tự quyết định.

### Google Chrome

#### Giới hạn audio context trên mỗi tab trong Chrome

Trước phiên bản 66, Google Chrome chỉ hỗ trợ tối đa sáu audio context _trên mỗi tab_ cùng lúc.

#### Ngoại lệ không chuẩn trong Chrome

Nếu giá trị của thuộc tính `latencyHint` không hợp lệ,
Chrome ném ra ngoại lệ {{jsxref("TypeError")}} với thông báo
"The provided value '...' is not a valid enum value of type
AudioContextLatencyCategory".

## Example

Ví dụ này tạo một {{domxref("AudioContext")}} mới cho âm thanh tương tác (tối ưu cho độ trễ), với tốc độ lấy mẫu 44,1 kHz và một đầu ra âm thanh cụ thể.

```js
const audioCtx = new AudioContext({
  latencyHint: "interactive",
  sampleRate: 44100,
  sinkId: "bb04fea9a8318c96de0bd...", // truncated for brevity
});
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- Hàm tạo {{domxref("OfflineAudioContext.OfflineAudioContext()", "OfflineAudioContext()")}}
