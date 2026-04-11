---
title: "RTCRtpTransceiver: setCodecPreferences() method"
short-title: setCodecPreferences()
slug: Web/API/RTCRtpTransceiver/setCodecPreferences
page-type: web-api-instance-method
browser-compat: api.RTCRtpTransceiver.setCodecPreferences
---

{{APIRef("WebRTC")}}

Phương thức **`setCodecPreferences()`** của giao diện {{domxref("RTCRtpTransceiver")}} được dùng để đặt các codec mà transceiver cho phép giải mã dữ liệu _đã nhận_, theo thứ tự ưu tiên giảm dần.

Các ưu tiên được đặt bằng phương thức này ảnh hưởng đến những codec nào được thương lượng với phía từ xa để mã hóa dữ liệu mà nó gửi, bao gồm các codec dùng cho truyền lại, dự phòng, và sửa lỗi tiến tiếp.
Những codec không có trong danh sách ưu tiên sẽ không tham gia vào quá trình thương lượng.
Lưu ý rằng các ưu tiên mà transceiver này dùng cho nội dung _gửi_ phụ thuộc vào ưu tiên của phía từ xa.

Cách khuyến nghị để đặt ưu tiên codec là trước tiên lấy mảng codec thực sự được hỗ trợ để giải mã dữ liệu nhận, rồi sắp xếp lại chúng theo thứ tự ưu tiên giảm dần.
Điều này đảm bảo mảng được sắp xếp đúng yêu cầu, không chứa codec nào không được hỗ trợ, đồng thời cũng chứa các codec cần cho truyền lại, dự phòng và sửa lỗi tiến tiếp.

Tập codec đã chỉ định sẽ được dùng cho mọi kết nối trong tương lai có bao gồm transceiver này cho đến khi phương thức này được gọi lại.

Khi chuẩn bị mở một {{domxref("RTCPeerConnection")}}, các codec nên được đặt bằng `setCodecPreferences()` _trước_ khi gọi {{domxref("RTCPeerConnection.createOffer()")}} hoặc {{domxref("RTCPeerConnection.createAnswer", "createAnswer()")}}, vì các phương thức này khởi tạo thương lượng (và mặc định sẽ dùng tham số codec từ cấu hình mặc định của {{Glossary("user agent", "user agent")}}).

Bạn có thể thay đổi codec khi đang có liên lạc diễn ra, nhưng trước tiên cần gọi `setCodecPreferences()` rồi kích hoạt một vòng thương lượng mới.
Một ứng dụng WebRTC thường đã có mã cho việc này trong [`negotiationneeded` event handler](/en-US/docs/Web/API/RTCPeerConnection/negotiationneeded_event).
Tuy nhiên, cần lưu ý rằng tại thời điểm viết bài này, sự kiện không tự động được phát ra khi bạn gọi `setCodecPreferences()`, nên bạn sẽ phải tự gọi `onnegotiationneeded`.

Hướng dẫn về codec được WebRTC hỗ trợ, cùng các đặc tính tích cực và tiêu cực của từng codec, có thể tìm thấy trong [Codecs used by WebRTC](/en-US/docs/Web/Media/Guides/Formats/WebRTC_codecs).

## Cú pháp

```js-nolint
setCodecPreferences(codecs)
```

### Tham số

- `codecs`
  - : Một mảng các đối tượng, mỗi đối tượng cung cấp tham số cho một trong các [media codec](/en-US/docs/Web/Media/Guides/Formats/WebRTC_codecs) được transceiver hỗ trợ, được sắp theo mức ưu tiên.
    Nếu `codecs` rỗng, toàn bộ cấu hình codec sẽ được đưa về mặc định của user agent.

    > [!NOTE]
    > Bất kỳ codec nào không có trong `codecs` sẽ không được xem xét trong quá trình thương lượng kết nối.
    > Điều này giúp bạn ngăn việc dùng những codec mà bạn không muốn dùng.

    Mỗi đối tượng codec trong mảng có các thuộc tính sau:
    - `channels` {{optional_inline}}
      - : Một số nguyên dương cho biết số kênh mà codec hỗ trợ.
        Ví dụ, với codec âm thanh, giá trị `1` chỉ âm thanh mono, còn `2` chỉ stereo.

    - `clockRate`
      - : Một số nguyên dương chỉ định tần số clock của codec theo Hertz (Hz).
        Tần số clock là tốc độ mà dấu thời gian RTP của codec tăng lên.
        Hầu hết codec có các giá trị hoặc khoảng giá trị cụ thể mà chúng cho phép.
        IANA duy trì một [danh sách codec và tham số của chúng](https://www.iana.org/assignments/rtp-parameters/rtp-parameters.xhtml#rtp-parameters-1), bao gồm cả tần số clock.

    - `mimeType`
      - : Một chuỗi cho biết kiểu media MIME và subtype của codec, được chỉ định dưới dạng `"type/subtype"`.
        Chuỗi MIME type dùng bởi RTP khác với những chuỗi dùng ở nơi khác.
        IANA duy trì một [registry các MIME type hợp lệ](https://www.iana.org/assignments/rtp-parameters/rtp-parameters.xhtml#rtp-parameters-2).
        Xem thêm [Codecs used by WebRTC](/en-US/docs/Web/Media/Guides/Formats/WebRTC_codecs) để biết chi tiết về các codec tiềm năng có thể được tham chiếu ở đây.

    - `sdpFmtpLine` {{optional_inline}}
      - : Một chuỗi cho biết trường tham số đặc thù định dạng từ dòng `a=fmtp` trong {{Glossary("SDP")}} tương ứng với codec, nếu trường đó có mặt.
        Nếu không có trường tham số, thuộc tính này sẽ bị bỏ qua.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidAccessError` {{domxref("DOMException")}}
  - : Danh sách `codecs` bao gồm một hoặc nhiều codec không được {{domxref("RTCRtpReceiver")}} liên quan đến transceiver hỗ trợ.
- `InvalidModificationError` {{domxref("DOMException")}}
  - : Danh sách `codecs` chỉ chứa các mục cho RTX, RED, FEC hoặc Comfort Noise, hoặc là tập rỗng.
    Các codec phải luôn chứa một codec cho media.

## Ví dụ

### Tạo mảng codec ưu tiên

Cách khuyến nghị để đặt ưu tiên codec là trước tiên lấy mảng codec thực sự được hỗ trợ để giải mã dữ liệu nhận, rồi sắp xếp lại danh sách theo thứ tự ưu tiên giảm dần.

Điều quan trọng là bắt đầu từ danh sách codec được hỗ trợ (không phải danh sách codec ưu tiên được hard-code), vì nếu bạn bao gồm bất kỳ codec nào không được {{domxref("RTCRtpReceiver")}} liên quan hỗ trợ, trình duyệt sẽ ném ngoại lệ `InvalidAccessError` khi bạn gọi phương thức `setCodecPreferences()`.
Ngoài ra, mảng này phải bao gồm các codec phù hợp cho truyền lại, dự phòng, và sửa lỗi tiến tiếp, và việc bắt đầu từ danh sách codec được hỗ trợ sẽ đảm bảo các codec này có mặt.

Bạn có thể lấy các codec được hỗ trợ để giải mã dữ liệu bằng phương thức tĩnh {{domxref("RTCRtpReceiver.getCapabilities_static", "RTCRtpReceiver.getCapabilities()")}} như sau:

```js
const availReceiveCodecs = transceiver.receiver.getCapabilities("video").codecs;
```

Để sắp xếp lại mảng codec theo thứ tự ưu tiên mong muốn, chúng ta có thể dùng hàm sắp xếp dưới đây để sắp theo MIME type (điều này lấy từ [setCodecPreferences is now in all browsers!](https://blog.mozilla.org/webrtc/cross-browser-support-for-choosing-webrtc-codecs/) trên blog.mozilla.org (2024)).

```js
function sortByMimeTypes(codecs, preferredOrder) {
  return codecs.sort((a, b) => {
    const indexA = preferredOrder.indexOf(a.mimeType);
    const indexB = preferredOrder.indexOf(b.mimeType);
    const orderA = indexA >= 0 ? indexA : Number.MAX_VALUE;
    const orderB = indexB >= 0 ? indexB : Number.MAX_VALUE;
    return orderA - orderB;
  });
}
```

Phương thức nhận danh sách codec được hỗ trợ, và một mảng chứa các MIME type ưu tiên theo thứ tự giảm dần, rồi trả về mảng đã được sắp xếp tại chỗ.
Đoạn mã dưới đây cho thấy cách dùng, giả sử bạn đã thiết lập một peer connection (`peerConnection`):

```js
// Lấy codec được hỗ trợ rồi sắp theo codec ưu tiên
const supportedCodecs = RTCRtpReceiver.getCapabilities("video").codecs;
const preferredCodecs = ["video/H264", "video/VP8", "video/VP9"];
const sortedCodecs = sortByMimeTypes(supportedCodecs, preferredCodecs);

// Lấy transceiver của kết nối và đặt ưu tiên
const [transceiver] = peerConnection.getTransceivers();
transceiver.setCodecPreferences(sortedCodecs); // <---
```

## Tiêu chuẩn

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [setCodecPreferences is now in all browsers!](https://blog.mozilla.org/webrtc/cross-browser-support-for-choosing-webrtc-codecs/) on blog.mozilla.org (2024)
- [WebRTC API](/en-US/docs/Web/API/WebRTC_API)
- [Codecs used by WebRTC](/en-US/docs/Web/Media/Guides/Formats/WebRTC_codecs)
- [Giới thiệu về Real-time Transport Protocol (RTP)](/en-US/docs/Web/API/WebRTC_API/Intro_to_RTP)
- [Web media technologies](/en-US/docs/Web/Media)
