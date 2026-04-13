---
title: MediaStream Recording API
slug: Web/API/MediaStream_Recording_API
page-type: web-api-overview
browser-compat: api.MediaRecorder
spec-urls: https://w3c.github.io/mediacapture-record/
---

{{DefaultAPISidebar("MediaStream Recording")}}

**MediaStream Recording API**, đôi khi được gọi là _Media Recording API_ hoặc _MediaRecorder API_, có liên kết chặt chẽ với [Media Capture and Streams API](/en-US/docs/Web/API/Media_Capture_and_Streams_API) và [WebRTC API](/en-US/docs/Web/API/WebRTC_API). MediaStream Recording API giúp có thể thu thập dữ liệu được tạo bởi đối tượng {{domxref("MediaStream")}} hoặc {{domxref("HTMLMediaElement")}} để phân tích, xử lý hoặc lưu vào đĩa. Nó cũng khá dễ làm việc.

## Khái niệm và cách sử dụng

MediaStream Recording API được tạo thành từ một giao diện chính, {{domxref("MediaRecorder")}}, thực hiện tất cả công việc lấy dữ liệu từ {{domxref("MediaStream")}} và cung cấp cho bạn để xử lý. Dữ liệu được gửi qua một loạt các sự kiện {{domxref("MediaRecorder.dataavailable_event", "dataavailable")}}, đã ở định dạng bạn chỉ định khi tạo `MediaRecorder`. Sau đó bạn có thể xử lý thêm dữ liệu hoặc ghi vào tệp theo ý muốn.

### Tổng quan về quá trình ghi

Quá trình ghi một luồng rất đơn giản:

1. Thiết lập {{domxref("MediaStream")}} hoặc {{domxref("HTMLMediaElement")}} (dưới dạng phần tử {{HTMLElement("audio")}} hoặc {{HTMLElement("video")}}) để phục vụ làm nguồn dữ liệu phương tiện.
2. Tạo đối tượng {{domxref("MediaRecorder")}}, chỉ định luồng nguồn và bất kỳ tùy chọn nào (chẳng hạn loại MIME của container hoặc tốc độ bit mong muốn của các track của nó).
3. Đặt {{domxref("MediaRecorder.dataavailable_event", "ondataavailable")}} thành trình xử lý sự kiện cho sự kiện {{domxref("MediaRecorder.dataavailable_event", "dataavailable")}}; điều này sẽ được gọi bất cứ khi nào có dữ liệu sẵn sàng cho bạn.
4. Sau khi phương tiện nguồn đang phát và bạn đã đến thời điểm sẵn sàng ghi video, hãy gọi {{domxref("MediaRecorder.start()")}} để bắt đầu ghi.
5. Trình xử lý sự kiện {{domxref("MediaRecorder.dataavailable_event", "dataavailable")}} của bạn được gọi mỗi khi có dữ liệu sẵn sàng; sự kiện có thuộc tính `data` có giá trị là {{domxref("Blob")}} chứa dữ liệu phương tiện. Bạn có thể buộc sự kiện `dataavailable` xảy ra, qua đó gửi âm thanh mới nhất cho bạn để bạn có thể lọc, lưu hoặc làm bất cứ điều gì.
6. Ghi dừng tự động khi phương tiện nguồn ngừng phát.
7. Bạn có thể dừng ghi bất cứ lúc nào bằng cách gọi {{domxref("MediaRecorder.stop()")}}.

> [!NOTE]
> Các {{domxref("Blob")}} riêng lẻ chứa các phần của phương tiện được ghi không nhất thiết phải phát được riêng lẻ. Phương tiện cần được lắp ráp lại trước khi phát.

Nếu có gì đó xảy ra sai trong khi ghi, sự kiện {{domxref("MediaRecorder/error_event", "error")}} được gửi đến `MediaRecorder`. Bạn có thể lắng nghe các sự kiện `error` bằng cách thiết lập trình xử lý sự kiện {{domxref("MediaRecorder.error_event", "onerror")}}.

Ví dụ ở đây, chúng ta sử dụng HTML Canvas làm nguồn của {{domxref("MediaStream")}}, và dừng ghi sau 9 giây.

```js
const canvas = document.querySelector("canvas");

// Optional frames per second argument.
const stream = canvas.captureStream(25);
const recordedChunks = [];

console.log(stream);
const options = { mimeType: "video/webm; codecs=vp9" };
const mediaRecorder = new MediaRecorder(stream, options);

mediaRecorder.ondataavailable = handleDataAvailable;
mediaRecorder.start();

function handleDataAvailable(event) {
  console.log("data-available");
  if (event.data.size > 0) {
    recordedChunks.push(event.data);
    console.log(recordedChunks);
    download();
  } else {
    // …
  }
}
function download() {
  const blob = new Blob(recordedChunks, {
    type: "video/webm",
  });
  const url = URL.createObjectURL(blob);
  const a = document.createElement("a");
  document.body.appendChild(a);
  a.style = "display: none";
  a.href = url;
  a.download = "test.webm";
  a.click();
  URL.revokeObjectURL(url);
}

// demo: to download after 9sec
setTimeout((event) => {
  console.log("stopping");
  mediaRecorder.stop();
}, 9000);
```

### Kiểm tra và kiểm soát trạng thái trình ghi

Bạn cũng có thể sử dụng các thuộc tính của đối tượng `MediaRecorder` để xác định trạng thái của quá trình ghi, cùng với các phương thức {{domxref("MediaRecorder.pause", "pause()")}} và {{domxref("MediaRecorder.resume", "resume()")}} để tạm dừng và tiếp tục ghi phương tiện nguồn.

Nếu bạn cần kiểm tra xem loại MIME cụ thể có được hỗ trợ không, điều đó cũng có thể. Chỉ cần gọi {{domxref("MediaRecorder.isTypeSupported_static", "MediaRecorder.isTypeSupported()")}}.

### Kiểm tra các nguồn đầu vào tiềm năng

Nếu mục tiêu của bạn là ghi đầu vào camera và/hoặc micrô, bạn có thể muốn kiểm tra các thiết bị đầu vào có sẵn trước khi bắt đầu quá trình xây dựng `MediaRecorder`. Để làm vậy, bạn cần gọi {{domxref("MediaDevices.enumerateDevices", "navigator.mediaDevices.enumerateDevices()")}} để lấy danh sách các thiết bị phương tiện có sẵn. Sau đó bạn có thể kiểm tra danh sách đó và xác định các nguồn đầu vào tiềm năng, thậm chí lọc danh sách dựa trên tiêu chí mong muốn.

Trong đoạn mã này, `enumerateDevices()` được sử dụng để kiểm tra các thiết bị đầu vào có sẵn, xác định những thiết bị là thiết bị đầu vào âm thanh và tạo các phần tử {{HTMLElement("option")}} sau đó được thêm vào phần tử {{HTMLElement("select")}} đại diện cho bộ chọn nguồn đầu vào.

```js
navigator.mediaDevices.enumerateDevices().then((devices) => {
  devices.forEach((device) => {
    const menu = document.getElementById("input-devices");
    if (device.kind === "audioinput") {
      const item = document.createElement("option");
      item.textContent = device.label;
      item.value = device.deviceId;
      menu.appendChild(item);
    }
  });
});
```

Mã tương tự có thể được sử dụng để cho phép người dùng giới hạn tập hợp thiết bị họ muốn sử dụng.

### Để biết thêm thông tin

Để tìm hiểu thêm về việc sử dụng MediaStream Recording API, xem [Using the MediaStream Recording API](/en-US/docs/Web/API/MediaStream_Recording_API/Using_the_MediaStream_Recording_API), cho thấy cách sử dụng API để ghi các clip âm thanh. Bài viết thứ hai, [Recording a media element](/en-US/docs/Web/API/MediaStream_Recording_API/Recording_a_media_element), mô tả cách nhận luồng từ phần tử {{HTMLElement("audio")}} hoặc {{HTMLElement("video")}} và sử dụng luồng đã thu (trong trường hợp này là ghi và lưu vào đĩa cục bộ).

## Giao diện

- {{domxref("BlobEvent")}}
  - : Mỗi khi một đoạn dữ liệu phương tiện hoàn thành việc ghi, nó được gửi đến người dùng ở dạng {{domxref("Blob")}} bằng cách sử dụng {{domxref("BlobEvent")}} loại `dataavailable`.
- {{domxref("MediaRecorder")}}
  - : Giao diện chính triển khai MediaStream Recording API.
- {{domxref("MediaRecorderErrorEvent")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Giao diện đại diện cho các lỗi do MediaStream Recording API ném ra. Thuộc tính {{domxref("MediaRecorderErrorEvent.error", "error")}} của nó là {{domxref("DOMException")}} chỉ định lỗi đã xảy ra.

## Ví dụ

### Ghi video cơ bản

```html
<button id="record-btn">Start</button>
<video id="player" src="" autoplay controls></video>
```

```js
const recordBtn = document.getElementById("record-btn");
const video = document.getElementById("player");

let chunks = [];
let isRecording = false;
let mediaRecorder = null;

const constraints = { video: true };

recordBtn.addEventListener("click", async () => {
  if (!isRecording) {
    // Acquire a recorder on load
    if (!mediaRecorder) {
      const stream = await navigator.mediaDevices.getUserMedia(constraints);
      mediaRecorder = new MediaRecorder(stream);
      mediaRecorder.addEventListener("dataavailable", (e) => {
        console.log("data available");
        chunks.push(e.data);
      });
      mediaRecorder.addEventListener("stop", (e) => {
        console.log("onstop fired");
        const blob = new Blob(chunks, { type: "video/ogv; codecs=opus" });
        video.src = window.URL.createObjectURL(blob);
      });
      mediaRecorder.addEventListener("error", (e) => {
        console.error("An error occurred:", e);
      });
    }
    isRecording = true;
    recordBtn.textContent = "Stop";
    chunks = [];
    mediaRecorder.start();
    console.log("recorder started");
  } else {
    isRecording = false;
    recordBtn.textContent = "Start";
    mediaRecorder.stop();
    console.log("recorder stopped");
  }
});
```

<!-- TODO: re-enable when blob: URLs are allowed by CSP settings -->
<!-- {{EmbedLiveSample("Basic video recording", , "400", , , , "camera")}} -->

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Media Capture and Streams API](/en-US/docs/Web/API/Media_Capture_and_Streams_API) landing page
- {{domxref("MediaDevices.getUserMedia()")}}
- [simpl.info MediaStream Recording demo](https://simpl.info/mediarecorder/), by [Sam Dutton](https://github.com/samdutton)
- [HTML5's Media Recorder API in Action on Chrome and Firefox](https://blog.addpipe.com/mediarecorder-api/)
- [MediaRecorder polyfill](https://github.com/ai/audio-recorder-polyfill) for Safari and Edge
- [TutorRoom](https://github.com/chrisjohndigital/TutorRoom): HTML video capture/playback/download using getUserMedia and the MediaStream Recording API ([source on GitHub](https://github.com/chrisjohndigital/TutorRoom))
- [Advanced media stream recorder sample](https://quickblox.github.io/javascript-media-recorder/sample/)
- [OpenLang](https://github.com/chrisjohndigital/OpenLang): HTML video language lab web application using MediaDevices and the MediaStream Recording API for video recording ([source on GitHub](https://github.com/chrisjohndigital/OpenLang))
- [MediaStream Recorder API Now Available in Safari Technology Preview 73](https://blog.addpipe.com/safari-technology-preview-73-adds-limited-mediastream-recorder-api-support/)
