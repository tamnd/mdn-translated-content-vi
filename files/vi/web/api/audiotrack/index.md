---
title: AudioTrack
slug: Web/API/AudioTrack
page-type: web-api-interface
browser-compat: api.AudioTrack
---

{{APIRef("HTML DOM")}}

Giao diện **`AudioTrack`** biểu diễn một rãnh âm thanh đơn từ một trong các phần tử phương tiện HTML, {{HTMLElement("audio")}} hoặc {{HTMLElement("video")}}.

Mục đích sử dụng phổ biến nhất khi truy cập một đối tượng `AudioTrack` là bật hoặc tắt thuộc tính {{domxref("AudioTrack.enabled", "enabled")}} của nó để tắt tiếng hoặc bật lại tiếng cho rãnh.

## Thuộc tính thực thể

- {{domxref("AudioTrack.enabled", "enabled")}}
  - : Một giá trị Boolean điều khiển việc âm thanh của rãnh có được bật hay không. Đặt giá trị này thành `false` sẽ tắt tiếng âm thanh của rãnh.
- {{domxref("AudioTrack.id", "id")}} {{ReadOnlyInline}}
  - : Một chuỗi xác định duy nhất rãnh trong phương tiện. ID này có thể được dùng để định vị một rãnh cụ thể trong danh sách rãnh âm thanh bằng cách gọi {{domxref("AudioTrackList.getTrackById()")}}. ID này cũng có thể được dùng làm phần đoạn của URL nếu phương tiện hỗ trợ tua theo media fragment theo [đặc tả Media Fragments URI](https://www.w3.org/TR/media-frags/).
- {{domxref("AudioTrack.kind", "kind")}} {{ReadOnlyInline}}
  - : Một chuỗi chỉ định loại mà rãnh thuộc vào. Ví dụ, rãnh âm thanh chính sẽ có `kind` là `"main"`.
- {{domxref("AudioTrack.label", "label")}} {{ReadOnlyInline}}
  - : Một chuỗi cung cấp nhãn dễ đọc cho con người của rãnh. Ví dụ, một rãnh bình luận âm thanh cho phim có thể có `label` là `"Commentary with director Christopher Nolan and actors Leonardo DiCaprio and Elliot Page."` Chuỗi này rỗng nếu không có nhãn nào được cung cấp.
- {{domxref("AudioTrack.language", "language")}} {{ReadOnlyInline}}
  - : Một chuỗi chỉ định ngôn ngữ chính của rãnh âm thanh, hoặc chuỗi rỗng nếu không rõ. Ngôn ngữ được chỉ định dưới dạng {{glossary("BCP 47 language tag")}}, chẳng hạn như `"en-US"` hoặc `"pt-BR"`.
- {{domxref("AudioTrack.sourceBuffer", "sourceBuffer")}} {{ReadOnlyInline}}
  - : {{domxref("SourceBuffer")}} đã tạo ra rãnh này. Trả về null nếu rãnh không được tạo bởi một {{domxref("SourceBuffer")}} hoặc nếu {{domxref("SourceBuffer")}} đã bị xóa khỏi thuộc tính {{domxref("MediaSource.sourceBuffers")}} của nguồn phương tiện cha của nó.

## Ghi chú sử dụng

Để lấy một `AudioTrack` cho một phần tử phương tiện nhất định, hãy dùng thuộc tính {{domxref("HTMLMediaElement.audioTracks", "audioTracks")}} của phần tử đó; thuộc tính này trả về một đối tượng {{domxref("AudioTrackList")}}, từ đó bạn có thể lấy các rãnh riêng lẻ có trong phương tiện:

```js
const el = document.querySelector("video");
const tracks = el.audioTracks;
```

Sau đó, bạn có thể truy cập các rãnh riêng lẻ của phương tiện bằng cú pháp mảng hoặc các hàm như {{jsxref("Array.forEach", "forEach()")}}.

Ví dụ đầu tiên này lấy rãnh âm thanh đầu tiên của phương tiện:

```js
const firstTrack = tracks[0];
```

Ví dụ tiếp theo quét qua tất cả các rãnh âm thanh của phương tiện, bật mọi rãnh có ngôn ngữ khớp với ngôn ngữ ưu tiên của người dùng (lấy từ biến `userLanguage`) và tắt các rãnh còn lại.

```js
tracks.forEach((track) => {
  track.enabled = track.language === userLanguage;
});
```

{{domxref("AudioTrack.language", "language")}} được chỉ định dưới dạng một {{glossary("BCP 47 language tag")}} hợp lệ, ví dụ `"en-US"` cho tiếng Anh Mỹ.

## Ví dụ

Xem [`AudioTrack.label`](/vi/docs/Web/API/AudioTrack/label#ví-dụ) để biết ví dụ minh họa cách lấy một mảng gồm loại và nhãn của các rãnh cho một phần tử phương tiện được chỉ định, có lọc theo loại.

## Các đặc tả

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
