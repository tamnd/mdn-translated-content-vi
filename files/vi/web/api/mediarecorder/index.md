---
title: MediaRecorder
slug: Web/API/MediaRecorder
page-type: web-api-interface
browser-compat: api.MediaRecorder
---

{{APIRef("MediaStream Recording")}}

Giao diện **`MediaRecorder`** của [MediaStream Recording API](/en-US/docs/Web/API/MediaStream_Recording_API) cung cấp chức năng ghi lại media một cách dễ dàng. Giao diện này được tạo bằng constructor {{domxref("MediaRecorder.MediaRecorder", "MediaRecorder()")}}.

{{InheritanceDiagram}}

## Constructor

- {{domxref("MediaRecorder.MediaRecorder", "MediaRecorder()")}}
  - : Tạo một đối tượng `MediaRecorder` mới, với một {{domxref("MediaStream")}} để ghi. Các tùy chọn cho phép đặt MIME type của vùng chứa, chẳng hạn `"video/webm"` hoặc `"video/mp4"`, cùng với tốc độ bit của các track âm thanh và video, hoặc một tốc độ bit tổng duy nhất.

## Thuộc tính instance

- {{domxref("MediaRecorder.mimeType")}} {{ReadOnlyInline}}
  - : Trả về MIME type đã được chọn làm vùng chứa ghi cho đối tượng `MediaRecorder` khi nó được tạo.
- {{domxref("MediaRecorder.state")}} {{ReadOnlyInline}}
  - : Trả về trạng thái hiện tại của đối tượng `MediaRecorder` (`inactive`, `recording` hoặc `paused`).
- {{domxref("MediaRecorder.stream")}} {{ReadOnlyInline}}
  - : Trả về stream đã được truyền vào constructor khi `MediaRecorder` được tạo.
- {{domxref("MediaRecorder.videoBitsPerSecond")}} {{ReadOnlyInline}}
  - : Trả về tốc độ bit mã hóa video đang được dùng. Giá trị này có thể khác với tốc độ bit được chỉ định trong constructor, nếu có.
- {{domxref("MediaRecorder.audioBitsPerSecond")}} {{ReadOnlyInline}}
  - : Trả về tốc độ bit mã hóa âm thanh đang được dùng. Giá trị này có thể khác với tốc độ bit được chỉ định trong constructor, nếu có.
- {{domxref("MediaRecorder.audioBitrateMode")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về chế độ bitrate được dùng để mã hóa các track âm thanh.

## Phương thức tĩnh

- {{domxref("MediaRecorder.isTypeSupported_static", "MediaRecorder.isTypeSupported()")}}
  - : Một phương thức tĩnh trả về giá trị `true` hoặc `false` cho biết kiểu media MIME đã cho có được hỗ trợ bởi user agent hiện tại hay không.

## Phương thức instance

- {{domxref("MediaRecorder.pause()")}}
  - : Tạm dừng việc ghi media.
- {{domxref("MediaRecorder.requestData()")}}
  - : Yêu cầu một {{domxref("Blob")}} chứa dữ liệu đã lưu nhận được cho đến thời điểm đó (hoặc kể từ lần cuối `requestData()` được gọi). Sau khi gọi phương thức này, quá trình ghi vẫn tiếp tục, nhưng trong một `Blob` mới.
- {{domxref("MediaRecorder.resume()")}}
  - : Tiếp tục ghi media sau khi đã tạm dừng.
- {{domxref("MediaRecorder.start()")}}
  - : Bắt đầu ghi media; phương thức này có thể nhận tùy chọn đối số `timeslice` với giá trị tính bằng mili giây. Nếu được chỉ định, media sẽ được ghi thành các phần riêng có độ dài đó, thay vì hành vi mặc định là ghi vào một phần lớn duy nhất.
- {{domxref("MediaRecorder.stop()")}}
  - : Dừng ghi, tại thời điểm đó một sự kiện {{domxref("MediaRecorder.dataavailable_event", "dataavailable")}} chứa `Blob` cuối cùng của dữ liệu đã lưu sẽ được phát ra. Không còn việc ghi nào diễn ra nữa.

## Sự kiện

Nghe các sự kiện này bằng `addEventListener()` hoặc bằng cách gán một trình xử lý sự kiện cho thuộc tính `oneventname` của giao diện này.

- {{domxref("MediaRecorder/dataavailable_event", "dataavailable")}}
  - : Được phát định kỳ mỗi khi đã ghi đủ `timeslice` mili giây media (hoặc khi toàn bộ media đã được ghi xong, nếu không chỉ định `timeslice`). Sự kiện, thuộc kiểu {{domxref("BlobEvent")}}, chứa media đã ghi trong thuộc tính {{domxref("BlobEvent.data", "data")}}.
- {{domxref("MediaRecorder/error_event", "error")}}
  - : Được phát khi có lỗi nghiêm trọng làm dừng việc ghi. Sự kiện nhận được dựa trên giao diện {{domxref("MediaRecorderErrorEvent")}}, trong đó thuộc tính {{domxref("MediaRecorderErrorEvent.error", "error")}} chứa một {{domxref("DOMException")}} mô tả lỗi thực sự đã xảy ra.
- {{domxref("MediaRecorder/pause_event", "pause")}}
  - : Được phát khi việc ghi media bị tạm dừng.
- {{domxref("MediaRecorder/resume_event", "resume")}}
  - : Được phát khi việc ghi media tiếp tục sau khi bị tạm dừng.
- {{domxref("MediaRecorder/start_event", "start")}}
  - : Được phát khi việc ghi media bắt đầu.
- {{domxref("MediaRecorder/stop_event", "stop")}}
  - : Được phát khi việc ghi media kết thúc, hoặc khi {{domxref("MediaStream")}} kết thúc, hoặc sau khi phương thức {{domxref("MediaRecorder.stop()")}} được gọi.

## Ví dụ

```js
if (navigator.mediaDevices) {
  console.log("getUserMedia supported.");

  const constraints = { audio: true };
  let chunks = [];

  navigator.mediaDevices
    .getUserMedia(constraints)
    .then((stream) => {
      const mediaRecorder = new MediaRecorder(stream);

      record.onclick = () => {
        mediaRecorder.start();
        console.log(mediaRecorder.state);
        console.log("recorder started");
        record.style.background = "red";
        record.style.color = "black";
      };

      stop.onclick = () => {
        mediaRecorder.stop();
        console.log(mediaRecorder.state);
        console.log("recorder stopped");
        record.style.background = "";
        record.style.color = "";
      };

      mediaRecorder.onstop = (e) => {
        console.log("data available after MediaRecorder.stop() called.");

        const clipName = prompt("Enter a name for your sound clip");

        const clipContainer = document.createElement("article");
        const clipLabel = document.createElement("p");
        const audio = document.createElement("audio");
        const deleteButton = document.createElement("button");
        const mainContainer = document.querySelector("body");

        clipContainer.classList.add("clip");
        audio.setAttribute("controls", "");
        deleteButton.textContent = "Delete";
        clipLabel.textContent = clipName;

        clipContainer.appendChild(audio);
        clipContainer.appendChild(clipLabel);
        clipContainer.appendChild(deleteButton);
        mainContainer.appendChild(clipContainer);

        audio.controls = true;
        const blob = new Blob(chunks, { type: "audio/ogg; codecs=opus" });
        chunks = [];
        const audioURL = URL.createObjectURL(blob);
        audio.src = audioURL;
        console.log("recorder stopped");

        deleteButton.onclick = (e) => {
          const evtTgt = e.target;
          evtTgt.parentNode.parentNode.removeChild(evtTgt.parentNode);
        };
      };

      mediaRecorder.ondataavailable = (e) => {
        chunks.push(e.data);
      };
    })
    .catch((err) => {
      console.error(`The following error occurred: ${err}`);
    });
}
```

> [!NOTE]
> Đoạn mã này được lấy cảm hứng từ demo Web Dictaphone. Một số dòng đã được lược bỏ để ngắn gọn; [tham khảo mã nguồn](https://github.com/mdn/dom-examples/tree/main/media/web-dictaphone) để xem mã đầy đủ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using the MediaStream Recording API](/en-US/docs/Web/API/MediaStream_Recording_API/Using_the_MediaStream_Recording_API)
- [Web Dictaphone](https://mdn.github.io/dom-examples/media/web-dictaphone/): demo trực quan hóa MediaRecorder + getUserMedia + Web Audio API, bởi [Chris Mills](https://github.com/chrisdavidmills) ([mã nguồn trên GitHub](https://github.com/mdn/dom-examples/tree/main/media/web-dictaphone).)
- [Recording a media element](/en-US/docs/Web/API/MediaStream_Recording_API/Recording_a_media_element)
- [simpl.info MediaStream Recording demo](https://simpl.info/mediarecorder/), bởi [Sam Dutton](https://github.com/samdutton).
- {{domxref("MediaDevices.getUserMedia()")}}
- [OpenLang](https://github.com/chrisjohndigital/OpenLang): ứng dụng web phòng lab học ngôn ngữ bằng video HTML sử dụng MediaDevices và MediaStream Recording API để ghi video ([mã nguồn trên GitHub](https://github.com/chrisjohndigital/OpenLang))
