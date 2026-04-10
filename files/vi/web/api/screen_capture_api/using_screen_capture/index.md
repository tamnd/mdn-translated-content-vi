---
title: Dùng Screen Capture API
slug: Web/API/Screen_Capture_API/Using_Screen_Capture
page-type: guide
browser-compat: api.MediaDevices.getDisplayMedia
---

{{DefaultAPISidebar("Screen Capture API")}}

Trong bài viết này, chúng ta sẽ xem cách dùng Screen Capture API và phương thức {{domxref("MediaDevices.getDisplayMedia", "getDisplayMedia()")}} của nó để ghi lại một phần hoặc toàn bộ màn hình cho mục đích phát trực tuyến, ghi hình, hoặc chia sẻ trong một phiên họp [WebRTC](/en-US/docs/Web/API/WebRTC_API).

> [!NOTE]
> Có thể hữu ích khi biết rằng các phiên bản gần đây của shim [WebRTC adapter.js](https://github.com/webrtcHacks/adapter) có bao gồm các triển khai `getDisplayMedia()` để bật chia sẻ màn hình trên những trình duyệt hỗ trợ nó nhưng chưa triển khai API tiêu chuẩn hiện tại. Điều này hoạt động ít nhất với Chrome, Edge và Firefox.

## Ghi nội dung màn hình

Việc ghi nội dung màn hình thành một {{domxref("MediaStream")}} trực tiếp bắt đầu bằng cách gọi {{domxref("MediaDevices.getDisplayMedia", "navigator.mediaDevices.getDisplayMedia()")}}, phương thức này trả về một promise giải quyết thành một stream chứa nội dung màn hình trực tiếp. Đối tượng `displayMediaOptions` được tham chiếu trong các ví dụ dưới đây có thể trông như sau:

```js
const displayMediaOptions = {
  video: {
    displaySurface: "browser",
  },
  audio: {
    suppressLocalAudioPlayback: false,
  },
  preferCurrentTab: false,
  selfBrowserSurface: "exclude",
  systemAudio: "include",
  surfaceSwitching: "include",
  monitorTypeSurfaces: "include",
};
```

### Bắt đầu ghi màn hình: kiểu `async`/`await`

```js
async function startCapture(displayMediaOptions) {
  let captureStream = null;

  try {
    captureStream =
      await navigator.mediaDevices.getDisplayMedia(displayMediaOptions);
  } catch (err) {
    console.error(`Error: ${err}`);
  }
  return captureStream;
}
```

Bạn có thể viết đoạn mã này bằng một hàm bất đồng bộ và toán tử [`await`](/en-US/docs/Web/JavaScript/Reference/Operators/await), như ở trên, hoặc dùng trực tiếp {{jsxref("Promise")}}, như bên dưới.

### Bắt đầu ghi màn hình: kiểu `Promise`

```js
function startCapture(displayMediaOptions) {
  return navigator.mediaDevices
    .getDisplayMedia(displayMediaOptions)
    .catch((err) => {
      console.error(err);
      return null;
    });
}
```

Dù theo cách nào, {{Glossary("user agent")}} cũng phản hồi bằng cách trình bày một giao diện yêu cầu người dùng chọn vùng màn hình để chia sẻ. Cả hai cách triển khai `startCapture()` này đều trả về {{domxref("MediaStream")}} chứa hình ảnh hiển thị đã được ghi.

Xem [Tùy chọn và ràng buộc](#options_and_constraints) bên dưới để biết thêm về cách chỉ định loại vùng hiển thị bạn muốn và các cách khác để điều chỉnh stream kết quả.

### Ví dụ về một cửa sổ cho phép người dùng chọn vùng hiển thị để ghi

![Ảnh chụp cửa sổ của Chrome để chọn vùng nguồn cần ghi](chrome-screen-capture-window.png)

Sau đó, bạn có thể dùng stream đã ghi, `captureStream`, cho bất kỳ thứ gì chấp nhận stream làm đầu vào. Các [ví dụ](#examples) bên dưới cho thấy vài cách sử dụng stream.

### Vùng hiển thị trực quan và vùng hiển thị logic

Trong ngữ cảnh Screen Capture API, một **display surface** là bất kỳ đối tượng nội dung nào có thể được API chọn để chia sẻ. Các vùng được chia sẻ bao gồm nội dung của một tab trình duyệt, một cửa sổ hoàn chỉnh, và một màn hình hoặc nhóm màn hình được gộp lại thành một vùng duy nhất.

Có hai loại vùng hiển thị. Một **visible display surface** là vùng hoàn toàn hiển thị trên màn hình, như cửa sổ hoặc tab đang ở phía trước, hoặc toàn bộ màn hình.

Một **logical display surface** là vùng bị che một phần hoặc hoàn toàn, do bị một đối tượng khác chồng lên ở một mức nào đó, hoặc bị ẩn hoàn toàn hay nằm ngoài màn hình. Screen Capture API xử lý những trường hợp này theo nhiều cách khác nhau. Nói chung, trình duyệt sẽ cung cấp một hình ảnh che phần bị ẩn của logical display surface theo một cách nào đó, chẳng hạn làm mờ hoặc thay bằng một màu hay hoa văn. Việc này được thực hiện vì lý do bảo mật, vì nội dung mà người dùng không nhìn thấy có thể chứa dữ liệu mà họ không muốn chia sẻ.

Một user agent có thể cho phép ghi toàn bộ nội dung của một cửa sổ bị che sau khi nhận được quyền từ người dùng. Trong trường hợp này, user agent có thể bao gồm nội dung bị che, либо bằng cách lấy nội dung hiện tại của phần bị ẩn của cửa sổ, hoặc bằng cách hiển thị nội dung mới nhất có thể nhìn thấy nếu nội dung hiện tại không có sẵn.

### Tùy chọn và ràng buộc

Đối tượng tùy chọn truyền vào {{domxref("MediaDevices.getDisplayMedia", "getDisplayMedia()")}} được dùng để đặt tùy chọn cho stream kết quả.

Các đối tượng `video` và `audio` được truyền vào đối tượng tùy chọn cũng có thể chứa các ràng buộc bổ sung dành riêng cho các media track đó. Xem [Thuộc tính của shared screen tracks](/en-US/docs/Web/API/MediaTrackConstraints#instance_properties_of_shared_screen_tracks) để biết chi tiết về các ràng buộc bổ sung cho việc cấu hình một screen-capture stream, được thêm vào {{domxref("MediaTrackConstraints")}}, {{domxref("MediaTrackSupportedConstraints")}} và {{domxref("MediaTrackSettings")}}.

Không có ràng buộc nào được áp dụng cho đến sau khi nội dung cần ghi đã được chọn. Các ràng buộc chỉ làm thay đổi những gì bạn thấy trong stream kết quả. Ví dụ, nếu bạn chỉ định ràng buộc {{domxref("MediaTrackConstraints.width", "width")}} cho video, nó sẽ được áp dụng bằng cách co giãn video sau khi người dùng chọn vùng để chia sẻ. Nó không đặt ra giới hạn cho kích thước của nguồn gốc.

> [!NOTE]
> Các ràng buộc _không bao giờ_ làm thay đổi danh sách nguồn khả dụng để Screen Sharing API có thể ghi. Điều này bảo đảm rằng ứng dụng web không thể ép người dùng chia sẻ nội dung cụ thể bằng cách thu hẹp danh sách nguồn cho tới khi chỉ còn một mục.

Khi việc ghi hiển thị đang diễn ra, máy đang chia sẻ nội dung màn hình sẽ hiển thị một dạng chỉ báo nào đó để người dùng biết việc chia sẻ đang diễn ra.

> [!NOTE]
> Vì lý do quyền riêng tư và bảo mật, các nguồn chia sẻ màn hình không được liệt kê bằng {{domxref("MediaDevices.enumerateDevices", "enumerateDevices()")}}. Liên quan đến điều này, sự kiện {{domxref("MediaDevices/devicechange_event", "devicechange")}} sẽ không bao giờ được gửi khi có thay đổi ở các nguồn khả dụng cho `getDisplayMedia()`.

### Ghi âm thanh được chia sẻ

{{domxref("MediaDevices.getDisplayMedia", "getDisplayMedia()")}} thường được dùng nhất để ghi video từ màn hình người dùng (hoặc một phần của nó). Tuy nhiên, {{Glossary("user agent", "các user agent")}} có thể cho phép ghi âm thanh cùng với nội dung video. Nguồn của âm thanh này có thể là cửa sổ được chọn, toàn bộ hệ thống âm thanh của máy tính, hoặc microphone của người dùng (hoặc kết hợp của tất cả các nguồn trên).

Trước khi bắt đầu một dự án cần chia sẻ âm thanh, hãy kiểm tra [tương thích trình duyệt](/en-US/docs/Web/API/MediaDevices/getDisplayMedia#browser_compatibility) của `getDisplayMedia()` để xem trình duyệt bạn cần hỗ trợ có hỗ trợ âm thanh trong stream màn hình đã ghi hay không.

Để yêu cầu chia sẻ màn hình kèm âm thanh, các tùy chọn truyền vào `getDisplayMedia()` có thể trông như sau:

```js
const displayMediaOptions = {
  video: true,
  audio: true,
};
```

Điều này cho phép người dùng hoàn toàn tự do chọn bất cứ thứ gì họ muốn, trong giới hạn mà user agent hỗ trợ. Có thể tinh chỉnh thêm bằng cách chỉ định các tùy chọn và ràng buộc bổ sung bên trong các đối tượng `audio` và `video`:

```js
const displayMediaOptions = {
  video: {
    displaySurface: "window",
  },
  audio: {
    echoCancellation: true,
    noiseSuppression: true,
    sampleRate: 44100,
    suppressLocalAudioPlayback: true,
  },
  surfaceSwitching: "include",
  selfBrowserSurface: "exclude",
  systemAudio: "exclude",
};
```

Trong ví dụ này, vùng hiển thị được ghi sẽ là toàn bộ cửa sổ. Track âm thanh lý tưởng nên bật khử vang và khử nhiễu, có tốc độ lấy mẫu âm thanh lý tưởng 44,1kHz, và chặn phát lại âm thanh cục bộ.

Ngoài ra, ứng dụng đang gợi ý cho user agent rằng nó nên:

- Cung cấp một điều khiển trong lúc chia sẻ màn hình để cho phép người dùng chuyển tab được chia sẻ một cách động.
- Ẩn tab hiện tại khỏi danh sách các tùy chọn được trình bày cho người dùng khi yêu cầu ghi được tạo.
- Không đưa âm thanh hệ thống vào các nguồn âm thanh có thể được cung cấp cho người dùng.

Ghi âm thanh luôn là tùy chọn, và ngay cả khi nội dung web yêu cầu một stream có cả âm thanh lẫn video, {{domxref("MediaStream")}} trả về vẫn có thể chỉ có một video track, không có âm thanh.

## Sử dụng stream đã ghi

{{jsxref("promise")}} được trả về bởi {{domxref("MediaDevices.getDisplayMedia", "getDisplayMedia()")}} sẽ được giải quyết thành một {{domxref("MediaStream")}} chứa ít nhất một video stream có nội dung màn hình hoặc vùng màn hình, và được điều chỉnh hoặc lọc dựa trên các ràng buộc đã chỉ định khi gọi `getDisplayMedia()`.

### Rủi ro tiềm ẩn

Các vấn đề về quyền riêng tư và bảo mật quanh việc chia sẻ màn hình thường không quá nghiêm trọng, nhưng chúng vẫn tồn tại. Rủi ro lớn nhất là người dùng vô tình chia sẻ nội dung mà họ không muốn.

Ví dụ, các vi phạm quyền riêng tư và/hoặc bảo mật có thể dễ xảy ra nếu người dùng đang chia sẻ màn hình và một cửa sổ nền đang hiển thị chứa thông tin cá nhân, hoặc nếu trình quản lý mật khẩu của họ xuất hiện trong stream được chia sẻ. Hiệu ứng này có thể nghiêm trọng hơn khi ghi các logical display surface, vì chúng có thể chứa nội dung mà người dùng thậm chí không biết đến, chứ chưa nói đến việc nhìn thấy nó.

User agent coi trọng quyền riêng tư nên làm mờ hoặc che nội dung thực tế không hiển thị trên màn hình, trừ khi người dùng đã cấp phép rõ ràng cho việc chia sẻ nội dung đó.

### Xác nhận việc ghi nội dung hiển thị

Trước khi việc phát trực tuyến nội dung màn hình được ghi có thể bắt đầu, {{Glossary("user agent")}} sẽ yêu cầu người dùng xác nhận yêu cầu chia sẻ và chọn nội dung cần chia sẻ.

## Ví dụ

### Phát trực tuyến screen capture

Trong ví dụ này, nội dung của vùng màn hình được ghi sẽ được phát vào một phần tử {{HTMLElement("video")}} trên cùng trang.

#### JavaScript

Không cần quá nhiều mã để làm việc này, và nếu bạn quen dùng {{domxref("MediaDevices.getUserMedia", "getUserMedia()")}} để ghi video từ camera, bạn sẽ thấy {{domxref("MediaDevices.getDisplayMedia", "getDisplayMedia()")}} rất quen thuộc.

##### Thiết lập

Trước hết, chúng ta thiết lập một số hằng số để tham chiếu tới các phần tử trên trang mà ta cần truy cập: phần tử {{HTMLElement("video")}} nơi nội dung màn hình ghi được sẽ được phát tới, một khung để in output log, và các nút start và stop để bật và tắt việc ghi hình màn hình.

Đối tượng `displayMediaOptions` chứa các tùy chọn truyền vào `getDisplayMedia()`; ở đây thuộc tính {{domxref("MediaTrackConstraints.displaySurface", "displaySurface")}} được đặt là `window`, cho biết toàn bộ cửa sổ sẽ được ghi.

Cuối cùng, chúng ta thiết lập các trình nghe sự kiện để phát hiện người dùng nhấp vào các nút start và stop.

```js
const videoElem = document.getElementById("video");
const logElem = document.getElementById("log");
const startElem = document.getElementById("start");
const stopElem = document.getElementById("stop");

// Tùy chọn cho getDisplayMedia()

const displayMediaOptions = {
  video: {
    displaySurface: "window",
  },
  audio: false,
};

// Thiết lập trình nghe sự kiện cho các nút start và stop
startElem.addEventListener("click", (evt) => {
  startCapture();
});

stopElem.addEventListener("click", (evt) => {
  stopCapture();
});
```

##### Ghi log nội dung

Ví dụ này ghi đè một số phương thức {{domxref("console")}} để xuất thông điệp của chúng vào khối {{HTMLElement("pre")}} có ID là `log`.

```js
console.log = (msg) => (logElem.textContent = `${logElem.textContent}\n${msg}`);
console.error = (msg) =>
  (logElem.textContent = `${logElem.textContent}\nError: ${msg}`);
```

Điều này cho phép chúng ta dùng {{domxref("console/log_static", "console.log()")}} và {{domxref("console.error_static", "console.error()")}} để ghi thông tin vào hộp log trong tài liệu.

##### Bắt đầu ghi hiển thị

Phương thức `startCapture()` bên dưới bắt đầu ghi một {{domxref("MediaStream")}} có nội dung lấy từ một vùng màn hình do người dùng chọn. `startCapture()` được gọi khi nút "Start Capture" được nhấp.

```js
async function startCapture() {
  logElem.textContent = "";

  try {
    videoElem.srcObject =
      await navigator.mediaDevices.getDisplayMedia(displayMediaOptions);
    dumpOptionsInfo();
  } catch (err) {
    console.error(err);
  }
}
```

Sau khi xóa nội dung log để loại bỏ mọi văn bản còn sót lại từ lần thử trước, `startCapture()` gọi {{domxref("MediaDevices.getDisplayMedia", "getDisplayMedia()")}}, truyền vào đối tượng ràng buộc được xác định bởi `displayMediaOptions`. Nhờ dùng {{jsxref("Operators/await", "await")}}, dòng mã tiếp theo sẽ không chạy cho đến khi {{jsxref("promise")}} được trả về bởi `getDisplayMedia()` được giải quyết. Khi giải quyết xong, promise trả về một {{domxref("MediaStream")}}, stream này sẽ phát nội dung của màn hình, cửa sổ hoặc vùng khác mà người dùng chọn.

Stream được nối tới phần tử {{HTMLElement("video")}} bằng cách lưu `MediaStream` trả về vào thuộc tính {{domxref("HTMLMediaElement.srcObject", "srcObject")}} của phần tử.

Hàm `dumpOptionsInfo()` - mà chúng ta sẽ xem ở ngay sau đây - sẽ in thông tin về stream ra hộp log vì mục đích minh họa.

Nếu bất kỳ phần nào trong đó thất bại, mệnh đề [`catch()`](/en-US/docs/Web/JavaScript/Reference/Statements/try...catch) sẽ xuất thông báo lỗi vào hộp log.

##### Dừng ghi hiển thị

Phương thức `stopCapture()` được gọi khi nút "Stop Capture" được nhấp. Nó dừng stream bằng cách lấy danh sách track của nó qua {{domxref("MediaStream.getTracks()")}}, rồi gọi phương thức {{domxref("MediaStreamTrack.stop", "stop()")}} của từng track. Sau khi xong, `srcObject` được đặt thành `null` để bảo đảm bất kỳ ai quan tâm đều hiểu rằng không còn stream nào được nối.

```js
function stopCapture(evt) {
  let tracks = videoElem.srcObject.getTracks();

  tracks.forEach((track) => track.stop());
  videoElem.srcObject = null;
}
```

##### In thông tin cấu hình

Vì mục đích thông tin, phương thức `startCapture()` ở trên gọi một phương thức tên `dumpOptions()`, phương thức này xuất các thiết lập track hiện tại cũng như các ràng buộc đã áp dụng cho stream khi nó được tạo.

```js
function dumpOptionsInfo() {
  const videoTrack = videoElem.srcObject.getVideoTracks()[0];

  console.log("Track settings:");
  console.log(JSON.stringify(videoTrack.getSettings(), null, 2));
  console.log("Track constraints:");
  console.log(JSON.stringify(videoTrack.getConstraints(), null, 2));
}
```

Track list được lấy bằng cách gọi {{domxref("MediaStream.getVideoTracks", "getVideoTracks()")}} trên {{domxref("MediaStream")}} của màn hình đã ghi. Các thiết lập hiện đang có hiệu lực được lấy bằng {{domxref("MediaStreamTrack.getSettings", "getSettings()")}}, còn các ràng buộc đã thiết lập được lấy bằng {{domxref("MediaStreamTrack.getConstraints", "getConstraints()")}}.

#### HTML

HTML bắt đầu bằng một đoạn giới thiệu, rồi đi vào phần chính.

```html
<p>
  This example shows you the contents of the selected part of your display.
  Click the Start Capture button to begin.
</p>

<p>
  <button id="start">Start Capture</button>&nbsp;<button id="stop">
    Stop Capture
  </button>
</p>

<video id="video" autoplay></video>
<br />

<strong>Log:</strong>
<br />
<pre id="log"></pre>
```

Các phần chính của HTML là:

1. Một {{HTMLElement("button")}} có nhãn "Start Capture" mà khi được nhấp sẽ gọi hàm `startCapture()` để yêu cầu quyền truy cập và bắt đầu ghi nội dung màn hình.
2. Một nút thứ hai, "Stop Capture", mà khi được nhấp sẽ gọi `stopCapture()` để chấm dứt việc ghi nội dung màn hình.
3. Một {{HTMLElement("video")}} để phát nội dung màn hình đã ghi.
4. Một khối {{HTMLElement("pre")}} để hiển thị văn bản log do phương thức {{domxref("console")}} bị chặn ghi ra.

#### CSS

CSS trong ví dụ này chỉ mang tính trình bày. Video được đặt viền và chiều rộng của nó được đặt để chiếm gần toàn bộ không gian ngang sẵn có (`width: 98%`). {{cssxref("max-width")}} được đặt thành `860px` để đặt giới hạn trên tuyệt đối cho kích thước video.

```css
#video {
  border: 1px solid #999999;
  width: 98%;
  max-width: 860px;
}

#log {
  width: 25rem;
  height: 15rem;
  border: 1px solid black;
  padding: 0.5rem;
  overflow: scroll;
}
```

#### Kết quả

Kết quả cuối cùng trông như sau. Nếu trình duyệt của bạn hỗ trợ Screen Capture API, việc nhấp "Start Capture" sẽ hiển thị giao diện của {{Glossary("user agent", "user agent")}} để chọn một màn hình, cửa sổ hoặc tab để chia sẻ.

{{EmbedLiveSample("Streaming screen capture", 640, 800, "", "", "", "display-capture")}}

## Bảo mật

Để hoạt động khi [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) được bật, bạn sẽ cần quyền `display-capture`. Việc này có thể được thực hiện bằng header {{HTTPHeader("Permissions-Policy")}} {{Glossary("HTTP")}} hoặc, nếu bạn đang dùng Screen Capture API trong một {{HTMLElement("iframe")}}, bằng thuộc tính [`allow`](/en-US/docs/Web/HTML/Reference/Elements/iframe#allow) của phần tử `<iframe>`.

Ví dụ, dòng sau trong HTTP headers sẽ bật Screen Capture API cho tài liệu và mọi phần tử {{HTMLElement("iframe")}} nhúng được tải từ cùng origin:

```http
Permissions-Policy: display-capture=(self)
```

Nếu bạn thực hiện screen capture bên trong một `<iframe>`, bạn có thể yêu cầu quyền chỉ cho khung đó, cách này rõ ràng an toàn hơn so với việc yêu cầu quyền rộng hơn:

```html
<iframe src="https://mycode.example.net/etc" allow="display-capture"> </iframe>
```

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Screen Capture API](/en-US/docs/Web/API/Screen_Capture_API)
- [Media Capture and Streams API](/en-US/docs/Web/API/Media_Capture_and_Streams_API)
- [Taking still photos with WebRTC](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Taking_still_photos)
- {{domxref("HTMLCanvasElement.captureStream()")}} để lấy một {{domxref("MediaStream")}} với nội dung trực tiếp của một {{HTMLElement("canvas")}}
