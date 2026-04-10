---
title: "Phương thức getParameters() của RTCRtpSender"
short-title: getParameters()
slug: Web/API/RTCRtpSender/getParameters
page-type: web-api-instance-method
browser-compat: api.RTCRtpSender.getParameters
spec-urls:
  - https://w3c.github.io/webrtc-pc/#dom-rtcrtpsender-getparameters
  - https://w3c.github.io/mst-content-hint/#dom-rtcdegradationpreference
---

{{APIRef("WebRTC")}}

Phương thức **`getParameters()`** của giao diện {{domxref("RTCRtpSender")}} trả về một đối tượng mô tả cấu hình hiện tại cho cách {{domxref("RTCRtpSender.track", "track")}} của sender sẽ được mã hóa và truyền tải đến một {{domxref("RTCRtpReceiver")}} từ xa.

## Cú pháp

```js-nolint
getParameters()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng cho biết cấu hình hiện tại của sender. <!-- RTCRtpSendParameters, derived from RTCRtpParameters -->

<!-- spec defines following in RTCRtpSendParameters -->

- `encodings`
  - : Một mảng các đối tượng, mỗi đối tượng chỉ định các tham số và cài đặt cho một codec duy nhất có thể được sử dụng để mã hóa media của track.
    Các thuộc tính của các đối tượng bao gồm:
    - `active`
      - : `true` (mặc định) nếu encoding đang được gửi, `false` nếu nó không được gửi hoặc sử dụng.

    - `codec` {{optional_inline}}
      - : Chọn [codec media](/en-US/docs/Web/Media/Guides/Formats/WebRTC_codecs) được sử dụng cho luồng RTP của encoding này.
        Nếu không được đặt, user agent có thể chọn bất kỳ codec nào được đàm phán để gửi.
        <!-- RTCRtpCodec -->
        - `channels` {{optional_inline}}
          - : Một số nguyên dương cho biết số kênh được hỗ trợ bởi codec.
            Ví dụ, đối với codec âm thanh, giá trị 1 chỉ định âm thanh đơn âm, trong khi 2 chỉ định âm thanh nổi.

        - `clockRate`
          - : Một số nguyên dương chỉ định tốc độ xung nhịp của codec tính bằng Hertz (Hz).
            Tốc độ xung nhịp là tốc độ mà timestamp RTP của codec tăng lên.
            Hầu hết các codec có các giá trị cụ thể hoặc dải giá trị cho phép.
            IANA duy trì một [danh sách các codec và tham số của chúng](https://www.iana.org/assignments/rtp-parameters/rtp-parameters.xhtml#rtp-parameters-1), bao gồm cả tốc độ xung nhịp.

        - `mimeType`
          - : Một chuỗi cho biết kiểu và kiểu phụ MIME media của codec, được chỉ định dưới dạng chuỗi `"type/subtype"`.
            Các chuỗi kiểu MIME được sử dụng bởi RTP khác với những chuỗi được sử dụng ở nơi khác.
            IANA duy trì một [registry các kiểu MIME hợp lệ](https://www.iana.org/assignments/rtp-parameters/rtp-parameters.xhtml#rtp-parameters-2).
            Ngoài ra, xem [Các codec được sử dụng bởi WebRTC](/en-US/docs/Web/Media/Guides/Formats/WebRTC_codecs) để biết chi tiết về các codec tiềm năng có thể được tham chiếu ở đây.

        - `sdpFmtpLine` {{optional_inline}}
          - : Một chuỗi cung cấp các tham số cụ thể định dạng được cung cấp bởi mô tả cục bộ.

    - `dtx` {{Deprecated_Inline}} {{Non-standard_Inline}}
      - : Chỉ được sử dụng cho một {{domxref("RTCRtpSender")}} có {{domxref("MediaStreamTrack.kind", "kind")}} là `audio`, thuộc tính này cho biết liệu truyền dẫn gián đoạn có đang được sử dụng hay không (một tính năng mà điện thoại được tắt hoặc micro được tự động tắt khi không có hoạt động giọng nói).
        Giá trị là `enabled` hoặc `disabled`.

    - `maxBitrate`
      - : Một số nguyên dương cho biết số bit tối đa mỗi giây mà user agent được phép cấp cho các track được mã hóa với encoding này.
        Các tham số khác có thể hạn chế thêm tốc độ bit, chẳng hạn như giá trị của `maxFramerate`, hoặc băng thông khả dụng cho transport hoặc mạng vật lý.

        Giá trị được tính toán sử dụng băng thông TIAS (Transport Independent Application Specific Maximum) tiêu chuẩn như được định nghĩa bởi {{RFC(3890, "", "6.2.2")}}; đây là băng thông tối đa cần thiết mà không cần xem xét các chi phí giao thức từ IP, TCP hoặc UDP, v.v.

        Lưu ý rằng tốc độ bit có thể đạt được theo một số cách, tùy thuộc vào media và encoding.
        Ví dụ, đối với video, tốc độ bit thấp có thể đạt được bằng cách loại bỏ các khung (tốc độ bit bằng 0 có thể chỉ cho phép gửi một khung), trong khi đối với âm thanh, track có thể phải dừng phát nếu tốc độ bit quá thấp để gửi.

    - `maxFramerate`
      - : Một giá trị chỉ định số khung tối đa mỗi giây cho phép cho encoding này.
    - `priority`
      - : Một chuỗi cho biết mức độ ưu tiên của {{domxref("RTCRtpSender")}}, có thể xác định cách user agent phân bổ băng thông giữa các sender.
        Các giá trị được phép là `very-low`, `low` (mặc định), `medium`, `high`.
    - `rid`
      - : Một chuỗi, nếu được đặt, chỉ định một _RTP stream ID_ (_RID_) được gửi bằng phần mở rộng header RID.
        Tham số này không thể được sửa đổi bằng {{domxref("RTCRtpSender.setParameters", "setParameters()")}}.
        Giá trị của nó chỉ có thể được đặt khi transceiver được tạo lần đầu.
    - `scaleResolutionDownBy`
      - : Chỉ được sử dụng cho các sender có track với {{domxref("MediaStreamTrack.kind", "kind")}} là `video`, đây là một giá trị dấu phẩy động chỉ định hệ số thu nhỏ video trong khi mã hóa.
        Giá trị mặc định, 1.0, có nghĩa là video sẽ được mã hóa ở kích thước ban đầu.
        Giá trị 2.0 thu nhỏ các khung video xuống hệ số 2 theo mỗi chiều, dẫn đến video có kích thước bằng 1/4 so với bản gốc.
        Giá trị không được nhỏ hơn 1.0 (cố gắng thu phóng video lên kích thước lớn hơn sẽ ném ra {{jsxref("RangeError")}}).

- `transactionId`
  - : Một chuỗi chứa một ID duy nhất.
    Giá trị này được sử dụng để đảm bảo rằng {{domxref("RTCRtpSender.setParameters", "setParameters()")}} chỉ có thể được gọi để sửa đổi các tham số được trả về bởi một lời gọi `getParameters()` cụ thể trước đó.
    Tham số này không thể được thay đổi bởi người gọi.
    <!-- spec defines following in RTCRtpParameters -->
- `codecs`
  - : Một mảng các đối tượng mô tả [các codec media](/en-US/docs/Web/Media/Guides/Formats/WebRTC_codecs) mà sender đã đặt là đã bật và sẵn sàng sử dụng.
    Tham số này không thể được thay đổi sau khi đã đặt ban đầu.

    Mỗi đối tượng codec trong mảng có thể có các thuộc tính sau: <!-- RTCRtpCodecParameters -->
    - `channels` {{optional_inline}}
      - : Một số nguyên dương cho biết số kênh được hỗ trợ bởi codec.
        Ví dụ, đối với codec âm thanh, giá trị 1 chỉ định âm thanh đơn âm, trong khi 2 chỉ định âm thanh nổi.

    - `clockRate`
      - : Một số nguyên dương chỉ định tốc độ xung nhịp của codec tính bằng Hertz (Hz).
        Tốc độ xung nhịp là tốc độ mà timestamp RTP của codec tăng lên.
        Hầu hết các codec có các giá trị cụ thể hoặc dải giá trị cho phép.
        IANA duy trì một [danh sách các codec và tham số của chúng](https://www.iana.org/assignments/rtp-parameters/rtp-parameters.xhtml#rtp-parameters-1), bao gồm cả tốc độ xung nhịp.

    - `mimeType`
      - : Một chuỗi cho biết kiểu và kiểu phụ MIME media của codec, được chỉ định dưới dạng chuỗi `"type/subtype"`.
        Các chuỗi kiểu MIME được sử dụng bởi RTP khác với những chuỗi được sử dụng ở nơi khác.
        IANA duy trì một [registry các kiểu MIME hợp lệ](https://www.iana.org/assignments/rtp-parameters/rtp-parameters.xhtml#rtp-parameters-2).
        Ngoài ra, xem [Các codec được sử dụng bởi WebRTC](/en-US/docs/Web/Media/Guides/Formats/WebRTC_codecs) để biết chi tiết về các codec tiềm năng có thể được tham chiếu ở đây.

    - `payloadType`
      - : [Loại payload RTP](https://www.iana.org/assignments/rtp-parameters/rtp-parameters.xhtml#rtp-parameters-1) được sử dụng để xác định codec này.

    - `sdpFmtpLine` {{optional_inline}}
      - : Một chuỗi cung cấp các tham số cụ thể định dạng được cung cấp bởi mô tả cục bộ.

- `headerExtensions`
  - : Một mảng gồm không hoặc nhiều phần mở rộng header RTP, mỗi phần mở rộng xác định một phần mở rộng được hỗ trợ bởi sender hoặc receiver. Các phần mở rộng header được mô tả trong {{RFC(3550, "", "5.3.1")}}.
    Tham số này không thể được thay đổi sau khi đã đặt ban đầu.
- `rtcp`
  - : Một đối tượng cung cấp các tham số cấu hình được sử dụng cho {{Glossary("RTCP")}} trên sender.
    Tham số này không thể được thay đổi.

    Đối tượng có thể có các thuộc tính sau: <!-- RTCRtcpParameters -->
    - `cname`
      - : Một chuỗi chỉ đọc cho biết tên chuẩn (CNAME) được sử dụng bởi RTCP (ví dụ: trong các thông báo SDES).
    - `reducedSize`
      - : Một boolean chỉ đọc là `True` nếu RTCP kích thước thu nhỏ được cấu hình ({{rfc("5506")}}), và `False` nếu RTCP phức hợp được chỉ định ({{rfc("3550")}}).

- `degradationPreference`
  - : Chỉ định cách ưu tiên mà lớp WebRTC nên xử lý việc tối ưu hóa hiệu suất trong các tình huống băng thông bị hạn chế. Các giá trị có thể là:
    - `balanced`
      - : Giá trị mặc định. Trình duyệt sẽ cân bằng giữa giảm framerate và độ phân giải.
    - `maintain-framerate`
      - : Trình duyệt sẽ giảm độ phân giải để duy trì framerate.
    - `maintain-resolution`
      - : Trình duyệt sẽ giảm framerate để duy trì độ phân giải.
    - `maintain-framerate-and-resolution`
      - : Trình duyệt sẽ duy trì framerate và độ phân giải bất kể chất lượng video, có thể dẫn đến việc loại bỏ các khung trước khi mã hóa nếu cần thiết để không sử dụng quá mức tài nguyên mạng và bộ mã hóa. Cài đặt này hữu ích cho các ứng dụng triển khai cơ chế tối ưu hóa chất lượng và hiệu suất mã hóa video riêng và không muốn cơ chế nội bộ của trình duyệt can thiệp vào nó.

## Ví dụ

Ví dụ này lấy transaction ID hiện tại của sender; transaction ID xác định duy nhất tập hợp tham số hiện tại, để đảm bảo rằng các lời gọi tới {{domxref("RTCRtpSender.setParameters", "setParameters()")}} luôn được xử lý theo đúng thứ tự, tránh ghi đè tham số một cách vô ý bằng các tham số cũ hơn.

```js
function getSenderTransactionID(sender) {
  let parameters = sender.getParameters();

  return parameters.transactionId;
}
```

Tương tự, mã này lấy tên chuẩn (CNAME) đang được sử dụng cho {{Glossary("RTCP")}} trên một {{domxref("RTCRtpSender")}}.

```js
function getRtpCNAME(sender) {
  let parameters = sender.getParameters();

  return parameters.rtcp.cname;
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("RTCRtpSender.setParameters()")}}
- {{domxref("RTCRtpReceiver.getParameters()")}}
