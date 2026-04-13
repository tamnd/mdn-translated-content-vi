---
title: Ghi một phần tử phương tiện
slug: Web/API/MediaStream_Recording_API/Recording_a_media_element
page-type: guide
---

{{DefaultAPISidebar("MediaStream Recording")}}

Trong khi bài viết Sử dụng MediaStream Recording API trình bày việc sử dụng giao diện {{domxref("MediaRecorder")}} để thu thập {{domxref("MediaStream")}} được tạo bởi thiết bị phần cứng, do {{domxref("MediaDevices.getUserMedia()","navigator.mediaDevices.getUserMedia()")}} trả về, bạn cũng có thể sử dụng phần tử phương tiện HTML (cụ thể là {{HTMLElement("audio")}} hoặc {{HTMLElement("video")}}) làm nguồn của `MediaStream` cần ghi. Trong bài viết này, chúng ta sẽ xem một ví dụ làm điều đó.

## Ví dụ về ghi phần tử phương tiện

### HTML

```html hidden
<p>
  Click the "Start Recording" button to begin video recording for a few seconds.
  You can stop recording by clicking the "Stop Recording" button. The "Download"
  button will download the received data (although it's in a raw, unwrapped form
  that isn't very useful).
</p>
<br />
```

Hãy bắt đầu bằng cách xem xét các phần quan trọng của HTML. Có nhiều hơn thế này, nhưng nó chỉ cung cấp thông tin thay vì là một phần cốt lõi của ứng dụng.

```html
<div class="left">
  <div id="startButton" class="button">Start Recording</div>
  <h2>Preview</h2>
  <video id="preview" width="160" height="120" autoplay muted></video>
</div>
```

Chúng ta trình bày giao diện chính trong hai cột. Bên trái là nút bắt đầu và phần tử {{HTMLElement("video")}} hiển thị bản xem trước video; đây là video mà camera người dùng thấy. Lưu ý rằng thuộc tính [`autoplay`](/en-US/docs/Web/HTML/Reference/Elements/video#autoplay) được sử dụng để khi luồng bắt đầu từ camera, nó được hiển thị ngay lập tức, và thuộc tính [`muted`](/en-US/docs/Web/HTML/Reference/Elements/video#muted) được chỉ định để đảm bảo âm thanh từ micrô của người dùng không được phát qua loa của họ, tạo ra vòng phản hồi khó chịu.

```html
<div class="right">
  <div id="stopButton" class="button">Stop Recording</div>
  <h2>Recording</h2>
  <video id="recording" width="160" height="120" controls></video>
  <a id="downloadButton" class="button">Download</a>
</div>
```

Bên phải có nút dừng và phần tử `<video>` sẽ được sử dụng để phát lại video đã ghi. Lưu ý rằng bảng phát lại không có autoplay (vì vậy phát lại không bắt đầu ngay khi phương tiện đến), và nó có [`controls`](/en-US/docs/Web/HTML/Reference/Elements/video#controls) được đặt, điều này yêu cầu hiển thị điều khiển người dùng để phát, tạm dừng, v.v.

Bên dưới phần tử phát lại là nút tải xuống video đã ghi.

```html hidden
<div class="bottom">
  <pre id="log"></pre>
</div>
```

```css hidden
body {
  font:
    14px "Open Sans",
    "Arial",
    sans-serif;
}

video {
  margin-top: 2px;
  border: 1px solid black;
}

.button {
  cursor: pointer;
  display: block;
  width: 160px;
  border: 1px solid black;
  font-size: 16px;
  text-align: center;
  padding-top: 2px;
  padding-bottom: 4px;
  color: white;
  background-color: darkgreen;
  text-decoration: none;
}

h2 {
  margin-bottom: 4px;
}

.left {
  margin-right: 10px;
  float: left;
  width: 160px;
  padding: 0px;
}

.right {
  margin-left: 10px;
  float: left;
  width: 160px;
  padding: 0px;
}

.bottom {
  clear: both;
  padding-top: 10px;
}
```

Bây giờ hãy xem mã JavaScript; đây là nơi hầu hết các hành động xảy ra!

### Thiết lập biến toàn cục

Chúng ta bắt đầu bằng cách thiết lập một số biến toàn cục mà chúng ta sẽ cần.

```js
let preview = document.getElementById("preview");
let recording = document.getElementById("recording");
let startButton = document.getElementById("startButton");
let stopButton = document.getElementById("stopButton");
let downloadButton = document.getElementById("downloadButton");
let logElement = document.getElementById("log");

let recordingTimeMS = 5000;
```

Hầu hết các biến này là tham chiếu đến các phần tử chúng ta cần làm việc cùng. Biến cuối cùng, `recordingTimeMS`, được đặt thành 5000 mili giây (5 giây); điều này xác định độ dài của các video chúng ta sẽ ghi.

### Hàm tiện ích

Tiếp theo, chúng ta tạo một số hàm tiện ích sẽ được sử dụng sau này.

```js
function log(msg) {
  logElement.innerText += `${msg}\n`;
}
```

Hàm `log()` được sử dụng để xuất chuỗi văn bản vào {{HTMLElement("div")}} để chúng ta có thể chia sẻ thông tin với người dùng.

```js
function wait(delayInMS) {
  return new Promise((resolve) => setTimeout(resolve, delayInMS));
}
```

Hàm `wait()` trả về một {{jsxref("Promise")}} mới giải quyết khi số mili giây được chỉ định đã trôi qua. Nó hoạt động bằng cách sử dụng [hàm mũi tên](/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions) gọi {{domxref("Window.setTimeout", "setTimeout()")}}, chỉ định trình xử lý giải quyết của promise làm hàm xử lý timeout.

### Bắt đầu ghi phương tiện

Hàm `startRecording()` xử lý việc bắt đầu quá trình ghi:

```js
function startRecording(stream, lengthInMS) {
  let recorder = new MediaRecorder(stream);
  let data = [];

  recorder.ondataavailable = (event) => data.push(event.data);
  recorder.start();
  log(`${recorder.state} for ${lengthInMS / 1000} seconds…`);

  let stopped = new Promise((resolve, reject) => {
    recorder.onstop = resolve;
    recorder.onerror = (event) => reject(event.name);
  });

  let recorded = wait(lengthInMS).then(() => {
    if (recorder.state === "recording") {
      recorder.stop();
    }
  });

  return Promise.all([stopped, recorded]).then(() => data);
}
```

`startRecording()` nhận hai tham số đầu vào: {{domxref("MediaStream")}} để ghi từ đó và độ dài tính bằng mili giây của bản ghi cần thực hiện. Chúng ta luôn ghi không quá số mili giây được chỉ định của phương tiện, mặc dù nếu phương tiện dừng trước thời gian đó, {{domxref("MediaRecorder")}} cũng tự động dừng ghi.

- Đầu tiên chúng ta tạo `MediaRecorder` sẽ xử lý việc ghi `stream` đầu vào.
- `data` là mảng, ban đầu trống, giữ các {{domxref("Blob")}} của dữ liệu phương tiện được cung cấp cho trình xử lý sự kiện {{domxref("MediaRecorder.dataavailable_event", "ondataavailable")}}.
- Việc gán `ondataavailable` thiết lập trình xử lý cho sự kiện {{domxref("MediaRecorder.dataavailable_event", "dataavailable")}}. Thuộc tính `data` của sự kiện nhận được là {{domxref("Blob")}} chứa dữ liệu phương tiện. Trình xử lý sự kiện đẩy `Blob` vào mảng `data`.
- Chúng ta bắt đầu quá trình ghi bằng cách gọi {{domxref("MediaRecorder.start", "recorder.start()")}}, và xuất thông báo vào nhật ký với trạng thái cập nhật của trình ghi và số giây nó sẽ ghi.
- Chúng ta tạo {{jsxref("Promise")}} mới, có tên `stopped`, được giải quyết khi trình xử lý sự kiện {{domxref("MediaRecorder.stop_event", "onstop")}} của `MediaRecorder` được gọi, và bị từ chối nếu trình xử lý sự kiện {{domxref("MediaRecorder.error_event", "onerror")}} của nó được gọi.
- Chúng ta tạo một `Promise` mới khác, có tên `recorded`, được giải quyết khi số mili giây được chỉ định đã trôi qua. Khi giải quyết, nó dừng `MediaRecorder` nếu đang ghi.
- Cuối cùng, chúng ta sử dụng {{jsxref("Promise.all")}} để tạo một `Promise` mới được thực hiện khi cả hai `Promise` (`stopped` và `recorded`) đã giải quyết. Sau khi điều đó giải quyết, mảng dữ liệu được trả về bởi `startRecording()` cho người gọi.

### Dừng luồng đầu vào

Hàm `stop()` dừng phương tiện đầu vào:

```js
function stop(stream) {
  stream.getTracks().forEach((track) => track.stop());
}
```

Điều này hoạt động bằng cách gọi {{domxref("MediaStream.getTracks()")}}, sử dụng {{jsxref("Array.forEach", "forEach()")}} để gọi {{domxref("MediaStreamTrack.stop()")}} trên mỗi track trong luồng.

### Nhận luồng đầu vào và thiết lập trình ghi

Bây giờ hãy xem phần phức tạp nhất của mã trong ví dụ này: trình xử lý sự kiện của chúng ta cho các click trên nút bắt đầu:

```js
startButton.addEventListener("click", () => {
  navigator.mediaDevices
    .getUserMedia({
      video: true,
      audio: true,
    })
    .then((stream) => {
      preview.srcObject = stream;
      downloadButton.href = stream;
      preview.captureStream = preview.captureStream || preview.mozCaptureStream;
      return new Promise((resolve) => {
        preview.onplaying = resolve;
      });
    })
    .then(() => startRecording(preview.captureStream(), recordingTimeMS))
    .then((recordedChunks) => {
      let recordedBlob = new Blob(recordedChunks, { type: "video/webm" });
      recording.src = URL.createObjectURL(recordedBlob);
      downloadButton.href = recording.src;
      downloadButton.download = "RecordedVideo.webm";

      log(
        `Successfully recorded ${recordedBlob.size} bytes of ${recordedBlob.type} media.`,
      );
    })
    .catch((error) => {
      if (error.name === "NotFoundError") {
        log("Camera or microphone not found. Can't record.");
      } else {
        log(error);
      }
    });
});
```

Khi sự kiện {{domxref("Element/click_event", "click")}} xảy ra, đây là những gì xảy ra:

- {{domxref("MediaDevices.getUserMedia")}} được gọi để yêu cầu {{domxref("MediaStream")}} mới có cả track video và audio. Đây là luồng chúng ta sẽ ghi.
- Khi Promise được trả về bởi `getUserMedia()` được giải quyết, thuộc tính {{domxref("HTMLMediaElement.srcObject","srcObject")}} của phần tử {{HTMLElement("video")}} xem trước được đặt thành luồng đầu vào, khiến video được camera người dùng thu được được hiển thị trong ô xem trước.
- Khi video xem trước bắt đầu phát, chúng ta biết có phương tiện để ghi, vì vậy chúng ta phản hồi bằng cách gọi hàm `startRecording()` đã tạo trước đó.
- Trình xử lý giải quyết của quá trình ghi nhận mảng các `Blob` dữ liệu phương tiện. Điều đầu tiên chúng ta làm là hợp nhất các đoạn thành một {{domxref("Blob")}} duy nhất có loại MIME là `"video/webm"`, sau đó {{domxref("URL.createObjectURL_static", "URL.createObjectURL()")}} được sử dụng để tạo URL tham chiếu blob.

### Xử lý nút dừng

Đoạn mã cuối cùng thêm trình xử lý cho sự kiện {{domxref("Element/click_event", "click")}} trên nút dừng:

```js
stopButton.addEventListener("click", () => {
  stop(preview.srcObject);
});
```

Điều này gọi hàm `stop()` chúng ta đã trình bày trước đó.

### Kết quả

Khi kết hợp lại với phần còn lại của HTML và CSS không hiển thị ở trên, nó trông và hoạt động như thế này:

{{EmbedLiveSample('Example_of_recording_a_media_element', '600', '440', , , , 'camera;microphone')}}

Bạn cũng có thể mở ví dụ này trong playground bằng nút "Play", cho phép bạn xem mã tổng hợp, bao gồm các phần ẩn ở trên vì chúng không quan trọng cho việc giải thích cách các API đang được sử dụng.

## Xem thêm

- [Media Capture and Streams API](/en-US/docs/Web/API/Media_Capture_and_Streams_API) landing page
- {{domxref("MediaDevices.getUserMedia()")}}
