---
title: "MediaError: thuộc tính message"
short-title: message
slug: Web/API/MediaError/message
page-type: web-api-instance-property
browser-compat: api.MediaError.message
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`MediaError.message`** trả về chuỗi mà con người có thể đọc cung cấp chi tiết chẩn đoán cụ thể liên quan đến lỗi được mô tả bởi đối tượng `MediaError`, hoặc chuỗi rỗng (`""`) nếu không thể xác định hoặc cung cấp thông tin chẩn đoán.

## Giá trị

Chuỗi cung cấp giải thích chi tiết, cụ thể về những gì đã xảy ra sai và có thể cách sửa. Đây _không_ phải là mô tả chung về giá trị thuộc tính {{domxref("MediaError.code")}}, mà đi sâu hơn vào các chi tiết cụ thể của lỗi cụ thể này và hoàn cảnh của nó. Nếu không có chi tiết cụ thể nào có sẵn, chuỗi này trống.

## Ví dụ

### Ghi nhật ký thông báo MediaError

Ví dụ này tạo phần tử {{HTMLElement("audio")}}, thiết lập trình xử lý lỗi cho nó, sau đó cho phép người dùng nhấp vào các nút để chỉ định có gán tệp âm thanh hợp lệ hay tệp bị thiếu cho thuộc tính [`src`](/en-US/docs/Web/HTML/Reference/Elements/audio#src) của phần tử. Trình xử lý lỗi xuất các dòng nhật ký vào hộp trên màn hình mô tả lỗi, bao gồm `code`, `message`, và gợi ý có thể hữu ích hơn cho khách truy cập so với `message` chẩn đoán:

```html
<audio controls id="audio"></audio>
<div>
  <button id="valid-button">Valid file</button>
  <button id="invalid-button">Missing file</button>
  <button id="svg-button">Wrong format</button>
</div>
<pre id="log">Logs:</pre>
```

```css hidden
pre {
  white-space: wrap;
  border: 1px solid grey;
}
```

Ví dụ tạo phần tử {{HTMLElement("audio")}} và cho phép người dùng gán tệp nhạc hợp lệ hoặc liên kết đến tệp không tồn tại. Điều này cho phép chúng ta xem hành vi của trình xử lý sự kiện {{domxref("HTMLMediaElement/error_event", "error")}}, nhận được bởi trình xử lý sự kiện chúng ta thêm vào phần tử `<audio>` chính.

Đầu tiên, nó lấy đối tượng {{domxref("MediaError")}} mô tả lỗi từ thuộc tính {{domxref("HTMLMediaElement.error", "error")}} trên {{domxref("HTMLAudioElement")}} đại diện cho trình phát âm thanh. {{domxref("MediaError.code", "code")}} số của lỗi được kiểm tra so với các hằng số `MediaError`, ban đầu không xác định. Nếu `err.code` bằng bất kỳ hằng số nào, nó tạo gợi ý chung với `MediaError.message` được thêm vào dòng nhật ký để cung cấp thông tin chẩn đoán chi tiết hơn cho các nhà phát triển. Văn bản kết quả được thêm vào phần tử `<pre>`:

```js
const audioElement = document.getElementById("audio");
const validButton = document.getElementById("valid-button");
const invalidButton = document.getElementById("invalid-button");
const svgButton = document.getElementById("svg-button");

const logMessage = (logLine) => {
  const now = new Date();
  const timestamp = now.toLocaleTimeString();
  document.getElementById("log").innerText += `\n[${timestamp}] ${logLine}`;
};

validButton.addEventListener("click", () => {
  audioElement.src = "https://mdn.github.io/shared-assets/audio/guitar.mp3";
});

svgButton.addEventListener("click", () => {
  audioElement.src =
    "https://mdn.github.io/shared-assets/images/examples/dino.svg";
});

invalidButton.addEventListener("click", () => {
  audioElement.src = "no-file-here.mp3";
});

audioElement.onerror = () => {
  const err = audioElement.error;
  let userHint = "";

  switch (err.code) {
    case MediaError.MEDIA_ERR_ABORTED:
      userHint = "Canceled audio playback.";
      break;
    case MediaError.MEDIA_ERR_NETWORK:
      userHint = "A network error occurred while fetching the audio.";
      break;
    case MediaError.MEDIA_ERR_DECODE:
      userHint = "An error occurred while decoding the audio.";
      break;
    case MediaError.MEDIA_ERR_SRC_NOT_SUPPORTED:
      userHint = "Audio is missing or is an unsupported format.";
      break;
    default:
      userHint += "An unknown error occurred.";
      break;
  }

  const message = err.message || "no message available";

  logMessage(`Error code ${err.code} (${err.message}), ${userHint}`);
};
```

Nhấp vào nút "Valid file" để bắt đầu phát như mong đợi, nút "Missing file" để thử tải tài nguyên bị thiếu, và nút "Wrong format" để thử đặt tệp SVG làm nguồn cho phần tử âm thanh. So sánh đầu ra nhật ký cho hai trường hợp lỗi minh họa sự khác biệt giữa `code` và `message` của `MediaError`:

{{embedlivesample("logging_mediaerror_messages", , "300")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("MediaError")}}: Giao diện được sử dụng để định nghĩa thuộc tính `MediaError.message`
- {{HTMLElement("audio")}}, {{HTMLElement("video")}}
