---
title: "RTCRtpReceiver: phương thức getParameters()"
short-title: getParameters()
slug: Web/API/RTCRtpReceiver/getParameters
page-type: web-api-instance-method
browser-compat: api.RTCRtpReceiver.getParameters
---

{{APIRef("WebRTC API")}}

Phương thức **`getParameters()`** của giao diện {{domxref("RTCRtpReceiver")}} trả về một đối tượng mô tả cấu hình hiện tại về cách {{domxref("RTCRtpReceiver.track", "track")}} của bộ nhận được giải mã.

## Cú pháp

```js-nolint
getParameters()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng cho biết cấu hình hiện tại của bộ nhận.

<!-- Spec defines as RTCRtpReceiveParameters, which is just a RTCRtpParameters -->

- `codecs`
  - : Một mảng các đối tượng mô tả [media codecs](/en-US/docs/Web/Media/Guides/Formats/WebRTC_codecs) mà bộ nhận sẵn sàng dùng.
    Đây là tập con các codec mà bộ nhận đã chỉ ra là nó ưu tiên và đầu cuối từ xa đã chỉ ra rằng nó sẵn sàng gửi.
    Tham số này không thể thay đổi sau khi đã được đặt ban đầu.

    Mỗi đối tượng codec trong mảng có thể có các thuộc tính sau: <!-- RTCRtpCodecParameters -->
    - `channels` {{optional_inline}}
      - : Một số nguyên dương cho biết số kênh được codec hỗ trợ.
        Ví dụ, với codec âm thanh giá trị 1 chỉ âm thanh đơn kênh, còn 2 chỉ âm thanh stereo.

    - `clockRate`
      - : Một số nguyên dương chỉ định tốc độ xung nhịp của codec theo Hertz (Hz).
        Clock rate là tốc độ mà RTP timestamp của codec tăng lên.
        Phần lớn codec có các giá trị hoặc khoảng giá trị cụ thể mà chúng cho phép.
        IANA duy trì một [danh sách codec và tham số của chúng](https://www.iana.org/assignments/rtp-parameters/rtp-parameters.xhtml#rtp-parameters-1), bao gồm cả clock rate.

    - `mimeType`
      - : Một chuỗi cho biết kiểu và subtype MIME media của codec, được chỉ định theo dạng `"type/subtype"`.
        Các chuỗi MIME type dùng bởi RTP khác với chuỗi dùng ở nơi khác.
        IANA duy trì một [sổ đăng ký MIME type hợp lệ](https://www.iana.org/assignments/rtp-parameters/rtp-parameters.xhtml#rtp-parameters-2).
        Xem thêm [Codecs dùng bởi WebRTC](/en-US/docs/Web/Media/Guides/Formats/WebRTC_codecs) để biết chi tiết về các codec có thể được tham chiếu ở đây.

    - `payloadType`
      - : [RTP payload type](https://www.iana.org/assignments/rtp-parameters/rtp-parameters.xhtml#rtp-parameters-1) dùng để định danh codec này.

    - `sdpFmtpLine` {{optional_inline}}
      - : Một chuỗi cung cấp trường tham số dành riêng cho định dạng từ dòng `a=fmtp` trong {{Glossary("SDP")}} tương ứng với codec {{Glossary("SDP")}} từ peer từ xa, nếu trường này tồn tại.
        Nếu không có trường tham số, thuộc tính này sẽ bị bỏ qua.
        Xem [mục 5.8 của đặc tả JSEP của IETF](https://datatracker.ietf.org/doc/html/draft-ietf-rtcweb-jsep-24#section-5.8) để biết thêm thông tin.

- `headerExtensions`
  - : Một mảng gồm không hoặc nhiều RTP header extension, mỗi phần tử xác định một extension được sender hoặc receiver hỗ trợ.
    Header extension được mô tả trong {{RFC(3550, "", "5.3.1")}}. Tham số này không thể thay đổi sau khi đã được đặt ban đầu.
- `rtcp`
  - : Một đối tượng {{domxref("RTCRtcpParameters")}} cung cấp các tham số cấu hình được dùng cho {{Glossary("RTCP")}} trên sender hoặc receiver.
    Tham số này không thể thay đổi sau khi đã được đặt ban đầu.

## Ví dụ

Ví dụ này lấy canonical name (CNAME) đang được dùng cho {{Glossary("RTCP")}} trên một {{domxref("RTCRtpReceiver")}}.

```js
function getRtcpCNAME(receiver) {
  let parameters = receiver.getParameters();

  return parameters.rtcp.cname;
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}
