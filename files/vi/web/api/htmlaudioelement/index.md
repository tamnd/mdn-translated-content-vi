---
title: HTMLAudioElement
slug: Web/API/HTMLAudioElement
page-type: web-api-interface
browser-compat: api.HTMLAudioElement
---

{{APIRef("HTML DOM")}}

Giao diện **`HTMLAudioElement`** cung cấp quyền truy cập vào các thuộc tính của các phần tử {{HTMLElement("audio")}}, cũng như các phương thức để thao tác chúng.

Giao diện này dựa trên, và kế thừa các thuộc tính và phương thức từ, giao diện {{domxref("HTMLMediaElement")}}.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("HTMLAudioElement.Audio", "Audio()")}}
  - : Tạo và trả về đối tượng `HTMLAudioElement` mới, tùy chọn bắt đầu quá trình tải tệp âm thanh vào nó nếu URL tệp được cung cấp.

## Thuộc tính phiên bản

_Không có thuộc tính cụ thể; kế thừa thuộc tính từ lớp cha, {{domxref("HTMLMediaElement")}}, và từ {{domxref("HTMLElement")}}._

## Phương thức phiên bản

_Kế thừa phương thức từ lớp cha, {{domxref("HTMLMediaElement")}}, và từ {{domxref("HTMLElement")}}. Không có phương thức riêng._

## Ví dụ

### Sử dụng cơ bản

Bạn có thể tạo `HTMLAudioElement` hoàn toàn bằng JavaScript sử dụng hàm khởi tạo {{domxref("HTMLAudioElement.Audio", "Audio()")}}:

```js
const audioElement = new Audio("car_horn.wav");
```

sau đó bạn có thể gọi phương thức `play()` trên phần tử

```js
audioElement.play();
```

> [!NOTE]
> Một lỗi phổ biến là cố gắng phát phần tử âm thanh ngay khi trang tải. Chính sách autoplay mặc định của các trình duyệt hiện đại sẽ chặn điều đó xảy ra. Tham khảo [Firefox](https://hacks.mozilla.org/2019/02/firefox-66-to-block-automatically-playing-audible-video-and-audio/) và [chrome](https://developer.chrome.com/blog/autoplay/) để biết các thực hành tốt nhất và cách giải quyết.

Một số thuộc tính được sử dụng phổ biến nhất của phần tử âm thanh bao gồm {{domxref("HTMLMediaElement.src", "src")}}, {{domxref("HTMLMediaElement.currentTime", "currentTime")}}, {{domxref("HTMLMediaElement.duration", "duration")}}, {{domxref("HTMLMediaElement.paused", "paused")}}, {{domxref("HTMLMediaElement.muted", "muted")}}, và {{domxref("HTMLMediaElement.volume", "volume")}}.

```js
const audioElement = new Audio("car_horn.wav");
audioElement.addEventListener("loadeddata", () => {
  let duration = audioElement.duration;
  // The duration variable now holds the duration (in seconds) of the audio clip
});
```

## Sự kiện

_Kế thừa phương thức từ lớp cha, {{domxref("HTMLMediaElement")}}, và từ tổ tiên {{domxref("HTMLElement")}}._ Lắng nghe sự kiện bằng cách sử dụng [`addEventListener()`](/en-US/docs/Web/API/EventTarget/addEventListener) hoặc bằng cách gán trình xử lý sự kiện vào thuộc tính `oneventname` của giao diện này.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web media technologies](/en-US/docs/Web/Media)
- [Audio and Video Delivery](/en-US/docs/Web/Media/Guides/Audio_and_video_delivery)
- Phần tử HTML triển khai giao diện này: {{HTMLElement("audio")}}.
