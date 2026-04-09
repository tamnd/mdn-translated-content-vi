---
title: Kiến thức cơ bản về âm thanh đa trình duyệt
slug: Web/Media/Guides/Audio_and_video_delivery/Cross-browser_audio_basics
page-type: guide
sidebar: mediasidebar
---

Bài viết này cung cấp:

- một hướng dẫn cơ bản để tạo trình phát âm thanh HTML đa trình duyệt với tất cả các thuộc tính, thuộc tính đối tượng và sự kiện liên quan được giải thích
- một hướng dẫn về các điều khiển tùy biến được tạo bằng Media API

## Ví dụ âm thanh cơ bản

Mã bên dưới là một ví dụ về cách triển khai âm thanh cơ bản bằng HTML5:

```html
<audio controls>
  <source src="audio-file.mp3" type="audio/mpeg" />
  <source src="audio-file.ogg" type="audio/ogg" />
  <!-- phương án dự phòng cho trình duyệt không hỗ trợ sẽ đặt ở đây -->
  <p>
    Trình duyệt của bạn không hỗ trợ HTML audio, nhưng bạn vẫn có thể
    <a href="audio-file.mp3">tải xuống bản nhạc</a>.
  </p>
</audio>
```

> [!NOTE]
> Bạn cũng có thể dùng tệp MP4 thay cho MP3. Tệp MP4 thường chứa âm thanh được mã hóa bằng [AAC](https://en.wikipedia.org/wiki/Advanced_Audio_Coding). Bạn có thể dùng `type="audio/mp4"`. (Hiện tại, các trình duyệt hỗ trợ mp3 cũng hỗ trợ âm thanh mp4).

- Ở đây chúng ta định nghĩa một phần tử {{ htmlelement("audio") }} với nhiều nguồn - chúng ta làm vậy vì không phải mọi trình duyệt đều hỗ trợ cùng một định dạng âm thanh. Để đảm bảo phạm vi hỗ trợ hợp lý, nên chỉ định ít nhất hai định dạng khác nhau. Hai định dạng cho độ phủ tốt nhất là mp3 và ogg vorbis.
- Chúng ta làm điều này bằng phần tử {{ htmlelement("source") }}, phần tử này nhận các thuộc tính `src` và `type`.
  - `src` chứa đường dẫn tới tệp âm thanh cần tải (tương đối hoặc tuyệt đối).
  - `type` dùng để thông báo cho trình duyệt biết loại tệp. Nếu bỏ qua, đa số trình duyệt sẽ cố đoán từ phần mở rộng tệp.

- Nếu phần tử {{ htmlelement("audio") }} không được hỗ trợ thì {{ htmlelement("audio") }} và {{ htmlelement("source") }} sẽ bị bỏ qua. Tuy nhiên, bất kỳ văn bản hay phần tử nào bạn định nghĩa bên trong {{ htmlelement("audio") }} vẫn sẽ được hiển thị hoặc thực thi. Vì vậy vị trí lý tưởng để tạo phương án dự phòng hoặc thông báo không tương thích là trước thẻ đóng `</audio>`. Trong trường hợp này, chúng ta cung cấp một đoạn văn bao gồm liên kết để tải trực tiếp âm thanh.
- Thuộc tính `controls` trên phần tử {{ htmlelement("audio") }} được chỉ định khi chúng ta muốn trình duyệt cung cấp các điều khiển phát mặc định. Nếu không chỉ định thuộc tính này, sẽ không có điều khiển nào xuất hiện - và thay vào đó bạn sẽ phải tự tạo điều khiển của riêng mình và lập trình chức năng bằng Media API (xem bên dưới). Tuy nhiên, đó có thể là một cách tiếp cận tốt, vì các điều khiển mặc định trông khác nhau giữa các trình duyệt. Do đó, tự tạo điều khiển đảm bảo giao diện nhất quán trên mọi trình duyệt.

## Chi tiết về âm thanh HTML

Bây giờ chúng ta đã xem ví dụ cơ bản, hãy tìm hiểu chi tiết hơn về các khía cạnh khác nhau của âm thanh HTML.

### Các thuộc tính HTML của âm thanh

Chúng ta có thể chỉ định một số thuộc tính với phần tử audio để xác định thêm cách âm thanh được khởi tạo.

#### autoplay

Chỉ định `autoplay` sẽ khiến âm thanh bắt đầu phát càng sớm càng tốt và không cần tương tác của người dùng - nói ngắn gọn, âm thanh sẽ tự phát.

```html
<audio autoplay>…</audio>
```

> [!NOTE]
> Giá trị này thường bị bỏ qua trên nền tảng di động, và không nên dùng trừ khi thực sự cần thiết. Việc tự phát âm thanh (và video) thường gây khó chịu. Ngoài ra, trình duyệt có các chính sách sẽ chặn hoàn toàn autoplay trong nhiều trường hợp. Xem [Hướng dẫn autoplay cho media và Web Audio APIs](/en-US/docs/Web/Media/Guides/Autoplay) để biết chi tiết.

#### loop

Thuộc tính `loop` sẽ đảm bảo rằng khi phát đến cuối clip âm thanh, clip đó sẽ quay lại đầu và bắt đầu phát lại từ đầu.

```html
<audio loop>…</audio>
```

#### muted

Nếu bạn muốn âm thanh bắt đầu ở trạng thái tắt tiếng, hãy thêm thuộc tính `muted`.

```html
<audio muted>…</audio>
```

> [!NOTE]
> Giá trị này thường bị bỏ qua trên nền tảng di động.

#### preload

Thuộc tính `preload` cho phép bạn chỉ định mức ưu tiên cho cách trình duyệt tải trước âm thanh, nói cách khác là phần nào của tệp mà nó sẽ tải khi phần tử {{ htmlelement("audio") }} được khởi tạo, và trước khi nút phát được nhấn.

`preload` có thể nhận 3 giá trị khác nhau:

1. `none`: Không tải gì trước khi nút phát được nhấn.
2. `metadata`: Tải siêu dữ liệu của âm thanh; đây thường là lựa chọn tốt nhất, vì nó cho phép bạn truy cập và hiển thị thông tin như độ dài âm thanh, đồng thời giúp trình duyệt xác định tệp âm thanh nào nên dùng.
3. `auto`: Tải toàn bộ tệp âm thanh càng sớm càng tốt. Đây nhìn chung không phải là lựa chọn tốt trừ khi bạn chắc chắn người dùng có kết nối mạng nhanh.

> [!NOTE]
> Giá trị này thường bị bỏ qua trên nền tảng di động.

```html
<audio preload="auto">…</audio>
```

#### controls

Chúng ta chỉ định thuộc tính `controls` khi muốn trình duyệt cung cấp các điều khiển phát mặc định cho mình.

```html
<audio controls>…</audio>
```

#### src

Như đã nói ở trên, bạn có thể dùng phần tử {{ htmlelement("source") }} để chỉ định một hoặc nhiều tệp âm thanh nguồn. Ngoài ra, bạn cũng có thể đặt trực tiếp thuộc tính `src` trên phần tử {{ htmlelement("audio") }} để chỉ định một nguồn duy nhất.

```html
<audio src="audio-file.mp3">…</audio>
```

#### type

Như đã nói ở trên, để chắc chắn trình duyệt biết loại tệp nào đang được chỉ định, tốt nhất nên khai báo thêm thuộc tính `type` cùng với `src`. Thuộc tính `type` chỉ định MIME type hoặc Internet Media Type của tệp.

```html
<audio src="audio-file.mp3" type="audio/mpeg">…</audio>
```

### Thao tác với phần tử Audio bằng JavaScript

Ngoài việc có thể chỉ định các thuộc tính khác nhau trong HTML, phần tử {{ htmlelement("audio") }} còn đi kèm với một số thuộc tính đối tượng và phương thức mà bạn có thể thao tác bằng JavaScript.

Với HTML sau:

```html
<audio id="my-audio" src="audio-file.mp3">…</audio>
```

Bạn có thể lấy phần tử {{htmlelement("audio") }} như sau:

```js
const audio = document.getElementById("my-audio");
```

Ngoài ra, bạn có thể tạo một phần tử mới. Đây là ví dụ tạo một phần tử {{ htmlelement("audio") }}, đặt media sẽ phát, phát và tạm dừng, rồi phát từ giây thứ 5 của âm thanh:

```js
const audio = document.createElement("audio");

if (audio.canPlayType("audio/mpeg")) {
  audio.setAttribute("src", "audio-file.mp3");
}

if (audio.canPlayType("audio/ogg")) {
  audio.setAttribute("src", "audio-file.ogg");
}

alert("play");

audio.play();

alert("stop");

audio.pause();

alert("play from 5 seconds in");

audio.currentTime = 5;
audio.play();
```

Hãy cùng tìm hiểu chi tiết hơn các thuộc tính và phương thức có sẵn.

#### play

Phương thức `play()` dùng để yêu cầu âm thanh phát. Nó không nhận tham số nào.

```js
audio.play();
```

#### pause

Phương thức `pause()` dùng để yêu cầu âm thanh tạm dừng. Nó không nhận tham số nào.

```js
audio.pause();
```

> [!NOTE]
> Không có phương thức dừng - để triển khai chức năng dừng, bạn phải tạm dừng media rồi đặt giá trị thuộc tính [`currentTime`](#currenttime) về 0.

#### canPlayType

Phương thức `canPlayType()` hỏi trình duyệt xem một loại tệp âm thanh nhất định có được hỗ trợ không. Nó nhận MIME type của loại cần kiểm tra làm tham số.

```js
if (audio.canPlayType("audio/mpeg")) {
  // Được hỗ trợ.
  // Làm gì đó ở đây!
}
```

`canPlayType()` trả về một trong ba giá trị:

1. `probably`
2. `maybe`
3. "" (một chuỗi rỗng)

Trong thực tế, chúng ta thường kiểm tra xem kết quả là đúng hay sai. Chuỗi không rỗng được coi là đúng.

> [!NOTE]
> Một bản đặc tả rất sớm quy định rằng trình duyệt phải trả về `no` thay vì chuỗi rỗng, nhưng may mắn là số người còn dùng trình duyệt cũ triển khai phiên bản đặc tả đó rất ít.

#### currentTime

Thuộc tính `currentTime` lấy hoặc đặt thời điểm hiện tại mà âm thanh nên phát tại đó. Điều này hữu ích ở nhiều trường hợp, ví dụ vì `play()` không nhận tham số nên nếu không muốn phát từ 0, chúng ta phải đặt riêng vị trí phát.

Giá trị của `currentTime` là một số biểu thị thời gian tính bằng giây.

```js
if (audio.currentTime > 5) {
  audio.currentTime = 3;
}
```

#### volume

Thuộc tính `volume` cho phép chúng ta đặt âm lượng âm thanh, dưới dạng một số từ 0 đến 1.

```js
// đặt âm lượng ở mức 50%
audio.volume = 0.5;
```

## Tạo trình phát âm thanh tùy biến của riêng bạn

Media API của JavaScript cho phép bạn tạo trình phát tùy biến của riêng mình. Hãy xem một ví dụ rất tối giản. Chúng ta có thể kết hợp HTML và JavaScript để tạo trình phát với một nút phát và một nút tạm dừng. Trước hết, chúng ta sẽ thiết lập audio trong HTML, không dùng thuộc tính `controls`, vì chúng ta đang tự tạo điều khiển:

```html
<audio id="my-audio">
  <source src="audio-file.mp3" type="audio/mpeg" />
  <source src="audio-file.ogg" type="audio/ogg" />
  <!-- đặt phương án dự phòng ở đây vì các trình duyệt hỗ trợ <audio> sẽ bỏ qua nó -->
  <p>Tải xuống<a href="audio-file.mp3">audio-file.mp3</a></p>
</audio>

<!-- các nút phát và tạm dừng tùy biến -->
<button id="play">phát</button>
<button id="pause">tạm dừng</button>
```

Tiếp theo, chúng ta gắn một số chức năng cho trình phát bằng JavaScript:

```js
const audio = document.getElementById("my-audio");
const play = document.getElementById("play");
const pause = document.getElementById("pause");

// liên kết các hàm với sự kiện 'onclick'
play.onclick = playAudio;
pause.onclick = pauseAudio;

function playAudio() {
  audio.play();
}

function pauseAudio() {
  audio.pause();
}
```

## Sự kiện tải media

Ở trên chúng ta đã chỉ cách tạo trình phát âm thanh, nhưng nếu muốn hiển thị tiến trình, trạng thái đệm, và chỉ kích hoạt các nút khi media sẵn sàng phát thì sao? May mắn là có một số sự kiện chúng ta có thể dùng để biết chính xác điều gì đang xảy ra.

Trước hết, hãy xem quy trình tải media theo thứ tự:

### loadstart

Sự kiện `loadstart` cho chúng ta biết quá trình tải đã bắt đầu và trình duyệt đang kết nối với media.

```js
audio.addEventListener("loadstart", () => {
  // Đang lấy tệp
});
```

### durationchange

Nếu bạn chỉ muốn biết ngay khi thời lượng media được xác định, đây là sự kiện dành cho bạn. Điều này hữu ích vì giá trị ban đầu của duration là `NaN` (Not a Number), điều mà có lẽ bạn không muốn hiển thị cho người dùng.

```js
audio.addEventListener("durationchange", () => {
  // Bạn có thể hiển thị thời lượng lúc này
});
```

### loadedmetadata

Siêu dữ liệu không chỉ gồm thời lượng - nếu bạn muốn chờ toàn bộ siêu dữ liệu tải xong rồi mới làm gì đó, bạn có thể bắt sự kiện `loadedmetadata`.

```js
audio.addEventListener("loadedmetadata", () => {
  // Bạn có thể hiển thị thời lượng lúc này
});
```

### loadeddata

Sự kiện `loadeddata` được kích hoạt khi phần đầu tiên của media được tải đến. Vị trí phát đã sẵn sàng nhưng chưa hẳn đã phát ngay được.

```js
audio.addEventListener("loadeddata", () => {
  // Bạn có thể hiển thị vị trí phát lúc này
});
```

### progress

Sự kiện `progress` cho biết việc tải media vẫn đang diễn ra. Đây là thời điểm tốt để hiển thị một dạng "trình tải".

```js
audio.addEventListener("progress", () => {
  // bạn có thể cho người dùng biết media đang được tải xuống
});
```

### canplay

`canplay` là một sự kiện hữu ích để phát hiện xem media đã sẵn sàng phát hay chưa. Ví dụ, bạn có thể vô hiệu hóa các điều khiển tùy biến cho đến khi sự kiện này xảy ra.

```js
audio.addEventListener("canplay", () => {
  // Âm thanh đã sẵn sàng phát
});
```

### canplaythrough

`canplaythrough` tương tự `canplay` nhưng cho biết media đã sẵn sàng để phát hết từ đầu đến cuối (tức là tệp đã tải xong hoàn toàn, hoặc được ước tính rằng nó sẽ tải kịp để không xảy ra dừng vì đệm).

```js
audio.addEventListener("canplaythrough", () => {
  // Âm thanh đã sẵn sàng phát hết từ đầu đến cuối
});
```

### Thứ tự các sự kiện tải media

Tóm lại, thứ tự của các sự kiện tải media là:

`loadstart` > `durationchange` > `loadedmetadata` > `loadeddata` > `progress` > `canplay` > `canplaythrough`

### Các sự kiện gián đoạn tải

Chúng ta cũng có một số sự kiện sẽ kích hoạt khi có gián đoạn nào đó trong quá trình tải media.

- suspend
  - : Dữ liệu media không còn được lấy nữa mặc dù tệp chưa được tải xong hoàn toàn.
- abort
  - : Việc tải dữ liệu media đã bị hủy nhưng không phải do lỗi.
- error
  - : Gặp lỗi trong khi dữ liệu media đang được tải xuống.
- emptied
  - : Bộ đệm media đã bị làm trống, có thể do lỗi hoặc do phương thức load() được gọi để tải lại.
- stalled
  - : Dữ liệu media đột nhiên không còn sẵn có.

## Sự kiện phát media

Chúng ta cũng có một bộ sự kiện khác hữu ích để phản ứng với trạng thái phát media.

### timeupdate

Sự kiện `timeupdate` được kích hoạt mỗi lần thuộc tính `currentTime` thay đổi. Trên thực tế, điều này xảy ra mỗi 250 mili giây. Sự kiện này có thể dùng để kích hoạt việc hiển thị tiến trình phát.

```js
audio.addEventListener("timeupdate", () => {
  // Cập nhật một thứ gì đó liên quan đến tiến trình phát
});
```

### playing

Sự kiện `playing` được khởi tạo khi phát đã sẵn sàng bắt đầu sau khi từng bị tạm dừng vì thiếu dữ liệu media.

### waiting

Sự kiện `waiting` được kích hoạt khi phát đã dừng do thiếu dữ liệu media, mặc dù dự kiến sẽ tiếp tục khi dữ liệu khả dụng trở lại.

### play

Sự kiện `play` được khởi tạo sau khi phương thức `play()` trả về hoặc khi thuộc tính `autoplay` khiến việc phát bắt đầu. Đây là lúc trạng thái media chuyển từ tạm dừng sang đang phát.

### pause

Sự kiện `pause` được kích hoạt sau khi phương thức `pause()` trả về. Đây là lúc trạng thái chuyển từ đang phát sang tạm dừng.

### ended

Sự kiện `ended` được khởi tạo khi media đi đến cuối.

```js
audio.addEventListener("ended", () => {
  // Làm gì đó khi bản âm thanh phát xong
});
```

### volumechange

Sự kiện `volumechange` cho biết âm lượng đã thay đổi; điều đó bao gồm cả việc bị tắt tiếng.

## Một trình phát âm thanh có phản hồi

Hãy xem đoạn HTML này:

```html
<audio id="my-audio">
  <source
    src="http://jPlayer.org/audio/mp3/Miaow-07-Bubble.mp3"
    type="audio/mpeg" />
  <source
    src="http://jPlayer.org/audio/ogg/Miaow-07-Bubble.ogg"
    type="audio/ogg" />
  <!-- đặt phương án dự phòng ở đây vì các trình duyệt hỗ trợ <audio> sẽ bỏ qua nó -->
  <a href="audio-file.mp3">audio-file.mp3</a>
</audio>

<div id="controls">
  <span id="loading">đang tải</span>
  <button id="play">phát</button>
  <button id="pause">tạm dừng</button>
</div>
<div id="progress">
  <div id="bar"></div>
</div>
```

Được tạo kiểu như sau:

```css
#controls {
  width: 80px;
  float: left;
}

#progress {
  margin-left: 80px;
  border: 1px solid black;
}

#bar {
  height: 20px;
  background-color: green;
  width: 0;
}

#play,
#pause {
  display: none; /* ẩn cho đến khi media sẵn sàng */
}
```

Bây giờ hãy nối nó với JavaScript:

```js
const audio = document.getElementById("my-audio");
const play = document.getElementById("play");
const pause = document.getElementById("pause");
const loading = document.getElementById("loading");
const bar = document.getElementById("bar");

function displayControls() {
  loading.style.display = "none";
  play.style.display = "block";
}

// Kiểm tra media đã sẵn sàng trước khi hiển thị điều khiển
if (audio.paused) {
  displayControls();
} else {
  // chưa sẵn sàng - chờ sự kiện canplay
  audio.addEventListener("canplay", () => {
    displayControls();
  });
}

play.addEventListener("click", () => {
  audio.play();
  play.style.display = "none";
  pause.style.display = "block";
});

pause.addEventListener("click", () => {
  audio.pause();
  pause.style.display = "none";
  play.style.display = "block";
});

// Hiển thị tiến trình
audio.addEventListener("timeupdate", () => {
  // Đặt phần trăm
  bar.style.width = `${Math.floor(
    (audio.currentTime / audio.duration) * 100,
  )}%`;
});
```

Bạn sẽ thu được thứ gì đó giống như thế này:

![Một trình phát âm thanh cơ bản với nút phát/tạm dừng và thanh tua](simpleplayer.png)

### Tua bằng thanh tua

Đây là một khởi đầu tốt, nhưng sẽ tuyệt hơn nếu có thể điều hướng âm thanh bằng thanh tiến trình. May mắn là điều này không quá khó để triển khai.

Trước hết, chúng ta cập nhật nhanh CSS của thanh tiến trình để hiển thị con trỏ dạng bàn tay khi rê chuột:

```css
#progress {
  margin-left: 80px;
  border: 1px solid black;
  cursor: pointer;
}
```

Sau đó chúng ta thêm mã phát hiện cú nhấp và di chuyển "playhead" đến vị trí chính xác:

```js
const progress = document.getElementById("progress");

progress.addEventListener("click", (e) => {
  // Tính vị trí chuẩn hóa của điểm nhấp
  const clickPosition = (e.pageX - progress.offsetLeft) / progress.offsetWidth;
  const clickTime = clickPosition * audio.duration;

  // Di chuyển playhead đến vị trí đúng
  audio.currentTime = clickTime;
});
```

### Đệm

Được rồi, chúng ta đang tiến gần đến mục tiêu, nhưng còn một thông tin hữu ích khác có thể hiển thị: lượng âm thanh đã được đệm hoặc tải xuống trước.

Có một vài thuộc tính chúng ta chưa xem tới, `buffered` và `seekable`.

#### buffered

Thuộc tính này cho chúng ta biết những phần nào của âm thanh đã được đệm (tải xuống trước). Nó trả về một đối tượng gọi là `TimeRanges`.

```js
bufferedTimeRanges = audio.buffered;
```

#### seekable

Thuộc tính seekable cho biết bạn có thể nhảy trực tiếp tới phần media đó mà không cần đệm thêm hay không.

```js
seekableTimeRanges = audio.seekable;
```

#### Các sự kiện về đệm

Cũng có một vài sự kiện liên quan đến đệm:

- `seeking`
  - : Sự kiện `seeking` được kích hoạt khi media đang được tìm vị trí.
- `seeked`
  - : `seeked` xảy ra khi thuộc tính `seeking` chuyển sang `false`.

> [!NOTE]
> Bạn có thể đọc thêm về [Buffering, Seeking and Time Ranges](/en-US/docs/Web/Media/Guides/Audio_and_video_delivery/buffering_seeking_time_ranges) ở nơi khác.

## Xem thêm

- [Buffering, Seeking and Time Ranges](/en-US/docs/Web/Media/Guides/Audio_and_video_delivery/buffering_seeking_time_ranges)
- [Sự kiện HTMLMediaElement](/en-US/docs/Web/API/HTMLMediaElement#events)
- [Tham chiếu sự kiện > Media](/en-US/docs/Web/API/Document_Object_Model/Events#media)
- [HTML video and audio](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_video_and_audio)
- [Tạo trình phát video đa trình duyệt](/en-US/docs/Web/Media/Guides/Audio_and_video_delivery/cross_browser_video_player)
- [jPlayer](https://jplayer.org/): Thư viện âm thanh và video mã nguồn mở cho jQuery và Zepto.
