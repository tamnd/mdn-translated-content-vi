---
title: "MediaDevices: getUserMedia() method"
short-title: getUserMedia()
slug: Web/API/MediaDevices/getUserMedia
page-type: web-api-instance-method
browser-compat: api.MediaDevices.getUserMedia
---

{{securecontext_header}}{{APIRef("Media Capture and Streams")}}

Phương thức **`getUserMedia()`** của giao diện {{domxref("MediaDevices")}} nhắc người dùng cấp quyền sử dụng một nguồn đầu vào phương tiện để tạo ra một {{domxref("MediaStream")}} có các track chứa những kiểu phương tiện được yêu cầu.

Luồng đó có thể bao gồm, chẳng hạn, một track video (do nguồn video phần cứng hoặc ảo như camera, thiết bị ghi video, dịch vụ chia sẻ màn hình, v.v. tạo ra), một track audio (tương tự, do nguồn âm thanh vật lý hoặc ảo như microphone, bộ chuyển đổi A/D, hoặc tương tự), và có thể cả các kiểu track khác.

Nó trả về một {{jsxref("Promise")}} được resolve thành một đối tượng {{domxref("MediaStream")}}.
Nếu người dùng từ chối cấp quyền, hoặc không có media phù hợp, promise sẽ bị reject với `NotAllowedError` hoặc `NotFoundError` {{domxref("DOMException")}} tương ứng.

> [!NOTE]
> Có thể promise trả về _không_ được resolve cũng _không_ bị reject, vì người dùng không bắt buộc phải đưa ra lựa chọn và có thể bỏ qua yêu cầu.

## Cú pháp

```js-nolint
getUserMedia(constraints)
```

### Tham số

- `constraints`
  - : Một đối tượng chỉ định các kiểu media cần yêu cầu, cùng với các yêu cầu cho từng kiểu.

    Tham số `constraints` là một đối tượng có hai thành viên: `video` và `audio`, mô tả các kiểu media được yêu cầu.
    Phải chỉ định một hoặc cả hai.
    Nếu trình duyệt không thể tìm thấy tất cả các track media của kiểu được chỉ định đáp ứng các constraints đã cho, promise trả về sẽ bị reject với `NotFoundError` {{domxref("DOMException")}}.

    Với cả `video` và `audio`, giá trị của nó là một boolean hoặc một object.
    Giá trị mặc định là `false`.
    - Nếu chỉ định `true` cho một kiểu media, stream kết quả _bắt buộc_ phải có track thuộc kiểu đó.
      Nếu vì bất kỳ lý do nào không thể đưa track đó vào, promise trả về sẽ reject.
    - Nếu chỉ định `false` cho một kiểu media, stream kết quả _không được_ có track thuộc kiểu đó, nếu không promise sẽ reject.
      Vì cả `video` và `audio` đều mặc định là `false`, nếu đối tượng `constraints` không chứa thuộc tính nào trong hai thuộc tính này hoặc hoàn toàn không có mặt, promise trả về sẽ luôn reject.
    - Nếu chỉ định một object cho một kiểu media, object đó được hiểu như một dictionary {{domxref("MediaTrackConstraints")}}.

### Giá trị trả về

Một {{jsxref("Promise")}} mà trình xử lý fulfillment nhận được một đối tượng {{domxref("MediaStream")}} khi media được yêu cầu đã lấy thành công.

### Ngoại lệ

- `AbortError` {{domxref("DOMException")}}
  - : Mặc dù người dùng và hệ điều hành đều đã cấp quyền truy cập vào thiết bị phần cứng, và không có sự cố phần cứng nào xảy ra gây ra `NotReadableError` {{domxref("DOMException")}}, lỗi này được ném nếu có sự cố nào đó ngăn thiết bị được sử dụng.

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném nếu tài liệu hiện tại không ở trạng thái hoạt động hoàn chỉnh.

- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném nếu một hoặc nhiều thiết bị nguồn được yêu cầu không thể sử dụng tại thời điểm này.
    Điều này xảy ra nếu ngữ cảnh duyệt web không an toàn (tức là trang được tải bằng HTTP thay vì HTTPS).
    Nó cũng xảy ra nếu người dùng đã chỉ định rằng phiên duyệt hiện tại không được phép truy cập thiết bị, người dùng đã từ chối truy cập cho phiên hiện tại, hoặc người dùng đã từ chối toàn bộ quyền truy cập vào thiết bị user media trên toàn hệ thống.
    Trên các trình duyệt hỗ trợ quản lý quyền media bằng [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy), lỗi này được trả về nếu Permissions Policy không được cấu hình để cho phép truy cập vào các nguồn đầu vào.

    > [!NOTE]
    > Các phiên bản cũ hơn của đặc tả dùng `SecurityError` cho trường hợp này; `SecurityError` hiện đã mang ý nghĩa mới.

- `NotFoundError` {{domxref("DOMException")}}
  - : Được ném nếu không tìm thấy track media nào thuộc kiểu được chỉ định đáp ứng các constraints đã cho.
- `NotReadableError` {{domxref("DOMException")}}
  - : Được ném nếu, mặc dù người dùng đã cấp quyền sử dụng các thiết bị phù hợp, một lỗi phần cứng xảy ra ở mức hệ điều hành, trình duyệt, hoặc trang web khiến không thể truy cập thiết bị.
- `OverconstrainedError` {{domxref("DOMException")}}
  - : Được ném nếu các constraints đã chỉ định dẫn đến không có thiết bị nào đáp ứng tiêu chí yêu cầu.
    Lỗi này là một đối tượng kiểu `OverconstrainedError`, và có thuộc tính `constraint` với giá trị chuỗi là tên của constraint không thể thỏa mãn, cùng với thuộc tính `message` chứa một chuỗi mô tả dễ hiểu về vấn đề.

    > [!NOTE]
    > Vì lỗi này có thể xảy ra ngay cả khi người dùng chưa cấp quyền sử dụng thiết bị nền tảng, nó có thể được dùng như một bề mặt [fingerprinting](/en-US/docs/Glossary/Fingerprinting).

- `SecurityError` {{domxref("DOMException")}}
  - : Được ném nếu hỗ trợ user media bị vô hiệu hóa trên {{domxref("Document")}} mà `getUserMedia()` được gọi trên đó.
    Cơ chế bật và tắt hỗ trợ user media được để cho từng user agent quyết định.
- {{jsxref("TypeError")}}
  - : Được ném nếu danh sách constraints được chỉ định rỗng, hoặc tất cả constraints đều đặt thành `false`.
    Điều này cũng có thể xảy ra nếu bạn cố gọi `getUserMedia()` trong một ngữ cảnh không an toàn, vì {{domxref("navigator.mediaDevices")}} là `undefined` trong ngữ cảnh không an toàn.

## Quyền riêng tư và bảo mật

Là một API có thể liên quan đến những lo ngại đáng kể về quyền riêng tư, đặc tả `getUserMedia()` đặt ra rất nhiều yêu cầu về quyền riêng tư và bảo mật mà trình duyệt bắt buộc phải đáp ứng.

`getUserMedia()` là một tính năng mạnh chỉ có thể dùng trong [secure contexts](/en-US/docs/Web/Security/Defenses/Secure_Contexts); trong các ngữ cảnh không an toàn, `navigator.mediaDevices` là `undefined`, ngăn truy cập vào `getUserMedia()`.
Nói ngắn gọn, secure context là một trang được tải bằng HTTPS hoặc lược đồ URL `file:///`, hoặc một trang được tải từ `localhost`.

Ngoài ra, luôn phải có sự cho phép của người dùng để truy cập đầu vào audio và video của họ.
Chỉ tài liệu cấp cao nhất của một window trong một origin hợp lệ mới có thể yêu cầu quyền sử dụng `getUserMedia()`, trừ khi ngữ cảnh cấp cao nhất đó rõ ràng cấp quyền cho một {{HTMLElement("iframe")}} cụ thể thông qua [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy).
Nếu không, người dùng sẽ thậm chí không được hỏi để cấp quyền dùng các thiết bị đầu vào.

Để biết thêm chi tiết về các yêu cầu và quy tắc này, cách chúng phản ánh trong ngữ cảnh mà mã của bạn đang chạy, và cách trình duyệt quản lý các vấn đề quyền riêng tư và bảo mật của người dùng, hãy đọc tiếp.

### Quyền riêng tư của người dùng

Là một API có thể liên quan đến những lo ngại đáng kể về quyền riêng tư, `getUserMedia()` theo đặc tả phải tuân theo các yêu cầu rất cụ thể về thông báo cho người dùng và quản lý quyền.
Trước tiên, `getUserMedia()` luôn phải xin quyền người dùng trước khi mở bất kỳ nguồn đầu vào thu media nào như webcam hoặc microphone.
Trình duyệt có thể cung cấp tính năng cấp quyền một lần cho mỗi miền, nhưng ít nhất phải hỏi ở lần đầu tiên, và người dùng phải cấp quyền liên tục một cách rõ ràng nếu họ chọn cho phép.

Các quy tắc về thông báo cũng quan trọng không kém.
Trình duyệt bắt buộc phải hiển thị chỉ báo cho biết camera hoặc microphone đang được sử dụng, ngoài bất kỳ chỉ báo phần cứng nào có thể tồn tại.
Chúng cũng phải hiển thị chỉ báo rằng quyền đã được cấp để dùng một thiết bị đầu vào, ngay cả khi thiết bị hiện không ghi hình/ghi âm.

Ví dụ trong Firefox, thanh địa chỉ hiển thị một biểu tượng đỏ nhấp nháy để báo rằng việc ghi đang diễn ra.
Biểu tượng có màu xám nếu quyền đã được cấp nhưng việc ghi hiện không diễn ra.
Đèn vật lý của thiết bị được dùng để cho biết việc ghi có đang hoạt động hay không.
Nếu bạn đã tắt tiếng camera của mình (gọi là "facemuting"), đèn hoạt động của camera sẽ tắt để cho biết camera không còn ghi bạn nữa, nhưng vẫn giữ quyền để tiếp tục dùng camera khi việc tắt tiếng kết thúc.

### Bảo mật

Có nhiều cách để cơ chế và kiểm soát bảo mật trong một {{Glossary("user agent")}} khiến `getUserMedia()` trả về lỗi liên quan đến bảo mật.

#### Permissions Policy

Hai chỉ thị [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) áp dụng cho `getUserMedia()` là `camera` và `microphone`.

Ví dụ, header HTTP này sẽ cho phép tài liệu và bất kỳ phần tử {{HTMLElement("iframe")}} nhúng nào được tải từ cùng origin sử dụng camera:

```http
Permissions-Policy: camera=(self)
```

Điều này sẽ yêu cầu quyền truy cập microphone cho origin hiện tại và origin cụ thể `https://developer.mozilla.org`:

```http
Permissions-Policy: microphone=(self "https://developer.mozilla.org")
```

Nếu bạn dùng `getUserMedia()` bên trong một `<iframe>`, bạn có thể yêu cầu quyền chỉ cho frame đó, và điều đó rõ ràng an toàn hơn so với yêu cầu một quyền tổng quát hơn.
Ở đây, chỉ ra rằng chúng ta cần khả năng sử dụng cả camera lẫn microphone:

```html
<iframe src="https://mycode.example.net/etc" allow="camera; microphone">
</iframe>
```

#### Bảo mật dựa trên mã hóa

Phương thức `getUserMedia()` chỉ có sẵn trong [secure contexts](/en-US/docs/Web/Security/Defenses/Secure_Contexts).
Secure context là ngữ cảnh mà trình duyệt có thể tin tưởng hợp lý rằng chứa một tài liệu được tải an toàn bằng HTTPS/TLS, và có mức độ tiếp xúc hạn chế với các ngữ cảnh không an toàn.
Nếu một tài liệu không được tải trong secure context, thuộc tính {{domxref("navigator.mediaDevices")}} là `undefined`, khiến việc truy cập `getUserMedia()` là không thể.

Cố truy cập `getUserMedia()` trong tình huống này sẽ dẫn đến {{jsxref("TypeError")}}.

#### Bảo mật nguồn tài liệu

Vì mối lo ngại bảo mật hiển nhiên liên quan đến `getUserMedia()` nếu bị dùng một cách bất ngờ hoặc không được quản lý bảo mật cẩn thận, nó chỉ có thể được dùng trong secure context.
Có nhiều cách không an toàn để tải một tài liệu vốn sau đó có thể cố gọi `getUserMedia()`.
Sau đây là các ví dụ về những tình huống mà `getUserMedia()` không được phép gọi:

- Một tài liệu được tải vào phần tử {{HTMLElement("iframe")}} có sandbox không thể gọi `getUserMedia()` trừ khi thuộc tính [`sandbox`](/en-US/docs/Web/HTML/Reference/Elements/iframe#sandbox) của `<iframe>` được đặt thành `allow-same-origin`.
- Một tài liệu được tải bằng URL `data://` hoặc `blob://` không có origin (chẳng hạn khi một trong các URL này được người dùng gõ vào thanh địa chỉ) không thể gọi `getUserMedia()`.
  Những loại URL này khi được tải từ mã JavaScript sẽ kế thừa quyền của script.
- Bất kỳ tình huống nào khác không có origin, chẳng hạn khi thuộc tính [`srcdoc`](/en-US/docs/Web/HTML/Reference/Elements/iframe#srcdoc) được dùng để chỉ định nội dung của một frame.

## Ví dụ

### Sử dụng getUserMedia()

Thông thường, bạn sẽ truy cập đối tượng singleton {{domxref("MediaDevices")}} bằng {{domxref("navigator.mediaDevices")}}, như sau:

```js
async function getMedia(constraints) {
  let stream = null;

  try {
    stream = await navigator.mediaDevices.getUserMedia(constraints);
    /* use the stream */
  } catch (err) {
    /* handle the error */
  }
}
```

Tương tự, nếu dùng trực tiếp promise thô, mã sẽ như sau:

```js
navigator.mediaDevices
  .getUserMedia(constraints)
  .then((stream) => {
    /* use the stream */
  })
  .catch((err) => {
    /* handle the error */
  });
```

> [!NOTE]
> Nếu tài liệu hiện tại không được tải an toàn, `navigator.mediaDevices` sẽ là `undefined`, và bạn không thể dùng `getUserMedia()`.
> Xem [Bảo mật](#security) để biết thêm thông tin về vấn đề này và các vấn đề bảo mật khác liên quan đến việc dùng `getUserMedia()`.

Bên dưới là một số ví dụ cho tham số `constraints`.

Yêu cầu sau xin cả audio và video mà không đặt yêu cầu cụ thể nào:

```js
getUserMedia({
  audio: true,
  video: true,
});
```

Trong khi thông tin về camera và microphone của người dùng không thể truy cập vì lý do riêng tư, một ứng dụng có thể yêu cầu các khả năng camera và microphone mà nó cần và muốn bằng cách dùng các ràng buộc bổ sung.
Lệnh sau thể hiện sự ưu tiên cho độ phân giải camera 1280x720:

```js
getUserMedia({
  audio: true,
  video: { width: 1280, height: 720 },
});
```

Trình duyệt sẽ cố gắng đáp ứng các constraints, và sẽ trả về một track phù hợp nếu phần cứng nền tảng hỗ trợ.
Nếu không được hỗ trợ, trình duyệt có thể thử cắt và giảm tỷ lệ một luồng có độ phân giải cao hơn từ phần cứng nền tảng để khớp với constraint (và cũng có thể giảm frame rate nếu điều đó được ràng buộc).
Hành vi này có thể được ép bằng cách đặt constraint [`resizeMode`](/en-US/docs/Web/API/MediaTrackConstraints#resizemode) thành `crop-and-scale` (hoặc vô hiệu hóa bằng cách đặt thành `none`):

```js
getUserMedia({
  audio: true,
  video: {
    width: { ideal: 1280 },
    height: { ideal: 720 },
  },
});
```

Không phải mọi constraint đều là số.
Ví dụ, trên thiết bị di động, đoạn sau sẽ ưu tiên camera trước (nếu có) thay vì camera sau:

```js
getUserMedia({
  audio: true,
  video: { facingMode: "user" },
});
```

Để _bắt buộc_ dùng camera sau, hãy dùng:

```js
getUserMedia({
  audio: true,
  video: {
    facingMode: { exact: "environment" },
  },
});
```

Một constraint không phải số khác là `deviceId`.
Nếu bạn có `deviceId` từ {{domxref("mediaDevices.enumerateDevices()")}}, bạn có thể dùng nó để yêu cầu một thiết bị cụ thể:

```js
getUserMedia({
  video: {
    deviceId: myPreferredCameraDeviceId,
  },
});
```

Đoạn trên sẽ trả về camera bạn yêu cầu, hoặc một camera khác nếu camera cụ thể đó không còn khả dụng.
Thông tin sẵn có nội bộ của trình duyệt, chẳng hạn như sở thích người dùng, cũng có thể ghi đè yêu cầu của bạn.
Ví dụ, khi người dùng được hỏi về quyền camera, camera họ chọn có thể được ưu tiên hơn camera bạn yêu cầu.
Một lần nữa, để _bắt buộc_ dùng camera cụ thể đó, bạn sẽ dùng:

```js
getUserMedia({
  video: {
    deviceId: {
      exact: myExactCameraOrBustDeviceId,
    },
  },
});
```

### Width and height

Ví dụ này đưa ra ưu tiên cho độ phân giải camera và gán đối tượng {{domxref("MediaStream")}} kết quả vào một phần tử video.

```js
// Ưu tiên độ phân giải camera gần nhất với 1280x720.
const constraints = {
  audio: true,
  video: { width: 1280, height: 720 },
};

navigator.mediaDevices
  .getUserMedia(constraints)
  .then((mediaStream) => {
    const video = document.querySelector("video");
    video.srcObject = mediaStream;
    video.onloadedmetadata = () => {
      video.play();
    };
  })
  .catch((err) => {
    // luôn kiểm tra lỗi ở cuối.
    console.error(`${err.name}: ${err.message}`);
  });
```

### Frame rate

Tốc độ khung hình thấp hơn có thể mong muốn trong một số trường hợp, như truyền WebRTC có giới hạn băng thông.

```js
const constraints = {
  video: { frameRate: { ideal: 10, max: 15 } },
};
```

### Camera trước và sau

Trên điện thoại di động.

```js
let front = false;
document.getElementById("flip-button").onclick = () => {
  front = !front;
};

const constraints = {
  video: { facingMode: front ? "user" : "environment" },
};
```

> [!NOTE]
> Trong một số trường hợp, có thể cần giải phóng chế độ camera hiện tại trước khi bạn có thể chuyển sang một chế độ khác.
> Để đảm bảo việc chuyển camera, nên giải phóng tài nguyên media bằng cách gọi phương thức "stop()" trên track trước khi yêu cầu một facing mode khác.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- API legacy cũ {{domxref("Navigator.getUserMedia()")}}
- {{domxref("MediaDevices.enumerateDevices()")}}: Liệt kê các thiết bị media có sẵn
- {{domxref("WebRTC API", "", "", "nocode")}}
- {{domxref("Media Capture and Streams API", "", "", "nocode")}}
- {{domxref("Screen Capture API", "", "", "nocode")}}: Thu nội dung màn hình dưới dạng một {{domxref("MediaStream")}}
- {{domxref("MediaDevices.getDisplayMedia()")}}: Lấy một luồng chứa nội dung màn hình
- {{domxref("Media Capture and Streams API/Taking Still Photos", "Taking webcam photos", "", "nocode")}}: Hướng dẫn dùng `getUserMedia()` để chụp ảnh tĩnh thay vì video
