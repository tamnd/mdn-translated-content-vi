---
title: Định dạng container phương tiện (kiểu tệp)
slug: Web/Media/Guides/Formats/Containers
page-type: guide
sidebar: mediasidebar
---

**Media container** là một định dạng tệp đóng gói một hoặc nhiều luồng phương tiện, chẳng hạn như âm thanh hoặc video, cùng với siêu dữ liệu, giúp chúng được lưu trữ và phát lại cùng nhau.
Định dạng của các tệp âm thanh và video được xác định bởi nhiều thành phần, bao gồm codec âm thanh và/hoặc video được dùng, định dạng media container (hoặc kiểu tệp), và tùy chọn các phần tử khác như codec phụ đề hoặc siêu dữ liệu.
Trong hướng dẫn này, chúng ta sẽ xem xét các định dạng container được dùng phổ biến nhất trên web, bao gồm các kiến thức cơ bản về đặc tả của chúng cũng như lợi ích, hạn chế và các trường hợp sử dụng lý tưởng.

[WebRTC](/en-US/docs/Web/API/WebRTC_API) không dùng container.
Thay vào đó, nó truyền trực tiếp các track âm thanh và video đã mã hóa từ một peer sang peer khác bằng các đối tượng {{domxref("MediaStreamTrack")}} để biểu diễn từng track.
Xem [Codec được WebRTC sử dụng](/en-US/docs/Web/Media/Guides/Formats/WebRTC_codecs) để biết thông tin về các codec thường dùng cho cuộc gọi WebRTC, cũng như thông tin tương thích trình duyệt liên quan đến hỗ trợ codec trong WebRTC.

## Các định dạng container phổ biến

Mặc dù có rất nhiều định dạng media container, các định dạng được liệt kê bên dưới là những định dạng bạn có khả năng gặp nhất.
Một số chỉ hỗ trợ âm thanh trong khi số khác hỗ trợ cả âm thanh lẫn video.
MIME type và phần mở rộng của từng định dạng được liệt kê. Các container được dùng phổ biến nhất cho media trên web có lẽ là MPEG-4 Part-14 (MP4) và Web Media File (WEBM). Tuy nhiên, bạn cũng có thể gặp Ogg, WAV, AVI, MOV và các định dạng khác.
Không phải tất cả trong số này đều được trình duyệt hỗ trợ rộng rãi; một số kết hợp container và codec đôi khi có phần mở rộng tệp và MIME type riêng cho tiện lợi hoặc vì mức độ phổ biến của chúng.
Ví dụ, một tệp Ogg chỉ có một track âm thanh Opus đôi khi được gọi là tệp Opus, và thậm chí có thể có phần mở rộng `.opus`.
Nhưng thực ra nó vẫn chỉ là một tệp Ogg.

Trong một số trường hợp, một codec cụ thể trở nên phổ biến đến mức cách dùng của nó được xem như một định dạng riêng biệt. Một ví dụ điển hình là tệp âm thanh MP3, vốn không được lưu trong một container thông thường. Thay vào đó, tệp MP3 về cơ bản là một luồng các frame được mã hóa theo MPEG-1 Audio Layer III, thường đi kèm với siêu dữ liệu như thẻ ID3. Các tệp này dùng MIME type `audio/mpeg` và phần mở rộng `.mp3`.

### Mục lục các định dạng container phương tiện (kiểu tệp)

Để tìm hiểu thêm về một định dạng container cụ thể, hãy tìm nó trong danh sách này và nhấp qua phần chi tiết, nơi có thông tin về mục đích sử dụng điển hình của container, các codec mà nó hỗ trợ, và trình duyệt nào hỗ trợ nó, cùng với các chi tiết khác.

<table class="standard-table">
  <thead>
    <tr>
      <th scope="row">Tên codec (viết tắt)</th>
      <th scope="col">Tên codec đầy đủ</th>
      <th scope="col">Khả năng tương thích trình duyệt</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row"><a href="#3gp">3GP</a></th>
      <td>Third Generation Partnership</td>
      <td>Firefox for Android</td>
    </tr>
    <tr>
      <th scope="row"><a href="#adts">ADTS</a></th>
      <td>Audio Data Transport Stream</td>
      <td>
        <p>Firefox</p>
        <p>Chỉ khả dụng nếu framework media của hệ điều hành bên dưới hỗ trợ.</p>
      </td>
    </tr>
    <tr>
      <th scope="row"><a href="#flac">FLAC</a></th>
      <td>Free Lossless Audio Codec</td>
      <td>Tất cả trình duyệt.</td>
    </tr>
    <tr>
      <th scope="row"><a href="#mpegmpeg-2">MPEG / MPEG-2</a></th>
      <td>Moving Picture Experts Group (1 and 2)</td>
      <td>—</td>
    </tr>
    <tr>
      <th scope="row"><a href="#mpeg-4_mp4">MPEG-4 (MP4)</a></th>
      <td>Moving Picture Experts Group 4</td>
      <td>Tất cả trình duyệt.</td>
    </tr>
    <tr>
      <th scope="row"><a href="#ogg">Ogg</a></th>
      <td>Ogg</td>
      <td>Tất cả trình duyệt.</td>
    </tr>
    <tr>
      <th scope="row"><a href="#quicktime">QuickTime (MOV)</a></th>
      <td>Apple QuickTime movie</td>
      <td>Chỉ các phiên bản Safari cũ, cùng các trình duyệt khác từng hỗ trợ plugin QuickTime của Apple</td>
    </tr>
    <tr>
      <th scope="row"><a href="#webm">WebM</a></th>
      <td>Web Media</td>
      <td>Tất cả trình duyệt.</td>
    </tr>
  </tbody>
</table>

Trừ khi có ghi chú khác, nếu một trình duyệt được liệt kê ở đây thì mặc định là hỗ trợ cả trên thiết bị di động lẫn máy tính để bàn.
Hỗ trợ cũng chỉ được hiểu là dành cho chính container, không phải cho bất kỳ codec cụ thể nào.

### 3GP

Media container **3GP** hoặc **3GPP** được dùng để đóng gói âm thanh và/hoặc video được thiết kế riêng cho việc truyền qua mạng di động để phát trên thiết bị di động.
Định dạng này được thiết kế cho điện thoại di động 3G, nhưng vẫn có thể dùng trên các điện thoại và mạng hiện đại hơn.
Tuy nhiên, băng thông tăng lên và hạn mức dữ liệu lớn hơn trên hầu hết các mạng đã làm giảm nhu cầu đối với 3GP.
Dẫu vậy, định dạng này vẫn được dùng cho các mạng chậm hơn và các điện thoại có hiệu năng thấp hơn.

Định dạng media container này được dẫn xuất từ ISO Base Media File Format và MPEG-4, nhưng được tinh gọn đặc biệt cho các tình huống băng thông thấp.

| Âm thanh      | Video         |
| ------------- | ------------- |
| `audio/3gpp`  | `video/3gpp`  |
| `audio/3gpp2` | `video/3gpp2` |
| `audio/3gp2`  | `video/3gp2`  |

Các MIME type này là các kiểu cơ bản của media container 3GP; các kiểu khác có thể được dùng tùy theo codec cụ thể đang sử dụng.
Ngoài ra, bạn có thể [thêm tham số `codecs`](/en-US/docs/Web/Media/Guides/Formats/codecs_parameter#iso_base_media_file_format_mp4_quicktime_and_3gp) vào chuỗi MIME type để chỉ ra codec nào được dùng cho các track âm thanh và/hoặc video, đồng thời tùy chọn cung cấp chi tiết về profile, level và/hoặc các thông số cấu hình codec khác.

<table class="standard-table">
  <caption>
    Video codec được 3GP hỗ trợ
  </caption>
  <thead>
    <tr>
      <th rowspan="2" scope="row" style="vertical-align: bottom">Codec</th>
      <th colspan="4" scope="col" style="text-align: center">
        Hỗ trợ trình duyệt
      </th>
    </tr>
    <tr>
      <th scope="col">Chrome</th>
      <th scope="col">Edge</th>
      <th scope="col">Firefox</th>
      <th scope="col">Safari</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">AVC (H.264)</th>
      <td></td><td></td><td></td><td></td>
    </tr>
    <tr>
      <th scope="row">H.263</th>
      <td></td><td></td><td></td><td></td>
    </tr>
    <tr>
      <th scope="row">MPEG-4 Part 2 (MP4v-es)</th>
      <td></td><td></td><td></td><td></td>
    </tr>
    <tr>
      <th scope="row">VP8</th>
      <td></td><td></td><td></td><td></td>
    </tr>
  </tbody>
</table>

<table class="standard-table">
  <caption>
    Audio codec được 3GP hỗ trợ
  </caption>
  <thead>
    <tr>
      <th rowspan="2" scope="row" style="vertical-align: bottom">Codec</th>
      <th colspan="4" scope="col" style="text-align: center">
        Hỗ trợ trình duyệt
      </th>
    </tr>
    <tr>
      <th scope="col">Chrome</th>
      <th scope="col">Edge</th>
      <th scope="col">Firefox</th>
      <th scope="col">Safari</th>
    </tr>
  </thead>
  <tbody>
    <tr><th scope="row">AMR-NB</th><td></td><td></td><td></td><td></td></tr>
    <tr><th scope="row">AMR-WB</th><td></td><td></td><td></td><td></td></tr>
    <tr><th scope="row">AMR-WB+</th><td></td><td></td><td></td><td></td></tr>
    <tr><th scope="row">AAC-LC</th><td></td><td></td><td></td><td></td></tr>
    <tr><th scope="row">HE-AAC v1</th><td></td><td></td><td></td><td></td></tr>
    <tr><th scope="row">HE-AAC v2</th><td></td><td></td><td></td><td></td></tr>
    <tr><th scope="row">MP3</th><td></td><td></td><td></td><td></td></tr>
  </tbody>
</table>

### ADTS

**Audio Data Transport Stream** (**ADTS**) là một định dạng container được MPEG-4 Part 3 quy định cho dữ liệu âm thanh, dùng cho âm thanh phát trực tuyến như radio Internet.
Về bản chất, nó gần như là một luồng AAC audio trần, gồm các ADTS frame với header tối giản.

| Âm thanh     |
| ------------ |
| `audio/aac`  |
| `audio/mpeg` |

MIME type dùng cho ADTS phụ thuộc vào loại audio frame chứa bên trong.
Nếu dùng ADTS frame, nên dùng MIME type `audio/aac`.
Nếu các audio frame ở định dạng MPEG-1/MPEG-2 Audio Layer I, II, hoặc III, MIME type phải là `audio/mpeg`.

<table class="standard-table">
  <caption>Audio codec được ADTS hỗ trợ</caption>
  <thead>
    <tr>
      <th rowspan="2" scope="row" style="vertical-align: bottom">Codec</th>
      <th colspan="4" scope="col" style="text-align: center">Hỗ trợ trình duyệt</th>
    </tr>
    <tr>
      <th scope="col">Chrome</th>
      <th scope="col">Edge</th>
      <th scope="col">Firefox</th>
      <th scope="col">Safari</th>
    </tr>
  </thead>
  <tbody>
    <tr><th scope="row">AAC</th><td></td><td></td><td>Yes</td><td></td></tr>
    <tr><th scope="row">MP3</th><td></td><td></td><td>Yes</td><td></td></tr>
  </tbody>
</table>

Firefox hỗ trợ AAC dựa trên hạ tầng media của hệ điều hành, nên nó khả dụng miễn là hệ điều hành hỗ trợ.

### FLAC

**Free Lossless Audio Codec** (**FLAC**) là một codec âm thanh không mất dữ liệu; cũng có một định dạng container đi kèm, cũng tên FLAC, có thể chứa âm thanh này.
Định dạng này không bị ràng buộc bởi bất kỳ bằng sáng chế nào, nên việc sử dụng nó không lo vướng mắc bản quyền.
Tệp FLAC chỉ có thể chứa dữ liệu âm thanh FLAC.

| Âm thanh                     |
| ---------------------------- |
| `audio/flac`                 |
| `audio/x-flac` (không chuẩn) |

<table class="standard-table">
  <caption>Audio codec được FLAC hỗ trợ</caption>
  <thead>
    <tr>
      <th rowspan="2" scope="row" style="vertical-align: bottom">Codec</th>
      <th colspan="4" scope="col" style="text-align: center">Hỗ trợ trình duyệt</th>
    </tr>
    <tr>
      <th scope="col">Chrome</th>
      <th scope="col">Edge</th>
      <th scope="col">Firefox</th>
      <th scope="col">Safari</th>
    </tr>
  </thead>
  <tbody>
    <tr><th scope="row">FLAC</th><td></td><td></td><td>Yes</td><td></td></tr>
  </tbody>
</table>

### MPEG/MPEG-2

Định dạng tệp **[MPEG-1](https://en.wikipedia.org/wiki/MPEG-1)** và **[MPEG-2](https://en.wikipedia.org/wiki/MPEG-2)** về cơ bản là giống nhau.
Được tạo bởi Moving Picture Experts Group (MPEG), các định dạng này được dùng rộng rãi trong phương tiện vật lý, bao gồm cả định dạng video trên đĩa DVD.

Trên Internet, ứng dụng phổ biến nhất của chuẩn MPEG có lẽ là dữ liệu âm thanh [MPEG-1 Audio Layer III](https://en.wikipedia.org/wiki/MPEG-1), thường gọi là MP3. Các tệp MP3 này rất phổ biến trên các thiết bị nghe nhạc số trên toàn thế giới, dù MPEG-1 và MPEG-2, xét toàn bộ, không được dùng rộng rãi trong nội dung web khác.

Khác biệt chính giữa MPEG-1 và MPEG-2 nằm ở các định dạng dữ liệu media chứ không phải ở định dạng container.
MPEG-1 được giới thiệu năm 1992; MPEG-2 được giới thiệu năm 1996.

| Âm thanh     | Video        |
| ------------ | ------------ |
| `audio/mpeg` | `video/mpeg` |

<table class="standard-table">
  <caption>Video codec được MPEG-1 và MPEG-2 hỗ trợ</caption>
  <thead>
    <tr>
      <th rowspan="2" scope="row" style="vertical-align: bottom">Codec</th>
      <th colspan="4" scope="col" style="text-align: center">Hỗ trợ trình duyệt</th>
    </tr>
    <tr><th scope="col">Chrome</th><th scope="col">Edge</th><th scope="col">Firefox</th><th scope="col">Safari</th></tr>
  </thead>
  <tbody>
    <tr><th scope="row">MPEG-1 Part 2</th><td></td><td></td><td>No</td><td></td></tr>
    <tr><th scope="row">MPEG-2 Part 2</th><td></td><td></td><td>No</td><td></td></tr>
  </tbody>
</table>

<table class="standard-table">
  <caption>Audio codec được MPEG-1 và MPEG-2 hỗ trợ</caption>
  <thead>
    <tr>
      <th rowspan="2" scope="row" style="vertical-align: bottom">Codec</th>
      <th colspan="4" scope="col" style="text-align: center">Hỗ trợ trình duyệt</th>
    </tr>
    <tr><th scope="col">Chrome</th><th scope="col">Edge</th><th scope="col">Firefox</th><th scope="col">Safari</th></tr>
  </thead>
  <tbody>
    <tr><th scope="row">MPEG-1 Audio Layer I</th><td></td><td></td><td>No</td><td></td></tr>
    <tr><th scope="row">MPEG-1 Audio Layer II</th><td></td><td></td><td>No</td><td></td></tr>
    <tr><th scope="row">MPEG-1 Audio Layer III (MP3)</th><td></td><td></td><td>Yes</td><td></td></tr>
  </tbody>
</table>

### MPEG-4 (MP4)

**[MPEG-4](https://en.wikipedia.org/wiki/MPEG-4)** (**MP4**) là phiên bản mới nhất của định dạng tệp MPEG.
Có hai phiên bản của định dạng này, được định nghĩa trong các phần 1 và 14 của đặc tả.
MP4 là một container phổ biến hiện nay vì nó hỗ trợ một số codec được dùng nhiều nhất và được hỗ trợ rộng rãi.

Định dạng tệp gốc MPEG-4 Part 1 được giới thiệu năm 1999; phiên bản 2, được định nghĩa trong Part 14, được bổ sung năm 2003.
Định dạng tệp MP4 được dẫn xuất từ [ISO base media file format](https://en.wikipedia.org/wiki/ISO_base_media_file_format), vốn lại được dẫn xuất trực tiếp từ [QuickTime file format](https://en.wikipedia.org/wiki/QuickTime_File_Format) do [Apple](https://www.apple.com/) phát triển.

Khi chỉ định media type MPEG-4 (`audio/mp4` hoặc `video/mp4`), bạn có thể [thêm tham số `codecs`](/en-US/docs/Web/Media/Guides/Formats/codecs_parameter#iso_base_media_file_format_mp4_quicktime_and_3gp) vào chuỗi MIME type để chỉ ra codec nào được dùng cho các track âm thanh và/hoặc video, đồng thời tùy chọn cung cấp chi tiết về profile, level và/hoặc các thông số cấu hình codec khác.

| Âm thanh    | Video       |
| ----------- | ----------- |
| `audio/mp4` | `video/mp4` |

Các MIME type này là các kiểu cơ bản của media container MPEG-4; các MIME type khác có thể được dùng tùy theo codec cụ thể đang nằm trong container.
Ngoài ra, bạn có thể [thêm tham số `codecs`](/en-US/docs/Web/Media/Guides/Formats/codecs_parameter#iso_base_media_file_format_mp4_quicktime_and_3gp) vào chuỗi MIME type để chỉ ra codec nào được dùng cho các track âm thanh và/hoặc video, đồng thời tùy chọn cung cấp chi tiết về profile, level và/hoặc các thông số cấu hình codec khác.

<table class="standard-table">
  <caption>Video codec được MPEG-4 hỗ trợ</caption>
  <thead><tr><th rowspan="2" scope="row" style="vertical-align: bottom">Codec</th><th colspan="4" scope="col" style="text-align: center">Hỗ trợ trình duyệt</th></tr><tr><th scope="col">Chrome</th><th scope="col">Edge</th><th scope="col">Firefox</th><th scope="col">Safari</th></tr></thead>
  <tbody>
    <tr><th scope="row">AVC (H.264)</th><td></td><td></td><td><p>Yes</p><p>Hỗ trợ H.264 của Firefox phụ thuộc vào hạ tầng media tích hợp sẵn của hệ điều hành, nên khả dụng miễn là hệ điều hành hỗ trợ.</p></td><td></td></tr>
    <tr><th scope="row">AV1</th><td></td><td></td><td><p>Yes</p><p>Hỗ trợ AV1 của Firefox bị tắt trên Windows on ARM (bật bằng cách đặt tùy chọn <code>media.av1.enabled</code> thành <code>true</code>).</p></td><td></td></tr>
    <tr><th scope="row">H.263</th><td></td><td></td><td>No</td><td></td></tr>
    <tr><th scope="row">MPEG-4 Part 2 Visual</th><td></td><td></td><td>No</td><td></td></tr>
    <tr><th scope="row">VP9</th><td></td><td></td><td>Yes</td><td></td></tr>
  </tbody>
</table>

<table class="standard-table">
  <caption>Audio codec được MPEG-4 hỗ trợ</caption>
  <thead><tr><th rowspan="2" scope="row" style="vertical-align: bottom">Codec</th><th colspan="4" scope="col" style="text-align: center">Hỗ trợ trình duyệt</th></tr><tr><th scope="col">Chrome</th><th scope="col">Edge</th><th scope="col">Firefox</th><th scope="col">Safari</th></tr></thead>
  <tbody>
    <tr><th scope="row">AAC</th><td></td><td></td><td><p>Yes</p><p>Hỗ trợ H.264 của Firefox phụ thuộc vào hạ tầng media tích hợp sẵn của hệ điều hành, nên khả dụng miễn là hệ điều hành hỗ trợ.</p></td><td></td></tr>
    <tr><th scope="row">FLAC</th><td></td><td></td><td>Yes</td><td></td></tr>
    <tr><th scope="row">MPEG-1 Audio Layer III (MP3)</th><td></td><td></td><td>Yes</td><td></td></tr>
    <tr><th scope="row">Opus</th><td></td><td></td><td>Yes</td><td></td></tr>
  </tbody>
</table>

### Ogg

Định dạng container [Ogg](https://en.wikipedia.org/wiki/Ogg) là một định dạng tự do và mở, được duy trì bởi [Xiph.org Foundation](https://www.xiph.org/).
Khung Ogg cũng định nghĩa các định dạng dữ liệu media không bị ràng buộc bởi bằng sáng chế, chẳng hạn như codec video Theora và các codec âm thanh Vorbis và Opus.
[Tài liệu của Xiph.org về định dạng Ogg](https://xiph.org/ogg/) có sẵn trên trang web của họ.

Mặc dù Ogg đã tồn tại rất lâu, nó chưa bao giờ giành được mức hỗ trợ rộng đến mức trở thành lựa chọn đầu tiên tốt cho media container.
Thông thường bạn sẽ tốt hơn nếu dùng WebM, mặc dù đôi khi Ogg vẫn hữu ích, chẳng hạn khi bạn muốn hỗ trợ các phiên bản Firefox và Chrome cũ chưa hỗ trợ WebM.
Ví dụ, Firefox 3.5 và 3.6 hỗ trợ Ogg nhưng không hỗ trợ WebM.

Bạn có thể tìm thêm thông tin về Ogg và các codec của nó trong [Theora Cookbook](https://archive.flossmanuals.net/ogg-theora/).

| Âm thanh    | Video       |
| ----------- | ----------- |
| `audio/ogg` | `video/ogg` |

MIME type `application/ogg` có thể được dùng khi bạn không nhất thiết biết media có chứa âm thanh hay video.
Nếu có thể, bạn nên dùng một trong các kiểu cụ thể, nhưng hãy rơi về `application/ogg` nếu bạn không biết định dạng nội dung là gì.

Bạn cũng có thể [thêm tham số `codecs`](/en-US/docs/Web/Media/Guides/Formats/codecs_parameter) vào chuỗi MIME type để chỉ ra codec nào được dùng cho các track âm thanh và/hoặc video, đồng thời mô tả thêm định dạng media của track.

<table class="standard-table">
  <caption>Video codec được Ogg hỗ trợ</caption>
  <thead><tr><th rowspan="2" scope="row" style="vertical-align: bottom">Codec</th><th colspan="4" scope="col" style="text-align: center">Hỗ trợ trình duyệt</th></tr><tr><th scope="col">Chrome</th><th scope="col">Edge</th><th scope="col">Firefox</th><th scope="col">Safari</th></tr></thead>
  <tbody>
    <tr><th scope="row">Theora</th><td></td><td></td><td>Yes</td><td></td></tr>
    <tr><th scope="row">VP8</th><td></td><td></td><td>Yes</td><td></td></tr>
    <tr><th scope="row">VP9</th><td></td><td></td><td>Yes</td><td></td></tr>
  </tbody>
</table>

<table class="standard-table">
  <caption>Audio codec được Ogg hỗ trợ</caption>
  <thead><tr><th rowspan="2" scope="row" style="vertical-align: bottom">Codec</th><th colspan="4" scope="col" style="text-align: center">Hỗ trợ trình duyệt</th></tr><tr><th scope="col">Chrome</th><th scope="col">Edge</th><th scope="col">Firefox</th><th scope="col">Safari</th></tr></thead>
  <tbody>
    <tr><th scope="row">FLAC</th><td></td><td></td><td>Yes</td><td></td></tr>
    <tr><th scope="row">Opus</th><td>Yes</td><td>Yes</td><td>Yes</td><td>Yes</td></tr>
    <tr><th scope="row">Vorbis</th><td></td><td></td><td>Yes</td><td>Yes</td></tr>
  </tbody>
</table>

> [!WARNING]
> Tệp âm thanh Ogg Opus dài hơn 12h 35m 39s sẽ bị cắt ngắn và có lỗi khi tua trên Firefox Linux 64 bit ([Firefox bug 1810378](https://bugzil.la/1810378)).

> [!NOTE]
> Safari 18.4+ (trên macOS 15.4+, iOS 18.4+, iPadOS 18.4+, và visionOS 2.4+) đã bổ sung hỗ trợ codec Opus và Vorbis trong container Ogg.

### QuickTime

Định dạng tệp **QuickTime** (**QTFF**, **QT**, hoặc **MOV**) được Apple tạo ra để dùng cho framework media cùng tên của hãng.
Phần mở rộng của các tệp này, `.mov`, xuất phát từ việc định dạng ban đầu được dùng cho phim và thường được gọi là định dạng "QuickTime movie".
Mặc dù QTFF là nền tảng cho định dạng tệp MPEG-4, vẫn có những khác biệt và hai định dạng này không hoàn toàn thay thế cho nhau.

Tệp QuickTime hỗ trợ mọi loại dữ liệu theo thời gian, bao gồm âm thanh, video, track văn bản, v.v.
Tệp QuickTime chủ yếu được hỗ trợ bởi macOS, nhưng trong nhiều năm, QuickTime cho Windows vẫn có sẵn để truy cập chúng trên Windows.
Tuy nhiên, QuickTime cho Windows không còn được Apple hỗ trợ từ đầu năm 2016 và _không nên dùng_, do đã biết có các lo ngại bảo mật.
Tuy vậy, Windows Media Player hiện đã tích hợp hỗ trợ cho các tệp QuickTime phiên bản 2.0 trở về trước; hỗ trợ cho các phiên bản sau cần thêm phần bổ trợ của bên thứ ba.

Trên Mac OS, framework QuickTime không chỉ hỗ trợ các tệp movie và codec định dạng QuickTime, mà còn hỗ trợ một loạt codec âm thanh và video phổ biến cũng như chuyên dụng, cùng các định dạng ảnh tĩnh.
Thông qua QuickTime, các ứng dụng Mac (bao gồm cả trình duyệt web, thông qua plugin QuickTime hoặc tích hợp trực tiếp) có thể đọc và ghi các định dạng âm thanh như AAC, AIFF, MP3, PCM và Qualcomm PureVoice; và các định dạng video như AVI, DV, Pixlet, ProRes, FLAC, Cinepak, 3GP, H.261 đến H.265, MJPEG, MPEG-1 và MPEG-4 Part 2, Sorenson, và nhiều định dạng khác.

Ngoài ra còn có một số thành phần bên thứ ba cho QuickTime, trong đó một số bổ sung hỗ trợ codec khác.

Vì hỗ trợ QuickTime, về thực tế, chủ yếu chỉ có trên thiết bị Apple, nên nó không còn được dùng rộng rãi trên Internet nữa.
Apple hiện nói chung dùng MP4 cho video.
Ngoài ra, framework QuickTime đã bị deprecate trên Mac từ lâu, và hoàn toàn không còn có sẵn начиная từ macOS 10.15 Catalina.

| Video             |
| ----------------- |
| `video/quicktime` |

MIME type `video/quicktime` là kiểu cơ bản cho media container QuickTime.
Lưu ý rằng QuickTime (framework media trên hệ điều hành Mac) hỗ trợ rất nhiều container và codec, nên thực tế nó còn hỗ trợ nhiều MIME type khác.

Bạn có thể [thêm tham số `codecs`](/en-US/docs/Web/Media/Guides/Formats/codecs_parameter#iso_base_media_file_format_mp4_quicktime_and_3gp) vào chuỗi MIME type để chỉ ra codec nào được dùng cho các track âm thanh và/hoặc video, đồng thời tùy chọn cung cấp chi tiết về profile, level và/hoặc các thông số cấu hình codec khác.

<table class="standard-table">
  <caption>Video codec được QuickTime hỗ trợ</caption>
  <thead><tr><th rowspan="2" scope="row" style="vertical-align: bottom">Codec</th><th colspan="4" scope="col" style="text-align: center">Hỗ trợ trình duyệt</th></tr><tr><th scope="col">Chrome</th><th scope="col">Edge</th><th scope="col">Firefox</th><th scope="col">Safari</th></tr></thead>
  <tbody>
    <tr><th scope="row">AVC (H.264)</th><td></td><td></td><td>No</td><td></td></tr>
    <tr><th scope="row">Cinepak</th><td></td><td></td><td>No</td><td></td></tr>
    <tr><th scope="row">Component Video</th><td></td><td></td><td>No</td><td></td></tr>
    <tr><th scope="row">DV</th><td></td><td></td><td>No</td><td></td></tr>
    <tr><th scope="row">H.261</th><td></td><td></td><td>No</td><td></td></tr>
    <tr><th scope="row">H.263</th><td></td><td></td><td>No</td><td></td></tr>
    <tr><th scope="row">MPEG-2</th><td></td><td></td><td>No</td><td></td></tr>
    <tr><th scope="row">MPEG-4 Part 2 Visual</th><td></td><td></td><td>No</td><td></td></tr>
    <tr><th scope="row">Motion JPEG</th><td></td><td></td><td>No</td><td></td></tr>
    <tr><th scope="row">Sorenson Video 2</th><td></td><td></td><td>No</td><td></td></tr>
    <tr><th scope="row">Sorenson Video 3</th><td></td><td></td><td>No</td><td></td></tr>
  </tbody>
</table>

<table class="standard-table">
  <caption>Audio codec được QuickTime hỗ trợ</caption>
  <thead><tr><th rowspan="2" scope="row" style="vertical-align: bottom">Codec</th><th colspan="4" scope="col" style="text-align: center">Hỗ trợ trình duyệt</th></tr><tr><th scope="col">Chrome</th><th scope="col">Edge</th><th scope="col">Firefox</th><th scope="col">Safari</th></tr></thead>
  <tbody>
    <tr><th scope="row">AAC</th><td></td><td></td><td>No</td><td></td></tr>
    <tr><th scope="row">ALaw 2:1</th><td></td><td></td><td>No</td><td></td></tr>
    <tr><th scope="row">Apple Lossless (ALAC)</th><td></td><td></td><td>No</td><td></td></tr>
    <tr><th scope="row">HE-AAC</th><td></td><td></td><td>No</td><td></td></tr>
    <tr><th scope="row">MPEG-1 Audio Layer III (MP3)</th><td></td><td></td><td>No</td><td></td></tr>
    <tr><th scope="row">Microsoft ADPCM</th><td></td><td></td><td>No</td><td></td></tr>
    <tr><th scope="row">µ-Law 2:1 (u-Law)</th><td></td><td></td><td>No</td><td></td></tr>
  </tbody>
</table>

### WAVE (WAV)

**Waveform Audio File Format** (**WAVE**), thường được gọi là WAV do phần mở rộng tệp của nó là `.wav`, là một định dạng do Microsoft và IBM phát triển để lưu trữ dữ liệu bitstream âm thanh.

Nó được dẫn xuất từ Resource Interchange File Format (RIFF), và vì thế tương tự các định dạng khác như AIFF của Apple.
Sổ đăng ký codec WAV có thể tìm thấy tại {{RFC(2361)}}; tuy nhiên, vì gần như tất cả tệp WAV đều dùng linear PCM, hỗ trợ cho các codec khác rất thưa thớt.

Định dạng WAVE được phát hành lần đầu năm 1991.

| Âm thanh         |
| ---------------- |
| `audio/wave`     |
| `audio/wav`      |
| `audio/x-wav`    |
| `audio/x-pn-wav` |

MIME type `audio/wave` là kiểu chuẩn và được ưu tiên; tuy nhiên, các kiểu khác đã được nhiều sản phẩm dùng trong nhiều năm và cũng có thể dùng trong một số môi trường.

<table class="standard-table">
  <caption>Audio codec được WAVE hỗ trợ</caption>
  <thead><tr><th rowspan="2" scope="row" style="vertical-align: bottom">Codec</th><th colspan="4" scope="col" style="text-align: center">Hỗ trợ trình duyệt</th></tr><tr><th scope="col">Chrome</th><th scope="col">Edge</th><th scope="col">Firefox</th><th scope="col">Safari</th></tr></thead>
  <tbody>
    <tr><th scope="row">ADPCM (Adaptive Differential Pulse Code Modulation)</th><td></td><td></td><td>No</td><td></td></tr>
    <tr><th scope="row">GSM 06.10</th><td></td><td></td><td>No</td><td></td></tr>
    <tr><th scope="row">LPCM (Linear Pulse Code Modulation)</th><td></td><td></td><td>Yes</td><td></td></tr>
    <tr><th scope="row">MPEG-1 Audio Layer III (MP3)</th><td></td><td></td><td>No</td><td></td></tr>
    <tr><th scope="row">µ-Law (u-Law)</th><td></td><td></td><td>No</td><td></td></tr>
  </tbody>
</table>

### WebM

**[WebM](https://en.wikipedia.org/wiki/WebM)** (**Web Media**) là một định dạng dựa trên [Matroska](https://en.wikipedia.org/wiki/Matroska), được thiết kế riêng cho việc sử dụng trong các môi trường web hiện đại.
Nó hoàn toàn dựa trên các công nghệ tự do và mở, và chủ yếu dùng các codec cũng tự do và mở, mặc dù một số sản phẩm cũng hỗ trợ codec khác trong container WebM.

WebM lần đầu được giới thiệu năm 2010 và hiện được hỗ trợ rộng rãi.
Các triển khai WebM tuân chuẩn phải hỗ trợ video codec VP8 và VP9 cùng audio codec Vorbis và Opus.
Định dạng container WebM và các codec bắt buộc của nó đều có sẵn dưới giấy phép mở.
Bất kỳ codec nào khác có thể yêu cầu giấy phép để dùng.

| Âm thanh     | Video        |
| ------------ | ------------ |
| `audio/webm` | `video/webm` |

<table class="standard-table">
  <caption>Video codec được WebM hỗ trợ</caption>
  <thead><tr><th rowspan="2" scope="row" style="vertical-align: bottom">Codec</th><th colspan="4" scope="col" style="text-align: center">Hỗ trợ trình duyệt</th></tr><tr><th scope="col">Chrome</th><th scope="col">Edge</th><th scope="col">Firefox</th><th scope="col">Safari</th></tr></thead>
  <tbody>
    <tr><th scope="row">AV1</th><td>Yes</td><td>Yes</td><td>
      <p>Yes</p>
      <p>Hỗ trợ AV1 của Firefox được bổ sung trên macOS trong Firefox 66; trên Windows trong Firefox 67; và trên Linux trong Firefox 68. Firefox for Android hiện chưa hỗ trợ AV1; cách triển khai của Firefox được thiết kế để dùng một tiến trình an toàn, nhưng trên Android hiện chưa được hỗ trợ.</p>
    </td><td></td></tr>
    <tr><th scope="row">VP8</th><td>Yes</td><td>Yes</td><td>Yes</td><td>Yes</td></tr>
    <tr><th scope="row">VP9</th><td>Yes</td><td>Yes</td><td>Yes</td><td>Yes</td></tr>
  </tbody>
</table>

<table class="standard-table">
  <caption>Audio codec được WebM hỗ trợ</caption>
  <thead><tr><th rowspan="2" scope="row" style="vertical-align: bottom">Codec</th><th colspan="4" scope="col" style="text-align: center">Hỗ trợ trình duyệt</th></tr><tr><th scope="col">Chrome</th><th scope="col">Edge</th><th scope="col">Firefox</th><th scope="col">Safari</th></tr></thead>
  <tbody>
    <tr><th scope="row">Opus</th><td>Yes</td><td>Yes</td><td>Yes</td><td>Yes</td></tr>
    <tr><th scope="row">Vorbis</th><td>Yes</td><td>Yes</td><td>Yes</td><td>Yes</td></tr>
  </tbody>
</table>

## Chọn container phù hợp

Có một vài yếu tố cần cân nhắc khi chọn container tốt nhất để dùng cho media của bạn.
Tầm quan trọng tương đối của từng yếu tố sẽ phụ thuộc vào nhu cầu của bạn, yêu cầu về giấy phép, và yêu cầu tương thích của đối tượng người dùng mục tiêu.

### Nguyên tắc chung

Khi chọn định dạng media phù hợp, quyết định của bạn nên dựa trên cách sử dụng dự định. Phát media khác với ghi hoặc chỉnh sửa media. Với thao tác xử lý, các định dạng chưa nén có thể cải thiện hiệu năng, trong khi nén không mất dữ liệu ngăn việc tích tụ nhiễu do nén lặp lại.

- Nếu đối tượng của bạn có khả năng bao gồm người dùng di động, đặc biệt là trên thiết bị cấu hình thấp hoặc mạng chậm, hãy cân nhắc cung cấp một phiên bản media trong container 3GP với mức nén phù hợp.
- Nếu bạn có yêu cầu mã hóa cụ thể, hãy chắc chắn container bạn chọn hỗ trợ các codec phù hợp.
- Nếu bạn muốn media của mình ở định dạng mở, không độc quyền, hãy cân nhắc dùng một trong các định dạng container mở như FLAC (cho âm thanh) hoặc WebM (cho video).
- Nếu vì lý do nào đó bạn chỉ có thể cung cấp media trong một định dạng duy nhất, hãy chọn định dạng có phạm vi hỗ trợ rộng nhất trên thiết bị và trình duyệt, chẳng hạn MP3 (cho âm thanh) hoặc MP4 (cho video và/hoặc âm thanh).
- Nếu media của bạn chỉ là âm thanh, việc chọn định dạng chỉ dành cho âm thanh thường là hợp lý. Xem bên dưới để so sánh các định dạng chỉ-âm thanh khác nhau.

### Lời khuyên khi chọn container

Các bảng dưới đây đưa ra gợi ý container nên dùng trong nhiều tình huống.
Đây chỉ là các đề xuất.
Hãy cân nhắc nhu cầu của ứng dụng và tổ chức của bạn trước khi chọn một định dạng container.

#### Tệp chỉ âm thanh

<table>
  <thead>
    <tr>
      <th>Nhu cầu</th>
      <th>Định dạng</th>
      <th>Mô tả</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>Tệp nén cho phát lại đa dụng</strong></td>
      <td><strong>MP3 (MPEG-1 Audio Layer III)</strong></td>
      <td>Tương thích rộng rãi và dễ nhận diện; dùng nén mất dữ liệu để đạt sự cân bằng tốt giữa kích thước tệp và chất lượng âm thanh.</td>
    </tr>
    <tr>
      <td rowspan="2"><strong>Nén không mất dữ liệu</strong></td>
      <td><strong>FLAC (Free Lossless Audio Codec)</strong></td>
      <td>Cung cấp nén không mất dữ liệu, đảm bảo âm thanh gốc được giữ nguyên trong khi vẫn giảm kích thước tệp.</td>
    </tr>
    <tr>
      <td><strong>ALAC (Apple Lossless Audio Codec)</strong></td>
      <td>Tương tự FLAC nhưng được thiết kế cho thiết bị Apple; đây là lựa chọn dự phòng tốt khi làm việc trong hệ sinh thái Apple.</td>
    </tr>
    <tr>
      <td rowspan="2"><strong>Tệp không nén</strong></td>
      <td><strong>WAV (Waveform Audio File Format)</strong></td>
      <td>Chứa âm thanh PCM không nén, cho độ trung thực cao nhất nhưng đổi lại là kích thước tệp lớn hơn.</td>
    </tr>
    <tr>
      <td><strong>AIFF (Audio Interchange File Format)</strong></td>
      <td>Tương đương WAV về chất lượng và kích thước tệp, dù thường được ưa chuộng hơn trên nền tảng Apple.</td>
    </tr>
  </tbody>
</table>

Hiện nay khi các bằng sáng chế của MP3 đã hết hiệu lực, việc chọn định dạng âm thanh đã trở nên dễ hơn nhiều.
Bạn không còn phải lựa chọn giữa khả năng tương thích rộng của MP3 và việc phải trả tiền bản quyền khi dùng nó.

Đáng tiếc là không có định dạng nén không mất dữ liệu nào trong hai định dạng lớn là FLAC và ALAC được hỗ trợ hoàn toàn ở mọi nơi.
FLAC được hỗ trợ rộng hơn trong hai định dạng này, nhưng không được macOS hỗ trợ nếu không cài thêm phần mềm, và không được hỗ trợ trên iOS.
Nếu bạn cần cung cấp âm thanh không mất dữ liệu, có thể bạn sẽ phải cung cấp cả FLAC lẫn ALAC để tiến gần hơn đến khả năng tương thích toàn diện.

#### Tệp video

<table>
  <thead>
    <tr>
      <th>Nhu cầu</th>
      <th>Định dạng</th>
      <th>Mô tả</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>Video mục đích chung (ưu tiên định dạng mở)</strong></td>
      <td><strong>WebM</strong></td>
      <td>Được thiết kế cho việc sử dụng web hiện đại, WebM là một container mở, không thu phí bản quyền, cung cấp khả năng nén hiệu quả và hỗ trợ gốc trong hầu hết trình duyệt.</td>
    </tr>
    <tr>
      <td><strong>Video mục đích chung</strong></td>
      <td><strong>MP4</strong></td>
      <td>MP4 là tiêu chuẩn công nghiệp cho nội dung video, được hỗ trợ rộng rãi trên thiết bị và trình duyệt.</td>
    </tr>
    <tr>
      <td><strong>Nén cao cho kết nối chậm</strong></td>
      <td><strong>3GP</strong></td>
      <td>Được tối ưu cho thiết bị di động và môi trường băng thông thấp, 3GP cho chất lượng video chấp nhận được trong điều kiện hạn chế.</td>
    </tr>
    <tr>
      <td><strong>Tương thích với thiết bị/trình duyệt cũ</strong></td>
      <td><strong>QuickTime</strong></td>
      <td>QuickTime là một container cũ vốn phổ biến trên nền tảng Apple. Nó vẫn thường được phần mềm ghi hình video trên macOS tạo ra.</td>
    </tr>
  </tbody>
</table>

Những gợi ý này dựa trên một số giả định.
Bạn nên cân nhắc kỹ các lựa chọn trước khi đưa ra quyết định cuối cùng, đặc biệt nếu bạn có nhiều media cần mã hóa.
Rất thường xuyên, bạn sẽ muốn cung cấp nhiều tùy chọn dự phòng cho các định dạng này, ví dụ MP4 làm dự phòng cho WebM hoặc 3GP, hoặc AVI làm dự phòng cho QuickTime.

## Tối đa hóa khả năng tương thích với nhiều container

Để tối ưu khả năng tương thích, bạn nên cân nhắc cung cấp nhiều hơn một phiên bản của tệp media, dùng phần tử {{HTMLElement("source")}} để chỉ định từng nguồn trong phần tử {{HTMLElement("audio")}} hoặc {{HTMLElement("video")}}.
Ví dụ, bạn có thể cung cấp video Ogg hoặc WebM làm lựa chọn đầu tiên, với bản dự phòng ở định dạng MP4.
Bạn thậm chí có thể cung cấp thêm một bản dự phòng kiểu retro như QuickTime hoặc AVI để tăng độ an toàn.

Để làm điều này, bạn tạo một phần tử `<video>` (hoặc `<audio>`) không có thuộc tính [`src`](/en-US/docs/Web/HTML/Reference/Elements/video#src).
Sau đó thêm các phần tử con {{HTMLElement("source")}} vào bên trong phần tử `<video>`, mỗi phần tử cho một phiên bản video bạn cung cấp.
Bạn có thể dùng cách này để cung cấp nhiều phiên bản video khác nhau, được chọn tùy theo băng thông sẵn có, nhưng trong trường hợp này chúng ta dùng nó để cung cấp các tùy chọn định dạng.

Trong ví dụ dưới đây, video được cung cấp cho trình duyệt ở hai định dạng: WebM và MP4.

{{InteractiveExample("HTML Demo: &lt;source&gt;", "tabbed-standard")}}

```html interactive-example
<video controls width="250" height="200" muted>
  <source src="/shared-assets/videos/flower.webm" type="video/webm" />
  <source src="/shared-assets/videos/flower.mp4" type="video/mp4" />
  Tải xuống video
  <a href="/shared-assets/videos/flower.webm">WEBM</a>
  hoặc
  <a href="/shared-assets/videos/flower.mp4">MP4</a>.
</video>
```

Video được cung cấp trước ở định dạng WebM (với thuộc tính [`type`](/en-US/docs/Web/HTML/Reference/Elements/source#type) đặt là `video/webm`).
Nếu {{Glossary("user agent")}} không phát được định dạng đó, nó sẽ chuyển sang lựa chọn tiếp theo, với `type` là `video/mp4`.
Nếu không phát được cả hai, dòng chữ "This browser does not support the HTML video element." sẽ được hiển thị.

## Đặc tả

| Đặc tả                                                                                                                                                       | Ghi chú                                                                                                           |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------- |
| [ETSI 3GPP](https://portal.3gpp.org/desktopmodules/Specifications/SpecificationDetails.aspx?specificationId=1441)                                            | Định nghĩa định dạng container 3GP                                                                                |
| [ISO/IEC 14496-3](https://www.iso.org/standard/53943.html) (MPEG-4 Part 3 Audio)                                                                             | Định nghĩa âm thanh MP4 bao gồm ADTS                                                                              |
| [FLAC Format](https://xiph.org/flac/format.html)                                                                                                             | Đặc tả định dạng FLAC                                                                                             |
| [ISO/IEC 11172-1](https://www.iso.org/standard/19180.html) (MPEG-1 Part 1 Systems)                                                                           | Định nghĩa định dạng container MPEG-1                                                                             |
| [ISO/IEC 13818-1](https://www.iso.org/standard/74427.html) (MPEG-2 Part 1 Systems)                                                                           | Định nghĩa định dạng container MPEG-2                                                                             |
| [ISO/IEC 14496-14](https://www.iso.org/standard/75929.html) (MPEG-4 Part 14: MP4 file format)                                                                | Định nghĩa định dạng container MPEG-4 (MP4) phiên bản 2                                                           |
| [ISO/IEC 14496-1](https://www.iso.org/standard/55688.html) (MPEG-4 Part 1 Systems)                                                                           | Định nghĩa định dạng container MPEG-4 (MP4) gốc                                                                   |
| {{RFC(3533)}}                                                                                                                                                | Định nghĩa định dạng container Ogg                                                                                |
| {{RFC(5334)}}                                                                                                                                                | Định nghĩa media type và phần mở rộng tệp của Ogg                                                                 |
| [QuickTime File Format Specification](https://developer.apple.com/documentation/quicktime-file-format)                                                       | Định nghĩa định dạng movie QuickTime (MOV)                                                                        |
| [Multimedia Programming Interface and Data Specifications 1.0](https://web.archive.org/web/20090417165828/http://www.kk.iij4u.or.jp/~kondo/wave/mpidata.txt) | Thứ gần nhất với một đặc tả WAV chính thức                                                                        |
| [Resource Interchange File Format](https://learn.microsoft.com/en-us/windows/win32/xaudio2/resource-interchange-file-format--riff-) (used by WAV)            | Định nghĩa định dạng RIFF; tệp WAVE là một dạng RIFF                                                              |
| [WebM Container Guidelines](https://www.webmproject.org/docs/container/)                                                                                     | Hướng dẫn thích nghi Matroska cho WebM                                                                            |
| [Matroska Specifications](https://www.matroska.org/index.html)                                                                                               | Đặc tả của định dạng container Matroska mà WebM dựa trên                                                          |
| [WebM Byte Stream Format](https://w3c.github.io/media-source/webm-byte-stream-format.html)                                                                   | Định dạng byte stream WebM để dùng với [Media Source Extensions](/en-US/docs/Web/API/Media_Source_Extensions_API) |

## Khả năng tương thích trình duyệt

<table class="standard-table">
  <thead>
    <tr>
      <th rowspan="2" scope="row" style="vertical-align: bottom">Tên định dạng container</th>
      <th colspan="3" scope="col" style="text-align: center; border-right: 2px solid #d4dde4">Âm thanh</th>
      <th colspan="3" scope="col" style="text-align: center">Video</th>
    </tr>
    <tr>
      <th scope="col" style="vertical-align: bottom">MIME type</th>
      <th scope="col" style="vertical-align: bottom">Phần mở rộng</th>
      <th scope="col" style="vertical-align: bottom; border-right: 2px solid #d4dde4">Hỗ trợ trình duyệt</th>
      <th scope="col" style="vertical-align: bottom">MIME type</th>
      <th scope="col" style="vertical-align: bottom">Phần mở rộng</th>
      <th scope="col" style="vertical-align: bottom; border-right: 2px solid #d4dde4">Hỗ trợ trình duyệt</th>
    </tr>
  </thead>
  <tbody>
    <tr><th scope="row" style="vertical-align: bottom">3GP</th><td style="vertical-align: top"><code>audio/3gpp</code></td><td style="vertical-align: top"><code>.3gp</code></td><td style="vertical-align: top; border-right: 2px solid #d4dde4">Firefox</td><td style="vertical-align: top"><code>video/3gpp</code></td><td style="vertical-align: top"><code>.3gp</code></td><td style="vertical-align: top">Firefox</td></tr>
    <tr><th scope="row" style="vertical-align: top">ADTS (Audio Data Transport Stream)</th><td style="vertical-align: top"><code>audio/aac</code></td><td style="vertical-align: top"><code>.aac</code></td><td style="vertical-align: top; border-right: 2px solid #d4dde4">Firefox</td><td style="vertical-align: top">—</td><td style="vertical-align: top">—</td><td style="vertical-align: top">—</td></tr>
    <tr><th scope="row" style="vertical-align: top">FLAC</th><td style="vertical-align: top"><code>audio/flac</code></td><td style="vertical-align: top"><code>.flac</code></td><td style="vertical-align: top; border-right: 2px solid #d4dde4">Firefox</td><td style="vertical-align: top">—</td><td style="vertical-align: top">—</td><td style="vertical-align: top">—</td></tr>
    <tr><th rowspan="2" scope="row" style="vertical-align: top">MPEG-1 / MPEG-2 (MPG or MPEG)</th><td style="vertical-align: top"><code>audio/mpeg</code></td><td style="vertical-align: top"><code>.mpg</code><br /><code>.mpeg</code></td><td style="vertical-align: top; border-right: 2px solid #d4dde4">Firefox</td><td rowspan="2" style="vertical-align: top"><code>video/mpeg</code></td><td rowspan="2" style="vertical-align: top"><code>.mpg</code><br /><code>.mpeg</code></td><td rowspan="2" style="vertical-align: top">Firefox</td></tr>
    <tr><td style="vertical-align: top"><code>audio/mp3</code></td><td style="vertical-align: top"><code>.mp3</code></td><td style="vertical-align: top; border-right: 2px solid #d4dde4">Firefox</td></tr>
    <tr><th scope="row" style="vertical-align: top">MPEG-4 (MP4)</th><td style="vertical-align: top"><code>audio/mp4</code></td><td style="vertical-align: top"><code>.mp4</code><br /><code>.m4a</code></td><td style="vertical-align: top; border-right: 2px solid #d4dde4">Firefox</td><td style="vertical-align: top"><code>video/mp4</code></td><td style="vertical-align: top"><code>.mp4</code><br /><code>.m4v</code><br /><code>.m4p</code></td><td style="vertical-align: top">Firefox</td></tr>
    <tr><th scope="row" style="vertical-align: top">Ogg</th><td style="vertical-align: top"><code>audio/ogg</code></td><td style="vertical-align: top"><code>.oga</code><br /><code>.ogg</code></td><td style="vertical-align: top; border-right: 2px solid #d4dde4">Firefox, Safari</td><td style="vertical-align: top"><code>video/ogg</code></td><td style="vertical-align: top"><code>.ogv</code><br /><code>.ogg</code></td><td style="vertical-align: top">Firefox</td></tr>
    <tr><th scope="row" style="vertical-align: top">QuickTime Movie (MOV)</th><td style="vertical-align: top">—</td><td style="vertical-align: top">—</td><td style="vertical-align: top; border-right: 2px solid #d4dde4">—</td><td style="vertical-align: top"><code>video/quicktime</code></td><td style="vertical-align: top"><code>.mov</code></td><td style="vertical-align: top">Safari</td></tr>
    <tr><th scope="row" style="vertical-align: top">WAV (Waveform Audio File)</th><td style="vertical-align: top"><code>audio/wav</code></td><td style="vertical-align: top"><code>.wav</code></td><td style="vertical-align: top; border-right: 2px solid #d4dde4">Firefox</td><td style="vertical-align: top">—</td><td style="vertical-align: top">—</td><td style="vertical-align: top">—</td></tr>
    <tr><th scope="row" style="vertical-align: top">WebM</th><td style="vertical-align: top"><code>audio/webm</code></td><td style="vertical-align: top"><code>.webm</code></td><td style="vertical-align: top; border-right: 2px solid #d4dde4">Firefox</td><td style="vertical-align: top"><code>video/webm</code></td><td style="vertical-align: top"><code>.webm</code></td><td style="vertical-align: top">Firefox</td></tr>
  </tbody>
</table>

## Xem thêm

- [WebRTC API](/en-US/docs/Web/API/WebRTC_API)
- [MediaStream Recording API](/en-US/docs/Web/API/MediaStream_Recording_API)
- Các phần tử {{HTMLElement("audio")}} và {{HTMLElement("video")}}
  \*\*\* End Patch
