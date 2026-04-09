---
title: Phân phối audio và video
slug: Web/Media/Guides/Audio_and_video_delivery
page-type: guide
sidebar: mediasidebar
---

Chúng ta có thể phân phối audio và video trên web theo nhiều cách, từ các tệp media "tĩnh" cho đến các luồng trực tiếp thích ứng. Bài viết này nhằm làm điểm khởi đầu để tìm hiểu các cơ chế phân phối khác nhau của media trên nền web và khả năng tương thích với các trình duyệt phổ biến.

## Các phần tử HTML cho audio và video

Dù chúng ta đang xử lý các tệp audio đã ghi sẵn hay các luồng trực tiếp, cơ chế để cung cấp chúng thông qua các phần tử {{ htmlelement("audio") }} và {{ htmlelement("video") }} của trình duyệt vẫn gần như giống nhau. Hiện tại, để hỗ trợ tất cả trình duyệt, chúng ta cần chỉ định hai định dạng, mặc dù với việc Firefox và Opera đã chấp nhận các định dạng MP3 và MP4, điều này đang thay đổi rất nhanh. Bạn có thể tìm thông tin tương thích trong [Hướng dẫn về các kiểu media và định dạng trên web](/en-US/docs/Web/Media/Guides/Formats).

Để phân phối video và audio, quy trình tổng quát thường sẽ như sau:

1. Kiểm tra trình duyệt hỗ trợ định dạng nào thông qua phát hiện tính năng (thường là chọn một trong hai định dạng như đã nêu ở trên).
2. Nếu trình duyệt không hỗ trợ phát bất kỳ định dạng nào đã cung cấp một cách nguyên bản, hãy hiển thị một hình ảnh tĩnh hoặc dùng một công nghệ dự phòng để trình bày video.
3. Xác định cách bạn muốn phát/khởi tạo media (ví dụ, một phần tử {{ htmlelement("video") }} hoặc có lẽ là `document.createElement('video')`?)
4. Cung cấp tệp media cho trình phát.

### HTML Audio

```html
<audio controls preload="auto">
  <source src="audio-file.mp3" type="audio/mpeg" />

  <!-- dự phòng cho trình duyệt không hỗ trợ mp3 -->
  <source src="audio-file.ogg" type="audio/ogg" />

  <!-- dự phòng cho trình duyệt không hỗ trợ phần tử audio -->
  <a href="audio-file.mp3">tải xuống audio</a>
</audio>
```

Đoạn mã trên sẽ tạo ra một trình phát audio cố gắng tải trước càng nhiều audio càng tốt để phát mượt hơn.

> [!NOTE]
> Thuộc tính `preload` có thể bị một số trình duyệt di động bỏ qua.

Để biết thêm thông tin, xem [Cross Browser Audio Basics (HTML Audio In Detail)](/en-US/docs/Web/Media/Guides/Audio_and_video_delivery/Cross-browser_audio_basics#html_audio_in_detail)

### HTML video

```html
<video
  controls
  width="640"
  height="480"
  poster="initial-image.png"
  autoplay
  muted>
  <source src="video-file.mp4" type="video/mp4" />

  <!-- dự phòng cho trình duyệt không hỗ trợ mp4 -->
  <source src="video-file.webm" type="video/webm" />

  <!-- chỉ định các tệp phụ đề -->
  <track src="subtitles_en.vtt" kind="subtitles" srclang="en" label="English" />
  <track
    src="subtitles_no.vtt"
    kind="subtitles"
    srclang="no"
    label="Norwegian" />

  <!-- dự phòng cho trình duyệt không hỗ trợ phần tử video -->
  <a href="video-file.mp4">tải xuống video</a>
</video>
```

Đoạn mã trên tạo ra một trình phát video có kích thước 640x480 pixel, hiển thị hình ảnh poster cho đến khi video được phát. Chúng ta yêu cầu video tự phát nhưng mặc định ở trạng thái tắt tiếng.

> [!NOTE]
> Thuộc tính `autoplay` có thể bị một số trình duyệt di động bỏ qua. Ngoài ra, tính năng tự phát có thể gây tranh cãi nếu bị lạm dụng. Bạn nên đọc kỹ [Hướng dẫn về autoplay cho media và Web Audio APIs](/en-US/docs/Web/Media/Guides/Autoplay) để biết cách dùng autoplay một cách hợp lý.

Để biết thêm thông tin, xem [phần tử \<video>](/en-US/docs/Web/HTML/Reference/Elements/video) và [Tạo một trình phát video đa trình duyệt](/en-US/docs/Web/Media/Guides/Audio_and_video_delivery/cross_browser_video_player).

### Audio JavaScript

```js
const myAudio = document.createElement("audio");

if (myAudio.canPlayType("audio/mpeg")) {
  myAudio.setAttribute("src", "audio-file.mp3");
} else if (myAudio.canPlayType("audio/ogg")) {
  myAudio.setAttribute("src", "audio-file.ogg");
}

myAudio.currentTime = 5;
myAudio.play();
```

Chúng ta đặt nguồn audio dựa trên kiểu tệp audio mà trình duyệt hỗ trợ, sau đó đưa vị trí phát đến giây thứ 5 và cố gắng phát nó.

> [!NOTE]
> Hầu hết trình duyệt sẽ bỏ qua lệnh phát nếu nó không được kích hoạt bởi một sự kiện do người dùng khởi tạo.

Cũng có thể đưa một phần tử {{ htmlelement("audio") }} một tệp WAV mã hóa base64, cho phép tạo audio ngay tại chỗ:

```html
<audio id="player" src="data:audio/x-wav;base64,UklGRvC…"></audio>
```

[Speak.js](https://github.com/kripken/speak.js/) sử dụng kỹ thuật này.

### Video JavaScript

```js
const myVideo = document.createElement("video");

if (myVideo.canPlayType("video/mp4")) {
  myVideo.setAttribute("src", "video-file.mp4");
} else if (myVideo.canPlayType("video/webm")) {
  myVideo.setAttribute("src", "video-file.webm");
}

myVideo.width = 480;
myVideo.height = 320;
```

Chúng ta đặt nguồn video tùy theo loại tệp video mà trình duyệt hỗ trợ, rồi đặt chiều rộng và chiều cao của video.

## Web Audio API

Trong ví dụ này, chúng ta lấy một tệp MP3 bằng API {{domxref("Window/fetch", "fetch()")}}, nạp nó vào một nguồn, rồi phát nó.

```js
let audioCtx;
let buffer;
let source;

async function loadAudio() {
  try {
    // Nạp một tệp audio
    const response = await fetch("viper.mp3");
    // Giải mã nó
    buffer = await audioCtx.decodeAudioData(await response.arrayBuffer());
  } catch (err) {
    console.error(`Không thể tải tệp audio. Lỗi: ${err.message}`);
  }
}

const play = document.getElementById("play");
play.addEventListener("click", async () => {
  if (!audioCtx) {
    audioCtx = new AudioContext();
    await loadAudio();
  }
  source = audioCtx.createBufferSource();
  source.buffer = buffer;
  source.connect(audioCtx.destination);
  source.start();
  play.disabled = true;
});
```

Bạn có thể [chạy toàn bộ ví dụ trực tiếp](https://mdn.github.io/webaudio-examples/decode-audio-data/promise/), hoặc [xem mã nguồn](https://github.com/mdn/webaudio-examples/tree/main/decode-audio-data/promise).

Tìm hiểu thêm về các khái niệm cơ bản của Web Audio API trong [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API).

## getUserMedia / Stream API

Cũng có thể lấy một luồng trực tiếp từ webcam và/hoặc micro bằng `getUserMedia` và Stream API. Đây là một phần của công nghệ rộng hơn gọi là WebRTC (Web Real-Time Communications) và tương thích với các phiên bản mới nhất của Chrome, Firefox và Opera.

Để lấy luồng từ webcam, trước tiên hãy thiết lập một phần tử {{htmlelement("video")}}:

```html
<video id="webcam" width="480" height="360"></video>
```

Tiếp theo, nếu được hỗ trợ, hãy kết nối nguồn webcam với phần tử video:

```js
if (navigator.mediaDevices) {
  navigator.mediaDevices
    .getUserMedia({ video: true, audio: false })
    .then((stream) => {
      const video = document.getElementById("webcam");
      video.autoplay = true;
      video.srcObject = stream;
    })
    .catch(() => {
      alert(
        "Đã xảy ra sự cố khi lấy các luồng - bạn đang chạy trên file:/// hay đã từ chối quyền truy cập?",
      );
    });
} else {
  alert("getUserMedia không được hỗ trợ trong trình duyệt này.");
}
```

Để tìm hiểu thêm, hãy đọc trang {{domxref("MediaDevices.getUserMedia")}} của chúng tôi.

## MediaStream Recording

Các tiêu chuẩn mới đang được triển khai để cho phép trình duyệt lấy media từ micro hoặc camera của bạn bằng `getUserMedia` và ghi lại ngay lập tức bằng MediaStream Recording API mới. Bạn lấy luồng nhận được từ `getUserMedia`, truyền nó vào đối tượng `MediaRecorder`, lấy đầu ra thu được và đưa nó vào nguồn audio hoặc video của bạn\*.

Cơ chế chính được mô tả dưới đây:

```js
navigator.mediaDevices
  .getUserMedia({ audio: true })
  .then((stream) => {
    const recorder = new MediaRecorder(stream);

    const data = [];
    recorder.ondataavailable = (e) => {
      data.push(e.data);
    };
    recorder.start();
    recorder.onerror = (e) => {
      throw e.error || new Error(e.name); // e.name là FF non-spec
    };
    recorder.onstop = (e) => {
      const audio = document.createElement("audio");
      audio.src = window.URL.createObjectURL(new Blob(data));
    };
    setTimeout(() => {
      rec.stop();
    }, 5000);
  })
  .catch((error) => {
    console.log(error.message);
  });
```

Xem [MediaStream Recording API](/en-US/docs/Web/API/MediaStream_Recording_API) để biết thêm chi tiết.

## Media Source Extensions (MSE)

[Media Source Extensions](https://w3c.github.io/media-source/) là một bản thảo làm việc của W3C dự kiến mở rộng {{domxref("HTMLMediaElement")}} để cho phép JavaScript tạo luồng media cho việc phát lại. Việc cho phép JavaScript tạo luồng giúp mở ra nhiều trường hợp sử dụng như adaptive streaming và time shifting của các luồng trực tiếp.

### Encrypted Media Extensions (EME)

[Encrypted Media Extensions](https://w3c.github.io/encrypted-media/) là một đề xuất của W3C nhằm mở rộng `HTMLMediaElement`, cung cấp các API để điều khiển việc phát nội dung được bảo vệ.

API này hỗ trợ nhiều trường hợp sử dụng, từ giải mã basic clear key đến video giá trị cao (khi có triển khai user agent phù hợp). Việc trao đổi license/key do ứng dụng điều phối, giúp phát triển các ứng dụng phát lại mạnh mẽ hỗ trợ nhiều công nghệ bảo vệ và giải mã nội dung khác nhau.

Một trong những mục đích chính của EME là cho phép trình duyệt triển khai DRM ([Digital Rights Management](https://en.wikipedia.org/wiki/Digital_rights_management)), giúp ngăn nội dung trên web, đặc biệt là video, bị sao chép.

### Adaptive Streaming

Các định dạng và giao thức mới đang được triển khai để hỗ trợ adaptive streaming. Media adaptive streaming có nghĩa là băng thông và thường cả chất lượng của luồng có thể thay đổi theo thời gian thực để phản ứng với băng thông khả dụng của người dùng. Adaptive streaming thường được dùng cùng với live streaming, nơi việc phân phối audio hoặc video mượt mà là điều then chốt.

Các định dạng chính dùng cho adaptive streaming là [HLS](/en-US/docs/Web/Media/Guides/Audio_and_video_delivery/Live_streaming_web_audio_and_video#hls) và [MPEG-DASH](/en-US/docs/Web/Media/Guides/Audio_and_video_delivery/Live_streaming_web_audio_and_video#mpeg-dash). MSE được thiết kế với DASH trong đầu. MSE định nghĩa các byte stream theo [ISOBMFF](https://dvcs.w3.org/hg/html-media/raw-file/tip/media-source/isobmff-byte-stream-format.html) và [M2TS](https://en.wikipedia.org/wiki/M2ts) (cả hai đều được DASH hỗ trợ, trong đó M2TS được HLS hỗ trợ). Nói chung, nếu bạn quan tâm đến tiêu chuẩn, đang tìm sự linh hoạt, hoặc muốn hỗ trợ hầu hết trình duyệt hiện đại, DASH thường là lựa chọn tốt hơn.

> [!NOTE]
> Hiện tại Safari không hỗ trợ DASH, mặc dù dash.js sẽ hoạt động trên các phiên bản Safari mới hơn dự kiến phát hành cùng OS X Yosemite.

DASH cũng cung cấp nhiều profile, bao gồm các profile onDemand không yêu cầu tiền xử lý hay chia nhỏ tệp media. Cũng có một số dịch vụ trên nền đám mây có thể chuyển đổi media của bạn sang cả HLS lẫn DASH.

Để biết thêm thông tin, xem [Phát trực tiếp audio và video trên web](/en-US/docs/Web/Media/Guides/Audio_and_video_delivery/Live_streaming_web_audio_and_video).

## Tùy chỉnh trình phát media của bạn

Bạn có thể muốn trình phát audio hoặc video của mình có giao diện nhất quán trên mọi trình duyệt, hoặc chỉ đơn giản là muốn chỉnh cho khớp với trang web của mình. Kỹ thuật tổng quát để đạt được điều này là bỏ thuộc tính `controls` để các điều khiển mặc định của trình duyệt không hiển thị, tạo các điều khiển tùy chỉnh bằng HTML và CSS, rồi dùng JavaScript để nối các điều khiển đó với API audio/video.

Nếu cần thêm gì đó, bạn cũng có thể bổ sung các tính năng hiện chưa có trong trình phát mặc định, chẳng hạn như tốc độ phát, chuyển đổi luồng chất lượng hoặc thậm chí là phổ âm thanh. Bạn cũng có thể chọn cách làm cho trình phát thích ứng với kích thước màn hình, ví dụ như bỏ thanh tiến trình trong một số điều kiện nhất định.

Bạn có thể phát hiện các sự kiện click, touch và/hoặc bàn phím để kích hoạt các hành động như phát, tạm dừng và tua. Việc nhớ hỗ trợ bàn phím thường rất quan trọng để đảm bảo sự tiện dụng và khả năng truy cập.

Một ví dụ nhanh — trước tiên hãy thiết lập audio và các điều khiển tùy chỉnh trong HTML:

```html
<audio id="my-audio" src="/shared-assets/audio/guitar.mp3"></audio>
<button id="my-control">play</button>
```

thêm một chút JavaScript để phát hiện các sự kiện phát và tạm dừng audio:

```js
const myAudio = document.getElementById("my-audio");
const myControl = document.getElementById("my-control");

function switchState() {
  if (myAudio.paused) {
    myAudio.play();
    myControl.textContent = "pause";
  } else {
    myAudio.pause();
    myControl.textContent = "play";
  }
}

function checkKey(e) {
  if (e.code === "Space") {
    // phím cách
    switchState();
  }
}

myControl.addEventListener("click", () => {
  switchState();
});

window.addEventListener("keypress", checkKey);
```

{{EmbedLiveSample("customizing your media player", "", 200)}}

Để biết thêm thông tin, xem [Tạo trình phát audio tùy chỉnh của riêng bạn](/en-US/docs/Web/Media/Guides/Audio_and_video_delivery/Cross-browser_audio_basics#creating_your_own_custom_audio_player).

## Mẹo khác cho audio/video

### Dừng tải xuống media

Trong khi việc dừng phát media chỉ đơn giản là gọi phương thức `pause()` của phần tử, trình duyệt vẫn tiếp tục tải media cho đến khi phần tử media được giải phóng thông qua garbage collection.

Dưới đây là một mẹo giúp dừng tải xuống ngay lập tức:

```js
const mediaElement = document.querySelector("#myMediaElementID");
mediaElement.removeAttribute("src");
mediaElement.load();
```

Bằng cách xóa thuộc tính `src` của phần tử media và gọi phương thức `load()`, bạn giải phóng các tài nguyên liên quan đến video, từ đó dừng việc tải qua mạng. Bạn phải gọi `load()` sau khi xóa thuộc tính, vì chỉ xóa `src` thôi thì không kích hoạt thuật toán tải. Nếu phần tử `<video>` cũng có các phần tử con `<source>`, thì chúng cũng nên được xóa trước khi gọi `load()`.

Lưu ý rằng chỉ đặt thuộc tính `src` thành chuỗi rỗng thực ra sẽ khiến trình duyệt coi như bạn đang đặt nguồn video theo một đường dẫn tương đối. Điều này khiến trình duyệt cố tải thêm một thứ khác, rất có thể không phải là một video hợp lệ.

### Tua trong media

Các phần tử media hỗ trợ việc di chuyển vị trí phát hiện tại đến các điểm cụ thể trong nội dung media. Điều này được thực hiện bằng cách đặt giá trị cho thuộc tính `currentTime` của phần tử; xem {{ domxref("HTMLMediaElement") }} để biết thêm chi tiết về các thuộc tính của phần tử. Đặt giá trị này bằng thời gian, tính theo giây, tại đó bạn muốn việc phát tiếp tục.

Bạn có thể dùng thuộc tính `seekable` của phần tử để xác định các khoảng media hiện có thể tua tới. Thuộc tính này trả về một đối tượng {{ domxref("TimeRanges") }} liệt kê các khoảng thời gian mà bạn có thể tua đến.

```js
const mediaElement = document.querySelector("#mediaElementID");
mediaElement.seekable.start(0); // Trả về thời điểm bắt đầu (tính bằng giây)
mediaElement.seekable.end(0); // Trả về thời điểm kết thúc (tính bằng giây)
mediaElement.currentTime = 122; // Tua tới 122 giây
mediaElement.played.end(0); // Trả về số giây mà trình duyệt đã phát
```

### Chỉ định phạm vi phát lại

Khi chỉ định URI của media cho một phần tử {{ HTMLElement("audio") }} hoặc {{ HTMLElement("video") }}, bạn có thể tùy chọn thêm thông tin bổ sung để chỉ rõ phần media cần phát. Để làm điều đó, hãy thêm một dấu thăng ("#") rồi đến mô tả đoạn media.

Một khoảng thời gian được chỉ định theo cú pháp:

```plain
#t=[starttime][,endtime]
```

Thời gian có thể được chỉ định bằng số giây (dưới dạng giá trị dấu phẩy động) hoặc theo dạng giờ/phút/giây phân tách bằng dấu hai chấm (chẳng hạn 2:05:01 cho 2 giờ, 5 phút và 1 giây).

Một vài ví dụ:

- `http://example.com/video.ogv#t=10,20`
  - : Chỉ định rằng video nên phát từ giây 10 đến giây 20.
- `http://example.com/video.ogv#t=,10.5`
  - : Chỉ định rằng video nên phát từ đầu đến giây 10,5.
- `http://example.com/video.ogv#t=,02:00:00`
  - : Chỉ định rằng video nên phát từ đầu đến hai giờ.
- `http://example.com/video.ogv#t=60`
  - : Chỉ định rằng video nên bắt đầu phát tại giây 60 và chạy đến hết video.

## Xử lý lỗi

Các lỗi được gửi tới các phần tử con {{ HTMLElement("source") }} tương ứng với nguồn gây ra lỗi.

Điều này cho phép bạn phát hiện nguồn nào đã tải thất bại, có thể rất hữu ích. Hãy xem HTML sau:

```html
<video>
  <source
    id="src-mp4"
    src="video.mp4"
    type='video/mp4; codecs="avc1.42E01E, mp4a.40.2"' />
  <source
    id="src-3gp"
    src="video.3gp"
    type='video/3gpp; codecs="mp4v.20.8, samr"' />
  <source
    id="src-ogg"
    src="video.ogv"
    type='video/ogv; codecs="theora, vorbis"' />
</video>
```

Vì Firefox trên một số nền tảng không hỗ trợ MP4 và 3GP do các vấn đề bằng sáng chế, các phần tử {{ HTMLElement("source") }} có ID `src-mp4` và `src-3gp` sẽ nhận sự kiện `error` trước khi tài nguyên Ogg được tải. Các nguồn được thử theo đúng thứ tự chúng xuất hiện, và khi một nguồn tải thành công, các nguồn còn lại sẽ không được thử nữa.

### Kiểm tra xem trình duyệt có hỗ trợ các định dạng đã cung cấp hay không

Hỗ trợ cho các định dạng media có thể xem tại [Can I Use](https://caniuse.com/).

- [Audio MP3 (`type="audio/mpeg"`)](https://caniuse.com/mp3)
- [Audio Ogg (`type="audio/ogg"`)](https://caniuse.com/ogg-vorbis)
- [Video MP4 (`type="video/mp4"`)](https://caniuse.com/mpeg4)
- [Video WebM (`type="video/webm"`)](https://caniuse.com/webm)
- [Video Ogg (`type="video/ogg"`)](https://caniuse.com/ogv)

Bạn cũng có thể tìm kiếm [các định dạng media khác](/en-US/docs/Web/Media/Guides/Formats/Containers).

Nếu một định dạng media đáng lẽ được hỗ trợ nhưng các tệp bạn cung cấp lại không phát được, có hai khả năng:

#### 1. Máy chủ media không trả về đúng kiểu mime cho tệp

Mặc dù điều này thường đã được hỗ trợ, bạn có thể cần thêm phần sau vào tệp `.htaccess` của máy chủ media.

```plain
# AddType TYPE/SUBTYPE EXTENSION

AddType audio/mpeg mp3
AddType audio/mp4 m4a
AddType audio/ogg ogg
AddType audio/ogg oga

AddType video/mp4 mp4
AddType video/mp4 m4v
AddType video/ogg ogv
AddType video/webm webm
AddType video/webm webmv
```

#### 2. Các tệp của bạn đã được mã hóa không đúng

Các tệp của bạn có thể đã được mã hóa sai — hãy thử mã hóa bằng một trong các công cụ sau, vốn được chứng minh là khá tin cậy:

- [Audacity](https://sourceforge.net/projects/audacity/) — Trình chỉnh sửa và ghi âm miễn phí
- [Miro](https://www.getmiro.com/) — Trình phát nhạc và video mã nguồn mở miễn phí
- [Handbrake](https://handbrake.fr/) — Bộ chuyển mã video mã nguồn mở
- [Firefogg](https://www.firefogg.org/) — Mã hóa video và audio cho Firefox
- [FFmpeg2](https://www.ffmpeg.org/) — Bộ mã hóa dòng lệnh toàn diện
- [Vid.ly](https://m.vid.ly/) — Trình phát video, chuyển mã và phân phối
- [Internet Archive](https://archive.org/) — Dịch vụ chuyển mã và lưu trữ miễn phí

### Phát hiện khi không có nguồn nào được tải

Để phát hiện rằng tất cả các phần tử con {{ HTMLElement("source") }} đều đã tải thất bại, hãy kiểm tra giá trị của thuộc tính `networkState` của phần tử media. Nếu giá trị này là `HTMLMediaElement.NETWORK_NO_SOURCE`, bạn biết rằng tất cả các nguồn đều đã tải thất bại.

Nếu tại thời điểm đó bạn thêm một nguồn khác, bằng cách chèn thêm một phần tử {{ HTMLElement("source") }} mới làm con của phần tử media, Gecko sẽ cố gắng tải tài nguyên được chỉ định.

### Hiển thị nội dung dự phòng khi không có nguồn nào có thể giải mã

Một cách khác để hiển thị nội dung dự phòng của video khi không có nguồn nào có thể được giải mã trong trình duyệt hiện tại là gắn một trình xử lý lỗi vào phần tử nguồn cuối cùng. Sau đó bạn có thể thay thế video bằng nội dung dự phòng của nó:

```html
<video controls>
  <source src="dynamicsearch.mp4" type="video/mp4" />
  <a href="dynamicsearch.mp4">
    <img src="dynamicsearch.jpg" alt="Dynamic app search in Firefox OS" />
  </a>
  <p>Nhấn vào ảnh để phát bản demo video về tìm kiếm ứng dụng động</p>
</video>
```

```js
const v = document.querySelector("video");
const sources = v.querySelectorAll("source");
const lastSource = sources[sources.length - 1];
lastSource.addEventListener("error", (ev) => {
  const d = document.createElement("div");
  d.innerHTML = v.innerHTML;
  v.parentNode.replaceChild(d, v);
});
```

## Thư viện JavaScript cho audio/video

Có khá nhiều thư viện JavaScript cho audio và video. Các thư viện phổ biến nhất cho phép bạn chọn một thiết kế trình phát nhất quán trên mọi trình duyệt và cung cấp phương án dự phòng cho các trình duyệt không hỗ trợ audio và video nguyên bản. Các phương án dự phòng trong lịch sử thường dùng các plugin nay đã lỗi thời như Adobe Flash hoặc Microsoft Silverlight để cung cấp trình phát media trong những trình duyệt không hỗ trợ, dù những công nghệ này không còn được hỗ trợ trên máy tính hiện đại. Các chức năng khác như phần tử [`<track>`](/en-US/docs/Web/HTML/Reference/Elements/track) cho phụ đề cũng có thể được cung cấp thông qua các thư viện media.

### Chỉ audio

- [SoundManager](https://www.schillmania.com/projects/soundmanager2/)
- [AmplitudeJS](https://serversideup.net/open-source/amplitudejs/)
- [HowlerJS](https://howlerjs.com/)

### Chỉ video

- [flowplayer](https://flowplayer.com/): Miễn phí nhưng có watermark logo flowplayer. Mã nguồn mở (giấy phép GPL.)
- [SublimeVideo](https://www.sublimevideo.net/): Yêu cầu đăng ký. Thiết lập bằng biểu mẫu với liên kết riêng theo tên miền tới thư viện lưu trên CDN.
- [Video.js](https://videojs.org/): Miễn phí và mã nguồn mở (giấy phép Apache 2.)

### Audio và Video

- [jPlayer](https://jPlayer.org/): Miễn phí và mã nguồn mở (giấy phép MIT.)
- [mediaelement.js](https://www.mediaelementjs.com/): Miễn phí và mã nguồn mở (giấy phép MIT.)

### Web Audio API

- [AudioContext monkeypatch](https://github.com/cwilso/AudioContext-MonkeyPatch): Một polyfill cho các phiên bản cũ của Web Audio API; mã nguồn mở (giấy phép Apache 2.)

## Các hướng dẫn

- [Tạo một trình phát video đa trình duyệt](/en-US/docs/Web/Media/Guides/Audio_and_video_delivery/cross_browser_video_player)
  - : Hướng dẫn tạo một trình phát video HTML cơ bản hoạt động trên nhiều trình duyệt bằng phần tử {{ htmlelement("video") }}.
- [Cơ bản về tạo kiểu cho trình phát video](/en-US/docs/Web/Media/Guides/Audio_and_video_delivery/Video_player_styling_basics)
  - : Sau khi có trình phát video đa trình duyệt ở bài trước, bài này sẽ xem xét cách cung cấp một số kiểu dáng đáp ứng cơ bản cho trình phát.
- [Thêm chú thích và phụ đề vào video HTML](/en-US/docs/Web/Media/Guides/Audio_and_video_delivery/Adding_captions_and_subtitles_to_HTML5_video)
  - : Bài viết này giải thích cách thêm chú thích và phụ đề vào HTML {{ htmlelement("video") }}, bằng [Web_Video_Text_Tracks_Format](/en-US/docs/Web/API/WebVTT_API) và phần tử {{ htmlelement("track") }}.
- [Cơ bản về audio đa trình duyệt](/en-US/docs/Web/Media/Guides/Audio_and_video_delivery/Cross-browser_audio_basics)
  - : Bài viết này cung cấp hướng dẫn cơ bản để tạo một trình phát audio HTML hoạt động đa trình duyệt, với tất cả các thuộc tính, thuộc tính đối tượng và sự kiện liên quan được giải thích, cùng hướng dẫn nhanh về các điều khiển tùy chỉnh được tạo bằng Media API.
- [Media buffering, seeking, and time ranges](/en-US/docs/Web/Media/Guides/Audio_and_video_delivery/buffering_seeking_time_ranges)
  - : Đôi khi việc biết một phần {{ htmlelement("audio") }} hoặc {{ htmlelement("video") }} đã tải được bao nhiêu hay có thể phát ngay không rất hữu ích - ví dụ điển hình là thanh tiến trình đã tải của một trình phát audio hoặc video. Bài viết này bàn về cách xây dựng thanh buffer/seek bằng [TimeRanges](/en-US/docs/Web/API/TimeRanges) và các tính năng khác của media API.
- [Giải thích về HTML playbackRate](/en-US/docs/Web/Media/Guides/Audio_and_video_delivery/WebAudio_playbackRate_explained)
  - : Thuộc tính `playbackRate` cho phép chúng ta thay đổi tốc độ phát của một đoạn web audio hoặc video. Bài viết này giải thích chi tiết điều đó.
- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
  - : Giải thích những điều cơ bản về cách dùng Web Audio API để lấy, thao tác và phát lại một nguồn audio.

### Media phát trực tuyến

- [Phát trực tiếp audio và video trên web](/en-US/docs/Web/Media/Guides/Audio_and_video_delivery/Live_streaming_web_audio_and_video)
  - : Công nghệ phát trực tiếp thường được dùng để truyền tải các sự kiện trực tiếp như thể thao, hòa nhạc và nói chung là các chương trình TV và Radio được phát trực tiếp. Thường được rút gọn thành streaming, live streaming là quá trình truyền media "trực tiếp" tới máy tính và thiết bị. Đây là một chủ đề khá phức tạp và còn mới, với nhiều biến số, nên trong bài viết này chúng tôi sẽ giới thiệu cho bạn về chủ đề đó và cho biết cách để bắt đầu.
- [Thiết lập nguồn media cho adaptive streaming](/en-US/docs/Web/Media/Guides/Audio_and_video_delivery/Setting_up_adaptive_streaming_media_sources)
  - : Giả sử bạn muốn thiết lập một nguồn media adaptive streaming trên máy chủ để được tiêu thụ trong một phần tử media HTML. Bạn sẽ làm điều đó như thế nào? Bài viết này giải thích cách làm, xem xét hai định dạng phổ biến nhất: MPEG-DASH và HLS (HTTP Live Streaming.)
- [DASH Adaptive Streaming cho HTML 5 Video](/en-US/docs/Web/API/Media_Source_Extensions_API/DASH_Adaptive_Streaming)
  - : Mô tả cách thiết lập adaptive streaming bằng DASH và WebM.

### Chủ đề nâng cao

- [Hỗ trợ Web Audio API đa trình duyệt](/en-US/docs/Web/API/Web_Audio_API/Best_practices#cross_browser_legacy_support)
  - : Hướng dẫn viết mã Web Audio API hoạt động trên nhiều trình duyệt.
- [Thu âm audio dễ dàng với MediaRecorder API](https://hacks.mozilla.org/2014/06/easy-audio-capture-with-the-mediarecorder-api/)
  - : Giải thích những điều cơ bản khi dùng MediaStream Recording API để ghi trực tiếp một luồng media.

## Tham khảo

- [Phần tử video](/en-US/docs/Web/HTML/Reference/Elements/video)
- [HTMLVideoElement API](/en-US/docs/Web/API/HTMLVideoElement)
- [MediaSource API](/en-US/docs/Web/API/MediaSource)
