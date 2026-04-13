---
title: "RTCRtpReceiver: phương thức tĩnh getCapabilities()"
short-title: getCapabilities()
slug: Web/API/RTCRtpReceiver/getCapabilities_static
page-type: web-api-static-method
browser-compat: api.RTCRtpReceiver.getCapabilities_static
---

{{APIRef("WebRTC")}}

Phương thức tĩnh **`RTCRtpReceiver.getCapabilities()`** trả về một đối tượng mô tả các khả năng codec và header extension được hỗ trợ bởi các đối tượng {{domxref("RTCRtpReceiver")}} trên thiết bị hiện tại.

Tương tự, bạn có thể lấy các khả năng của đối tượng {{domxref("RTCRtpSender")}} bằng cách gọi hàm tĩnh {{domxref("RTCRtpSender.getCapabilities_static", "RTCRtpSender.getCapabilities()")}}.

## Cú pháp

```js-nolint
RTCRtpReceiver.getCapabilities(kind)
```

### Tham số

- `kind`
  - : Một chuỗi cho biết loại phương tiện mà khả năng nhận của trình duyệt được yêu cầu.
    Các loại phương tiện được hỗ trợ là: `audio` và `video`.

### Giá trị trả về

Một đối tượng mới cho biết trình duyệt có khả năng gì để nhận loại phương tiện đã chỉ định qua một {{domxref("RTCPeerConnection")}}.
Nếu trình duyệt không hỗ trợ `kind` phương tiện đó, giá trị trả về là `null`.

Đối tượng trả về có các thuộc tính sau:

- `codecs`
  - : Một mảng các đối tượng, mỗi đối tượng mô tả khả năng cơ bản của một [media codec](/en-US/docs/Web/Media/Guides/Formats/WebRTC_codecs) duy nhất được {{domxref("RTCRtpReceiver")}} hỗ trợ.

    > [!NOTE]
    > Mảng này chứa các mục đặc biệt đại diện cho các thành phần nền tảng của transport - bạn có thể bỏ qua chúng nếu chỉ quan tâm đến codec thực sự dùng cho phương tiện.
    > Chúng được mô tả bên dưới trong mục [Mảng codecs](#the_codecs_array).

    Mỗi đối tượng codec có các thuộc tính sau:
    - `channels` {{optional_inline}}
      - : Một giá trị số nguyên dương cho biết số kênh tối đa mà codec hỗ trợ; ví dụ, codec chỉ hỗ trợ mono sẽ có giá trị là 1; codec stereo sẽ là 2, v.v.
    - `clockRate`
      - : Một số nguyên dương chỉ định tốc độ xung nhịp của codec theo Hertz (Hz).
        IANA duy trì một [danh sách codec và tham số của chúng](https://www.iana.org/assignments/rtp-parameters/rtp-parameters.xhtml#rtp-parameters-1), bao gồm cả clock rate.
    - `mimeType`
      - : Một chuỗi cho biết kiểu và subtype MIME media của codec.
        Các chuỗi MIME type dùng bởi RTP khác với chuỗi dùng ở nơi khác.
        Xem {{RFC(3555, "", 4)}} để biết sổ đăng ký IANA đầy đủ cho các kiểu này.
        Xem thêm [Codecs dùng bởi WebRTC](/en-US/docs/Web/Media/Guides/Formats/WebRTC_codecs) để biết chi tiết về các codec có thể được tham chiếu ở đây.
    - `sdpFmtpLine` {{optional_inline}}
      - : Một chuỗi cung cấp trường tham số dành riêng cho định dạng từ dòng `a=fmtp` trong SDP tương ứng với codec, nếu có dòng như vậy.
        Nếu không có trường tham số, thuộc tính này sẽ bị bỏ qua.

- `headerExtensions`
  - : Một mảng các đối tượng, mỗi đối tượng cung cấp URI của một [header extension](https://datatracker.ietf.org/doc/html/rfc3550#section-5.3.1) được hỗ trợ cho `kind` phương tiện hiện tại.
    Mỗi đối tượng có thuộc tính sau:
    - `uri`
      - : Một chuỗi chỉ định URI của header extension.
        URI được định dạng như mô tả trong {{RFC(5285)}}.

## Mô tả

Là một hàm tĩnh, phương thức này luôn được gọi theo dạng:

```js
capabilities = RTCRtpReceiver.getCapabilities("audio");
```

Tập khả năng trả về là danh sách khả năng lạc quan nhất có thể.
Có thể các tổ hợp tùy chọn nhất định sẽ không hoạt động khi bạn thực sự thử dùng chúng.

Gọi `RTCRtpReceiver.getCapabilities()` không chuẩn bị trình duyệt theo bất kỳ cách nào để xử lý phương tiện. Không có gì được tải, lấy về, hay chuẩn bị trước.
Đó chỉ là cách xác định những gì có thể dùng trước khi bắt đầu truy cập phương tiện.

Vì tập khả năng thường ổn định trong một khoảng thời gian dài (người dùng không thường xuyên cài đặt rồi gỡ cài đặt codec, v.v.), khả năng phương tiện có thể, toàn bộ hoặc một phần, trở thành một phương thức liên gốc để nhận dạng người dùng.
Vì lý do đó, trong ngữ cảnh nhạy cảm với quyền riêng tư, trình duyệt có thể chọn che giấu các khả năng; ví dụ, bằng cách bỏ qua các cấu hình codec ít dùng.

### Mảng codecs

Mảng `codecs` là một mảng các đối tượng mô tả một codec đơn lẻ và các khả năng cơ bản của nó.
Trình duyệt chỉ báo cáo riêng các tổ hợp khả năng khác nhau.
Nếu hai tập khả năng có thể được mô tả bằng một, thì chúng sẽ được gộp lại.
Điều đó có nghĩa là, chẳng hạn, nếu có hai mục cho codec H.264 (được xác định bởi [`mimeType`](#mimetype) là "video/H264"), thì vẫn có các giá trị khác trong đối tượng khả năng cho biết chúng khác nhau ở điểm nào đó.

Có ba mục đặc biệt luôn phải có, đại diện cho các thành phần nền tảng của transport. Các thành phần đó là:

- RED (REDundant Audio Data)
  - : Kiểu media của một mục RED có thể thay đổi vì có nhiều phiên bản khác nhau, nhưng nó sẽ luôn kết thúc bằng `red`, chẳng hạn `video/red` hoặc `video/fwdred`.
    Chuẩn RED cơ bản có thể xem trong {{RFC(2198)}}. Có thể có nhiều mục RED nếu hỗ trợ nhiều dạng khác nhau; mỗi mục sẽ có một media type duy nhất trong trường hợp đó.
- FEC (Forward Error Correction)
  - : Một thành phần FEC xử lý dữ liệu sửa lỗi; kiểu media của nó cũng có thể thay đổi do có các phiên bản nâng cao của chuẩn, nhưng nó sẽ luôn kết thúc bằng `fec`.
    Một giá trị có thể là `video/ulpfec` (mô hình sửa lỗi tổng quát).
    Cũng có thể có nhiều mục FEC nếu hỗ trợ hơn một dạng.
- RTX (Retransmission)
  - : Thành phần này chịu trách nhiệm truyền lại dữ liệu; kiểu media của nó phải là `video/rtx`.
    Chỉ có một mục cho RTX, và nó sẽ không có thuộc tính [`sdpFmtpLine`](#sdpfmtpline).

Những mục này nên bị bỏ qua nếu bạn chỉ quan tâm đến codec liên quan đến phương tiện.

## Ví dụ

### Hỗ trợ tính năng

Bạn có thể dùng [`Object.hasOwn()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/hasOwn) để kiểm tra rằng `RTCRtpReceiver.getCapabilities()` được hỗ trợ:

```html hidden
<p id="log"></p>
```

```js hidden
const log = document.querySelector("#log");
```

```js
log.textContent = `RTCRtpReceiver.getCapabilities() supported: ${Object.hasOwn(
  RTCRtpReceiver,
  "getCapabilities",
)}`;
```

{{ EmbedLiveSample('Feature support', '100%', '30px') }}

### Kiểm tra hỗ trợ cho một codec cụ thể

Hàm dưới đây trả về một giá trị Boolean cho biết thiết bị có hỗ trợ nhận video H.264 trên một kết nối WebRTC hay không.

> [!NOTE]
> Vì `RTCRtpReceiver.getCapabilities()` thực chất chỉ cho biết mức hỗ trợ _có khả năng_ nên việc cố nhận video H.264 vẫn có thể thất bại ngay cả sau khi nhận phản hồi dương tính từ hàm này.

```js
function canReceiveH264() {
  let capabilities = RTCRtpReceiver.getCapabilities("video");

  capabilities.codecs.forEach((codec) => {
    if (codec.mimeType === "video/H264") {
      return true;
    }
  });
  return false;
}
```

### Lấy tất cả khả năng

Ví dụ mã này cho thấy cách chúng ta có thể lấy tất cả codec và header được hỗ trợ.
HTML định nghĩa một danh sách lựa chọn cho hai loại khả năng, và một vùng log.

```html
<select id="kind">
  <option value="audio">audio</option>
  <option value="video">video</option>
</select>
<textarea rows="40" cols="100" id="log"></textarea>
```

JavaScript định nghĩa một hàm để ghi log khả năng cho một "kind" cụ thể.
Hàm này được gọi ban đầu với giá trị `audio`.
Một listener cập nhật giá trị khi danh sách lựa chọn `kind` thay đổi.

```js
const log = document.querySelector("#log");
const kindSelector = document.querySelector("#kind");

logMediaCapabilities("audio");

kindSelector.addEventListener("click", () => {
  log.textContent = "";
  logMediaCapabilities(kindSelector.value);
});

function logMediaCapabilities(kind) {
  if (!Object.hasOwn(RTCRtpReceiver, "getCapabilities")) {
    log.textContent = "RTCRtpReceiver.getCapabilities() not supported";
    return;
  }
  const capabilities = RTCRtpReceiver.getCapabilities(`${kind}`);
  log.textContent += "Headers\n";
  capabilities.headerExtensions.forEach((header) => {
    log.textContent += ` uri: ${header.uri}\n`;
  });

  log.textContent += "\nCodecs\n";
  capabilities.codecs.forEach((codec) => {
    log.textContent += ` mime type: ${codec.mimeType}\n`;
    log.textContent += `   channels: ${codec.channels}\n`; // max channels - e.g. 2 is stereo
    log.textContent += `   clockRate: ${codec.clockRate}\n`; // clock rate in Hz
    log.textContent += `   sdpFmtpLine: ${codec.sdpFmtpLine}\n`; // mime media type and subtype
  });
}
```

#### Kết quả

{{ EmbedLiveSample('Getting all capabilities', '100%', '500px') }}

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}
