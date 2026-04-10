---
title: "Phương thức static getCapabilities() của RTCRtpSender"
short-title: getCapabilities()
slug: Web/API/RTCRtpSender/getCapabilities_static
page-type: web-api-static-method
browser-compat: api.RTCRtpSender.getCapabilities_static
---

{{APIRef("WebRTC")}}

_Phương thức static_ **`RTCRtpSender.getCapabilities()`** trả về một đối tượng mô tả khả năng codec và phần mở rộng header được hỗ trợ bởi {{domxref("RTCRtpSender")}}.

Tương tự, bạn có thể thu thập khả năng của các đối tượng {{domxref("RTCRtpReceiver")}} trên thiết bị bằng cách gọi hàm static {{domxref("RTCRtpReceiver.getCapabilities_static", "RTCRtpReceiver.getCapabilities()")}}.

## Cú pháp

```js-nolint
RTCRtpSender.getCapabilities(kind)
```

### Tham số

- `kind`
  - : Một chuỗi cho biết loại media mà khả năng gửi của trình duyệt được yêu cầu.
    Các loại media được hỗ trợ là: `audio` và `video`.

### Giá trị trả về

Một đối tượng mới cho biết trình duyệt có những khả năng gì để gửi loại media được chỉ định qua một {{domxref("RTCPeerConnection")}}.
Nếu trình duyệt không có bất kỳ hỗ trợ nào cho `kind` media đã cho, giá trị trả về là `null`.

Đối tượng trả về có các thuộc tính sau:

- `codecs`
  - : Một mảng các đối tượng, mỗi đối tượng mô tả khả năng cơ bản của một [codec media](/en-US/docs/Web/Media/Guides/Formats/WebRTC_codecs) được hỗ trợ bởi {{domxref("RTCRtpSender")}}.

    > [!NOTE]
    > Mảng chứa các mục đặc biệt đại diện cho các thành phần cơ bản của transport — các mục này có thể được bỏ qua nếu bạn chỉ quan tâm đến các codec thực tế được sử dụng cho media.
    > Các mục này được mô tả bên dưới trong phần [Mảng codecs](#mang-codecs).

    Mỗi đối tượng codec có các thuộc tính sau:
    - `channels` {{optional_inline}}
      - : Một giá trị nguyên dương cho biết số kênh tối đa được hỗ trợ bởi codec; ví dụ, một codec chỉ hỗ trợ âm thanh mono sẽ có giá trị là 1; codec stereo sẽ có giá trị 2, v.v.
    - `clockRate`
      - : Một số nguyên dương chỉ định tốc độ xung nhịp của codec tính bằng Hertz (Hz).
        IANA duy trì một [danh sách các codec và tham số của chúng](https://www.iana.org/assignments/rtp-parameters/rtp-parameters.xhtml#rtp-parameters-1), bao gồm cả tốc độ xung nhịp.
    - `mimeType`
      - : Một chuỗi cho biết kiểu và kiểu phụ MIME media của codec.
        Các chuỗi kiểu MIME được sử dụng bởi RTP khác với những chuỗi được sử dụng ở nơi khác.
        Xem {{RFC(3555, "", 4)}} để biết registry IANA đầy đủ của các loại này.
        Ngoài ra, xem [Các codec được sử dụng bởi WebRTC](/en-US/docs/Web/Media/Guides/Formats/WebRTC_codecs) để biết chi tiết về các codec tiềm năng có thể được tham chiếu ở đây.
    - `sdpFmtpLine` {{optional_inline}}
      - : Một chuỗi cung cấp trường tham số cụ thể định dạng từ dòng `a=fmtp` trong SDP tương ứng với codec, nếu dòng như vậy tồn tại.
        Nếu không có trường tham số, thuộc tính này sẽ bị loại bỏ.

- `headerExtensions`
  - : Một mảng các đối tượng, mỗi đối tượng cung cấp URI của một [phần mở rộng header](https://datatracker.ietf.org/doc/html/rfc3550#section-5.3.1) được hỗ trợ cho loại media `kind` hiện tại.
    Mỗi đối tượng có thuộc tính sau:
    - `uri`
      - : Một chuỗi, chỉ định URI của một phần mở rộng header.
        URI được định dạng như mô tả trong {{RFC(5285)}}.

## Mô tả

Là một hàm static, phương thức này luôn được gọi bằng cú pháp:

```js
capabilities = RTCRtpSender.getCapabilities("audio");
```

Tập hợp khả năng được trả về là danh sách lạc quan nhất có thể.
Hoàn toàn có thể xảy ra trường hợp một số tổ hợp tùy chọn nhất định không hoạt động khi bạn thực sự cố gắng sử dụng chúng.

Việc gọi `RTCRtpSender.getCapabilities()` không làm trình duyệt chuẩn bị sẵn sàng để xử lý media theo bất kỳ cách nào.
Không có gì được tải, tìm nạp hoặc chuẩn bị khác.
Đây là một cách để xác định những gì có thể sử dụng được trước khi bắt đầu cố gắng truy cập media.

Vì tập hợp các khả năng có sẵn thường ổn định trong một khoảng thời gian (mọi người không cài đặt và gỡ bỏ codec thường xuyên), khả năng media có thể toàn bộ hoặc một phần cung cấp một phương pháp cross-origin để nhận dạng người dùng.
Vì lý do đó, trong các ngữ cảnh nhạy cảm về quyền riêng tư, trình duyệt có thể chọn che giấu các khả năng; điều này có thể được thực hiện, ví dụ, bằng cách loại bỏ các cấu hình codec ít được sử dụng.

### Mảng codecs

Mảng `codecs` là một mảng các đối tượng mô tả một codec duy nhất và các khả năng cơ bản của nó.
Trình duyệt sẽ chỉ báo cáo các tổ hợp khả năng riêng biệt separately.
Nếu hai tập hợp khả năng có thể được mô tả thành một, chúng sẽ được gộp lại.
Điều đó có nghĩa là, ví dụ, nếu có hai mục cho codec H.264 (được xác định bởi [`mimeType`](#mimetype) là "video/H264"), sẽ có các giá trị khác trong các đối tượng khả năng cho biết chúng khác nhau như thế nào.

Có ba mục đặc biệt luôn phải có mặt, đại diện cho các thành phần cơ bản của transport. Các thành phần đó là:

- RED (Dữ liệu âm thanh dự phòng - REDundant Audio Data)
  - : Kiểu media của một mục RED có thể thay đổi do có nhiều phiên bản khác nhau, nhưng nó sẽ kết thúc bằng `red`, chẳng hạn như `video/red` hoặc `video/fwdred`.
    Tiêu chuẩn RED cơ bản có thể tìm thấy trong {{RFC(2198)}}. Có thể có nhiều mục cho RED nếu các dạng khác nhau được hỗ trợ; mỗi mục sẽ có một kiểu media duy nhất trong trường hợp đó.
- FEC (Sửa lỗi tiến - Forward Error Correction)
  - : Một thành phần FEC xử lý dữ liệu sửa lỗi; kiểu media của nó cũng có thể thay đổi do có các phiên bản nâng cao của tiêu chuẩn, nhưng nó sẽ luôn kết thúc bằng `fec`.
    Một giá trị khả dĩ là `video/ulpfec` (mô hình kết nối lỗi chung).
    Cũng có thể có nhiều mục FEC nếu có nhiều hơn một dạng được hỗ trợ.
- RTX (Truyền lại - Retransmission)
  - : Thành phần này chịu trách nhiệm truyền lại dữ liệu; kiểu media của nó phải là `video/rtx`.
    Chỉ có một mục cho RTX và nó sẽ không có thuộc tính [`sdpFmtpLine`](#sdpfmtpline).

Các mục này nên được bỏ qua nếu chỉ quan tâm đến các codec liên quan đến media.

## Ví dụ

### Hỗ trợ tính năng

Bạn có thể sử dụng [`Object.hasOwn()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/hasOwn) để kiểm tra xem `RTCRtpSender.getCapabilities()` có được hỗ trợ không:

```html hidden
<p id="log"></p>
```

```js hidden
const log = document.querySelector("#log");
```

```js
log.textContent = `RTCRtpSender.getCapabilities() được hỗ trợ: ${Object.hasOwn(
  RTCRtpSender,
  "getCapabilities",
)}`;
```

{{ EmbedLiveSample('Hỗ trợ tính năng', '100%', '30px') }}

### Kiểm tra hỗ trợ cho một codec cụ thể

Hàm dưới đây trả về `true` hoặc `false` cho biết thiết bị có hỗ trợ gửi video H.264 trên một {{domxref("RTCRtpSender")}} hay không.

> [!NOTE]
> Vì `RTCRtpSender.getCapabilities()` thực chất chỉ cho thấy khả năng _có thể_ hỗ trợ.
> Vì vậy, dưới đây hỗ trợ H.264 vẫn có thể thất bại ngay cả sau khi nhận được phản hồi tích cực từ hàm này.

```js
function canSendH264() {
  let capabilities = RTCRtpSender.getCapabilities("video");

  capabilities.codecs.forEach((codec) => {
    if (codec.mimeType === "video/H264") {
      return true;
    }
  });
  return false;
}
```

### Lấy tất cả khả năng

Ví dụ mã này cho thấy cách chúng ta có thể lấy tất cả các codec và header được hỗ trợ.
HTML định nghĩa một danh sách chọn cho hai loại khả năng và một vùng log.

```html
<select id="kind">
  <option value="audio">audio</option>
  <option value="video">video</option>
</select>
<textarea rows="40" cols="100" id="log"></textarea>
```

JavaScript định nghĩa một hàm để ghi log khả năng cho một "kind" cụ thể.
Hàm này được gọi ban đầu với giá trị `audio`.
Một listener cập nhật giá trị khi danh sách chọn `kind` thay đổi.

```js
const log = document.querySelector("#log");
const kindSelector = document.querySelector("#kind");

logMediaCapabilities("audio");

kindSelector.addEventListener("click", () => {
  log.textContent = "";
  logMediaCapabilities(kindSelector.value);
});

function logMediaCapabilities(kind) {
  const capabilities = RTCRtpSender.getCapabilities(`${kind}`);
  log.textContent += "Headers\n";
  capabilities.headerExtensions.forEach((header) => {
    log.textContent += ` uri: ${header.uri}\n`;
  });

  log.textContent += "\nCodecs\n";
  capabilities.codecs.forEach((codec) => {
    log.textContent += ` mime type: ${codec.mimeType}\n`;
    log.textContent += `   channels: ${codec.channels}\n`; // kênh tối đa - vd: 2 là stereo
    log.textContent += `   clockRate: ${codec.clockRate}\n`; // tốc độ xung nhịp tính bằng Hz
    log.textContent += `   sdpFmtpLine: ${codec.sdpFmtpLine}\n`; // kiểu và kiểu phụ MIME media
  });
}
```

#### Kết quả

{{ EmbedLiveSample('Lấy tất cả khả năng', '100%', '500px') }}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
