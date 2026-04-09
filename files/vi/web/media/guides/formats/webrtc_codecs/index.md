---
title: Codec được dùng bởi WebRTC
slug: Web/Media/Guides/Formats/WebRTC_codecs
page-type: guide
sidebar: mediasidebar
---

[WebRTC API](/en-US/docs/Web/API/WebRTC_API) cho phép tạo ra các website và ứng dụng giúp người dùng giao tiếp theo thời gian thực, sử dụng âm thanh và/hoặc video, cùng với dữ liệu tùy chọn và các thông tin khác. Để giao tiếp, hai thiết bị cần có khả năng thống nhất một codec mà cả hai đều hiểu cho từng track để có thể giao tiếp thành công và hiển thị media được chia sẻ. Hướng dẫn này xem xét các codec mà trình duyệt bắt buộc phải triển khai, cũng như các codec khác mà một số hoặc tất cả trình duyệt hỗ trợ cho WebRTC.

## Media không có vùng chứa

WebRTC sử dụng trực tiếp các đối tượng {{domxref("MediaStreamTrack")}} cho từng track được chia sẻ từ một bên ngang hàng sang bên ngang hàng khác, không có vùng chứa hay thậm chí một {{domxref("MediaStream")}} gắn với các track đó. Những codec nào có thể nằm trong các track đó không được quy định bởi đặc tả WebRTC. Tuy nhiên, {{RFC(7742)}} quy định rằng tất cả trình duyệt tương thích WebRTC phải hỗ trợ [VP8](/en-US/docs/Web/Media/Guides/Formats/Video_codecs#vp8) và hồ sơ Constrained Baseline của [H.264](/en-US/docs/Web/Media/Guides/Formats/Video_codecs#avc_h.264) cho video, còn {{RFC(7874)}} quy định rằng trình duyệt phải hỗ trợ ít nhất codec [Opus](/en-US/docs/Web/Media/Guides/Formats/Audio_codecs#opus) cũng như các định dạng PCMA và PCMU của [G.711](/en-US/docs/Web/Media/Guides/Formats/Audio_codecs#g.711_pulse_code_modulation_of_voice_frequencies).

Hai RFC này cũng nêu ra các tùy chọn phải được hỗ trợ cho từng codec, cũng như các tính năng phục vụ sự thoải mái của người dùng như khử tiếng vọng. Hướng dẫn này xem xét các codec mà trình duyệt bắt buộc phải triển khai, cũng như các codec khác mà một số hoặc tất cả trình duyệt hỗ trợ cho WebRTC.

Mặc dù nén luôn là điều bắt buộc khi làm việc với media trên web, nó còn đặc biệt quan trọng trong hội nghị truyền hình để đảm bảo người tham gia có thể giao tiếp mà không bị trễ hoặc gián đoạn. Điều quan trọng thứ hai là cần giữ đồng bộ video và âm thanh, որպեսզի các chuyển động và mọi thông tin bổ trợ (chẳng hạn như slide hay hình chiếu) được hiển thị cùng lúc với âm thanh tương ứng.

## Yêu cầu codec chung

Trước khi xem xét các khả năng và yêu cầu theo từng codec, có một vài yêu cầu tổng thể mà _mọi_ cấu hình codec dùng với WebRTC đều phải đáp ứng.

Trừ khi {{Glossary("SDP")}} chỉ rõ điều khác, trình duyệt web nhận một luồng video WebRTC phải có khả năng xử lý video ở 20 FPS với độ phân giải tối thiểu 320 pixel ngang và 240 pixel dọc. Nên mã hóa video ở tốc độ khung hình và kích thước không thấp hơn mức đó, vì đó gần như là giới hạn dưới của những gì WebRTC thường được kỳ vọng xử lý.

SDP hỗ trợ một cách chỉ định độc lập với codec cho độ phân giải video được ưu tiên ({{RFC(6236)}}). Điều này được thực hiện bằng cách gửi thuộc tính SDP `a=image-attr` để chỉ ra độ phân giải tối đa có thể chấp nhận. Tuy nhiên, phía gửi không bắt buộc phải hỗ trợ cơ chế này, vì vậy bạn phải sẵn sàng nhận media ở độ phân giải khác với độ phân giải đã yêu cầu. Ngoài yêu cầu về độ phân giải tối đa này, các codec cụ thể có thể cung cấp thêm cách khác để yêu cầu cấu hình media cụ thể.

## Codec video được hỗ trợ

WebRTC thiết lập một bộ codec nền tảng mà tất cả trình duyệt tuân thủ đều phải hỗ trợ. Một số trình duyệt cũng có thể cho phép các codec khác.

Dưới đây là các codec video được _yêu cầu_ trong bất kỳ trình duyệt nào tuân thủ WebRTC đầy đủ, cùng với các hồ sơ bắt buộc và các trình duyệt thực sự đáp ứng yêu cầu đó.

<table class="standard-table">
  <caption>
    Các codec video bắt buộc
  </caption>
  <thead>
    <tr>
      <th scope="row">Tên codec</th>
      <th scope="col">Hồ sơ</th>
      <th scope="col">Khả năng tương thích trình duyệt</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th id="vp8_table" scope="row"><a href="#vp8">VP8</a></th>
      <td>—</td>
      <td><p>Chrome, Edge, Firefox, Safari (12.1+)</p>
        <p>
          Firefox 134 hỗ trợ VP8 cho <a href="/en-US/docs/Web/API/WebRTC_API/Protocols#simulcast">simulcast</a>.
          Firefox 136+ hỗ trợ <a href="/en-US/docs/Web/API/WebRTC_API/Protocols#dependency_descriptor_rtp_header_extension">phần mở rộng tiêu đề DD RTP</a> với VP8.
        </p>
      </td>
    </tr>
    <tr>
      <th id="h264_table" scope="row"><a href="#avc_h.264">AVC / H.264</a></th>
      <td>Constrained Baseline (CB)</td>
      <td>
        <p>Chrome (52+), Edge, Firefox, Safari</p>
        <p>
          <ul>
            <li>Firefox 137+ hỗ trợ <a href="/en-US/docs/Web/API/WebRTC_API/Protocols#dependency_descriptor_rtp_header_extension">phần mở rộng tiêu đề DD RTP</a> với H264 trên máy tính để bàn.
            Firefox trên Android không hỗ trợ tiêu đề DD (<a href="https://bugzil.la/1947116">lỗi Firefox 1947116</a>).</li>
            <li>Firefox 136+ hỗ trợ H.264 cho simulcast.</li>
            <li>Firefox cho Android 73+ có hỗ trợ phần cứng.</li>
            <li>Các phiên bản Firefox cho Android từ 68 đến 72 không hỗ trợ H.264 (do thay đổi trong <a href="https://support.mozilla.org/en-US/kb/firefox-android-openh264">yêu cầu của Google Play Store</a> khiến Firefox không thể tải xuống và cài đặt codec OpenH264 cần để xử lý H.264 trong các kết nối WebRTC).</li>
          </ul>
        </p>
      </td>
    </tr>
  </tbody>
</table>

Để biết chi tiết về các cân nhắc liên quan đến WebRTC cho từng codec, hãy xem các mục con bên dưới bằng cách theo các liên kết trên tên của từng codec.

Chi tiết đầy đủ về những codec video và cấu hình mà WebRTC bắt buộc phải hỗ trợ có thể tìm thấy trong {{RFC(7742, "WebRTC Video Processing and Codec Requirements")}}. Cần lưu ý rằng RFC này bao quát nhiều yêu cầu liên quan đến video, bao gồm không gian màu (sRGB là không gian màu mặc định được ưu tiên, nhưng không bắt buộc), các khuyến nghị cho tính năng xử lý webcam (tự động lấy nét, tự động cân bằng trắng, tự động điều chỉnh mức sáng), v.v.

> [!NOTE]
> Các yêu cầu này dành cho trình duyệt web và các sản phẩm khác tuân thủ WebRTC đầy đủ. Các sản phẩm không phải WebRTC nhưng có thể giao tiếp với WebRTC ở một mức độ nào đó có thể hoặc không thể hỗ trợ các codec này, mặc dù các tài liệu đặc tả khuyến khích họ làm như vậy.

Ngoài các codec bắt buộc, một số trình duyệt còn hỗ trợ thêm các codec khác. Những codec đó được liệt kê trong bảng sau.

<table class="standard-table">
  <caption>
    Các codec video khác
  </caption>
  <thead>
    <tr>
      <th scope="row">Tên codec</th>
      <th scope="col">Hồ sơ</th>
      <th scope="col">Khả năng tương thích trình duyệt</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th id="vp9_table" scope="row">VP9</th>
      <td>—</td>
      <td>
        <p>Chrome (48+), Firefox</p>
        <p>Firefox không hỗ trợ VP9 cho simulcast theo mặc định (<a href="https://bugzil.la/1633876">lỗi Firefox 1633876</a>).
        Firefox 136+ hỗ trợ <a href="/en-US/docs/Web/API/WebRTC_API/Protocols#dependency_descriptor_rtp_header_extension">phần mở rộng tiêu đề DD RTP</a> với VP9.
        </p>
      </td>
    </tr>
    <tr>
      <th id="av1_table" scope="row"><a href="#av1">AV1</a></th>
      <td>—</td>
      <td>
        <p>Chrome (113+), Firefox (136+)</p>
        <p>Firefox 136 hỗ trợ AV1 cho simulcast và <a href="/en-US/docs/Web/API/WebRTC_API/Protocols#dependency_descriptor_rtp_header_extension">phần mở rộng tiêu đề DD RTP</a>.</p>
      </td>
    </tr>
  </tbody>
</table>

### VP8

VP8, mà chúng tôi [mô tả khái quát](/en-US/docs/Web/Media/Guides/Formats/Video_codecs#vp8) trong [hướng dẫn chính về codec video dùng trên web](/en-US/docs/Web/Media/Guides/Formats/Video_codecs), có một số yêu cầu cụ thể cần tuân theo khi dùng nó để mã hóa hoặc giải mã một track video trên kết nối WebRTC.

Trừ khi được chỉ rõ điều khác, VP8 sẽ dùng pixel vuông (nghĩa là pixel có {{glossary("aspect ratio")}} 1:1).

#### Ghi chú khác

Định dạng tải trọng mạng để chia sẻ VP8 bằng {{Glossary("RTP")}} (chẳng hạn khi dùng WebRTC) được mô tả trong {{RFC(7741, "RTP Payload Format for VP8 Video")}}.

### AVC / H.264

Hỗ trợ hồ sơ Constrained Baseline (CB) của AVC là bắt buộc trong mọi triển khai WebRTC tuân thủ đầy đủ. CB là một tập con của hồ sơ chính và được thiết kế riêng cho các ứng dụng có độ phức tạp thấp, độ trễ thấp như video trên thiết bị di động và hội nghị truyền hình, cũng như cho các nền tảng có năng lực xử lý video thấp hơn.

Phần [tổng quan về AVC](/en-US/docs/Web/Media/Guides/Formats/Video_codecs#avc_h.264) và các tính năng của nó có trong hướng dẫn chính về codec video.

#### Yêu cầu hỗ trợ tham số đặc biệt

AVC cung cấp rất nhiều tham số để điều khiển các giá trị tùy chọn. Để cải thiện độ tin cậy của việc chia sẻ media WebRTC trên nhiều nền tảng và trình duyệt, các đầu cuối WebRTC hỗ trợ AVC bắt buộc phải xử lý một số tham số theo những cách cụ thể. Đôi khi điều này có nghĩa là một tham số phải (hoặc không được) được hỗ trợ. Đôi khi nó có nghĩa là phải yêu cầu một giá trị cụ thể cho tham số, hoặc cho phép một tập giá trị cụ thể. Và đôi khi các yêu cầu còn phức tạp hơn.

##### Các tham số hữu ích nhưng không bắt buộc

Các tham số này không nhất thiết phải được đầu cuối WebRTC hỗ trợ, và việc sử dụng chúng cũng không bắt buộc. Việc dùng chúng có thể cải thiện trải nghiệm người dùng theo nhiều cách, nhưng không phải lúc nào cũng cần dùng. Thực tế, một số tham số trong số này khá phức tạp để sử dụng.

- `max-br`
  - : Nếu được chỉ định và phần mềm hỗ trợ, tham số `max-br` chỉ định tốc độ bit video tối đa, tính theo đơn vị 1.000 bps cho VCL và 1.200 bps cho NAL. Bạn có thể xem chi tiết về điều này trên [trang 47 của RFC 6184](https://datatracker.ietf.org/doc/html/rfc6184#page-47).
- `max-cpb`
  - : Nếu được chỉ định và phần mềm hỗ trợ, `max-cpb` chỉ định kích thước bộ đệm khung hình mã hóa tối đa. Đây là một tham số khá phức tạp với kích thước đơn vị có thể thay đổi. Xem [trang 45 của RFC 6184](https://datatracker.ietf.org/doc/html/rfc6184#page-45) để biết chi tiết.
- `max-dpb`
  - : Nếu được chỉ định và hỗ trợ, `max-dpb` cho biết kích thước bộ đệm khung hình đã giải mã tối đa, tính theo đơn vị macroblock 8/3. Xem [RFC 6184, trang 46](https://datatracker.ietf.org/doc/html/rfc6184#page-46) để biết thêm chi tiết.
- `max-fs`
  - : Nếu được chỉ định và phần mềm hỗ trợ, `max-fs` chỉ định kích thước tối đa của một khung video đơn lẻ, được tính theo số macroblock.
- `max-mbps`
  - : Nếu được chỉ định và phần mềm hỗ trợ, giá trị này là một số nguyên chỉ định tốc độ tối đa mà macroblock phải được xử lý mỗi giây (tính theo macroblock mỗi giây).
- `max-smbps`
  - : Nếu được chỉ định và phần mềm hỗ trợ, tham số này chỉ định một số nguyên biểu thị tốc độ xử lý macroblock tĩnh tối đa theo macroblock tĩnh mỗi giây (giả định lý thuyết rằng tất cả macroblock đều là macroblock tĩnh).

##### Các tham số có yêu cầu cụ thể

Các tham số này có thể được yêu cầu hoặc không, nhưng có một số yêu cầu đặc biệt khi được dùng.

- `packetization-mode`
  - : Tất cả các đầu cuối đều phải hỗ trợ chế độ 1 (chế độ không xen kẽ). Việc hỗ trợ các chế độ packetization khác là tùy chọn, và bản thân tham số cũng không bắt buộc phải được chỉ định.
- `sprop-parameter-sets`
  - : Thông tin chuỗi và khung hình cho AVC có thể được gửi trong băng hoặc ngoài băng. Khi AVC được dùng với WebRTC, thông tin này _phải_ được báo hiệu trong băng; do đó, tham số `sprop-parameter-sets` _không được_ đưa vào SDP.

##### Các tham số phải được chỉ định

Các tham số này phải được chỉ định bất cứ khi nào dùng AVC trong một kết nối WebRTC.

- `profile-level-id`
  - : Tất cả các triển khai WebRTC đều _phải_ chỉ định và diễn giải tham số này trong SDP của chúng, để xác định phân hồ sơ mà codec sử dụng. Giá trị cụ thể được đặt không được xác định; điều quan trọng là tham số này phải được dùng. Điều này đáng lưu ý vì trong {{RFC(6184)}} ("RTP Payload Format for H.264 Video"), `profile-level-id` hoàn toàn là tùy chọn.

#### Các yêu cầu khác

Để hỗ trợ chuyển đổi giữa hướng dọc và hướng ngang, có hai phương pháp có thể dùng. Phương pháp đầu tiên là phần mở rộng tiêu đề video orientation (CVO) cho giao thức RTP. Tuy nhiên, nếu điều này không được báo hiệu là được hỗ trợ trong SDP, thì nên khuyến khích trình duyệt hỗ trợ các thông điệp Display Orientation SEI, dù không bắt buộc.

Trừ khi được báo hiệu khác, tỷ lệ khung hình điểm ảnh là 1:1, tức là các pixel là hình vuông.

#### Ghi chú khác

Định dạng payload dùng cho AVC trong WebRTC được mô tả trong {{RFC(6184, "RTP Payload Format for H.264 Video")}}. Các triển khai AVC cho WebRTC bắt buộc phải hỗ trợ các thông điệp SEI đặc biệt "filler payload" và "full frame freeze"; chúng được dùng để hỗ trợ chuyển đổi mượt mà giữa nhiều luồng đầu vào.

### AV1

AV1 được [mô tả khái quát](/en-US/docs/Web/Media/Guides/Formats/Video_codecs#av1) trong [hướng dẫn chính về codec video dùng trên web](/en-US/docs/Web/Media/Guides/Formats/Video_codecs).

#### Phần mở rộng tiêu đề RTP Dependency Descriptor

WebRTC hỗ trợ hai công nghệ chính để gửi video hiệu quả cho những người nhận đang hoạt động với các khả năng và điều kiện mạng khác nhau.

AV1 dùng [phần mở rộng tiêu đề RTP Dependency Descriptor (DD)](/en-US/docs/Web/API/WebRTC_API/Protocols#dependency_descriptor_rtp_header_extension) để cung cấp thông tin phụ thuộc khung hình cần thiết nhằm hỗ trợ [các trường hợp sử dụng hội nghị nhiều bên](/en-US/docs/Web/API/WebRTC_API/Protocols#multi-party_video_conferencing).

## Codec âm thanh được hỗ trợ

Các codec âm thanh mà {{RFC(7874)}} yêu cầu mọi trình duyệt tương thích WebRTC phải hỗ trợ được hiển thị trong bảng dưới đây.

<table class="standard-table">
  <caption>
    Các codec âm thanh bắt buộc
  </caption>
  <thead>
    <tr>
      <th scope="row">Tên codec</th>
      <th scope="col">Khả năng tương thích trình duyệt</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">
        <a href="/en-US/docs/Web/Media/Guides/Formats/Audio_codecs#opus">Opus</a>
      </th>
      <td>Chrome, Edge, Firefox, Safari</td>
    </tr>
    <tr>
      <th scope="row">
        <a
          href="/en-US/docs/Web/Media/Guides/Formats/Audio_codecs#g.711_pulse_code_modulation_of_voice_frequencies"
          >G.711 PCM (A-law)</a
        >
      </th>
      <td>Chrome, Firefox, Safari</td>
    </tr>
    <tr>
      <th scope="row">
        <a
          href="/en-US/docs/Web/Media/Guides/Formats/Audio_codecs#g.711_pulse_code_modulation_of_voice_frequencies"
          >G.711 PCM (µ-law)</a
        >
      </th>
      <td>Chrome, Firefox, Safari</td>
    </tr>
  </tbody>
</table>

Xem bên dưới để biết thêm chi tiết về mọi cân nhắc cụ thể cho WebRTC tồn tại cho từng codec được liệt kê ở trên.

Điều hữu ích cần lưu ý là {{RFC(7874)}} không chỉ định nghĩa một danh sách codec âm thanh mà một trình duyệt tuân thủ WebRTC phải hỗ trợ; nó còn đưa ra các khuyến nghị và yêu cầu cho những tính năng âm thanh đặc biệt như khử tiếng vọng, giảm nhiễu và cân bằng mức âm thanh.

> [!NOTE]
> Danh sách ở trên cho biết bộ codec tối thiểu mà tất cả các đầu cuối tương thích WebRTC phải triển khai. Một trình duyệt nhất định cũng có thể hỗ trợ các codec khác; tuy nhiên, khả năng tương thích đa nền tảng và đa thiết bị có thể gặp rủi ro nếu bạn dùng codec khác mà không kiểm tra kỹ rằng hỗ trợ tồn tại trong mọi trình duyệt mà người dùng của bạn có thể chọn.

Ngoài các codec âm thanh bắt buộc, một số trình duyệt còn hỗ trợ thêm các codec khác. Những codec đó được liệt kê trong bảng sau.

<table class="standard-table">
  <caption>
    Các codec âm thanh khác
  </caption>
  <thead>
    <tr>
      <th scope="row">Tên codec</th>
      <th scope="col">Khả năng tương thích trình duyệt</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">G.722</th>
      <td>Chrome, Firefox, Safari</td>
    </tr>
    <tr>
      <th scope="row">iLBC</th>
      <td>Chrome, Safari</td>
    </tr>
    <tr>
      <th scope="row">iSAC</th>
      <td>Chrome, Safari</td>
    </tr>
  </tbody>
</table>

**[Internet Low Bitrate Codec](https://en.wikipedia.org/wiki/Internet_Low_Bitrate_Codec)** (**iLBC**) là một codec băng hẹp mã nguồn mở do Global IP Solutions và sau này là Google phát triển, được thiết kế riêng cho việc truyền phát âm thanh giọng nói. Google và một số nhà phát triển trình duyệt khác đã áp dụng nó cho WebRTC.

**[Internet Speech Audio Codec](https://en.wikipedia.org/wiki/Internet_Speech_Audio_Codec)** (**iSAC**) là một codec khác do Global IP Solutions phát triển và nay thuộc sở hữu của Google, công ty đã phát hành mã nguồn mở cho nó. Nó được dùng bởi Google Talk, QQ và các ứng dụng nhắn tin tức thời khác, và được thiết kế riêng cho các truyền tải giọng nói được đóng gói trong một luồng RTP.

**[Comfort noise](https://en.wikipedia.org/wiki/Comfort_noise)** (**CN**) là một dạng tiếng ồn nền nhân tạo được dùng để lấp đầy khoảng trống trong truyền dẫn thay vì dùng im lặng tuyệt đối. Điều này giúp tránh hiệu ứng giật có thể xảy ra khi kích hoạt bằng giọng nói và các tính năng tương tự làm luồng tạm thời ngừng gửi dữ liệu - một khả năng được gọi là Discontinuous Transmission (DTX). Trong {{RFC(3389)}}, có một phương pháp cung cấp phần lấp đầy thích hợp để dùng trong các khoảng im lặng.

Comfort Noise được dùng với G.711, và cũng có thể được dùng với các codec khác không có tính năng CN tích hợp. Ví dụ, Opus đã có sẵn khả năng CN riêng; vì vậy, không khuyến nghị dùng RFC 3389 CN với codec Opus.

Người gửi âm thanh không bao giờ bắt buộc phải dùng discontinuous transmission hoặc comfort noise.

### Opus

Định dạng Opus, được định nghĩa bởi {{RFC(6716)}}, là định dạng chính cho âm thanh trong WebRTC. Định dạng payload RTP cho Opus nằm trong {{RFC(7587)}}. Bạn có thể tìm thêm thông tin tổng quát về Opus và các khả năng của nó, cũng như cách các API khác có thể hỗ trợ Opus, trong [mục tương ứng](/en-US/docs/Web/Media/Guides/Formats/Audio_codecs#opus) của [hướng dẫn về codec âm thanh dùng trên web](/en-US/docs/Web/Media/Guides/Formats/Audio_codecs).

Cả chế độ speech và chế độ âm thanh tổng quát đều nên được hỗ trợ. Khả năng mở rộng và tính linh hoạt của Opus rất hữu ích khi làm việc với âm thanh có thể có mức độ phức tạp thay đổi. Việc hỗ trợ tín hiệu stereo trong băng cho phép hỗ trợ stereo mà không làm phức tạp quá trình tách kênh.

Toàn bộ dải tốc độ bit mà Opus hỗ trợ (6 kbps đến 510 kbps) đều được hỗ trợ trong WebRTC, và tốc độ bit có thể thay đổi linh động. Tốc độ bit cao hơn thường cải thiện chất lượng.

#### Khuyến nghị tốc độ bit

Với kích thước khung hình 20 mili giây, bảng sau cho thấy các tốc độ bit được khuyến nghị cho các dạng media khác nhau.

| Loại media                        | Phạm vi tốc độ bit được khuyến nghị |
| --------------------------------- | ----------------------------------- |
| Giọng nói hẹp băng (NB)           | 8 đến 12 kbps                       |
| Giọng nói rộng băng (WB)          | 16 đến 20 kbps                      |
| Giọng nói toàn băng (FB)          | 28 đến 40 kbps                      |
| Nhạc đơn âm toàn băng (FB mono)   | 48 đến 64 kbps                      |
| Nhạc stereo toàn băng (FB stereo) | 64 đến 128 kbps                     |

Tốc độ bit có thể được điều chỉnh bất cứ lúc nào. Để tránh tắc nghẽn mạng, tốc độ bit âm thanh trung bình không nên vượt quá băng thông mạng sẵn có (trừ đi mọi yêu cầu băng thông bổ sung khác đã biết hoặc dự kiến).

### G.711

G.711 định nghĩa định dạng cho âm thanh **Pulse Code Modulation** (**PCM**) như một chuỗi các mẫu số nguyên 8 bit được lấy ở tần số lấy mẫu 8.000 Hz, tạo ra tốc độ bit 64 kbps. Cả mã hóa [µ-law](https://en.wikipedia.org/wiki/M-law) và [A-law](https://en.wikipedia.org/wiki/A-law) đều được phép.

G.711 được [ITU định nghĩa](https://www.itu.int/rec/T-REC-G.711-198811-I/en) và định dạng payload của nó được định nghĩa trong {{RFC(3551, "", "4.5.14")}}.

WebRTC yêu cầu G.711 dùng các mẫu 8 bit ở tốc độ chuẩn 64 kbps, dù G.711 có hỗ trợ một số biến thể khác. Không có G.711.0 (nén không mất dữ liệu), G.711.1 (khả năng dải rộng), hay bất kỳ phần mở rộng nào khác của chuẩn G.711 được WebRTC bắt buộc.

Do tần số lấy mẫu và kích thước mẫu thấp, chất lượng âm thanh G.711 nhìn chung bị coi là kém theo tiêu chuẩn hiện đại, dù nó gần tương đương với âm thanh của điện thoại bàn. Nó thường được dùng như một phương án chung tối thiểu để đảm bảo trình duyệt có thể thiết lập kết nối âm thanh bất kể nền tảng và trình duyệt, hoặc làm phương án dự phòng nói chung.

## Chỉ định và cấu hình codec

### Lấy danh sách codec được hỗ trợ

Vì một trình duyệt và nền tảng nhất định có thể có mức độ sẵn có khác nhau đối với các codec tiềm năng - và có thể hỗ trợ nhiều hồ sơ hoặc mức khác nhau cho cùng một codec - bước đầu tiên khi cấu hình codec cho một {{domxref("RTCPeerConnection")}} là lấy danh sách codec có sẵn. Để làm điều này, trước hết bạn phải thiết lập một kết nối để lấy danh sách đó.

Có một vài cách để làm việc này. Cách hiệu quả nhất là dùng phương thức tĩnh {{domxref("RTCRtpSender/getCapabilities_static", "RTCRtpSender.getCapabilities()")}} (hoặc {{domxref("RTCRtpReceiver/getCapabilities_static", "RTCRtpReceiver.getCapabilities()")}} tương đương cho receiver), với kiểu media làm tham số đầu vào. Ví dụ, để xác định các codec video được hỗ trợ, bạn có thể làm như sau:

```js
codecList = RTCRtpSender.getCapabilities("video").codecs;
```

Bây giờ `codecList` là một mảng các đối tượng [`codec`](/en-US/docs/Web/API/RTCRtpSender/getCapabilities_static#codecs), mỗi đối tượng mô tả một cấu hình codec.
Danh sách cũng sẽ có các mục cho [retransmission](/en-US/docs/Web/API/RTCRtpSender/getCapabilities_static#rtx_retransmission) (RTX), [redundant coding](/en-US/docs/Web/API/RTCRtpSender/getCapabilities_static#red_redundant_audio_data) (RED), và [forward error correction](/en-US/docs/Web/API/RTCRtpSender/getCapabilities_static#fec_forward_error_correction) (FEC).

Nếu kết nối đang trong quá trình khởi động, bạn có thể dùng sự kiện {{domxref("RTCPeerConnection.icegatheringstatechange_event", "icegatheringstatechange")}} để theo dõi việc hoàn tất thu thập candidate {{Glossary("ICE")}}, rồi lấy danh sách.

```js
let codecList = null;

peerConnection.addEventListener("icegatheringstatechange", (event) => {
  if (peerConnection.iceGatheringState === "complete") {
    const senders = peerConnection.getSenders();

    senders.forEach((sender) => {
      if (sender.track.kind === "video") {
        codecList = sender.getParameters().codecs;
      }
    });
  }

  codecList = null;
});
```

Trình xử lý sự kiện cho `icegatheringstatechange` được thiết lập; trong đó, chúng ta kiểm tra xem trạng thái ICE gathering có phải là `complete` hay không, điều đó cho biết sẽ không còn candidate nào nữa được thu thập. Phương thức {{domxref("RTCPeerConnection.getSenders()")}} được gọi để lấy danh sách tất cả các đối tượng {{domxref("RTCRtpSender")}} mà kết nối đang dùng.

Với dữ liệu đó, chúng ta duyệt qua danh sách sender, tìm sender đầu tiên mà {{domxref("MediaStreamTrack")}} của nó cho biết {{domxref("MediaStreamTrack.kind", "kind")}} là `video`, nghĩa là dữ liệu của track đó là media video.
Sau đó, chúng ta gọi phương thức {{domxref("RTCRtpSender.getParameters", "getParameters()")}} của sender đó và đặt `codecList` thành thuộc tính `codecs` trong đối tượng trả về, rồi trả về cho bên gọi.

Nếu không tìm thấy track video nào, chúng ta đặt `codecList` thành `null`.

Khi trả về, `codecList` hoặc là `null` để cho biết không tìm thấy track video nào, hoặc là một mảng các đối tượng {{domxref("RTCCodecStats")}}, mỗi đối tượng mô tả một cấu hình codec được phép. Đặc biệt quan trọng trong các đối tượng này là thuộc tính {{domxref("RTCCodecStats.payloadType", "payloadType")}}, một giá trị một byte xác định duy nhất cấu hình được mô tả.

> [!NOTE]
> Hai phương thức lấy danh sách codec được hiển thị ở đây dùng các kiểu đầu ra khác nhau trong danh sách codec của chúng. Hãy lưu ý điều này khi sử dụng kết quả.

### Tùy chỉnh danh sách codec

Sau khi có danh sách codec khả dụng, bạn có thể thay đổi nó rồi gửi danh sách đã sửa sang {{domxref("RTCRtpTransceiver.setCodecPreferences()")}} để sắp xếp lại danh sách codec. Điều này thay đổi thứ tự ưu tiên của các codec, cho phép bạn yêu cầu WebRTC ưu tiên một codec khác so với các codec còn lại.

```js
function changeVideoCodec(mimeType) {
  const transceivers = peerConnection.getTransceivers();

  transceivers.forEach((transceiver) => {
    const kind = transceiver.sender.track.kind;
    let sendCodecs = RTCRtpSender.getCapabilities(kind).codecs;
    let recvCodecs = RTCRtpReceiver.getCapabilities(kind).codecs;

    if (kind === "video") {
      sendCodecs = preferCodec(mimeType);
      recvCodecs = preferCodec(mimeType);
      transceiver.setCodecPreferences([...sendCodecs, ...recvCodecs]);
    }
  });

  peerConnection.onnegotiationneeded();
}
```

Trong ví dụ này, hàm `changeVideoCodec()` nhận vào MIME type của codec bạn muốn dùng. Mã bắt đầu bằng việc lấy danh sách tất cả các transceiver của {{domxref("RTCPeerConnection")}}.

Sau đó, với mỗi transceiver, chúng ta lấy kiểu media mà transceiver biểu diễn từ thuộc tính {{domxref("MediaStreamTrack.kind", "kind")}} của track thuộc {{domxref("RTCRtpSender")}}. Chúng ta cũng lấy danh sách tất cả codec mà trình duyệt hỗ trợ cho cả việc gửi và nhận video, bằng phương thức tĩnh `getCapabilities()` của cả {{domxref("RTCRtpSender")}} và {{domxref("RTCRtpReceiver")}}.

Nếu media là video, chúng ta gọi một phương thức có tên `preferCodec()` cho cả danh sách codec của sender lẫn receiver; phương thức này sắp xếp lại danh sách codec theo cách chúng ta muốn (xem bên dưới).

Cuối cùng, chúng ta gọi phương thức {{domxref("RTCRtpTransceiver.setCodecPreferences", "setCodecPreferences()")}} của {{domxref("RTCRtpTransceiver")}} để chỉ định rằng các codec gửi và nhận đã cho được phép, theo thứ tự mới đã sắp xếp.

Việc đó được thực hiện cho mỗi transceiver trên `RTCPeerConnection`; khi tất cả transceiver đã được cập nhật, chúng ta gọi trình xử lý sự kiện {{domxref("RTCPeerConnection.negotiationneeded_event", "onnegotiationneeded")}}, sự kiện này sẽ tạo một offer mới, cập nhật mô tả cục bộ, gửi offer đến bên ngang hàng từ xa, v.v., qua đó kích hoạt quá trình thương lượng lại kết nối.

Hàm `preferCodec()` được mã ở trên gọi có dạng như sau để đưa một codec cụ thể lên đầu danh sách (để nó được ưu tiên trong quá trình thương lượng):

```js
function preferCodec(codecs, mimeType) {
  let otherCodecs = [];
  let sortedCodecs = [];
  let count = codecs.length;

  codecs.forEach((codec) => {
    if (codec.mimeType === mimeType) {
      sortedCodecs.push(codec);
    } else {
      otherCodecs.push(codec);
    }
  });

  return sortedCodecs.concat(otherCodecs);
}
```

Mã này chỉ đơn giản là tách danh sách codec thành hai mảng: một mảng chứa các codec có MIME type khớp với MIME type được chỉ định bởi tham số `mimeType`, và một mảng khác chứa tất cả các codec còn lại. Sau khi danh sách được tách ra, chúng được nối lại với nhau sao cho các mục khớp `mimeType` được đặt trước, sau đó là tất cả codec còn lại. Danh sách đã sắp xếp lại được trả về cho bên gọi.

## Codec mặc định

Trừ khi được chỉ định khác, codec mặc định - hay chính xác hơn là codec được ưu tiên - mà mỗi triển khai WebRTC của trình duyệt yêu cầu được hiển thị trong bảng dưới đây.

<table class="standard-table">
  <caption>
    Codec được ưu tiên cho WebRTC trong các trình duyệt web chính
  </caption>
  <thead>
    <tr>
      <th scope="col"></th>
      <th scope="col">Âm thanh</th>
      <th scope="col">Video</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">Chrome</th>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <th scope="row">Edge</th>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <th scope="row">Firefox</th>
      <td></td>
      <td>VP9 (Firefox 46 trở lên)<br />VP8</td>
    </tr>
    <tr>
      <th scope="row">Opera</th>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <th scope="row">Safari</th>
      <td></td>
      <td></td>
    </tr>
  </tbody>
</table>

## Chọn codec phù hợp

Trước khi chọn một codec không nằm trong số các codec bắt buộc (VP8 hoặc AVC cho video và Opus hoặc PCM cho âm thanh), bạn nên cân nhắc nghiêm túc các nhược điểm tiềm tàng: cụ thể là chỉ các codec này mới có thể được giả định chung là có sẵn trên hầu như mọi thiết bị hỗ trợ WebRTC.

Nếu bạn chọn ưu tiên một codec khác thay vì các codec bắt buộc, bạn ít nhất nên cho phép dự phòng sang một codec bắt buộc nếu codec bạn ưu tiên không được hỗ trợ.

### Âm thanh

Nhìn chung, nếu có sẵn và âm thanh bạn muốn gửi có tốc độ lấy mẫu lớn hơn 8 kHz, bạn nên cân nhắc mạnh mẽ dùng Opus làm codec chính. Với các kết nối chỉ có giọng nói trong môi trường hạn chế, dùng G.711 ở tốc độ lấy mẫu 8 kHz có thể mang lại trải nghiệm chấp nhận được cho hội thoại, nhưng thường bạn sẽ dùng G.711 như một lựa chọn dự phòng, vì có những lựa chọn khác hiệu quả hơn và nghe tốt hơn, chẳng hạn như Opus ở chế độ narrowband.

### Video

Có nhiều yếu tố tham gia khi quyết định một codec video (hoặc một bộ codec) để hỗ trợ.

#### Điều khoản cấp phép

Trước khi chọn codec video, hãy chắc chắn rằng bạn biết các yêu cầu cấp phép liên quan đến codec bạn chọn; bạn có thể tìm thông tin về các vấn đề cấp phép tiềm năng trong [hướng dẫn chính về codec video dùng trên web](/en-US/docs/Web/Media/Guides/Formats/Video_codecs). Trong hai codec video bắt buộc - VP8 và AVC/H.264 - chỉ VP8 là hoàn toàn không có yêu cầu cấp phép. Nếu bạn chọn AVC, hãy chắc chắn rằng bạn đã hiểu bất kỳ khoản phí tiềm năng nào có thể phải trả; dù vậy, các chủ sở hữu bằng sáng chế thường cho biết rằng hầu hết nhà phát triển website thông thường không cần lo lắng về việc trả phí cấp phép, vì các khoản này chủ yếu nhắm đến nhà phát triển phần mềm mã hóa và giải mã.

> [!WARNING]
> Thông tin ở đây _không_ cấu thành tư vấn pháp lý! Hãy chắc chắn xác nhận mức độ rủi ro pháp lý của bạn trước khi đưa ra bất kỳ quyết định cuối cùng nào khi có khả năng phát sinh vấn đề cấp phép.

#### Nhu cầu điện năng và tuổi thọ pin

Một yếu tố khác cần cân nhắc - đặc biệt trên nền tảng di động - là tác động mà codec có thể có đến thời lượng pin. Nếu một codec được xử lý bằng phần cứng trên một nền tảng nhất định, codec đó có khả năng cho thời lượng pin tốt hơn nhiều và sinh ít nhiệt hơn.

Ví dụ, Safari cho iOS và iPadOS đã giới thiệu WebRTC với AVC là codec video duy nhất được hỗ trợ. AVC có lợi thế trên iOS và iPadOS là có thể được mã hóa và giải mã bằng phần cứng. Safari 12.1 giới thiệu hỗ trợ VP8 trong WebRTC, giúp cải thiện khả năng tương tác, nhưng đi kèm cái giá - VP8 không có hỗ trợ phần cứng trên thiết bị iOS, nên việc dùng nó làm tăng tác động lên bộ xử lý và làm giảm thời lượng pin.

#### Hiệu năng

May mắn là, từ góc nhìn người dùng cuối, VP8 và AVC hoạt động tương tự nhau, và đều đủ tốt để dùng trong hội nghị truyền hình cùng các giải pháp WebRTC khác. Quyết định cuối cùng là của bạn. Dù bạn chọn gì, hãy chắc chắn đọc thông tin được cung cấp trong bài viết này về bất kỳ vấn đề cấu hình cụ thể nào mà bạn có thể phải xử lý cho codec đó.

Hãy nhớ rằng việc chọn một codec không nằm trong danh sách codec bắt buộc có thể làm tăng nguy cơ chọn một codec không được hỗ trợ bởi trình duyệt mà người dùng của bạn có thể ưu tiên. Xem bài viết [Xử lý các vấn đề hỗ trợ media trong nội dung web](/en-US/docs/Web/Media/Guides/Formats/Support_issues) để tìm hiểu thêm về cách cung cấp hỗ trợ cho codec bạn ưu tiên trong khi vẫn có thể dự phòng cho các trình duyệt không triển khai codec đó.

## Hệ quả bảo mật

Có những vấn đề bảo mật tiềm năng thú vị phát sinh khi chọn và cấu hình codec. Video WebRTC được bảo vệ bằng Datagram Transport Layer Security ({{Glossary("DTLS")}}), nhưng về mặt lý thuyết, một bên có động cơ vẫn có thể suy ra mức độ thay đổi diễn ra từ khung hình này sang khung hình khác khi dùng codec có tốc độ bit biến thiên (VBR), bằng cách theo dõi tốc độ bit của luồng và cách nó thay đổi theo thời gian. Điều này có thể cho phép kẻ xấu suy ra điều gì đó về nội dung của luồng, dựa trên sự lên xuống của tốc độ bit.

Để biết thêm về các cân nhắc bảo mật khi dùng AVC trong WebRTC, xem {{RFC(6184, "RTP Payload Format for H.264 Video: Security Considerations", 9)}}.

## Kiểu media cho định dạng payload RTP

Có thể hữu ích khi tham khảo danh sách {{Glossary("IANA")}} về các kiểu media cho định dạng payload {{Glossary("RTP")}}; đây là một danh sách đầy đủ các kiểu media MIME được định nghĩa để _có thể_ dùng trong các luồng RTP, chẳng hạn như những luồng được dùng trong WebRTC. Phần lớn trong số này không được dùng trong ngữ cảnh WebRTC, nhưng danh sách vẫn có thể hữu ích.

Xem thêm {{RFC(4855)}}, bao quát sổ đăng ký các kiểu media.

## Xem thêm

- [WebRTC API](/en-US/docs/Web/API/WebRTC_API)
- [Giới thiệu về các giao thức WebRTC](/en-US/docs/Web/API/WebRTC_API/Protocols)
- [Kết nối WebRTC](/en-US/docs/Web/API/WebRTC_API/Connectivity)
- [Hướng dẫn về codec video dùng trên web](/en-US/docs/Web/Media/Guides/Formats/Video_codecs)
- [Hướng dẫn về codec âm thanh dùng trên web](/en-US/docs/Web/Media/Guides/Formats/Audio_codecs)
- [Khái niệm video số](/en-US/docs/Web/Media/Guides/Formats/Video_concepts)
- [Khái niệm âm thanh số](/en-US/docs/Web/Media/Guides/Formats/Audio_concepts)
