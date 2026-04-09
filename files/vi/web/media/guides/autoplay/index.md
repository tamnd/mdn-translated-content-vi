---
title: Hướng dẫn autoplay cho media và Web Audio APIs
slug: Web/Media/Guides/Autoplay
page-type: guide
sidebar: mediasidebar
---

Việc tự động bắt đầu phát audio (hoặc video có track audio) ngay khi trang tải có thể là một bất ngờ không mong muốn đối với người dùng. Mặc dù autoplay của media có mục đích hữu ích, nó nên được dùng cẩn thận và chỉ khi thật sự cần. Để trao quyền kiểm soát cho người dùng, các trình duyệt thường cung cấp nhiều hình thức chặn autoplay. Trong hướng dẫn này, chúng ta sẽ đề cập đến chức năng autoplay trong các API media và Web Audio khác nhau, bao gồm một tổng quan ngắn về cách dùng autoplay và cách làm việc với trình duyệt để xử lý việc chặn autoplay một cách mềm dẻo.

Việc chặn autoplay _không_ được áp dụng cho các phần tử {{HTMLElement("video")}} khi media nguồn không có track audio, hoặc khi track audio bị tắt tiếng. Media có track audio đang hoạt động được xem là **có thể nghe được**, và việc chặn autoplay sẽ áp dụng với chúng. Media **không thể nghe được** sẽ không bị ảnh hưởng bởi chặn autoplay.

## Autoplay và chặn autoplay

Thuật ngữ **autoplay** dùng để chỉ bất kỳ tính năng nào khiến media bắt đầu phát mà không có yêu cầu cụ thể từ người dùng rằng việc phát phải bắt đầu. Điều này bao gồm cả việc dùng thuộc tính HTML để tự phát media lẫn việc dùng mã JavaScript để bắt đầu phát ngoài ngữ cảnh xử lý đầu vào của người dùng.

Điều đó có nghĩa là cả hai hành vi sau đều được xem là autoplay, và vì vậy đều chịu chính sách chặn autoplay của trình duyệt:

```html
<audio src="/music.mp3" autoplay></audio>
```

và

```js
audioElement.play();
```

Các tính năng và API web sau có thể bị ảnh hưởng bởi chặn autoplay:

- Các phần tử {{Glossary("HTML")}} {{HTMLElement("audio")}} và {{HTMLElement("video")}}
- [Web Audio API](/en-US/docs/Web/API/Web_Audio_API)

Từ góc nhìn người dùng, một trang web hay ứng dụng đột ngột phát ra tiếng mà không báo trước có thể gây khó chịu, bất tiện hoặc tạo cảm giác không dễ chịu. Vì vậy, trình duyệt thường chỉ cho phép autoplay thành công trong những trường hợp cụ thể.

### Khả năng sử dụng autoplay

Nhìn chung, bạn có thể giả định rằng media chỉ được phép autoplay nếu _ít nhất một_ trong các điều kiện sau đúng:

- Audio đang bị tắt tiếng hoặc âm lượng được đặt bằng 0
- Người dùng đã tương tác với trang web (bằng cách nhấp, chạm, nhấn phím, v.v.)
- Trang web đã được đưa vào danh sách cho phép; điều này có thể xảy ra tự động nếu trình duyệt xác định rằng người dùng thường xuyên tương tác với media, hoặc được bật thủ công thông qua tùy chọn hay các tính năng giao diện người dùng khác
- Nếu [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) cho autoplay được dùng để cấp hỗ trợ autoplay cho một {{HTMLElement("iframe")}} và tài liệu của nó.

Nếu không, việc phát rất có thể sẽ bị chặn.
Các tình huống chính xác dẫn đến bị chặn, và chi tiết về cách các trang web được đưa vào danh sách cho phép, khác nhau giữa các trình duyệt, nhưng các hướng dẫn ở trên là những quy tắc tốt để dựa vào.

Để biết chi tiết, xem chính sách autoplay của [Google Chrome](https://developer.chrome.com/blog/autoplay/) và [WebKit](https://webkit.org/blog/7734/auto-play-policy-changes-for-macos/).

> [!NOTE]
> Nói cách khác, việc phát bất kỳ media nào có audio thường bị chặn nếu việc phát được khởi tạo bằng chương trình trong một tab chưa từng có bất kỳ tương tác người dùng nào. Trình duyệt cũng có thể chọn chặn trong các trường hợp khác.

## Autoplay của các phần tử media

Giờ khi đã nói về autoplay là gì và điều gì có thể ngăn autoplay được cho phép, chúng ta sẽ xem cách website hoặc ứng dụng của bạn có thể tự động phát media khi trang tải, cách phát hiện khi autoplay không xảy ra, và các mẹo để ứng phó khi trình duyệt từ chối autoplay.

### Thuộc tính autoplay

Cách đơn giản nhất để tự động phát nội dung là thêm thuộc tính [`autoplay`](/en-US/docs/Web/HTML/Reference/Elements/audio#autoplay) vào phần tử {{HTMLElement("audio")}} hoặc {{HTMLElement("video")}}, thuộc tính này đặt property {{domxref("HTMLMediaElement.autoplay", "autoplay")}} của phần tử thành `true`.
Khi `autoplay` là `true`, media sẽ tự động bắt đầu phát càng sớm càng tốt sau khi các điều sau xảy ra:

- Trang được phép sử dụng chức năng autoplay
- Phần tử đã được tạo trong quá trình tải trang
- Đã nhận đủ media để bắt đầu phát và tiếp tục phát đến hết media mà không bị gián đoạn, giả sử không có thay đổi lớn nào về hiệu năng mạng hoặc băng thông.

#### Ví dụ: Thuộc tính autoplay

Một phần tử {{HTMLElement("audio")}} dùng thuộc tính `autoplay` có thể trông như sau:

```html
<audio id="musicplayer" autoplay>
  <source src="/music/chapter1.mp3" />
</audio>
```

#### Ví dụ 2: Phát hiện xem autoplay có được phép hay không

Nếu autoplay quan trọng với ứng dụng của bạn, bạn có thể cần tùy biến hành vi dựa trên việc autoplay được cho phép, bị từ chối, hay chỉ được hỗ trợ cho nội dung không thể nghe được.
Ví dụ, nếu ứng dụng của bạn cần tự phát một video và bạn biết rằng trang chỉ cho phép autoplay với nội dung không thể nghe được, bạn có thể tắt tiếng video hoặc cung cấp video không có track audio.
Tương tự, nếu bạn biết rằng autoplay hoàn toàn không được phép, bạn có thể cung cấp một hình ảnh mặc định cho video (dùng thuộc tính [`poster`](/en-US/docs/Web/HTML/Reference/Elements/video#poster)), hoặc chọn trì hoãn việc tải video cho đến khi nó được yêu cầu.

Phương thức [`Navigator.getAutoplayPolicy()`](/en-US/docs/Web/API/Navigator/getAutoplayPolicy) có thể được dùng để kiểm tra chính sách autoplay cho một loại tính năng media (tức là tất cả phần tử media, hoặc tất cả audio context) trong một tài liệu, hoặc để kiểm tra xem một phần tử media hay audio context cụ thể có thể autoplay hay không.

Ví dụ dưới đây cho thấy cách bạn truyền chuỗi `mediaelement` để lấy chính sách autoplay cho tất cả phần tử media trong tài liệu (truyền `audiocontext` để lấy chính sách cho audio context).
Đoạn mã giả định `video` là một phần tử media `HTMLVideoElement` dùng thẻ [`<video>`](/en-US/docs/Web/HTML/Reference/Elements/video#autoplay) hoặc [`HTMLVideoElement`](/en-US/docs/Web/API/HTMLVideoElement), và nó được cấu hình để tự phát với audio theo mặc định.
Nếu autoplay chỉ được phép cho nội dung không thể nghe được, chúng ta sẽ tắt tiếng audio; nếu autoplay bị từ chối, chúng ta sẽ đảm bảo một ảnh giữ chỗ được hiển thị cho video.

```js
if (navigator.getAutoplayPolicy("mediaelement") === "allowed") {
  // Phần tử video sẽ tự phát kèm audio.
} else if (navigator.getAutoplayPolicy("mediaelement") === "allowed-muted") {
  // Tắt tiếng audio trên video
  video.muted = true;
} else if (navigator.getAutoplayPolicy("mediaelement") === "disallowed") {
  // Đặt ảnh giữ chỗ mặc định.
  video.poster = "http://example.com/poster_image_url";
}
```

Mã để kiểm tra một phần tử hoặc audio context cụ thể là giống nhau, ngoại trừ việc bạn truyền vào phần tử hoặc context cần kiểm tra thay vì chuỗi kiểu.
Ở đây chúng ta truyền vào đối tượng `video` mà mình muốn kiểm tra.

```js
if (navigator.getAutoplayPolicy(video) === "allowed") {
  // Phần tử video sẽ tự phát kèm audio.
} else if (navigator.getAutoplayPolicy(video) === "allowed-muted") {
  // Tắt tiếng audio trên video
  video.muted = true;
} else if (navigator.getAutoplayPolicy(video) === "disallowed") {
  // Đặt ảnh giữ chỗ mặc định.
  video.poster = "http://example.com/poster_image_url";
}
```

Chính sách autoplay cho một kiểu media có thể thay đổi do người dùng tương tác với trang web, trang, hoặc một phần tử cụ thể.
Tương tự, trên một số trình duyệt, chính sách cho một phần tử cụ thể có thể thay đổi ngay cả khi chính sách của kiểu đó không đổi (ví dụ, trên các trình duyệt mà việc chạm vào một phần tử cụ thể chỉ cho phép chính phần tử đó tự phát).

Vì không có cách nào để được thông báo khi chính sách autoplay thay đổi (dù là cho một kiểu hay một phần tử), nhìn chung chúng tôi khuyến nghị kiểm tra chính sách khi trang được tải, và dùng kiểu media.

#### Ví dụ 3: Phát hiện thất bại của autoplay như một phương án dự phòng

Không có sự kiện cụ thể nào (hay thông báo nào khác) được kích hoạt bởi thành công hay thất bại của autoplay, vì vậy các trình duyệt không hỗ trợ [`Navigator.getAutoplayPolicy()`](/en-US/docs/Web/API/Navigator/getAutoplayPolicy) sẽ không có cách dễ dàng nào để xác định autoplay có được hỗ trợ hay không, hoặc để phản ứng khi nó được kích hoạt hay không được kích hoạt.

Một cách tiếp cận là lắng nghe lần xuất hiện đầu tiên của sự kiện {{domxref("HTMLMediaElement/play_event", "play")}}, sự kiện này được phát trên phần tử media khi nó được tiếp tục sau khi tạm dừng _và_ khi autoplay xảy ra.
Điều đó có nghĩa là lần đầu tiên sự kiện `play` được phát ra, bạn biết rằng media của mình đang được bắt đầu lần đầu tiên sau khi trang được mở,

Hãy xem HTML này cho một phần tử media:

```html
<video src="my-video.mp4" id="video" autoplay></video>
```

Ở đây chúng ta có một phần tử {{HTMLElement("video")}} với thuộc tính [`autoplay`](/en-US/docs/Web/HTML/Reference/Elements/video#autoplay) được đặt và một trình xử lý sự kiện {{domxref("HTMLMediaElement.play_event", "play")}} được thiết lập; sự kiện được xử lý bởi một hàm tên `handleFirstPlay()`, nhận sự kiện `play` làm đầu vào.

`handleFirstPlay()` trông như sau:

```js
const video = document.getElementById("video");
video.addEventListener("play", handleFirstPlay);

let hasPlayed = false;
function handleFirstPlay(event) {
  if (!hasPlayed) {
    hasPlayed = true;

    // Xóa listener để hàm này chỉ được gọi một lần.
    const vid = event.target;
    vid.removeEventListener("play", handleFirstPlay);

    // Bắt đầu bất cứ việc gì bạn cần làm sau khi phát lần đầu bắt đầu
  }
}
```

Sau khi lấy được tham chiếu tới phần tử video từ thuộc tính {{domxref("Event")}} của đối tượng {{domxref("Event.target", "target")}}, chúng ta dùng nó để xóa event listener.
Điều này sẽ ngăn mọi sự kiện `play` trong tương lai được chuyển tới trình xử lý. Điều đó có thể xảy ra nếu video bị người dùng tạm dừng và phát lại, hoặc được trình duyệt tự động tiếp tục khi tài liệu nằm trong một tab nền.

Tại thời điểm này, trang web hoặc ứng dụng của bạn có thể bắt đầu thực hiện bất cứ điều gì phụ thuộc vào việc video đã được khởi chạy.

### Phương thức play()

Thuật ngữ "autoplay" cũng dùng để chỉ các tình huống trong đó một script cố gắng kích hoạt việc phát media có audio, ngoài ngữ cảnh xử lý sự kiện đầu vào của người dùng. Điều này được thực hiện bằng cách gọi phương thức {{domxref("HTMLMediaElement.play", "play()")}} của phần tử media.

> [!NOTE]
> Chúng tôi khuyến nghị mạnh mẽ bạn nên dùng thuộc tính `autoplay` bất cứ khi nào có thể, vì hỗ trợ cho các tùy chọn autoplay phổ biến hơn đối với thuộc tính `autoplay` so với các cách khác để phát media tự động. Nó cũng cho phép trình duyệt chịu trách nhiệm khởi động phát lại, giúp nó tối ưu hóa thời điểm diễn ra việc đó.

#### Ví dụ: Phát video

Ví dụ này phát phần tử {{HTMLElement("video")}} đầu tiên tìm thấy trong tài liệu. `play()` sẽ không cho phép việc phát bắt đầu trừ khi tài liệu có quyền tự động phát media.

```js
document.querySelector("video").play();
```

#### Ví dụ: Xử lý lỗi play()

Việc phát hiện thất bại khi tự phát media dễ hơn nhiều khi bạn dùng phương thức {{domxref("HTMLMediaElement.play", "play()")}} để bắt đầu. `play()` trả về một {{jsxref("Promise")}} được resolve khi media bắt đầu phát thành công, và bị reject khi việc phát không bắt đầu được (chẳng hạn nếu autoplay bị từ chối). Khi autoplay thất bại, có lẽ bạn sẽ muốn cung cấp một cách để người dùng tự yêu cầu trình duyệt xin quyền phát media.

Bạn có thể dùng đoạn mã như sau để thực hiện việc đó:

```js
let startPlayPromise = videoElem.play();

if (startPlayPromise !== undefined) {
  startPlayPromise
    .then(() => {
      // Bắt đầu bất cứ việc gì bạn cần làm chỉ sau khi việc phát
      // đã bắt đầu.
    })
    .catch((error) => {
      if (error.name === "NotAllowedError") {
        showPlayButton(videoElem);
      } else {
        // Xử lý lỗi tải hoặc phát lại
      }
    });
}
```

Điều đầu tiên chúng ta làm với kết quả của `play()` là đảm bảo nó không phải `undefined`. Chúng ta kiểm tra điều này vì trong các phiên bản cũ hơn của đặc tả HTML, `play()` không trả về giá trị. Việc trả về một promise để cho phép bạn xác định thành công hay thất bại của thao tác mới được thêm gần đây hơn. Kiểm tra `undefined` giúp đoạn mã này không lỗi trên các phiên bản trình duyệt cũ.

Nếu promise do `play()` trả về được resolve mà không lỗi, nhánh `then()` sẽ chạy và có thể bắt đầu bất kỳ việc gì cần thực hiện khi autoplay đã khởi động.

Sau đó chúng ta thêm trình xử lý {{jsxref("Promise.catch", "catch()")}} vào promise. Nó xem xét thuộc tính {{domxref("DOMException.name", "name")}} của lỗi để xem đó có phải là `NotAllowedError` hay không. Điều này cho biết việc phát thất bại do vấn đề quyền, chẳng hạn autoplay bị từ chối. Nếu đúng vậy, chúng ta nên hiển thị giao diện để người dùng tự khởi động phát lại; việc đó được xử lý ở đây bởi hàm `showPlayButton()`.

Các lỗi khác sẽ được xử lý phù hợp.

Nếu bạn muốn bắt đầu phát video sau lần tương tác đầu tiên với trang, {{domxref("Window.setInterval", "setInterval()")}} có thể được dùng để làm việc này:

```js
let playAttempt = setInterval(() => {
  videoElem
    .play()
    .then(() => {
      clearInterval(playAttempt);
    })
    .catch((error) => {
      console.log("Không thể phát video, người dùng chưa tương tác.");
    });
}, 3000);
```

## Tự phát bằng Web Audio API

Trong [Web Audio API](/en-US/docs/Web/API/Web_Audio_API), một website hoặc ứng dụng có thể bắt đầu phát audio bằng phương thức `start()` trên một source node được liên kết với {{domxref("AudioContext")}}. Thực hiện việc này ngoài ngữ cảnh xử lý một sự kiện đầu vào của người dùng sẽ chịu các quy tắc autoplay.

## Chính sách Permissions Policy cho autoplay

Bên cạnh việc quản lý và kiểm soát chức năng autoplay ở phía trình duyệt đã mô tả ở trên, một máy chủ web cũng có thể bày tỏ mong muốn cho phép autoplay hoạt động. Directive {{Glossary("HTTP")}} {{HTTPHeader("Permissions-Policy")}} {{httpheader("Permissions-Policy/autoplay", "autoplay")}} được dùng để kiểm soát miền nào, nếu có, có thể dùng để tự phát media. Theo mặc định, Permissions Policy `autoplay` được đặt thành `self`, cho biết autoplay được phép khi media được lưu trữ trên cùng miền với tài liệu.

Bạn cũng có thể chỉ định một allowlist rỗng (`()`) để vô hiệu hóa hoàn toàn autoplay, `*` để cho phép autoplay từ tất cả miền, hoặc một hay nhiều origin cụ thể mà media có thể được phát tự động. Các origin này được ngăn cách bằng khoảng trắng.

> [!NOTE]
> Chính sách Permissions Policy được chỉ định sẽ áp dụng cho tài liệu và mọi {{HTMLElement("iframe")}} lồng bên trong nó, trừ khi các khung đó có thuộc tính [`allow`](/en-US/docs/Web/HTML/Reference/Elements/iframe#allow), thuộc tính này đặt một Permissions Policy mới cho khung đó và tất cả các khung lồng bên trong nó.

Khi dùng thuộc tính [`allow`](/en-US/docs/Web/HTML/Reference/Elements/iframe#allow) trên một `<iframe>` để chỉ định Permissions Policy cho khung đó và các khung con lồng bên trong, bạn cũng có thể chỉ định giá trị `'src'` để cho phép chỉ tự phát media từ cùng miền với miền được chỉ định bởi thuộc tính [`src`](/en-US/docs/Web/HTML/Reference/Elements/iframe#src) của khung.

### Ví dụ: Chỉ cho phép autoplay từ miền của tài liệu

Để dùng header {{HTTPHeader("Permissions-Policy")}} nhằm chỉ cho phép media tự phát từ {{Glossary("origin")}} của tài liệu:

```http
Permissions-Policy: autoplay=(self)
```

Để làm điều tương tự cho một {{HTMLElement("iframe")}}:

```html
<iframe src="mediaplayer.html" allow="autoplay"> </iframe>
```

### Ví dụ: Cho phép autoplay và chế độ toàn màn hình

Thêm quyền [Fullscreen API](/en-US/docs/Web/API/Fullscreen_API) vào ví dụ trước sẽ cho ra một header `Permissions-Policy` như sau nếu quyền truy cập fullscreen được phép bất kể miền; bạn cũng có thể thêm giới hạn theo miền nếu cần.

```http
Permissions-Policy: autoplay=(self), fullscreen=(self)
```

Các quyền tương tự, được cấp bằng thuộc tính `allow` của phần tử `<iframe>`, sẽ trông như sau:

```html
<iframe src="mediaplayer.html" allow="autoplay; fullscreen"> </iframe>
```

### Ví dụ: Cho phép autoplay từ các nguồn cụ thể

Header `Permissions-Policy` để cho phép media phát từ cả miền riêng của tài liệu (hoặc `<iframe>`) và `https://example.media` sẽ trông như sau:

```http
Permissions-Policy: autoplay=(self "https://example.media")
```

Một {{HTMLElement("iframe")}} có thể được viết để chỉ định chính sách autoplay này áp dụng cho chính nó và mọi khung con như sau:

```html
<iframe
  width="300"
  height="200"
  src="mediaplayer.html"
  allow="autoplay 'src' https://example.media">
</iframe>
```

### Ví dụ: Vô hiệu hóa autoplay

Đặt Permissions Policy `autoplay` thành `()`/`none` sẽ vô hiệu hóa hoàn toàn autoplay cho tài liệu hoặc `<iframe>` và mọi khung lồng bên trong. HTTP header là:

```http
Permissions-Policy: autoplay=()
```

Sử dụng thuộc tính `allow` của `<iframe>`:

```html
<iframe src="mediaplayer.html" allow="autoplay 'none'"> </iframe>
```

## Best practices

Phần này cung cấp các mẹo và best practice được khuyến nghị để giúp bạn tận dụng tốt nhất khi làm việc với autoplay.

### Xử lý thất bại của autoplay với điều khiển media

Một trường hợp sử dụng phổ biến của autoplay là tự động bắt đầu phát một đoạn video đi kèm bài viết, quảng cáo, hoặc bản xem trước của chức năng chính của trang. Để tự phát các video như vậy, bạn có hai lựa chọn: không có track audio, hoặc có track audio nhưng cấu hình phần tử {{HTMLElement("video")}} để tắt tiếng audio theo mặc định, như sau:

```html
<video
  src="/videos/awesomevid.webm"
  controls
  autoplay
  playsinline
  muted></video>
```

Phần tử video này được cấu hình để bao gồm các điều khiển của người dùng (thường là phát/tạm dừng, tua trên timeline video, điều khiển âm lượng và tắt tiếng); đồng thời, vì thuộc tính [`muted`](/en-US/docs/Web/HTML/Reference/Elements/video#muted) được bao gồm, và thuộc tính [`playsinline`](/en-US/docs/Web/HTML/Reference/Elements/video#playsinline) là bắt buộc cho autoplay trong Safari, video sẽ tự phát nhưng audio bị tắt. Tuy nhiên, người dùng vẫn có thể bật lại audio bằng cách nhấp vào nút bật tiếng trong các điều khiển.

## Tùy chọn cấu hình trình duyệt

Trình duyệt có thể có các tùy chọn kiểm soát cách autoplay hoạt động, hoặc cách việc chặn autoplay được xử lý. Ở đây, bất kỳ tùy chọn nào có ý nghĩa đặc biệt hoặc quan trọng với bạn như một nhà phát triển web đều được liệt kê. Chúng bao gồm những tùy chọn có thể giúp bạn kiểm thử hoặc gỡ lỗi, cũng như những tùy chọn có thể được đặt theo cách mà bạn cần sẵn sàng xử lý.

### Firefox

- `media.allowed-to-play.enabled`
  - : Một tùy chọn Boolean chỉ định liệu property không chuẩn `HTMLMediaElement.allowedToPlay` có được hiển thị ra web hay không. Hiện tại giá trị mặc định là `false` (trừ các bản nightly, nơi nó mặc định là `true`). Nếu là `false`, thuộc tính `allowedToPlay` sẽ không có trong interface `HTMLMediaElement`, và vì vậy cũng không xuất hiện trên các phần tử {{HTMLElement("audio")}} hoặc {{HTMLElement("video")}}.
- `media.autoplay.allow-extension-background-pages`
  - : Tùy chọn Boolean này, nếu `true`, cho phép các script nền của tiện ích mở rộng trình duyệt tự phát audio media. Đặt giá trị này thành `false` sẽ vô hiệu hóa khả năng này. Giá trị mặc định là `true`.
- `media.autoplay.allow-muted`
  - : Một tùy chọn Boolean, nếu `true` (mặc định) sẽ cho phép media audio hiện đang bị tắt tiếng được tự động phát. Nếu đã đổi thành `false`, media có track audio sẽ không được phép phát ngay cả khi bị tắt tiếng.
- `media.autoplay.block-webaudio`
  - : Một tùy chọn Boolean cho biết có áp dụng chặn autoplay cho [Web Audio API](/en-US/docs/Web/API/Web_Audio_API) hay không.
    Nếu `false`, web audio luôn được phép tự phát.
    Nếu `true`, các audio context chỉ có thể phát trên các trang sau khi đã có {{Glossary("Sticky activation")}}.
    Mặc định được đặt thành `true`.
- `media.autoplay.default`
  - : Một tùy chọn số nguyên chỉ định việc cấu hình theo miền cho hỗ trợ autoplay có được cho phép theo mặc định (`0`), bị chặn (`1`), hay là yêu cầu hỏi khi dùng (`2`). Giá trị mặc định là `0`.
- `media.autoplay.enabled.user-gestures-needed` (chỉ các bản Nightly)
  - : Một tùy chọn Boolean kiểm soát việc phát hiện cử chỉ người dùng có được phép ghi đè thiết lập của `media.autoplay.default` hay không. Nếu `media.autoplay.default` _không_ được đặt thành `0` (autoplay được phép theo mặc định), việc tùy chọn này là `true` sẽ vẫn cho phép media có track audio tự phát nếu trang đã được kích hoạt bởi cử chỉ người dùng, và media không thể nghe được thì không bị hạn chế gì cả.
- `media.block-autoplay-until-in-foreground`
  - : Một tùy chọn Boolean cho biết việc phát media có bị chặn khi bắt đầu trên tab nền hay không. Giá trị mặc định, `true`, nghĩa là ngay cả khi autoplay vốn có thể được phép, nó cũng sẽ không diễn ra cho đến khi tab được đưa ra nền trước. Điều này ngăn tình huống gây mất tập trung khi một tab bắt đầu phát âm thanh và người dùng không thể tìm ra tab đó trong số tất cả các tab và cửa sổ của mình.

## Xem thêm

- [Công nghệ web media](/en-US/docs/Web/Media)
- [HTML video và audio](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_video_and_audio) (Hướng dẫn học tập)
- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
- [Cơ bản về audio đa trình duyệt](/en-US/docs/Web/Media/Guides/Audio_and_video_delivery/Cross-browser_audio_basics)
