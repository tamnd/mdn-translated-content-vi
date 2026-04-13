---
title: "Phương thức setParameters() của RTCRtpSender"
short-title: setParameters()
slug: Web/API/RTCRtpSender/setParameters
page-type: web-api-instance-method
browser-compat: api.RTCRtpSender.setParameters
spec-urls:
  - https://w3c.github.io/webrtc-pc/#dom-rtcrtpsender-setparameters
  - https://w3c.github.io/mst-content-hint/#dom-rtcdegradationpreference
---

{{APIRef("WebRTC API")}}

Phương thức **`setParameters()`** của giao diện {{domxref("RTCRtpSender")}} áp dụng các thay đổi cho cấu hình của {{domxref("RTCRtpSender.track", "track")}} sender, là {{domxref("MediaStreamTrack")}} mà `RTCRtpSender` chịu trách nhiệm.

Nói cách khác, `setParameters()` cập nhật cấu hình của luồng truyền tải {{Glossary("RTP")}} cũng như cấu hình mã hóa cho một track media outgoing cụ thể trên kết nối [WebRTC](/en-US/docs/Web/API/WebRTC_API).

## Cú pháp

```js-nolint
setParameters(parameters)
```

### Tham số

- `parameters`
  - : Một đối tượng tham số trước đó thu được bằng cách gọi phương thức {{domxref("RTCRtpSender.getParameters", "getParameters()")}} của cùng sender đó, với các thay đổi mong muốn cho các tham số cấu hình của sender.
    Các tham số này bao gồm các codec tiềm năng có thể được sử dụng để mã hóa {{domxref("RTCRtpSender.track", "track")}} của sender.
    Các tham số khả dụng là:
    - `encodings`
      - : Một mảng các đối tượng, mỗi đối tượng chỉ định các tham số cho một codec duy nhất có thể được sử dụng để mã hóa media của track.
        Các thuộc tính của các đối tượng bao gồm:
        - `active`
          - : Đặt giá trị này thành `true` (mặc định) khiến encoding này được gửi, trong khi `false` ngừng gửi và sử dụng (nhưng không khiến SSRC bị xóa).

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
          - : Chỉ được sử dụng cho một {{domxref("RTCRtpSender")}} có {{domxref("MediaStreamTrack.kind", "kind")}} là `audio`, thuộc tính này cho biết có nên sử dụng truyền dẫn gián đoạn hay không (một tính năng mà điện thoại được tắt hoặc micro được tự động tắt khi không có hoạt động giọng nói).
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
            Tham số này không thể được sửa đổi bằng `setParameters()`.
            Giá trị của nó chỉ có thể được đặt khi transceiver được tạo lần đầu.

        - `scaleResolutionDownBy`
          - : Chỉ được sử dụng cho các sender có track với {{domxref("MediaStreamTrack.kind", "kind")}} là `video`, đây là một giá trị dấu phẩy động chỉ định hệ số thu nhỏ video trong khi mã hóa.
            Giá trị mặc định, 1.0, có nghĩa là video sẽ được mã hóa ở kích thước ban đầu.
            Giá trị 2.0 thu nhỏ các khung video xuống hệ số 2 theo mỗi chiều, dẫn đến video có kích thước bằng 1/4 so với bản gốc.
            Giá trị không được nhỏ hơn 1.0 (cố gắng thu phóng video lên kích thước lớn hơn sẽ ném ra {{jsxref("RangeError")}}).

    - `transactionId`
      - : Một chuỗi chứa một ID duy nhất.
        ID này được đặt trong lời gọi {{domxref("RTCRtpSender.getParameters", "getParameters()")}} trước đó và đảm bảo rằng các tham số có nguồn gốc từ một lời gọi {{domxref("RTCRtpSender.getParameters", "getParameters()")}} trước đó.
        <!-- spec defines following in RTCRtpParameters -->
    - `codecs`
      - : Một mảng các đối tượng mô tả [các codec media](/en-US/docs/Web/Media/Guides/Formats/WebRTC_codecs) mà sender sẽ chọn.
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
      - : Một mảng gồm không hoặc nhiều phần mở rộng header RTP, mỗi phần mở rộng xác định một phần mở rộng được hỗ trợ bởi sender. Các phần mở rộng header được mô tả trong {{RFC(3550, "", "5.3.1")}}.
        Tham số này không thể được thay đổi.
    - `rtcp`
      - : Một đối tượng cung cấp các tham số cấu hình được sử dụng cho {{Glossary("RTCP")}} trên sender.
        Tham số này không thể được thay đổi.

        Đối tượng có thể có các thuộc tính sau: <!-- RTCRtcpParameters -->
        - `cname`
          - : Một chuỗi chỉ đọc cho biết tên chuẩn (CNAME) được sử dụng bởi RTCP (ví dụ: trong các thông báo SDES).
        - `reducedSize`
          - : Một boolean chỉ đọc là `True` nếu RTCP kích thước thu nhỏ được cấu hình ({{rfc("5506")}}), và `False` nếu RTCP phức hợp được chỉ định ({{rfc("3550")}}).

    - `degradationPreference` {{optional_inline}}
      - : Chỉ định cách ưu tiên mà lớp WebRTC nên xử lý việc tối ưu hóa hiệu suất trong các tình huống băng thông bị hạn chế. Các giá trị có thể là:
        - `balanced`
          - : Giá trị mặc định. Trình duyệt sẽ cân bằng giữa giảm framerate và độ phân giải.
        - `maintain-framerate`
          - : Trình duyệt sẽ giảm độ phân giải để duy trì framerate.
        - `maintain-resolution`
          - : Trình duyệt sẽ giảm framerate để duy trì độ phân giải.
        - `maintain-framerate-and-resolution`
          - : Trình duyệt sẽ duy trì framerate và độ phân giải bất kể chất lượng video, có thể dẫn đến việc loại bỏ các khung trước khi mã hóa nếu cần thiết để không sử dụng quá mức tài nguyên mạng và bộ mã hóa. Cài đặt này hữu ích cho các ứng dụng triển khai cơ chế tối ưu hóa chất lượng và hiệu suất mã hóa video riêng và không muốn cơ chế nội bộ của trình duyệt can thiệp vào nó.

### Giá trị trả về

Một {{jsxref("Promise")}} được resolved khi thuộc tính {{domxref("RTCRtpSender.track")}} được cập nhật với các tham số đã cho.

### Ngoại lệ

Nếu xảy ra lỗi, promise trả về bị rejected với ngoại lệ phù hợp từ danh sách dưới đây.

- `InvalidModificationError` {{domxref("DOMException")}}
  - : Được trả về nếu một trong các vấn đề sau được phát hiện:
    - Số lượng encoding được chỉ định trong thuộc tính `encodings` của đối tượng `parameters` không khớp với số lượng encoding hiện được liệt kê cho `RTCRtpSender`.
      Bạn không thể thay đổi số lượng tùy chọn encoding sau khi sender đã được tạo.
    - Thứ tự của `encodings` được chỉ định đã thay đổi so với thứ tự của danh sách hiện tại.
    - Đã cố gắng thay đổi một thuộc tính không thể được thay đổi sau khi sender được tạo lần đầu.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Được trả về nếu transceiver, mà `RTCRtpSender` là một phần, không đang chạy hoặc không có tham số để đặt.
- `OperationError` {{domxref("DOMException")}}
  - : Được trả về nếu xảy ra lỗi không khớp với các lỗi được chỉ định ở đây.
- {{jsxref("RangeError")}}
  - : Được trả về nếu giá trị được chỉ định cho tùy chọn `scaleResolutionDownBy` nhỏ hơn 1.0 — điều này sẽ dẫn đến việc mở rộng thay vì thu nhỏ, điều không được phép; hoặc nếu một hoặc nhiều giá trị [`maxFramerate`](#maxframerate) của `encodings` được chỉ định nhỏ hơn 0.0.

Ngoài ra, nếu xảy ra lỗi WebRTC trong khi cấu hình hoặc truy cập media, một {{domxref("RTCError")}} được ném ra với {{domxref("RTCError.errorDetail", "errorDetail")}} được đặt thành `hardware-encoder-error`.

## Mô tả

Điều quan trọng cần lưu ý là bạn không thể tự tạo đối tượng `parameters` và mong đợi nó hoạt động.
Thay vào đó, bạn _phải_ gọi {{domxref("RTCRtpSender.getParameters", "getParameters()")}} trước, sửa đổi đối tượng parameters nhận được, sau đó truyền đối tượng đó vào `setParameters()`.
WebRTC sử dụng thuộc tính `transactionId` của đối tượng parameters để đảm bảo rằng khi bạn đặt tham số, các thay đổi của bạn dựa trên các tham số mới nhất thay vì một cấu hình đã lỗi thời.

## Ví dụ

Một trường hợp sử dụng cho `setParameters()` là cố gắng giảm băng thông mạng được sử dụng trong các môi trường bị hạn chế bằng cách thay đổi độ phân giải và/hoặc tốc độ bit của media đang được truyền tải bởi {{domxref("RTCRtpSender")}}.

Hiện tại, một số trình duyệt có các giới hạn trong triển khai của chúng có thể gây ra vấn đề.
Vì lý do đó, hai ví dụ được đưa ra ở đây.
Ví dụ đầu tiên cho thấy cách sử dụng `setParameters()` khi tất cả trình duyệt hỗ trợ đầy đủ các tham số đang được sử dụng, trong khi ví dụ thứ hai демонстриает các cách giải quyết giúp giải quyết các giới hạn trong trình duyệt với hỗ trợ không đầy đủ cho các tham số [`maxBitrate`](#maxbitrate) và [`scaleResolutionDownBy`](#scaleresolutiondownby).

### Theo đặc tả

Khi tất cả trình duyệt triển khai đầy đủ đặc tả, triển khai `setVideoParams()` này sẽ hoạt động. Điều này demonstrates cách mọi thứ _nên_ hoạt động.
Bạn nên sử dụng ví dụ thứ hai bên dưới trong thời điểm hiện tại.
Nhưng đây là một minh chứng rõ ràng hơn về khái niệm cơ bản là trước tiên lấy tham số, sau đó thay đổi chúng, rồi đặt chúng.

```js
async function setVideoParams(sender, height, bitrate) {
  const scaleRatio = sender.track.getSettings().height / height;
  const params = sender.getParameters();

  params.encodings[0].scaleResolutionDownBy = Math.max(scaleRatio, 1);
  params.encodings[0].maxBitrate = bitrate;
  await sender.setParameters(params);
}
```

Khi gọi hàm này, bạn chỉ định một sender, cũng như chiều cao bạn muốn thu nhỏ video của sender xuống, cũng như tốc độ bit tối đa để cho phép sender truyền tải.
Một hệ số tỷ lệ cho kích thước video, `scaleRatio`, được tính toán.
Sau đó, các tham số hiện tại của sender được lấy bằng cách sử dụng {{domxref("RTCRtpSender.getParameters", "getParameters()")}}.

Các tham số sau đó được thay đổi bằng cách thay đổi [`scaleResolutionDownBy`](#scaleresolutiondownby) và [`maxBitrate`](#maxbitrate) của đối tượng `encodings` đầu tiên thành hệ số tỷ lệ đã tính toán và `bitrate` tối đa được chỉ định.

Các tham số đã thay đổi sau đó được lưu bằng cách gọi phương thức `setParameters()` của sender.

### Triển khai tương thích hiện tại

Như đã đề cập ở trên, ví dụ trước cho thấy cách mọi thứ được thiết kế để hoạt động.
Thật không may, có các vấn đề triển khai ngăn cản điều này trong nhiều trình duyệt hiện nay.
Vì lý do đó, nếu bạn muốn tương thích với iPhone và các thiết bị khác chạy Safari, và với Firefox, hãy sử dụng mã giống như sau:

```js
async function setVideoParams(sender, height, bitrate) {
  const scaleRatio = sender.track.getSettings().height / height;
  const params = sender.getParameters();

  // Nếu encodings là null, tạo nó
  params.encodings ??= [{}];
  params.encodings[0].scaleResolutionDownBy = Math.max(scaleRatio, 1);
  params.encodings[0].maxBitrate = bitrate;
  await sender.setParameters(params);

  // Nếu giá trị thay đổi mới của scaleResolutionDownBy là 1,
  // sử dụng applyConstraints() để đảm bảo chiều cao bị giới hạn,
  // vì scaleResolutionDownBy có thể chưa được triển khai

  if (sender.getParameters().encodings[0].scaleResolutionDownBy === 1) {
    await sender.track.applyConstraints({ height });
  }
}
```

Sự khác biệt ở đây:

- Nếu `encodings` là `null`, chúng ta tạo nó để đảm bảo rằng chúng ta có thể đặt các tham số thành công mà không bị crash.
- Nếu, sau khi đặt các tham số, giá trị của `scaleResolutionDownBy` vẫn là 1, chúng ta gọi phương thức {{domxref("MediaStreamTrack.applyConstraints", "applyConstraints()")}} của track sender để giới hạn chiều cao của track thành `height`.
  Điều này bù đắp cho `scaleResolutionDownBy` chưa được triển khai (như trường hợp của Safari tại thời điểm viết bài).

Mã này sẽ fallback sạch sẽ và hoạt động bình thường nếu trình duyệt triển khai đầy đủ các tính năng được sử dụng.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [API WebRTC](/en-US/docs/Web/API/WebRTC_API)
- [Các codec được sử dụng bởi WebRTC](/en-US/docs/Web/Media/Guides/Formats/WebRTC_codecs)
- [Công nghệ media web](/en-US/docs/Web/Media)
