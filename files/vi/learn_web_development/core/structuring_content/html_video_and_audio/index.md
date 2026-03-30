---
title: Video và âm thanh HTML
short-title: Video và âm thanh
slug: Learn_web_development/Core/Structuring_content/HTML_video_and_audio
page-type: tutorial-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Structuring_content/Test_your_skills/Images", "Learn_web_development/Core/Structuring_content/Test_your_skills/Audio_and_video", "Learn_web_development/Core/Structuring_content")}}

Bây giờ chúng ta đã quen với việc thêm hình ảnh đơn giản vào trang web, bước tiếp theo là bắt đầu thêm trình phát video và âm thanh vào tài liệu HTML của bạn! Trong bài viết này, chúng ta sẽ xem xét cách thực hiện điều đó với các phần tử {{htmlelement("video")}} và {{htmlelement("audio")}}; sau đó chúng ta sẽ kết thúc bằng cách xem xét cách thêm phụ đề/phụ đề cho video của bạn.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Quen thuộc cơ bản với HTML, như đã được đề cập trong
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/Basic_HTML_syntax"
          >Cú pháp HTML cơ bản</a
        >. Ngữ nghĩa ở cấp độ văn bản như <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/Headings_and_paragraphs"
          >tiêu đề và đoạn văn</a
        > và <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/Lists"
          >danh sách</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Cú pháp cơ bản của thẻ <code>&lt;video&gt;</code> và <code>&lt;audio&gt;</code></li>
          <li>Các thuộc tính dành riêng cho video và âm thanh như controls và muted.</li>
          <li>Sử dụng các phần tử <code>&lt;source&gt;</code> để cung cấp các nguồn video hoặc âm thanh khác nhau.</li>
          <li>Những kiến thức cơ bản về sử dụng các bản nhạc văn bản như phụ đề và chú thích.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Video và âm thanh trên web

Đợt đầu tiên của các video và âm thanh trực tuyến được thực hiện bởi các công nghệ dựa trên plugin độc quyền như [Flash](https://en.wikipedia.org/wiki/Adobe_Flash) và [Silverlight](https://en.wikipedia.org/wiki/Microsoft_Silverlight). Cả hai đều có vấn đề về bảo mật và khả năng tiếp cận, và hiện đã lỗi thời, nhường chỗ cho các giải pháp HTML gốc là các phần tử {{htmlelement("video")}} và {{htmlelement("audio")}} và sự có mặt của {{Glossary("JavaScript")}} {{Glossary("API","APIs")}} để điều khiển chúng. Chúng ta sẽ không xem xét JavaScript ở đây — chỉ các nền tảng cơ bản có thể đạt được với HTML.

Chúng tôi sẽ không dạy bạn cách tạo tệp âm thanh và video — điều đó đòi hỏi một bộ kỹ năng hoàn toàn khác. Chúng tôi đã cung cấp cho bạn [các tệp âm thanh và video mẫu và mã ví dụ](https://github.com/mdn/learning-area/tree/main/html/multimedia-and-embedding/video-and-audio-content) để bạn thử nghiệm, trong trường hợp bạn không thể tự lấy tệp của mình.

> [!NOTE]
> Trước khi bắt đầu ở đây, bạn cũng nên biết rằng có khá nhiều OVP (nhà cung cấp video trực tuyến) như [YouTube](https://www.youtube.com/), [Dailymotion](https://www.dailymotion.com/), và [Vimeo](https://vimeo.com/), và các nhà cung cấp âm thanh trực tuyến như [Soundcloud](https://soundcloud.com/). Các công ty này cung cấp cách thuận tiện, dễ dàng để lưu trữ và sử dụng video, vì vậy bạn không cần lo lắng về mức tiêu thụ băng thông lớn. OVP thậm chí thường cung cấp mã sẵn sàng để nhúng video/âm thanh vào trang web của bạn; nếu bạn sử dụng cách đó, bạn có thể tránh được một số khó khăn mà chúng ta thảo luận trong bài viết này. Chúng ta sẽ thảo luận thêm về loại dịch vụ này trong bài viết tiếp theo.

## Phần tử \<video>

Phần tử {{htmlelement("video")}} cho phép bạn nhúng video rất dễ dàng. Một ví dụ thực sự đơn giản trông như thế này:

```html
<video src="rabbit320.webm" controls>
  <p>
    Your browser doesn't support HTML video. Here is a
    <a href="rabbit320.webm">link to the video</a> instead.
  </p>
</video>
```

Các tính năng cần lưu ý là:

- [`src`](/en-US/docs/Web/HTML/Reference/Elements/video#src)
  - : Tương tự như đối với phần tử {{htmlelement("img")}}, thuộc tính `src` (nguồn) chứa đường dẫn đến video bạn muốn nhúng. Nó hoạt động theo cách hoàn toàn giống nhau.
- [`controls`](/en-US/docs/Web/HTML/Reference/Elements/video#controls)
  - : Người dùng phải có thể kiểm soát phát lại video và âm thanh (điều này đặc biệt quan trọng đối với những người bị [động kinh](https://en.wikipedia.org/wiki/Epilepsy#Epidemiology).) Bạn phải sử dụng thuộc tính `controls` để bao gồm giao diện điều khiển của chính trình duyệt, hoặc xây dựng giao diện của bạn bằng [JavaScript API](/en-US/docs/Web/API/HTMLMediaElement) phù hợp. Ở mức tối thiểu, giao diện phải bao gồm cách bắt đầu và dừng phương tiện, và điều chỉnh âm lượng.
- Đoạn văn bên trong thẻ `<video>`
  - : Đây được gọi là **nội dung dự phòng** — nội dung này sẽ được hiển thị nếu trình duyệt truy cập trang không hỗ trợ phần tử `<video>`, cho phép chúng ta cung cấp dự phòng cho các trình duyệt cũ hơn. Đây có thể là bất cứ thứ gì bạn thích; trong trường hợp này, chúng tôi đã cung cấp liên kết trực tiếp đến tệp video, vì vậy người dùng ít nhất có thể truy cập vào nó theo cách nào đó bất kể trình duyệt họ đang sử dụng là gì.

Video được nhúng sẽ trông giống như thế này:

![Trình phát video đơn giản hiển thị video của một chú thỏ trắng nhỏ](simple-video.png)

Bạn có thể [thử ví dụ trực tiếp](https://mdn.github.io/learning-area/html/multimedia-and-embedding/video-and-audio-content/simple-video.html) ở đây (xem thêm [mã nguồn](https://github.com/mdn/learning-area/blob/main/html/multimedia-and-embedding/video-and-audio-content/simple-video.html).)

## Sử dụng nhiều định dạng nguồn để cải thiện tính tương thích

Có một vấn đề với ví dụ trên. Video có thể không phát được đối với bạn, vì các trình duyệt khác nhau hỗ trợ các định dạng video (và âm thanh) khác nhau. May mắn thay, có những điều bạn có thể làm để giúp ngăn chặn điều này không trở thành vấn đề.

### Nội dung của tệp phương tiện

Đầu tiên, hãy nhanh chóng xem qua thuật ngữ. Các định dạng như OGG, WAV, MP4 và WebM được gọi là **[định dạng container](/en-US/docs/Web/Media/Guides/Formats/Containers)**. Chúng xác định một cấu trúc trong đó các track âm thanh và/hoặc video tạo nên phương tiện được lưu trữ, cùng với siêu dữ liệu mô tả phương tiện, codec nào được sử dụng để mã hóa các kênh của nó, v.v.

Một tệp WebM chứa một bộ phim có một track video chính và một track góc thay thế, cùng với âm thanh cho cả tiếng Anh và tiếng Tây Ban Nha, ngoài âm thanh cho một track bình luận tiếng Anh có thể được hình dung như được hiển thị trong sơ đồ dưới đây. Cũng bao gồm các track văn bản chứa phụ đề cho phim, phụ đề tiếng Tây Ban Nha cho phim, và chú thích tiếng Anh cho bình luận.

![Sơ đồ hình dung nội dung của tệp phương tiện ở cấp độ track.](containersandtracks.png)

Các track âm thanh và video trong container chứa dữ liệu ở định dạng phù hợp cho codec được sử dụng để mã hóa phương tiện đó. Các định dạng khác nhau được sử dụng cho track âm thanh so với track video. Mỗi track âm thanh được mã hóa bằng [codec âm thanh](/en-US/docs/Web/Media/Guides/Formats/Audio_codecs), trong khi các track video được mã hóa bằng (như bạn có thể đoán) [codec video](/en-US/docs/Web/Media/Guides/Formats/Video_codecs). Như chúng ta đã nói trước đây, các trình duyệt khác nhau hỗ trợ các định dạng video và âm thanh khác nhau, và các định dạng container khác nhau (như OGG, MP4 và WebM, có thể chứa các loại video và âm thanh khác nhau).

Ví dụ:

- Container WebM thường đóng gói âm thanh Vorbis hoặc Opus với video VP8/VP9. Điều này được hỗ trợ trong tất cả các trình duyệt hiện đại, mặc dù các phiên bản cũ hơn có thể không hoạt động.
- Container MP4 thường đóng gói âm thanh AAC hoặc MP3 với video H.264. Điều này cũng được hỗ trợ trong tất cả các trình duyệt hiện đại.
- Container Ogg có xu hướng sử dụng âm thanh Vorbis và video Theora. Điều này được hỗ trợ tốt nhất trong Firefox và Chrome, nhưng về cơ bản đã bị thay thế bởi định dạng WebM chất lượng tốt hơn.

Có một số trường hợp đặc biệt. Ví dụ, đối với một số loại âm thanh, dữ liệu của codec thường được lưu trữ mà không có container, hoặc với container đơn giản hóa. Một ví dụ như vậy là codec FLAC, được lưu trữ phổ biến nhất trong các tệp FLAC, đây chỉ là các track FLAC thô.

Một ví dụ khác là "tệp MP3" phổ biến. "Tệp MP3" là tệp âm thanh được mã hóa bằng nén MPEG-1 Audio Layer III. Mặc dù nó có thể bao gồm siêu dữ liệu, nhưng nó không được đóng gói trong container MPEG hoặc MPEG-2 riêng biệt. Sự hỗ trợ rộng rãi của nó trong các phần tử {{htmlelement("audio")}} và {{htmlelement("video")}} phần lớn là bằng chứng về sự phổ biến bền vững của nó.

Trình phát âm thanh sẽ có xu hướng phát trực tiếp một track âm thanh, ví dụ: tệp MP3 hoặc Ogg. Những tệp này không cần container.

### Hỗ trợ tệp phương tiện trong các trình duyệt

> [!NOTE]
> Một số định dạng phổ biến, như MP3 và MP4/H.264, rất tốt nhưng bị bằng sáng chế; nghĩa là có các bằng sáng chế bao gồm một số hoặc tất cả công nghệ mà chúng dựa trên. Ở Hoa Kỳ, bằng sáng chế bao gồm MP3 cho đến năm 2017, và H.264 bị bằng sáng chế bao gồm ít nhất đến năm 2027.
>
> Do những bằng sáng chế đó, các trình duyệt muốn triển khai hỗ trợ cho các codec đó thường phải trả phí cấp phép khổng lồ. Ngoài ra, một số người thích tránh phần mềm bị hạn chế và chỉ sử dụng các định dạng mở. Do những lý do pháp lý và sở thích này, các nhà phát triển web thấy mình phải hỗ trợ nhiều định dạng để cung cấp trải nghiệm video cho toàn bộ khán giả của họ.

Các codec được mô tả trong phần trước tồn tại để nén video và âm thanh thành các tệp có thể quản lý được, vì âm thanh và video thô đều cực kỳ lớn. Mỗi trình duyệt web hỗ trợ một loạt **{{Glossary("Codec","codec")}}**, như Vorbis hoặc H.264, được sử dụng để chuyển đổi âm thanh và video đã nén thành dữ liệu nhị phân và ngược lại. Mỗi codec cung cấp lợi thế và nhược điểm của riêng nó, và mỗi container cũng có thể cung cấp các tính năng tích cực và tiêu cực của riêng nó ảnh hưởng đến quyết định của bạn về việc sử dụng cái nào.

Mọi thứ trở nên hơi phức tạp hơn vì không chỉ mỗi trình duyệt hỗ trợ một tập hợp định dạng tệp container khác nhau, mà chúng còn hỗ trợ một lựa chọn codec khác nhau. Để tối đa hóa khả năng trang web hoặc ứng dụng của bạn hoạt động trên trình duyệt của người dùng, bạn có thể cần cung cấp mỗi tệp phương tiện bạn sử dụng ở nhiều định dạng. Nếu trang web của bạn và trình duyệt của người dùng không chia sẻ định dạng phương tiện chung, phương tiện của bạn sẽ không phát.

Do sự phức tạp của việc đảm bảo phương tiện của ứng dụng có thể xem được trên mọi kết hợp trình duyệt, nền tảng và thiết bị bạn muốn tiếp cận, việc chọn kết hợp tốt nhất của codec và container có thể là một nhiệm vụ phức tạp. Xem [Chọn container phù hợp](/en-US/docs/Web/Media/Guides/Formats/Containers#choosing_the_right_container) để được trợ giúp chọn định dạng tệp container phù hợp nhất với nhu cầu của bạn; tương tự, xem [Chọn codec video](/en-US/docs/Web/Media/Guides/Formats/Video_codecs#choosing_a_video_codec) và [Chọn codec âm thanh](/en-US/docs/Web/Media/Guides/Formats/Audio_codecs#choosing_an_audio_codec) để được trợ giúp chọn codec phương tiện đầu tiên để sử dụng cho nội dung và đối tượng mục tiêu của bạn.

Một điều bổ sung cần ghi nhớ: các trình duyệt di động có thể hỗ trợ các định dạng bổ sung không được hỗ trợ bởi các trình duyệt desktop tương đương của chúng, giống như chúng có thể không hỗ trợ tất cả các định dạng giống như phiên bản desktop. Ngoài ra, cả trình duyệt desktop và di động _có thể_ được thiết kế để chuyển giao việc xử lý phát lại phương tiện (cho tất cả phương tiện hoặc chỉ cho các loại cụ thể mà nó không thể xử lý nội bộ). Điều này có nghĩa là hỗ trợ phương tiện một phần phụ thuộc vào phần mềm người dùng đã cài đặt.

Vậy làm thế nào để chúng ta thực hiện điều này? Hãy xem ví dụ [đã được cập nhật](https://github.com/mdn/learning-area/blob/main/html/multimedia-and-embedding/video-and-audio-content/multiple-video-formats.html) sau ([thử trực tiếp ở đây](https://mdn.github.io/learning-area/html/multimedia-and-embedding/video-and-audio-content/multiple-video-formats.html)):

```html
<video controls>
  <source src="rabbit320.mp4" type="video/mp4" />
  <source src="rabbit320.webm" type="video/webm" />
  <p>
    Your browser doesn't support this video. Here is a
    <a href="rabbit320.mp4">link to the video</a> instead.
  </p>
</video>
```

Ở đây chúng ta đã lấy thuộc tính `src` ra khỏi thẻ {{HTMLElement("video")}} thực sự, và thay vào đó bao gồm các phần tử {{htmlelement("source")}} riêng biệt trỏ đến các nguồn của riêng chúng. Trong trường hợp này, trình duyệt sẽ đi qua các phần tử {{HTMLElement("source")}} và phát phần tử đầu tiên mà nó có codec để hỗ trợ. Bao gồm các nguồn WebM và MP4 sẽ đủ để phát video của bạn trên hầu hết các nền tảng và trình duyệt hiện nay.

Mỗi phần tử `<source>` cũng có thuộc tính [`type`](/en-US/docs/Web/HTML/Reference/Elements/source#type). Điều này là tùy chọn, nhưng được khuyến nghị bạn nên bao gồm nó. Thuộc tính `type` chứa {{glossary("MIME type")}} của tệp được chỉ định bởi `<source>`, và các trình duyệt có thể sử dụng `type` để ngay lập tức bỏ qua các video chúng không hiểu. Nếu `type` không được bao gồm, các trình duyệt sẽ tải và cố gắng phát từng tệp cho đến khi tìm thấy tệp hoạt động, điều này rõ ràng mất thời gian và là việc sử dụng tài nguyên không cần thiết.

Tham khảo [hướng dẫn về các loại và định dạng phương tiện](/en-US/docs/Web/Media/Guides/Formats) để được trợ giúp chọn container và codec tốt nhất cho nhu cầu của bạn, cũng như để tra cứu các loại MIME đúng cần chỉ định cho mỗi loại.

## Các tính năng \<video> khác

Có nhiều tính năng khác mà bạn có thể bao gồm khi hiển thị video HTML. Hãy xem ví dụ tiếp theo của chúng ta:

```html
<video
  controls
  width="400"
  height="400"
  autoplay
  loop
  muted
  preload="auto"
  poster="poster.png">
  <source src="rabbit320.mp4" type="video/mp4" />
  <source src="rabbit320.webm" type="video/webm" />
  <p>
    Your browser doesn't support this video. Here is a
    <a href="rabbit320.mp4">link to the video</a> instead.
  </p>
</video>
```

Giao diện người dùng kết quả trông giống như thế này:

![Trình phát video hiển thị ảnh poster trước khi phát. Ảnh poster có nội dung HTML video example, OMG hell yeah!](poster_screenshot_updated.png)

Các tính năng bao gồm:

- [`width`](/en-US/docs/Web/HTML/Reference/Elements/video#width) và [`height`](/en-US/docs/Web/HTML/Reference/Elements/video#height)
  - : Bạn có thể kiểm soát kích thước video bằng các thuộc tính này hoặc bằng {{Glossary("CSS")}}. Trong cả hai trường hợp, video duy trì tỷ lệ chiều rộng-chiều cao gốc của chúng — được gọi là **tỷ lệ khung hình**. Nếu tỷ lệ khung hình không được duy trì bởi kích thước bạn đặt, video sẽ phát triển để lấp đầy không gian theo chiều ngang, và không gian chưa được lấp đầy chỉ được cấp một màu nền đặc theo mặc định.
- [`autoplay`](/en-US/docs/Web/HTML/Reference/Elements/video#autoplay)
  - : Làm cho âm thanh hoặc video bắt đầu phát ngay lập tức, trong khi phần còn lại của trang đang tải. Bạn được khuyên không nên sử dụng video (hoặc âm thanh) tự động phát trên trang web của mình, vì người dùng có thể thấy nó thực sự khó chịu.
- [`loop`](/en-US/docs/Web/HTML/Reference/Elements/video#loop)
  - : Làm cho video (hoặc âm thanh) bắt đầu phát lại bất cứ khi nào nó kết thúc. Điều này cũng có thể gây khó chịu, vì vậy chỉ sử dụng nếu thực sự cần thiết.
- [`muted`](/en-US/docs/Web/HTML/Reference/Elements/video#muted)
  - : Làm cho phương tiện phát với âm thanh tắt theo mặc định.
- [`poster`](/en-US/docs/Web/HTML/Reference/Elements/video#poster)
  - : URL của hình ảnh sẽ được hiển thị trước khi video được phát. Nó được thiết kế để sử dụng cho màn hình splash hoặc màn hình quảng cáo.
- [`preload`](/en-US/docs/Web/HTML/Reference/Elements/video#preload)
  - : Được sử dụng để đệm các tệp lớn; nó có thể nhận một trong ba giá trị:
    - `"none"` không đệm tệp
    - `"auto"` đệm tệp phương tiện
    - `"metadata"` chỉ đệm siêu dữ liệu cho tệp

Bạn có thể tìm thấy ví dụ trên để [phát trực tiếp trên GitHub](https://mdn.github.io/learning-area/html/multimedia-and-embedding/video-and-audio-content/extra-video-features.html) (xem thêm [mã nguồn](https://github.com/mdn/learning-area/blob/main/html/multimedia-and-embedding/video-and-audio-content/extra-video-features.html).) Lưu ý rằng chúng tôi đã không bao gồm thuộc tính `autoplay` trong phiên bản trực tiếp — nếu video bắt đầu phát ngay khi trang tải, bạn sẽ không thể thấy poster!

## Phần tử \<audio>

Phần tử {{htmlelement("audio")}} hoạt động giống như phần tử {{htmlelement("video")}}, với một vài khác biệt nhỏ như được phác thảo dưới đây. Một ví dụ điển hình có thể trông như thế này:

```html
<audio controls>
  <source src="viper.mp3" type="audio/mp3" />
  <source src="viper.ogg" type="audio/ogg" />
  <p>
    Your browser doesn't support this audio file. Here is a
    <a href="viper.mp3">link to the audio</a> instead.
  </p>
</audio>
```

Điều này tạo ra điều gì đó như sau trong trình duyệt:

![Trình phát âm thanh đơn giản với nút phát, bộ đếm thời gian, điều khiển âm lượng và thanh tiến trình](audio-player.png)

> [!NOTE]
> Bạn có thể [chạy bản demo âm thanh trực tiếp](https://mdn.github.io/learning-area/html/multimedia-and-embedding/video-and-audio-content/multiple-audio-formats.html) trên GitHub (xem thêm [mã nguồn trình phát âm thanh](https://github.com/mdn/learning-area/blob/main/html/multimedia-and-embedding/video-and-audio-content/multiple-audio-formats.html).)

Điều này chiếm ít không gian hơn trình phát video, vì không có thành phần hình ảnh — bạn chỉ cần hiển thị các điều khiển để phát âm thanh. Các khác biệt khác so với video HTML như sau:

- Phần tử {{htmlelement("audio")}} không hỗ trợ các thuộc tính `width`/`height` — một lần nữa, không có thành phần hình ảnh, vì vậy không có gì để gán chiều rộng hoặc chiều cao.
- Nó cũng không hỗ trợ thuộc tính `poster` — một lần nữa, không có thành phần hình ảnh.

Ngoài điều này, `<audio>` hỗ trợ tất cả các tính năng giống như `<video>` — xem lại các phần trên để biết thêm thông tin về chúng.

## Hiển thị các bản nhạc văn bản video

Bây giờ chúng ta sẽ thảo luận về một khái niệm hơi nâng cao hơn thực sự hữu ích để biết. Nhiều người không thể hoặc không muốn nghe nội dung âm thanh/video mà họ tìm thấy trên Web, ít nhất là vào một số thời điểm. Ví dụ:

- Nhiều người có khiếm khuyết thính giác (như khó nghe hoặc điếc) nên không thể nghe rõ âm thanh nếu có.
- Những người khác có thể không thể nghe âm thanh vì họ đang ở trong môi trường ồn ào (như quán bar đông người khi đang chiếu trận thể thao).
- Tương tự, trong các môi trường mà việc phát âm thanh sẽ là sự phân tâm hoặc gián đoạn (như trong thư viện hoặc khi đối tác đang cố ngủ), việc có phụ đề có thể rất hữu ích.
- Những người không nói ngôn ngữ của video có thể muốn bản phiên âm văn bản hoặc thậm chí dịch để giúp họ hiểu nội dung phương tiện.

Sẽ không tuyệt vời nếu có thể cung cấp cho những người này bản phiên âm của những lời được nói trong âm thanh/video không? Nhờ HTML video, bạn có thể. Để làm điều này, chúng ta sử dụng định dạng tệp [WebVTT](/en-US/docs/Web/API/WebVTT_API) và phần tử {{htmlelement("track")}}.

> [!NOTE]
> "Phiên âm" có nghĩa là "viết lại các lời nói dưới dạng văn bản." Văn bản kết quả là "bản phiên âm."

WebVTT là định dạng để viết các tệp văn bản chứa nhiều chuỗi văn bản cùng với siêu dữ liệu như thời gian trong video mà mỗi chuỗi văn bản nên được hiển thị, và thậm chí thông tin định kiểu/định vị hạn chế. Các chuỗi văn bản này được gọi là **cue**, và có một số loại cue được sử dụng cho các mục đích khác nhau. Các cue phổ biến nhất là:

- subtitles (phụ đề)
  - : Bản dịch tài liệu nước ngoài, dành cho những người không hiểu các từ được nói trong âm thanh.
- captions (chú thích)
  - : Bản phiên âm đồng bộ của hộp thoại hoặc mô tả các âm thanh quan trọng, để cho phép những người không thể nghe âm thanh hiểu những gì đang xảy ra.
- timed descriptions (mô tả theo thời gian)
  - : Văn bản nên được trình phát phương tiện đọc to để mô tả các hình ảnh quan trọng cho người mù hoặc người bị khiếm thị.

Tệp WebVTT điển hình sẽ trông giống như thế này:

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

Để hiển thị điều này cùng với phát lại phương tiện HTML, bạn cần:

1. Lưu nó dưới dạng tệp `.vtt` ở đâu đó mà máy chủ có thể phục vụ (xem bên dưới), chẳng hạn như trong cùng thư mục với tệp HTML.
2. Liên kết đến tệp `.vtt` với phần tử {{htmlelement("track")}}. `<track>` nên được đặt trong `<audio>` hoặc `<video>`, nhưng sau tất cả các phần tử `<source>`. Sử dụng thuộc tính [`kind`](/en-US/docs/Web/HTML/Reference/Elements/track#kind) để chỉ định liệu các cue có phải là `subtitles`, `captions` hay `descriptions`. Hơn nữa, sử dụng [`srclang`](/en-US/docs/Web/HTML/Reference/Elements/track#srclang) để cho trình duyệt biết ngôn ngữ bạn đã viết phụ đề. Cuối cùng, thêm [`label`](/en-US/docs/Web/HTML/Reference/Elements/track#label) để giúp người đọc xác định ngôn ngữ họ đang tìm kiếm.

Đây là một ví dụ:

```html
<video controls>
  <source src="example.mp4" type="video/mp4" />
  <source src="example.webm" type="video/webm" />
  <track kind="subtitles" src="subtitles_es.vtt" srclang="es" label="Spanish" />
</video>
```

Để thử điều này, bạn cần lưu trữ các tệp trên [máy chủ HTTP cục bộ](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/set_up_a_local_testing_server). Trong đầu ra trong trình duyệt, bạn sẽ thấy video có phụ đề được hiển thị. Để xem ứng dụng đầy đủ và mã nguồn của nó, hãy xem [Thêm phụ đề vào video HTML](/en-US/docs/Web/Media/Guides/Audio_and_video_delivery/Adding_captions_and_subtitles_to_HTML5_video). Ví dụ này sử dụng JavaScript để cho phép người dùng chọn giữa các phụ đề khác nhau. Lưu ý rằng để bật phụ đề, bạn cần nhấn nút "CC" và chọn một tùy chọn — English, Deutsch, hoặc Español.

> [!NOTE]
> Các bản nhạc văn bản cũng giúp bạn với {{glossary("SEO")}}, vì các công cụ tìm kiếm đặc biệt phát triển mạnh trên văn bản. Các bản nhạc văn bản thậm chí cho phép các công cụ tìm kiếm liên kết trực tiếp đến một điểm giữa chừng trong video.

## Nhúng âm thanh và video của riêng bạn

Đối với tác vụ này, tại sao không ra ngoài thế giới và quay video và âm thanh của riêng bạn? Nếu bạn có điện thoại, hãy sử dụng nó để thu âm và quay video, chuyển sang máy tính và thử nó. Bạn có thể phải thực hiện một số chuyển đổi để có được WebM và MP4 trong trường hợp video, và MP3 và Ogg trong trường hợp âm thanh, nhưng có đủ các chương trình và công cụ để cho phép bạn thực hiện điều này mà không cần quá nhiều rắc rối, chẳng hạn như [CloudConvert](https://cloudconvert.com/mp4-converter) (trực tuyến) và [Audacity](https://sourceforge.net/projects/audacity/) (ứng dụng desktop). Chúng tôi muốn bạn thử!

> [!NOTE]
> Nếu bạn không thể lấy bất kỳ video hay âm thanh nào, thì bạn có thể tự do sử dụng [các tệp âm thanh và video mẫu](https://github.com/mdn/learning-area/tree/main/html/multimedia-and-embedding/video-and-audio-content) của chúng tôi để thực hiện bài tập này.

Chúng tôi muốn bạn:

1. Lưu các tệp âm thanh và video của bạn trong một thư mục mới trên máy tính của bạn.
2. Tạo một tệp HTML mới trong cùng thư mục, được gọi là `index.html`, dựa trên [mẫu bắt đầu](https://github.com/mdn/learning-area/blob/main/html/introduction-to-html/getting-started/index.html) của chúng ta.
3. Thêm các phần tử {{HTMLElement("audio")}} và {{HTMLElement("video")}} vào trang; làm cho chúng hiển thị các điều khiển mặc định của trình duyệt.
4. Cung cấp cho cả hai phần tử {{HTMLElement("source")}} để trình duyệt sẽ tìm định dạng âm thanh mà chúng hỗ trợ tốt nhất và tải nó. Những phần tử này phải bao gồm các thuộc tính [`type`](/en-US/docs/Web/HTML/Reference/Elements/source#type).
5. Cung cấp cho cả hai một phần tử `<p>` dự phòng bên trong các thẻ cung cấp liên kết trực tiếp đến phương tiện cho các trình duyệt không hỗ trợ.
6. Cung cấp cho phần tử `<video>` một poster sẽ được hiển thị trước khi video bắt đầu phát. Hãy vui vẻ tạo đồ họa poster của riêng bạn.

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

HTML hoàn chỉnh của bạn sẽ trông giống như thế này:

```html
<video controls poster="poster.png">
  <source src="rabbit320.mp4" type="video/mp4" />
  <source src="rabbit320.webm" type="video/webm" />
  <p>
    Your browser doesn't support HTML video. Here is a
    <a href="rabbit320.mp4">link to the video</a> instead.
  </p>
</video>

<audio controls>
  <source src="viper.mp3" type="audio/mp3" />
  <source src="viper.ogg" type="audio/ogg" />
  <p>
    Your browser doesn't support HTML audio. Here is a
    <a href="viper.mp3">link to the audio</a> instead.
  </p>
</audio>
```

</details>

## Tóm tắt

Và đó là kết thúc — chúng tôi hy vọng bạn đã vui khi chơi với video và âm thanh trong các trang web! Tiếp theo, chúng tôi sẽ cung cấp cho bạn một số bài kiểm tra mà bạn có thể sử dụng để kiểm tra mức độ bạn đã hiểu và ghi nhớ thông tin chúng tôi đã cung cấp về video và âm thanh HTML.

{{PreviousMenuNext("Learn_web_development/Core/Structuring_content/Test_your_skills/Images", "Learn_web_development/Core/Structuring_content/Test_your_skills/Audio_and_video", "Learn_web_development/Core/Structuring_content")}}
