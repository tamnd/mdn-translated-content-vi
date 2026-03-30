---
title: Đa phương tiện dễ tiếp cận
slug: Learn_web_development/Core/Accessibility/Multimedia
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Accessibility/Test_your_skills/WAI-ARIA","Learn_web_development/Core/Accessibility/Mobile", "Learn_web_development/Core/Accessibility")}}

Một loại nội dung khác có thể tạo ra các vấn đề về khả năng tiếp cận là đa phương tiện. Nội dung video, âm thanh và hình ảnh cần được cung cấp các phương án thay thế bằng văn bản phù hợp để các công nghệ hỗ trợ và người dùng của chúng có thể hiểu được. Bài viết này chỉ ra cách thực hiện.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>Quen thuộc với <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a>, <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">CSS</a>, và các thực hành tốt nhất về khả năng tiếp cận như đã được dạy trong các bài học trước của mô-đun.</a>.</td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Các vấn đề với trình phát đa phương tiện gốc, và cách tạo các trình phát tùy chỉnh.</li>
          <li>Mục đích của bản ghi âm thanh và các đường dẫn văn bản (phụ đề, chú thích, v.v.) trong việc làm cho nội dung âm thanh và video dễ tiếp cận.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Đa phương tiện và khả năng tiếp cận

Cho đến nay trong mô-đun này, chúng ta đã xem xét nhiều loại nội dung khác nhau và những gì cần làm để đảm bảo khả năng tiếp cận của chúng, từ nội dung văn bản đơn giản đến bảng dữ liệu, hình ảnh, các điều khiển gốc như phần tử form và nút, và thậm chí các cấu trúc đánh dấu phức tạp hơn (với các thuộc tính [WAI-ARIA](/en-US/docs/Learn_web_development/Core/Accessibility/WAI-ARIA_basics)).

Bài viết này, mặt khác, xem xét một lớp nội dung chung khác mà có lẽ không dễ đảm bảo khả năng tiếp cận — đa phương tiện. Hình ảnh, đường dẫn âm thanh, video, các phần tử {{htmlelement("canvas")}}, v.v., không được các trình đọc màn hình hiểu dễ dàng hoặc được điều hướng bằng bàn phím, và chúng ta cần cung cấp cho chúng sự hỗ trợ cần thiết.

Nhưng đừng nản lòng — ở đây chúng ta sẽ giúp bạn khám phá các kỹ thuật có sẵn để làm cho đa phương tiện dễ tiếp cận hơn.

## Hình ảnh đơn giản

Chúng ta đã đề cập đến các phương án thay thế văn bản đơn giản cho hình ảnh HTML trong bài viết [HTML: Nền tảng tốt cho khả năng tiếp cận](/en-US/docs/Learn_web_development/Core/Accessibility/HTML) — bạn có thể tham khảo lại đó để biết chi tiết đầy đủ. Tóm lại, bạn nên đảm bảo rằng nội dung trực quan có sẵn văn bản thay thế để các trình đọc màn hình có thể đọc cho người dùng của họ.

Ví dụ:

```html
<img
  src="dinosaur.png"
  alt="A red Tyrannosaurus Rex: A two legged dinosaur standing upright like a human, with small arms, and a large head with lots of sharp teeth." />
```

## Điều khiển âm thanh và video dễ tiếp cận

Triển khai các điều khiển cho âm thanh/video trên web không phải là vấn đề, phải không? Hãy cùng tìm hiểu.

### Vấn đề với các điều khiển HTML gốc

Các phiên bản video và audio HTML thậm chí có một bộ điều khiển tích hợp cho phép bạn điều khiển phương tiện ngay lập tức. Ví dụ (xem `native-controls.html` [mã nguồn](https://github.com/mdn/learning-area/blob/main/accessibility/multimedia/native-controls.html) và [trực tiếp](https://mdn.github.io/learning-area/accessibility/multimedia/native-controls.html)):

```html
<audio controls>
  <source src="viper.mp3" type="audio/mp3" />
  <source src="viper.ogg" type="audio/ogg" />
  <p>
    Your browser doesn't support HTML audio. Here is a
    <a href="viper.mp3">link to the audio</a> instead.
  </p>
</audio>

<br />

<video controls>
  <source src="rabbit320.mp4" type="video/mp4" />
  <source src="rabbit320.webm" type="video/webm" />
  <p>
    Your browser doesn't support HTML video. Here is a
    <a href="rabbit320.mp4">link to the video</a> instead.
  </p>
</video>
```

Thuộc tính controls cung cấp các nút phát/tạm dừng, thanh tìm kiếm, v.v. — các điều khiển cơ bản mà bạn mong đợi từ một trình phát đa phương tiện. Nó trông như thế này trong Firefox và Chrome:

![Ảnh chụp màn hình Điều khiển Video trong Firefox](native-controls-firefox.png)

![Ảnh chụp màn hình Điều khiển Video trong Chrome](native-controls-chrome.png)

Tuy nhiên, có những vấn đề với các điều khiển này:

- Chúng không thể điều hướng bằng bàn phím trong hầu hết các trình duyệt, nghĩa là bạn không thể tab giữa các điều khiển bên trong trình phát gốc. Opera và Chrome cung cấp điều này ở một mức độ nhất định, nhưng vẫn chưa lý tưởng.
- Các trình duyệt khác nhau cung cấp cho các điều khiển gốc kiểu dáng và chức năng khác nhau, và chúng không thể được tạo kiểu, có nghĩa là chúng không thể dễ dàng được làm theo hướng dẫn kiểu dáng của trang web.

Để khắc phục điều này, chúng ta có thể tạo các điều khiển tùy chỉnh của riêng mình. Hãy xem cách thực hiện.

### Tạo điều khiển âm thanh và video tùy chỉnh

HTML video và audio chia sẻ một API — HTML Media Element — cho phép bạn ánh xạ chức năng tùy chỉnh vào các nút và các điều khiển khác — cả hai đều do bạn tự định nghĩa.

Hãy lấy ví dụ video ở trên và thêm các điều khiển tùy chỉnh vào chúng.

#### Thiết lập cơ bản

Đầu tiên, hãy lấy bản sao của các tệp [custom-controls-start.html](https://github.com/mdn/learning-area/blob/main/accessibility/multimedia/custom-controls-start.html), [custom-controls.css](https://github.com/mdn/learning-area/blob/main/accessibility/multimedia/custom-controls.css), [rabbit320.mp4](https://raw.githubusercontent.com/mdn/learning-area/master/accessibility/multimedia/rabbit320.mp4), và [rabbit320.webm](https://raw.githubusercontent.com/mdn/learning-area/master/accessibility/multimedia/rabbit320.webm) và lưu chúng vào một thư mục mới trên ổ cứng của bạn.

Tạo một tệp mới có tên main.js và lưu nó vào cùng thư mục.

Trước tiên, hãy xem HTML cho trình phát video, trong HTML:

```html
<section class="player">
  <video controls>
    <source src="rabbit320.mp4" type="video/mp4" />
    <source src="rabbit320.webm" type="video/webm" />
    <p>
      Your browser doesn't support HTML video. Here is a
      <a href="rabbit320.mp4">link to the video</a> instead.
    </p>
  </video>

  <div class="controls">
    <button class="play-pause">Play</button>
    <button class="stop">Stop</button>
    <button class="rwd">Rwd</button>
    <button class="fwd">Fwd</button>
    <div class="time">00:00</div>
  </div>
</section>
```

#### Thiết lập cơ bản JavaScript

Chúng ta đã chèn một số nút điều khiển đơn giản bên dưới video của mình. Các điều khiển này tất nhiên sẽ không làm gì theo mặc định; để thêm chức năng, chúng ta sẽ sử dụng JavaScript.

Đầu tiên chúng ta cần lưu trữ tham chiếu đến từng điều khiển — thêm phần sau vào đầu tệp JavaScript của bạn:

```js
const playPauseBtn = document.querySelector(".play-pause");
const stopBtn = document.querySelector(".stop");
const rwdBtn = document.querySelector(".rwd");
const fwdBtn = document.querySelector(".fwd");
const timeLabel = document.querySelector(".time");
```

Tiếp theo, chúng ta cần lấy tham chiếu đến chính trình phát video/audio — thêm dòng này bên dưới các dòng trước:

```js
const player = document.querySelector("video");
```

Điều này giữ tham chiếu đến một đối tượng {{domxref("HTMLMediaElement")}}, có một số thuộc tính và phương thức hữu ích có thể được sử dụng để kết nối chức năng với các nút của chúng ta.

Trước khi tiến hành tạo chức năng nút, hãy xóa các điều khiển gốc để chúng không can thiệp vào các điều khiển tùy chỉnh của chúng ta. Thêm phần sau, một lần nữa ở cuối JavaScript của bạn:

```js
player.removeAttribute("controls");
```

Làm theo cách này thay vì chỉ không bao gồm thuộc tính controls ngay từ đầu có ưu điểm là nếu JavaScript của chúng ta thất bại vì bất kỳ lý do gì, người dùng vẫn có một số điều khiển có sẵn.

#### Kết nối các nút của chúng ta

Đầu tiên, hãy thiết lập nút phát/tạm dừng. Chúng ta có thể làm cho nó chuyển đổi giữa phát và tạm dừng với một hàm điều kiện đơn giản, như sau. Thêm nó vào code của bạn, ở cuối:

```js
playPauseBtn.onclick = () => {
  if (player.paused) {
    player.play();
    playPauseBtn.textContent = "Pause";
  } else {
    player.pause();
    playPauseBtn.textContent = "Play";
  }
};
```

Tiếp theo, thêm code này vào cuối, kiểm soát nút dừng:

```js
stopBtn.onclick = () => {
  player.pause();
  player.currentTime = 0;
  playPauseBtn.textContent = "Play";
};
```

Không có hàm `stop()` nào có sẵn trên {{domxref("HTMLMediaElement")}}, vì vậy thay vào đó chúng ta `pause()` nó, và đồng thời đặt `currentTime` về 0.

Tiếp theo, các nút tua lại và tua nhanh — thêm các khối sau vào cuối code của bạn:

```js
rwdBtn.onclick = () => {
  player.currentTime -= 3;
};

fwdBtn.onclick = () => {
  player.currentTime += 3;
  if (player.currentTime >= player.duration || player.paused) {
    player.pause();
    player.currentTime = 0;
    playPauseBtn.textContent = "Play";
  }
};
```

Những điều này rất đơn giản, chỉ cộng hoặc trừ 3 giây vào `currentTime` mỗi khi chúng được nhấp. Trong một trình phát video thực, bạn có thể muốn một thanh tìm kiếm phức tạp hơn, hoặc tương tự.

Lưu ý rằng chúng ta cũng kiểm tra xem `currentTime` có lớn hơn tổng `duration` của phương tiện hay không, hoặc nếu phương tiện không đang phát khi `fwdBtn` được nhấn. Nếu một trong hai điều kiện là đúng, chúng ta dừng video để tránh giao diện người dùng bị lỗi nếu họ cố tua nhanh khi video không đang phát hoặc tua nhanh qua cuối video.

Cuối cùng, thêm phần sau vào cuối code, để điều khiển hiển thị thời gian đã trôi qua:

```js
player.ontimeupdate = () => {
  const minutes = Math.floor(player.currentTime / 60);
  const seconds = Math.floor(player.currentTime - minutes * 60);
  const minuteValue = minutes < 10 ? `0${minutes}` : minutes;
  const secondValue = seconds < 10 ? `0${seconds}` : seconds;

  const mediaTime = `${minuteValue}:${secondValue}`;
  timeLabel.textContent = mediaTime;
};
```

Mỗi khi thời gian cập nhật (một lần mỗi giây), chúng ta kích hoạt hàm này. Nó tính số phút và giây từ giá trị currentTime đã cho (tính bằng giây), thêm số 0 đứng đầu nếu giá trị phút hoặc giây nhỏ hơn 10, và sau đó tạo hiển thị và thêm nó vào nhãn thời gian.

#### Đọc thêm

Điều này cho bạn ý tưởng cơ bản về cách thêm chức năng trình phát tùy chỉnh vào các phiên bản trình phát video/audio. Để biết thêm thông tin về cách thêm các tính năng phức tạp hơn vào trình phát video/audio, xem:

- [Phân phối âm thanh và video](/en-US/docs/Web/Media/Guides/Audio_and_video_delivery)
- [Kiến thức cơ bản về tạo kiểu cho trình phát video](/en-US/docs/Web/Media/Guides/Audio_and_video_delivery/Video_player_styling_basics)
- [Tạo trình phát video đa trình duyệt](/en-US/docs/Web/Media/Guides/Audio_and_video_delivery/cross_browser_video_player)

Chúng ta cũng đã tạo một ví dụ nâng cao để chỉ ra cách bạn có thể tạo hệ thống hướng đối tượng tìm mọi trình phát video và audio trên trang (dù có bao nhiêu) và thêm các điều khiển tùy chỉnh của chúng ta vào đó. Xem [custom-controls-oojs](https://mdn.github.io/learning-area/accessibility/multimedia/custom-controls-OOJS/) (cũng xem [mã nguồn](https://github.com/mdn/learning-area/tree/main/accessibility/multimedia/custom-controls-OOJS)).

## Bản ghi âm thanh

Để cung cấp cho người điếc quyền truy cập vào nội dung âm thanh, bạn cần tạo bản ghi văn bản. Chúng có thể được bao gồm trên cùng trang với âm thanh theo cách nào đó hoặc được bao gồm trên một trang riêng biệt và liên kết đến.

Về thực tế tạo bản ghi, các lựa chọn của bạn là:

- Dịch vụ thương mại — Bạn có thể trả tiền cho chuyên gia để thực hiện việc ghi chép lại, xem ví dụ các công ty như [Scribie](https://scribie.com/), [Casting Words](https://castingwords.com/), hoặc [Rev](https://www.rev.com/). Hãy tìm hiểu và hỏi ý kiến để đảm bảo bạn tìm được công ty uy tín mà bạn có thể làm việc hiệu quả.
- Cộng đồng/tự phát/tự ghi — Nếu bạn là một phần của cộng đồng tích cực hoặc nhóm tại nơi làm việc, thì bạn có thể nhờ họ giúp thực hiện bản dịch. Bạn thậm chí có thể thử tự làm.
- Dịch vụ tự động — Có các dịch vụ AI có sẵn, như [Trint](https://trint.com/) hoặc [Transcribear](https://transcribear.com/). Tải lên tệp video/audio lên trang web, và nó sẽ tự động ghi lại cho bạn. Trên YouTube, bạn có thể chọn tạo phụ đề/bản ghi tự động. Tùy thuộc vào độ rõ ràng của âm thanh được nói, chất lượng bản ghi kết quả sẽ thay đổi đáng kể.

Như với hầu hết mọi thứ trong cuộc sống, bạn có xu hướng nhận được những gì bạn trả; các dịch vụ khác nhau sẽ có độ chính xác và thời gian tạo bản ghi khác nhau. Nếu bạn trả tiền cho một công ty uy tín hoặc dịch vụ AI để thực hiện việc ghi chép, bạn có thể sẽ hoàn thành nhanh chóng và với chất lượng cao. Nếu bạn không muốn trả tiền, bạn có thể nhận được với chất lượng thấp hơn và/hoặc chậm hơn.

Không ổn khi xuất bản tài nguyên âm thanh nhưng hứa hẹn sẽ xuất bản bản ghi sau — những lời hứa như vậy thường không được giữ, điều này sẽ làm xói mòn lòng tin giữa bạn và người dùng của bạn. Nếu âm thanh bạn đang trình bày là gì đó như một cuộc họp trực tiếp hoặc buổi biểu diễn trực tiếp, sẽ chấp nhận được khi ghi chú trong quá trình biểu diễn, xuất bản chúng đầy đủ cùng với âm thanh, và sau đó tìm kiếm sự giúp đỡ để làm sạch các ghi chú sau đó.

### Ví dụ bản ghi

Nếu bạn sử dụng dịch vụ tự động, thì bạn có thể phải sử dụng giao diện người dùng mà công cụ cung cấp. Ví dụ, hãy xem video [Wait, ARIA Roles Have Categories?](https://www.youtube.com/watch?v=mwF-PpJOjMs) của chúng ta và chọn menu ba chấm (. . .) _> Show Transcript_. Bạn sẽ thấy bản ghi xuất hiện trong một panel riêng biệt.

Nếu bạn đang tạo giao diện người dùng của riêng mình để trình bày âm thanh và bản ghi liên quan, bạn có thể làm theo cách bạn thích, nhưng có thể hợp lý khi bao gồm nó trong một panel có thể hiển thị/ẩn; xem ví dụ [audio-transcript-ui](https://mdn.github.io/learning-area/accessibility/multimedia/audio-transcript-ui/) của chúng ta (cũng xem [mã nguồn](https://github.com/mdn/learning-area/tree/main/accessibility/multimedia/audio-transcript-ui)).

### Mô tả âm thanh

Trong những trường hợp mà hình ảnh đi kèm với âm thanh của bạn, bạn sẽ cần cung cấp mô tả âm thanh của một số loại để mô tả nội dung bổ sung đó.

Trong nhiều trường hợp, điều này sẽ có dạng video, trong đó bạn có thể triển khai phụ đề sử dụng các kỹ thuật được mô tả trong phần tiếp theo của bài viết.

Tuy nhiên, có một số trường hợp đặc biệt. Bạn có thể ví dụ có một bản ghi âm của cuộc họp đề cập đến một tài nguyên đi kèm như bảng tính hoặc biểu đồ. Trong những trường hợp như vậy, bạn nên đảm bảo rằng các tài nguyên được cung cấp cùng với âm thanh + bản ghi, và cụ thể liên kết đến chúng ở những nơi chúng được đề cập trong bản ghi. Điều này tất nhiên sẽ giúp ích cho tất cả người dùng, không chỉ những người bị điếc.

> [!NOTE]
> Bản ghi âm thanh nói chung sẽ giúp nhiều nhóm người dùng. Cũng như cung cấp cho người dùng bị điếc quyền truy cập vào thông tin có trong âm thanh, hãy nghĩ đến người dùng có kết nối băng thông thấp, người sẽ thấy tải xuống âm thanh bất tiện. Hãy nghĩ đến người dùng trong môi trường ồn ào như quán bar, đang cố gắng truy cập thông tin nhưng không thể nghe nó qua tiếng ồn.

## Đường dẫn văn bản video

Để làm cho video dễ tiếp cận với người điếc, người suy giảm thị giác, hoặc các nhóm người dùng khác (chẳng hạn như những người có băng thông thấp, hoặc những người không hiểu ngôn ngữ video được quay), bạn cần bao gồm các đường dẫn văn bản cùng với nội dung video của mình.

> [!NOTE]
> Các đường dẫn văn bản cũng hữu ích cho bất kỳ người dùng nào, không chỉ những người khuyết tật. Ví dụ, một số người dùng có thể không nghe được âm thanh vì họ đang ở trong môi trường ồn ào (như quán bar đông đúc khi đang chiếu trận thể thao) hoặc có thể không muốn làm phiền người khác nếu họ đang ở nơi yên tĩnh (như thư viện).

Đây không phải là khái niệm mới — các dịch vụ truyền hình đã có phụ đề khép kín trong một thời gian dài:

![Khung từ hoạt hình xưa với phụ đề khép kín "Good work, Goldie. Keep it up!"](closed-captions.png)

Nhiều quốc gia cung cấp phim tiếng Anh với phụ đề được viết bằng ngôn ngữ bản địa của họ, và các phụ đề ngôn ngữ khác nhau thường có sẵn trên DVD, như được hiển thị bên dưới:

![Phim tiếng Anh với phụ đề tiếng Đức "Emo, warum erkennst du nicht die Schonheit dieses Ortes?"](subtitles_german.png)

Có các loại đường dẫn văn bản khác nhau cho các mục đích khác nhau. Những loại chính bạn sẽ gặp là:

- Phụ đề khép kín (Captions) — Dành cho người điếc không thể nghe đường âm thanh, bao gồm các từ được nói, và thông tin theo ngữ cảnh như ai đã nói các từ đó, nếu mọi người đang tức giận hay buồn, và âm nhạc hiện đang tạo ra tâm trạng gì.
- Phụ đề (Subtitles) — Bao gồm các bản dịch của đoạn hội thoại âm thanh, dành cho người dùng không hiểu ngôn ngữ đang được nói.
- Mô tả (Descriptions) — Bao gồm mô tả cho người suy giảm thị giác không thể nhìn thấy video, ví dụ, cảnh trông như thế nào.
- Tiêu đề chương (Chapter titles) — Các điểm đánh dấu chương nhằm giúp người dùng điều hướng tài nguyên phương tiện

### Triển khai các đường dẫn văn bản video HTML

Các đường dẫn văn bản để hiển thị với video HTML cần được viết trong WebVTT, một định dạng văn bản chứa nhiều chuỗi văn bản cùng với siêu dữ liệu như thời gian nào trong video bạn muốn hiển thị mỗi chuỗi văn bản, và thậm chí thông tin định kiểu/vị trí hạn chế. Các chuỗi văn bản này được gọi là cues (gợi ý).

Tệp WebVTT điển hình sẽ trông như thế này:

```plain
WEBVTT

1
00:00:22.230 --> 00:00:24.606
This is the first subtitle.

2
00:00:30.739 --> 00:00:34.074
This is the second.

…
```

Để hiển thị cùng với phát lại phương tiện HTML, bạn cần:

- Lưu nó dưới dạng tệp .vtt ở nơi hợp lý.
- Liên kết đến tệp .vtt với phần tử {{htmlelement("track")}}. `<track>` nên được đặt trong `<audio>` hoặc `<video>`, nhưng sau tất cả các phần tử `<source>`. Sử dụng thuộc tính [`kind`](/en-US/docs/Web/HTML/Reference/Elements/track#kind) để chỉ định liệu các cues là phụ đề, phụ đề khép kín hay mô tả. Hơn nữa, sử dụng [`srclang`](/en-US/docs/Web/HTML/Reference/Elements/track#srclang) để cho trình duyệt biết ngôn ngữ bạn đã viết phụ đề.

Dưới đây là một ví dụ:

```html
<video controls>
  <source src="example.mp4" type="video/mp4" />
  <source src="example.webm" type="video/webm" />
  <track kind="subtitles" src="subtitles_en.vtt" srclang="en" />
</video>
```

Điều này sẽ tạo ra một video có phụ đề được hiển thị. Để có ứng dụng đầy đủ và mã nguồn của nó, xem [Thêm phụ đề và chú thích vào video HTML](/en-US/docs/Web/Media/Guides/Audio_and_video_delivery/Adding_captions_and_subtitles_to_HTML5_video). Ví dụ này sử dụng JavaScript để cho phép người dùng chọn giữa các phụ đề khác nhau. Lưu ý rằng để bật phụ đề, bạn cần nhấn nút "CC" và chọn một tùy chọn — English, Deutsch, hoặc Español.

> [!NOTE]
> Các đường dẫn văn bản và bản ghi cũng giúp bạn với {{glossary("SEO")}}, vì các công cụ tìm kiếm đặc biệt phát triển tốt trên văn bản. Các đường dẫn văn bản thậm chí cho phép các công cụ tìm kiếm liên kết trực tiếp đến một điểm giữa chừng trong video.

## Tóm tắt

Chương này đã cung cấp một tóm tắt về các mối quan tâm về khả năng tiếp cận cho nội dung đa phương tiện, cùng với một số giải pháp thực tế.

Không phải lúc nào cũng dễ dàng để làm cho đa phương tiện dễ tiếp cận. Ví dụ, nếu bạn đang xử lý một trò chơi 3D nhập vai hoặc ứng dụng thực tế ảo, thì khá khó để cung cấp các phương án thay thế văn bản cho trải nghiệm như vậy, và bạn có thể lập luận rằng người dùng suy giảm thị giác không thực sự là đối tượng mục tiêu cho những ứng dụng như vậy.

Tuy nhiên, bạn có thể đảm bảo rằng ứng dụng như vậy có đủ độ tương phản màu sắc và trình bày rõ ràng để có thể nhận thấy được đối với những người suy giảm thị lực/mù màu, và cũng làm cho nó có thể điều hướng bằng bàn phím. Hãy nhớ rằng khả năng tiếp cận là về việc làm nhiều nhất có thể, thay vì phấn đấu cho 100% khả năng tiếp cận mọi lúc, điều này thường là không thể.

{{PreviousMenuNext("Learn_web_development/Core/Accessibility/Test_your_skills/WAI-ARIA","Learn_web_development/Core/Accessibility/Mobile", "Learn_web_development/Core/Accessibility")}}
