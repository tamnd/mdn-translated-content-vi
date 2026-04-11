---
title: "Navigator: phương thức getAutoplayPolicy()"
short-title: getAutoplayPolicy()
slug: Web/API/Navigator/getAutoplayPolicy
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.Navigator.getAutoplayPolicy
---

{{APIRef("HTML DOM")}}{{SeeCompatTable}}

Phương thức **`getAutoplayPolicy()`** của _API phát hiện chính sách tự động phát_ cung cấp thông tin về việc [autoplay](/en-US/docs/Web/Media/Guides/Autoplay) của các thành phần phương tiện và ngữ cảnh âm thanh được cho phép, không được phép hay chỉ được phép nếu âm thanh bị tắt tiếng.

Các ứng dụng có thể sử dụng thông tin này để cung cấp trải nghiệm người dùng phù hợp.
Ví dụ: nếu chính sách tác nhân người dùng chỉ cho phép tự động phát nội dung không nghe được thì ứng dụng có thể tắt tiếng video để chúng vẫn có thể tự động phát.

Phương pháp này có thể được sử dụng để có được chính sách tự động phát rộng rãi cho tất cả các mục thuộc một loại cụ thể trong tài liệu hoặc cho các thành phần phương tiện hoặc ngữ cảnh âm thanh cụ thể.

## Cú pháp

```js-nolint
// Test autoplay policy for a particular media playing feature
getAutoplayPolicy(type)

// Test autoplay support for a specific element or context
getAutoplayPolicy(element)
getAutoplayPolicy(context)
```

### Thông số

Phương thức này phải được gọi với một (và chỉ một) trong ba tham số sau:

- `type` {{optional_inline}}
  - : Một chuỗi biểu thị _feature_ đang phát phương tiện cần có chính sách tự động phát rộng.

Các giá trị được hỗ trợ là: - `mediaelement` - : Nhận chính sách tự động phát rộng rãi cho các thành phần phương tiện trong tài liệu.
Phần tử phương tiện là các đối tượng dẫn xuất [`HTMLMediaElement`](/en-US/docs/Web/API/HTMLMediaElement) như [`HTMLAudioElement`](/en-US/docs/Web/API/HTMLAudioElement) và [`HTMLVideoElement`](/en-US/docs/Web/API/HTMLVideoElement) và các thẻ tương ứng {{HTMLElement("audio")}} và {{HTMLElement("video")}} của chúng.

- `audiocontext` - : Nhận chính sách tự động phát rộng rãi cho người chơi [Web Audio API](/en-US/docs/Web/API/Web_Audio_API) trong tài liệu.

- `element` {{optional_inline}}
  - : Một phần tử phương tiện cụ thể.
    Đây phải là [`HTMLMediaElement`](/en-US/docs/Web/API/HTMLMediaElement), bao gồm các phần tử dẫn xuất như [`HTMLVideoElement`](/en-US/docs/Web/API/HTMLVideoElement) và [`HTMLAudioElement`](/en-US/docs/Web/API/HTMLAudioElement).

- `context` {{optional_inline}}
  - : Một [`AudioContext`](/en-US/docs/Web/API/AudioContext) cụ thể.

### Giá trị trả về

Một chuỗi biểu thị chính sách tự động phát cho loại tính năng, thành phần hoặc bối cảnh phương tiện được chỉ định.
Đây sẽ là một chuỗi chứa một trong các giá trị sau:

- `allowed`
  - : Cho phép tự động phát.
- `allowed-muted`
  - : Chỉ cho phép tự động phát đối với phương tiện không nghe được.
    Điều này bao gồm các phương tiện không có rãnh âm thanh hoặc âm thanh đã bị tắt tiếng.
- `disallowed`
  - : Không cho phép tự động phát.

Lưu ý rằng chính sách tự động phát được trả về cho tham số `type` là chính sách _broad_ cho các mục thuộc loại được chỉ định.
Khi tải trang, tất cả các mục thuộc một loại sẽ có cùng chính sách với loại đó.
Khi người dùng đã tương tác với trang/trang web, trên một số trình duyệt, các mục riêng lẻ _có thể_ có chính sách khác với loại tương ứng.

### Ngoại lệ

- `TypeError`
  - : Đối tượng được truyền vào phương thức không phải là loại được phép.
    Các loại được phép bao gồm [`HTMLMediaElement`](/en-US/docs/Web/API/HTMLMediaElement) (hoặc phần tử dẫn xuất như [`HTMLVideoElement`](/en-US/docs/Web/API/HTMLVideoElement) và [`HTMLAudioElement`](/en-US/docs/Web/API/HTMLAudioElement)) hoặc [`AudioContext`](/en-US/docs/Web/API/AudioContext).

## Sự miêu tả

"Tự động phát" đề cập đến bất kỳ tính năng nào khiến nội dung bắt đầu phát mà không cần người dùng yêu cầu cụ thể việc bắt đầu phát lại.
Điều này bao gồm thuộc tính `autoplay` trong các phần tử HTML [`<video>`](/en-US/docs/Web/HTML/Reference/Elements/video#autoplay) và [`<audio>`](/en-US/docs/Web/HTML/Reference/Elements/audio#autoplay), đồng thời sử dụng mã JavaScript để bắt đầu phát lại mà không có bất kỳ tương tác nào của người dùng.

Tác nhân người dùng thường chặn tự động phát hoặc chỉ cho phép tự động phát nội dung không nghe được vì âm thanh không mong muốn khi trang tải lần đầu có thể dẫn đến trải nghiệm người dùng chói tai và khó chịu.
Các cơ chế được sử dụng để xác định xem nội dung có thể tự động phát hay không hoặc chỉ phát đối với nội dung không nghe được, khác nhau giữa các tác nhân người dùng.

Phương thức **`getAutoplayPolicy()`** cung cấp cơ chế tiêu chuẩn để xác định chính sách cho một tác nhân người dùng cụ thể nhằm tự động phát một loại hoặc mục nội dung cụ thể.
Điều này cho phép tùy chỉnh ứng dụng như tự động tắt tiếng video trên các trang web không cho phép tự động phát nội dung âm thanh hoặc sửa đổi ứng dụng để hoạt động mà không tự động phát.

Cách sử dụng phương pháp được khuyến nghị là gọi nó là _khi tải trang_ (hoặc trước khi các phần tử phát nội dung được tạo) chỉ định loại tính năng cần kiểm tra, sau đó định cấu hình tính năng tự động phát của các phần tử phương tiện dựa trên kết quả.
Ví dụ: nếu ứng dụng muốn tự động phát các thành phần video có đoạn âm thanh, bạn có thể sử dụng mã sau để tắt tiếng video nếu chỉ cho phép phát nội dung không nghe được.

```js
if (navigator.getAutoplayPolicy("mediaelement") === "allowed") {
  // Do nothing. The content can autoplay.
} else if (navigator.getAutoplayPolicy("mediaelement") === "allowed-muted") {
  // Mute the video so it can autoplay.
} else {
  // Autoplay disallowed.
  // Add a play button to the video element.
}
```

Phương thức này cũng có thể được gọi để kiểm tra chính sách tự động phát cho một phần tử phương tiện hoặc ngữ cảnh âm thanh cụ thể.
Như được hiển thị bên dưới, mã trông giống hệt nhau ngoại trừ việc bạn chuyển vào mục chỉ định thay vì chuỗi `type`.

```js
const video = document.getElementById("video_element_id");
if (navigator.getAutoplayPolicy(video) === "allowed") {
  // Do nothing. The content can autoplay.
} else if (navigator.getAutoplayPolicy(video) === "allowed-muted") {
  // Mute the video so it can autoplay.
} else {
  // Autoplay disallowed.
  // Add a play button to the video element.
}
```

Khi tải trang, trước khi người dùng tương tác với trang hoặc trang web, chính sách tự động phát cho loại và các mục riêng lẻ sẽ giống nhau.
Sau khi người dùng tương tác với trang web, trang hoặc các thành phần cụ thể, chính sách tự động phát có thể thay đổi đối với toàn bộ `type`.
Cũng có thể chính sách cho một mục cụ thể sẽ thay đổi, ngay cả khi chính sách chung cho `type` không thay đổi.

Không có cách nào để được thông báo rằng chính sách tự động phát đã thay đổi.
Vì lý do này, mặc dù bạn có thể kiểm tra chính sách cho một loại hoặc mục bất kỳ lúc nào, nhưng thông thường bạn sẽ chỉ làm như vậy khi tải trang hoặc trước khi thử phát nội dung.

## Ví dụ

### Kiểm tra xem tính năng này có được hỗ trợ không

Mã bên dưới cho biết cách kiểm tra xem `navigator.getAutoplayPolicy()` có được hỗ trợ hay không:

```html hidden
<div id="reportResult"></div>
```

```js hidden
const log = document.getElementById("reportResult");
```

```js
if (!navigator.getAutoplayPolicy) {
  log.textContent = "navigator.getAutoplayPolicy() not supported.";
} else {
  log.textContent = "navigator.getAutoplayPolicy() is supported.";
}
```

Kết quả của việc chạy mã trên trang này là:

{{EmbedLiveSample('Checking if the feature is supported', '', '50')}}

### Kiểm tra chính sách tự động phát cho loại phần tử phương tiện

Ví dụ này minh họa cách bạn có thể kiểm tra chính sách tự động phát cho loại thành phần phương tiện.

Mã tạo thành phần video có thuộc tính [`autoplay`](/en-US/docs/Web/API/HTMLMediaElement/autoplay) và không bị tắt tiếng theo mặc định.
Nếu chính sách tự động phát là "cho phép tắt tiếng", video sẽ bị tắt tiếng để cho phép phát.

#### HTML

HTML bên dưới có phần tử `div` được sử dụng làm nhật ký báo cáo và cũng hiển thị [`<video>`](/en-US/docs/Web/HTML/Reference/Elements/video) có thuộc tính [`autoplay`](/en-US/docs/Web/API/HTMLMediaElement/autoplay).
Theo mặc định, phần này không nên bị tắt tiếng và sẽ tự động phát nếu tính năng tự động phát không bị chặn.

```html
<div id="reportResult"></div>
<!-- Simple video example -->
<!-- 'Big Buck Bunny' licensed under CC 3.0 by the Blender foundation. Hosted by archive.org -->
<!-- Poster from peach.blender.org -->
<video
  id="bunny_vid"
  autoplay
  controls
  src="https://archive.org/download/BigBuckBunny_124/Content/big_buck_bunny_720p_surround.mp4"
  poster="https://peach.blender.org/wp-content/uploads/title_anouncement.jpg?x11217"
  width="620">
  Sorry, your browser doesn't support embedded videos, but don't worry, you can
  <a href="https://archive.org/details/BigBuckBunny_124">download it</a> and
  watch it with your favorite video player!
</video>
```

#### JavaScript

Mã này báo cáo liệu phương thức `getAutoplayPolicy()` có được hỗ trợ hay không và nếu có thì chính sách dành cho các thành phần phương tiện.

Nếu chính sách là `allowed-muted` thì chỉ có thể phát video bị tắt tiếng.
Trong trường hợp này, chúng tôi thêm một số văn bản giải thích điều gì đang xảy ra và tắt tiếng video.

```js
const log = document.getElementById("reportResult");
const video = document.getElementById("bunny_vid");

if (!navigator.getAutoplayPolicy) {
  log.textContent =
    "navigator.getAutoplayPolicy() not supported. It may or may not autoplay, depending on the browser!";
} else {
  log.textContent = `Autoplay policy for media elements is: ${navigator.getAutoplayPolicy(
    "mediaelement",
  )}. `;

  if (navigator.getAutoplayPolicy("mediaelement") === "allowed-muted") {
    // Mute the video so it can autoplay
    video.muted = true;
    log.textContent += "Video has been muted to allow it to autoplay.";
  }
}
```

Lưu ý rằng bạn có thể kiểm tra `allowed` và `disallowed` theo cách tương tự.

#### Kết quả

Video được hiển thị bên dưới cùng với thông tin về việc phương pháp `getAutoplayPolicy()` có được hỗ trợ hay không và chính sách nếu có.

Nếu `getAutoplayPolicy()` được hỗ trợ và chính sách là `allowed` thì video sẽ tự động phát cùng với âm thanh.
Nếu chính sách là `allowed-muted` thì video sẽ phát mà không có âm thanh.

{{EmbedLiveSample('Test autoplay policy for media elements', '', '400')}}

Lưu ý rằng nếu `getAutoplayPolicy()` không được hỗ trợ thì video sẽ tự động phát kèm âm thanh hoặc không phát.
Mã không có quyền kiểm soát hành vi này: bạn hoàn toàn phụ thuộc vào việc triển khai trình duyệt!

### Kiểm tra chính sách tự động phát cho một phần tử phương tiện cụ thể

Ví dụ này cho thấy cách bạn có thể kiểm tra xem một phần tử phương tiện cụ thể có tự động phát hay không.
Nó gần giống hệt như ví dụ trước (kiểm tra `AudioContext` cũng tương tự).
Lưu ý rằng các phần tử cụ thể có thể tự động phát ngay cả khi việc kiểm tra loại `mediaelement` cho biết rằng tính năng tự động phát là `disallowed`; nói cách khác, việc kiểm tra một phần tử cụ thể sẽ đáng tin cậy hơn (mặc dù điều đó không quan trọng khi tải trang).

Mã tạo thành phần video có thuộc tính [`autoplay`](/en-US/docs/Web/API/HTMLMediaElement/autoplay).
Nếu chính sách tự động phát là "cho phép tắt tiếng", video sẽ bị tắt tiếng để cho phép phát.

#### HTML

HTML bên dưới có phần tử `div` được sử dụng làm nhật ký báo cáo và cũng hiển thị [`<video>`](/en-US/docs/Web/HTML/Reference/Elements/video) có thuộc tính [`autoplay`](/en-US/docs/Web/API/HTMLMediaElement/autoplay).
Theo mặc định, phần này không nên bị tắt tiếng và sẽ tự động phát nếu tính năng tự động phát không bị chặn.

```html
<div id="reportResult"></div>
<!-- Simple video example -->
<!-- 'Big Buck Bunny' licensed under CC 3.0 by the Blender foundation. Hosted by archive.org -->
<!-- Poster from peach.blender.org -->
<video
  id="bunny_vid"
  autoplay
  controls
  src="https://archive.org/download/BigBuckBunny_124/Content/big_buck_bunny_720p_surround.mp4"
  poster="https://peach.blender.org/wp-content/uploads/title_anouncement.jpg?x11217"
  width="620">
  Sorry, your browser doesn't support embedded videos, but don't worry, you can
  <a href="https://archive.org/details/BigBuckBunny_124">download it</a> and
  watch it with your favorite video player!
</video>
```

#### JavaScript

Mã này báo cáo liệu phương thức `getAutoplayPolicy()` có được hỗ trợ hay không và nếu có thì chính sách dành cho các thành phần phương tiện.

Nếu chính sách là `allowed-muted` thì chỉ có thể phát video bị tắt tiếng, do đó mã sẽ tắt tiếng video.

```js
const log = document.getElementById("reportResult");
const video = document.getElementById("bunny_vid");

if (!navigator.getAutoplayPolicy) {
  log.textContent =
    "navigator.getAutoplayPolicy() not supported. It may or may not autoplay, depending on the browser!";
} else {
  // Here we pass in the HTMLVideoElement to check
  log.textContent = `navigator.getAutoplayPolicy(video) === ${navigator.getAutoplayPolicy(
    "mediaelement",
  )}`;

  if (navigator.getAutoplayPolicy(video) === "allowed-muted") {
    // Mute the video so it can autoplay
    video.muted = true;
    log.textContent += "Video has been muted to allow it to autoplay.";
  }
}
```

#### Kết quả

Kết quả giống như trong ví dụ trước:

- Video sẽ tự động phát có âm thanh nếu trả về `allowed` và không có âm thanh nếu trả về `allowed-muted`.
- Nếu `getAutoplayPolicy()` không được hỗ trợ, hành vi tự động phát video chỉ phụ thuộc vào trình duyệt.

{{EmbedLiveSample('Test autoplay policy for a specific media element', '', '400')}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [Autoplay guide for media and Web Audio APIs](/en-US/docs/Web/Media/Guides/Autoplay)
