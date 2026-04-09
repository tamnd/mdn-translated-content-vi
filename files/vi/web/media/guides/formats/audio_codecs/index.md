---
title: Hướng dẫn codec âm thanh web
slug: Web/Media/Guides/Formats/Audio_codecs
page-type: guide
sidebar: mediasidebar
---

Ngay cả âm thanh stereo có độ trung thực cao với chất lượng vừa phải cũng có thể chiếm khá nhiều dung lượng đĩa. Với nhà phát triển web, mối lo lớn hơn nữa là băng thông mạng cần thiết để truyền âm thanh, dù là để phát trực tuyến hay tải xuống để dùng trong trò chơi. Việc xử lý dữ liệu âm thanh để mã hóa và giải mã được thực hiện bởi một **{{Glossary("codec")}}** âm thanh (**CO**der/**DEC**oder). Trong bài viết này, chúng ta sẽ xem các codec âm thanh được dùng trên web để nén và giải nén âm thanh, khả năng và trường hợp sử dụng của chúng, đồng thời đưa ra hướng dẫn khi chọn codec âm thanh cho nội dung của bạn.

Ngoài ra, các triển khai WebRTC thường sử dụng một tập con của các codec này để mã hóa và giải mã media, và cũng có thể hỗ trợ thêm codec khác để đạt hỗ trợ đa nền tảng tối ưu cho hội nghị video và âm thanh, đồng thời tích hợp tốt hơn với các giải pháp viễn thông cũ. Xem [Codec được WebRTC sử dụng](/en-US/docs/Web/Media/Guides/Formats/WebRTC_codecs) để biết chi tiết.

Để biết các khái niệm nền tảng về cách âm thanh số hoạt động, hãy xem bài viết [Khái niệm âm thanh số](/en-US/docs/Web/Media/Guides/Formats/Audio_concepts).

## Các codec phổ biến

Danh sách bên dưới liệt kê các codec được dùng phổ biến nhất trên web và những container (loại tệp) nào hỗ trợ chúng. Nếu tất cả những gì bạn cần biết là codec nào có thể dùng được, phần này dành cho bạn. Tất nhiên, từng trình duyệt có thể chọn hỗ trợ hoặc không hỗ trợ toàn bộ các codec này, và việc chúng hỗ trợ những kiểu container nào cũng có thể khác nhau. Ngoài ra, trình duyệt có thể chọn hỗ trợ thêm những codec không có trong danh sách này.

<table class="standard-table">
  <thead>
    <tr>
      <th scope="row">Tên codec (viết tắt)</th>
      <th scope="col">Tên codec đầy đủ</th>
      <th scope="col">Hỗ trợ container</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row"><a href="#aac_advanced_audio_coding">AAC</a></th>
      <td>Advanced Audio Coding</td>
      <td>
        <a href="/en-US/docs/Web/Media/Guides/Formats/Containers#mpeg-4_mp4">MP4</a>,
        <a href="/en-US/docs/Web/Media/Guides/Formats/Containers#adts">ADTS</a>,
        <a href="/en-US/docs/Web/Media/Guides/Formats/Containers#3gp">3GP</a>
      </td>
    </tr>
    <tr>
      <th scope="row"><a href="#alac_apple_lossless_audio_codec">ALAC</a></th>
      <td>Apple Lossless Audio Codec</td>
      <td>
        <a href="/en-US/docs/Web/Media/Guides/Formats/Containers#mpeg-4_mp4">MP4</a>,
        <a href="/en-US/docs/Web/Media/Guides/Formats/Containers#quicktime"
          >QuickTime</a
        >
        (MOV)
      </td>
    </tr>
    <tr>
      <th scope="row"><a href="#amr_adaptive_multi-rate">AMR</a></th>
      <td>Adaptive Multi-Rate</td>
      <td><a href="/en-US/docs/Web/Media/Guides/Formats/Containers#3gp">3GP</a></td>
    </tr>
    <tr>
      <th scope="row"><a href="#flac_free_lossless_audio_codec">FLAC</a></th>
      <td>Free Lossless Audio Codec</td>
      <td>
        <a href="/en-US/docs/Web/Media/Guides/Formats/Containers#mpeg-4_mp4">MP4</a>,
        <a href="/en-US/docs/Web/Media/Guides/Formats/Containers#ogg">Ogg</a>,
        <a href="/en-US/docs/Web/Media/Guides/Formats/Containers#flac">FLAC</a>
      </td>
    </tr>
    <tr>
      <th scope="row">
        <a href="#g.711_pulse_code_modulation_of_voice_frequencies">G.711</a>
      </th>
      <td>Pulse Code Modulation (PCM) of Voice Frequencies</td>
      <td>
        {{Glossary("RTP")}} /
        <a href="/en-US/docs/Web/API/WebRTC_API">WebRTC</a>
      </td>
    </tr>
    <tr>
      <th scope="row"><a href="#g.722_64_kbps_7_khz_audio_coding">G.722</a></th>
      <td>
        7 kHz Audio Coding Within 64 kbps (for
        telephony/{{Glossary("VoIP")}})
      </td>
      <td>
        {{Glossary("RTP")}} /
        <a href="/en-US/docs/Web/API/WebRTC_API">WebRTC</a>
      </td>
    </tr>
    <tr>
      <th scope="row"><a href="#mp3_mpeg-1_audio_layer_iii">MP3</a></th>
      <td>MPEG-1 Audio Layer III</td>
      <td>
        <a href="/en-US/docs/Web/Media/Guides/Formats/Containers#mpeg-4_mp4">MP4</a>,
        <a href="/en-US/docs/Web/Media/Guides/Formats/Containers#adts">ADTS</a>,
        <a href="/en-US/docs/Web/Media/Guides/Formats/Containers#mpegmpeg-2">MPEG</a>,
        <a href="/en-US/docs/Web/Media/Guides/Formats/Containers#3gp">3GP</a>
        <p>
          Khi dữ liệu codec MPEG-1 Audio Layer III được lưu trong một tệp MPEG
          và tệp đó không có track video, tệp thường được gọi là tệp MP3, dù về
          bản chất nó vẫn là tệp định dạng MPEG.
        </p>
      </td>
    </tr>
    <tr>
      <th scope="row"><a href="#opus">Opus</a></th>
      <td>Opus</td>
      <td>
        <a href="/en-US/docs/Web/Media/Guides/Formats/Containers#webm">WebM</a>,
        <a href="/en-US/docs/Web/Media/Guides/Formats/Containers#mpeg-4_mp4">MP4</a>,
        <a href="/en-US/docs/Web/Media/Guides/Formats/Containers#ogg">Ogg</a>
      </td>
    </tr>
    <tr>
      <th scope="row"><a href="#vorbis">Vorbis</a></th>
      <td>Vorbis</td>
      <td>
        <a href="/en-US/docs/Web/Media/Guides/Formats/Containers#webm">WebM</a>,
        <a href="/en-US/docs/Web/Media/Guides/Formats/Containers#ogg">Ogg</a>
      </td>
    </tr>
  </tbody>
</table>

## Các yếu tố ảnh hưởng đến âm thanh đã mã hóa

Có hai nhóm yếu tố chung ảnh hưởng đến âm thanh đã mã hóa do bộ mã hóa của codec âm thanh xuất ra: chi tiết về định dạng và nội dung của âm thanh nguồn, cùng với codec và cấu hình của nó trong quá trình mã hóa.

Với mỗi yếu tố ảnh hưởng đến âm thanh đã mã hóa, có một quy tắc gần như luôn đúng: vì độ trung thực của âm thanh số được quyết định bởi độ mịn và độ chính xác của các mẫu được lấy để chuyển nó thành luồng dữ liệu, nên dữ liệu dùng để biểu diễn phiên bản số của âm thanh càng nhiều thì âm thanh lấy mẫu càng khớp gần với nguồn gốc.

### Ảnh hưởng của định dạng âm thanh nguồn đến đầu ra âm thanh đã mã hóa

Vì âm thanh đã mã hóa vốn dùng ít bit hơn để biểu diễn mỗi mẫu, định dạng âm thanh nguồn thực ra có thể ảnh hưởng đến kích thước âm thanh đã mã hóa ít hơn bạn tưởng. Tuy vậy, vẫn có một số yếu tố ảnh hưởng đến chất lượng và kích thước của âm thanh đã mã hóa. Bảng dưới đây liệt kê một số yếu tố quan trọng của định dạng tệp âm thanh nguồn và tác động của chúng lên âm thanh đã mã hóa.

<table class="standard-table">
  <caption>
    Ảnh hưởng của định dạng và nội dung âm thanh nguồn đến chất lượng và kích
    thước âm thanh đã mã hóa
  </caption>
  <thead>
    <tr>
      <th scope="row">Đặc điểm</th>
      <th scope="col">Ảnh hưởng đến chất lượng</th>
      <th scope="col">Ảnh hưởng đến kích thước</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">
        <a
          href="/en-US/docs/Web/Media/Guides/Formats/Audio_concepts#audio_data_format_and_structure"
          >Số lượng kênh</a
        >
      </th>
      <td>
        Số lượng kênh chỉ ảnh hưởng đến cảm nhận về hướng âm thanh, chứ không
        ảnh hưởng đến chất lượng.
      </td>
      <td>
        Mỗi kênh có thể làm tăng đáng kể kích thước âm thanh đã mã hóa, tùy
        theo nội dung và thiết lập của bộ mã hóa.
      </td>
    </tr>
    <tr>
      <th scope="row">Nhiễu / Tiếng xì</th>
      <td>
        Tiếng ồn nền hoặc tiếng xì không mong muốn thường làm giảm chất lượng
        âm thanh cả trực tiếp (bằng cách che lấp chi tiết của âm thanh chính)
        lẫn gián tiếp (bằng cách làm dạng sóng âm thanh phức tạp hơn và do đó
        khó giảm kích thước mà vẫn giữ được độ chính xác).
      </td>
      <td>
        Tiếng xì, nhiễu tĩnh hoặc tiếng ồn nền làm tăng độ phức tạp của âm
        thanh, từ đó thường làm giảm lượng nén có thể đạt được.
      </td>
    </tr>
    <tr>
      <th scope="row">
        <a href="/en-US/docs/Web/Media/Guides/Formats/Audio_concepts#sampling_audio"
          >Tốc độ lấy mẫu</a
        >
      </th>
      <td>
        Càng có nhiều mẫu mỗi giây, độ trung thực của âm thanh đã mã hóa càng có
        khả năng cao hơn.
      </td>
      <td>
        Tăng tốc độ lấy mẫu sẽ làm tăng kích thước tệp âm thanh đã mã hóa.
      </td>
    </tr>
    <tr>
      <th scope="row">
        <a
          href="/en-US/docs/Web/Media/Guides/Formats/Audio_concepts#audio_data_format_and_structure"
          >Kích thước mẫu</a
        >
      </th>
      <td>
        Mẫu càng lớn thì mỗi mẫu càng chứa được nhiều chi tiết hơn, dẫn đến biểu
        diễn từng mẫu chính xác hơn.
      </td>
      <td>
        Phụ thuộc vào codec; các codec thường có định dạng mẫu nội bộ có thể
        giống hoặc không giống kích thước mẫu gốc. Nhưng nhiều chi tiết nguồn
        hơn có thể làm tệp đã mã hóa lớn hơn; nó sẽ không bao giờ làm nhỏ hơn.
      </td>
    </tr>
  </tbody>
</table>

Tất nhiên, các tác động này có thể bị thay đổi bởi những quyết định được đưa ra trong quá trình mã hóa âm thanh. Ví dụ, nếu bộ mã hóa được cấu hình để giảm tốc độ lấy mẫu, thì ảnh hưởng của tốc độ lấy mẫu lên tệp đầu ra cũng sẽ giảm tương ứng.

Để biết thêm thông tin về những đặc điểm này và các đặc điểm khác của dữ liệu âm thanh, hãy xem [Định dạng và cấu trúc dữ liệu âm thanh](/en-US/docs/Web/Media/Guides/Formats/Audio_concepts#audio_data_format_and_structure).

### Ảnh hưởng của cấu hình codec đến đầu ra âm thanh đã mã hóa

Codec âm thanh thường dùng các thuật toán toán học được thiết kế khéo léo và rất phức tạp để lấy dữ liệu âm thanh nguồn rồi nén nó xuống mức chiếm ít dung lượng bộ nhớ hoặc băng thông mạng hơn đáng kể. Ngoài việc chọn loại bộ mã hóa sẽ dùng, bạn có thể có cơ hội tinh chỉnh bộ mã hóa bằng các tham số để chọn thuật toán cụ thể, điều chỉnh các thuật toán đó, và chỉ định số lần quét cần áp dụng khi mã hóa.

<table class="standard-table">
  <caption>
    Tác động của cấu hình bộ mã hóa âm thanh đến chất lượng và kích thước
  </caption>
  <thead>
    <tr>
      <th scope="row">Đặc điểm</th>
      <th scope="col">Ảnh hưởng đến chất lượng</th>
      <th scope="col">Ảnh hưởng đến kích thước</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">
        <a
          href="/en-US/docs/Web/Media/Guides/Formats/Audio_concepts#lossy_vs._lossless_compression"
          >Nén không mất dữ liệu</a
        >
      </th>
      <td>Không mất độ trung thực</td>
      <td>Khó đạt mức nén hơn 40-50%</td>
    </tr>
    <tr>
      <th scope="row">
        <a
          href="/en-US/docs/Web/Media/Guides/Formats/Audio_concepts#lossy_vs._lossless_compression"
          >Nén mất dữ liệu</a
        >
      </th>
      <td>
        Luôn có một mức mất độ trung thực nào đó; mức nén càng cao thì mức mất
        càng lớn
      </td>
      <td>Có thể nén tới 80-95%</td>
    </tr>
    <tr>
      <th scope="row">
        <a href="/en-US/docs/Web/Media/Guides/Formats/Audio_concepts#bit_rate"
          >Bitrate</a
        >
      </th>
      <td>Bitrate càng cao thì chất lượng có thể càng cao</td>
      <td>
        Bitrate càng cao thì tệp đã mã hóa càng có xu hướng lớn hơn
      </td>
    </tr>
    <tr>
      <th scope="row">
        <a
          href="/en-US/docs/Web/Media/Guides/Formats/Audio_concepts#audio_frequency_bandwidth"
          >Băng thông tần số âm thanh</a
        >
      </th>
      <td>
        Nếu trong dải tần bị loại bỏ có âm thanh, có thể xảy ra mất độ trung
        thực đáng chú ý
      </td>
      <td>
        Loại bỏ dải tần nghĩa là ít dữ liệu hơn để mã hóa, do đó tệp đã mã hóa
        nhỏ hơn
      </td>
    </tr>
    <tr>
      <th scope="row">
        <a
          href="/en-US/docs/Web/Media/Guides/Formats/Audio_concepts#joint_stereo"
          >Mã hóa stereo</a
        >
      </th>
      <td>
        Stereo đơn giản và
        <a
          href="/en-US/docs/Web/Media/Guides/Formats/Audio_concepts#mid-side_stereo_coding"
          >mã hóa stereo mid-side</a
        >
        không ảnh hưởng đến chất lượng;
        <a
          href="/en-US/docs/Web/Media/Guides/Formats/Audio_concepts#intensity_stereo_coding"
          >mã hóa stereo cường độ</a
        >
        tuy nhiên làm mất chi tiết.
      </td>
      <td>
        Stereo kết hợp có thể giảm kích thước âm thanh đã mã hóa ở một mức nào
        đó
      </td>
    </tr>
  </tbody>
</table>

Các tham số sẵn có, cũng như dải giá trị có thể dùng, khác nhau giữa từng codec, và thậm chí giữa các công cụ mã hóa khác nhau cho cùng một codec, vì vậy hãy đọc tài liệu đi kèm phần mềm mã hóa bạn dùng để biết thêm.

### Các yếu tố ảnh hưởng đến kích thước âm thanh đã mã hóa

Nhiều yếu tố ảnh hưởng đến kích thước âm thanh đã mã hóa. Một số liên quan đến dạng của âm thanh nguồn; số khác liên quan đến các quyết định được đưa ra trong quá trình mã hóa.

#### Codec không mất dữ liệu và codec mất dữ liệu

Có hai nhóm cơ bản của nén âm thanh. Các thuật toán nén **không mất dữ liệu** giảm kích thước âm thanh mà không làm suy giảm chất lượng hay độ trung thực của âm thanh. Khi giải mã âm thanh được nén bằng một codec không mất dữ liệu như [FLAC](#flac_free_lossless_audio_codec) hoặc [ALAC](#alac_apple_lossless_audio_codec), kết quả giống hệt âm thanh gốc trên mọi phương diện, đến từng bit.

Ngược lại, các codec **mất dữ liệu** tận dụng thực tế rằng tai người không phải là bộ giải thích âm thanh hoàn hảo, và não người có thể tách thông tin quan trọng ra khỏi âm thanh không hoàn hảo hoặc có nhiễu. Chúng loại bỏ các tần số âm thanh ít được dùng, chấp nhận mất độ chính xác trong đầu ra đã giải mã, và dùng các phương pháp khác để làm mất nội dung, chất lượng và độ trung thực của âm thanh nhằm tạo ra media đã mã hóa nhỏ hơn. Khi giải mã, đầu ra vẫn ở mức có thể hiểu được, nhưng mức độ sẽ khác nhau. Codec cụ thể được dùng, cùng cấu hình nén được chọn, quyết định mức độ đầu ra nghe giống tín hiệu âm thanh gốc chưa nén đến đâu đối với tai người.

Do cách codec mất dữ liệu hoạt động khác với codec không mất dữ liệu, đặc biệt là việc codec không mất dữ liệu phải thận trọng hơn rất nhiều khi nén, codec mất dữ liệu gần như luôn cho âm thanh nén nhỏ hơn đáng kể so với codec không mất dữ liệu.

Nói chung, những lý do phổ biến nhất để chọn âm thanh không mất dữ liệu là vì bạn cần lưu trữ đạt chất lượng lưu trữ lâu dài, hoặc vì các mẫu âm thanh sẽ được trộn lại và nén lại, và bạn muốn tránh việc các artefact trong âm thanh bị khuếch đại do nén lại. Với truyền phát âm thanh theo thời gian thực, thường phải dùng codec mất dữ liệu để bảo đảm luồng dữ liệu có thể theo kịp tốc độ phát âm thanh bất kể hiệu năng mạng.

### Số kênh tối đa

Âm thanh đưa đến từng loa trong một hệ thống âm thanh được cung cấp bởi một kênh âm thanh trong luồng. Âm đơn là một kênh. Âm stereo là hai kênh. Âm thanh vòm 5.1 có năm kênh âm thanh, cộng thêm một kênh **Low Frequency Enhancement** (**LFE**).

Các kênh LFE được thiết kế riêng để lưu trữ dữ liệu âm thanh tần số thấp, và thường được dùng để cung cấp dữ liệu âm thanh cho loa siêu trầm, chẳng hạn. Khi bạn thấy số lượng kênh âm thanh được viết theo dạng X.Y (như 2.1 hoặc 5.1), con số sau dấu thập phân, Y, là số kênh LFE. Ví dụ, MP3 hỗ trợ một kênh LFE, còn AAC hỗ trợ tối đa 16 kênh.

Ngoài việc cung cấp âm thanh cho các loa cụ thể trong hệ thống âm thanh, một số codec có thể cho phép dùng các kênh âm thanh để cung cấp âm thanh thay thế, chẳng hạn giọng hát bằng ngôn ngữ khác hoặc âm thanh mô tả cho người khiếm thị.

### Băng thông tần số âm thanh

Băng thông tần số âm thanh của một codec cho biết dải tần âm thanh có thể được biểu diễn bằng codec đó. Một số codec hoạt động bằng cách loại bỏ âm thanh nằm ngoài một dải tần nhất định. Có mối tương quan giữa tốc độ lấy mẫu và tần số âm thanh tối đa có thể được biểu diễn bởi dạng sóng mà codec tạo ra. Về mặt lý thuyết, tần số tối đa mà codec có thể biểu diễn bằng một nửa tốc độ lấy mẫu; tần số này được gọi là [tần số Nyquist](https://en.wikipedia.org/wiki/Nyquist_frequency). Trên thực tế, giá trị tối đa hơi thấp hơn một chút, nhưng khá gần.

Băng thông tần số âm thanh thể hiện rất rõ khi một codec được thiết kế hoặc cấu hình để biểu diễn lời nói của con người thay vì một dải âm thanh rộng. Lời nói của con người nói chung nằm trong dải tần từ 300 Hz đến 18 kHz. Tuy nhiên, phần lớn âm phát ra từ giọng người nằm trong khoảng 300 Hz đến 8 kHz, và chỉ cần bắt được đủ phần âm thanh của giọng người trong khoảng 500 Hz đến 3 kHz thì vẫn có thể hiểu được.

Vì lý do đó, các codec dành riêng cho giọng nói thường bắt đầu bằng cách loại bỏ âm thanh nằm ngoài một dải nhất định. Dải đó chính là băng thông tần số âm thanh. Ví dụ, G.722 loại bỏ âm thanh ngoài băng thông tần số âm thanh từ 50 Hz đến 7 kHz. Điều này làm giảm lượng dữ liệu cần được mã hóa ngay từ đầu.

## Chi tiết codec

Bên dưới là cái nhìn ngắn gọn về từng codec, tập trung vào khả năng cơ bản và các trường hợp sử dụng chính của chúng.

### AAC (Advanced Audio Coding)

Codec **Advanced Audio Coding** (**AAC**) được định nghĩa như một phần của tiêu chuẩn MPEG-4 (H.264); cụ thể là trong [MPEG-4 Part 3](https://www.iso.org/standard/53943.html) và [MPEG-2 Part 7](https://www.iso.org/standard/43345.html). Được thiết kế để cung cấp khả năng nén tốt hơn với độ trung thực cao hơn MP3, AAC đã trở thành lựa chọn phổ biến, và là định dạng chuẩn cho âm thanh trong nhiều loại media, bao gồm đĩa Blu-Ray và HDTV, cũng như định dạng dùng cho các bài hát mua từ các nhà cung cấp trực tuyến như iTunes.

AAC có nhiều profile định nghĩa các cách nén âm thanh cho những trường hợp sử dụng cụ thể, từ âm thanh vòm chất lượng cao đến âm thanh chất lượng thấp dành riêng cho lời nói.

Vì là một định dạng vướng bằng sáng chế, mức hỗ trợ AAC hơi khó đoán hơn. Ví dụ, Firefox chỉ hỗ trợ AAC nếu hệ điều hành hoặc một thư viện bên ngoài cung cấp hỗ trợ đó.

<table class="standard-table">
  <tbody>
    <tr>
      <th scope="row">Bitrate được hỗ trợ</th>
      <td>Tùy ý, tới 512 kbps</td>
    </tr>
    <tr>
      <th scope="row">Hỗ trợ bitrate biến thiên (VBR)</th>
      <td>Có</td>
    </tr>
    <tr>
      <th scope="row">Định dạng mẫu được hỗ trợ</th>
      <td>Số nguyên 32-bit</td>
    </tr>
    <tr>
      <th scope="row">Tốc độ lấy mẫu được hỗ trợ</th>
      <td>8 kHz - 96 kHz</td>
    </tr>
    <tr>
      <th scope="row">Bitrate tối thiểu khuyến nghị cho âm stereo</th>
      <td>96 kbps ở tốc độ lấy mẫu 48 kHz</td>
    </tr>
    <tr>
      <th scope="row">Nén</th>
      <td>Mất dữ liệu</td>
    </tr>
    <tr>
      <th scope="row">Số kênh âm thanh tối đa</th>
      <td>48 (cộng thêm 16 kênh Low Frequency Enhancement)</td>
    </tr>
    <tr>
      <th scope="row">Băng thông tần số âm thanh</th>
      <td>
        0 Hz - 96 kHz (kênh âm thanh tiêu chuẩn)<br />0 Hz - 120 Hz (kênh LFE)
      </td>
    </tr>
    <tr>
      <th scope="row">Độ trễ</th>
      <td>20 ms đến 405 ms</td>
    </tr>
    <tr>
      <th scope="row">Tương thích trình duyệt</th>
      <td>
        <p>
          Do các vấn đề bằng sáng chế, Firefox không hỗ trợ AAC trực tiếp. Thay
          vào đó, Firefox dựa vào hỗ trợ AAC gốc của hệ điều hành. Khả năng này
          được giới thiệu ở các bản phát hành Firefox khác nhau trên từng nền
          tảng:
        </p>
        <p>
          Chrome chỉ hỗ trợ AAC trong container MP4, và chỉ hỗ trợ Main Profile
          của AAC. Ngoài ra, AAC không có sẵn trong các bản dựng Chromium.
        </p>
      </td>
    </tr>
    <tr>
      <th scope="row">Hỗ trợ container</th>
      <td>MP4, ADTS, 3GP</td>
    </tr>
    <tr>
      <th scope="row">
        Tương thích với {{Glossary("RTP")}} /
        <a href="/en-US/docs/Web/API/WebRTC_API">WebRTC</a>
      </th>
      <td>Có</td>
    </tr>
    <tr>
      <th scope="row">Cấp phép</th>
      <td>
        Với việc phát trực tuyến hoặc phân phối nội dung mã hóa AAC: không cần
        giấy phép; các nhà phát triển codec phải xin giấy phép bằng sáng chế
        thông qua
        <a href="https://via-la.com/licensing-programs/aac/">VIA Licensing</a>
      </td>
    </tr>
  </tbody>
</table>

### ALAC (Apple Lossless Audio Codec)

**Apple Lossless Audio Codec** (**ALAC** hay **Apple Lossless**) là một codec không mất dữ liệu do Apple phát triển. Sau khi ban đầu là định dạng đóng, Apple đã mở nó dưới giấy phép Apache.

Mức hỗ trợ ALAC trên nhiều nền tảng và trình duyệt không mạnh, khiến nó không phải lựa chọn lý tưởng cho mục đích sử dụng chung. Tuy nhiên, nếu đối tượng chính của bạn là người dùng macOS và iOS, nó có thể đáng cân nhắc vì các hệ điều hành này đã tích hợp sẵn hỗ trợ ALAC. Nếu không, FLAC có lẽ là lựa chọn tốt hơn nếu bạn buộc phải dùng codec không mất dữ liệu.

Tuy vậy, hãy nhớ rằng codec không mất dữ liệu đòi hỏi băng thông và dung lượng lưu trữ lớn hơn đáng kể, nên có thể không phù hợp ngoài những trường hợp sử dụng rất cụ thể.

<table class="standard-table">
  <tbody>
    <tr>
      <th scope="row">Bitrate được hỗ trợ</th>
      <td>
        Phụ thuộc vào định dạng mẫu, tốc độ lấy mẫu, và mức nén
      </td>
    </tr>
    <tr>
      <th scope="row">Hỗ trợ bitrate biến thiên (VBR)</th>
      <td>Không</td>
    </tr>
    <tr>
      <th scope="row">Định dạng mẫu được hỗ trợ</th>
      <td>Số nguyên 16-bit, 20-bit, 24-bit và 32-bit</td>
    </tr>
    <tr>
      <th scope="row">Tốc độ lấy mẫu được hỗ trợ</th>
      <td>1 Hz đến 384.000 Hz</td>
    </tr>
    <tr>
      <th scope="row">Bitrate tối thiểu khuyến nghị cho âm stereo</th>
      <td>Không áp dụng</td>
    </tr>
    <tr>
      <th scope="row">Nén</th>
      <td>Không mất dữ liệu; lên tới 45-60%</td>
    </tr>
    <tr>
      <th scope="row">Số kênh âm thanh tối đa</th>
      <td>8 (tối đa âm thanh vòm 7.1)</td>
    </tr>
    <tr>
      <th scope="row">Băng thông tần số âm thanh</th>
      <td>?</td>
    </tr>
    <tr>
      <th scope="row">Độ trễ</th>
      <td>?</td>
    </tr>
    <tr>
      <th scope="row">Tương thích trình duyệt</th>
      <td>
        <table class="standard-table">
          <tbody>
            <tr>
              <th scope="row">Tính năng</th>
              <th scope="col">Chrome</th>
              <th scope="col">Edge</th>
              <th scope="col">Firefox</th>
              <th scope="col">Opera</th>
              <th scope="col">Safari</th>
            </tr>
            <tr>
              <th scope="row">Hỗ trợ ALAC</th>
              <td>Không</td>
              <td>Không</td>
              <td>Không</td>
              <td>Không</td>
              <td>Có</td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>
    <tr>
      <th scope="row">Hỗ trợ container</th>
      <td>MP4</td>
    </tr>
    <tr>
      <th scope="row">
        Tương thích với {{Glossary("RTP")}} /
        <a href="/en-US/docs/Web/API/WebRTC_API">WebRTC</a>
      </th>
      <td>Không</td>
    </tr>
    <tr>
      <th scope="row">Cấp phép</th>
      <td>
        Giấy phép mở (Apache License 2.0);
        <a href="https://github.com/macosforge/alac"
          >mã nguồn có sẵn trên GitHub</a
        >
      </td>
    </tr>
  </tbody>
</table>

### AMR (Adaptive Multi-Rate)

**[Adaptive Multi-Rate audio codec](https://voiceage.com/AMR-NB.AMR.html)** được tối ưu cho việc mã hóa lời nói con người một cách hiệu quả. Nó được tiêu chuẩn hóa vào năm 1999 như một phần của chuẩn âm thanh 3GPP dùng cho điện thoại di động [GSM](https://en.wikipedia.org/wiki/GSM) và [UMTS](https://en.wikipedia.org/wiki/UMTS), và dùng thuật toán băng hẹp đa tốc độ để mã hóa âm thanh ở chất lượng mức điện thoại với bitrate khoảng 7,4 kbps. Ngoài việc dùng cho thoại thời gian thực, âm thanh AMR còn có thể được dùng cho voicemail và các bản ghi âm ngắn khác.

Âm thanh AMR được lưu trong tệp có thể có đuôi `.amr`, nhưng cũng có thể được đóng gói trong tệp `.3gp`.

Là một codec dành riêng cho lời nói, AMR gần như vô dụng cho mọi nội dung khác, kể cả âm thanh chỉ có giọng hát. Ngoài ra, vì AMR được thiết kế để giảm tối đa yêu cầu dung lượng, nó chỉ giữ lại phần băng thông tần số âm thanh của lời nói con người thực sự cần thiết để hiểu nội dung, nên chất lượng cũng giảm theo. Nếu bạn cần ghi âm với tác động tối thiểu lên băng thông mạng và/hoặc dung lượng lưu trữ, AMR là một lựa chọn rất tốt. Tuy nhiên, nếu bạn cần tái tạo lời nói với độ trung thực cao, hoặc thậm chí phát lại nhạc chất lượng thấp, bạn cần chọn định dạng khác.

<table class="standard-table">
  <tbody>
    <tr>
      <th rowspan="2" scope="row">Bitrate được hỗ trợ</th>
      <td>
        <strong>Half Rate (HR) và Full Rate (FR):</strong> 1.8 kbps, 4.75 kbps,
        5.15 kbps, 5.9 kbps, 6.7 kbps, 7.4 kbps, 7.95 kbps
      </td>
    </tr>
    <tr>
      <td><strong>Chỉ Full Rate (FR):</strong> 10.2 kbps và 12.2 kbps</td>
    </tr>
    <tr>
      <th scope="row">Hỗ trợ bitrate biến thiên (VBR)</th>
      <td>Không</td>
    </tr>
    <tr>
      <th scope="row">Định dạng mẫu được hỗ trợ</th>
      <td>Số nguyên 13-bit</td>
    </tr>
    <tr>
      <th scope="row">Tốc độ lấy mẫu được hỗ trợ</th>
      <td>8 kHz</td>
    </tr>
    <tr>
      <th scope="row">Bitrate tối thiểu khuyến nghị cho âm stereo</th>
      <td>Không áp dụng</td>
    </tr>
    <tr>
      <th scope="row">Nén</th>
      <td>Mất dữ liệu</td>
    </tr>
    <tr>
      <th scope="row">Số kênh âm thanh tối đa</th>
      <td>1</td>
    </tr>
    <tr>
      <th scope="row">Băng thông tần số âm thanh</th>
      <td>200 Hz đến 3.400 Hz</td>
    </tr>
    <tr>
      <th scope="row">Độ trễ</th>
      <td>25 ms</td>
    </tr>
    <tr>
      <th scope="row">Tương thích trình duyệt</th>
      <td>
        <table class="standard-table">
          <tbody>
            <tr>
              <th scope="row">Tính năng</th>
              <th scope="col">Chrome</th>
              <th scope="col">Edge</th>
              <th scope="col">Firefox</th>
              <th scope="col">Opera</th>
              <th scope="col">Safari</th>
            </tr>
            <tr>
              <th scope="row">Hỗ trợ AMR</th>
              <td>Không</td>
              <td>?</td>
              <td>Không</td>
              <td>Không</td>
              <td>?</td>
            </tr>
          </tbody>
        </table>
        <p>
          Dù trình duyệt Chrome không hỗ trợ AMR, ChromeOS có hỗ trợ AMR-NB
          (băng hẹp) và AMR-WB (băng rộng).
        </p>
      </td>
    </tr>
    <tr>
      <th scope="row">Hỗ trợ container</th>
      <td>AMR, 3GPP</td>
    </tr>
    <tr>
      <th scope="row">
        Tương thích với {{Glossary("RTP")}} /
        <a href="/en-US/docs/Web/API/WebRTC_API">WebRTC</a>
      </th>
      <td>Không</td>
    </tr>
    <tr>
      <th scope="row">Cấp phép</th>
      <td>
        Không miễn phí; áp dụng phí cấp phép và tiền bản quyền hằng năm. Xem
        <a href="https://voiceage.com/Overview-lic.html"
          >thông tin cấp phép VoiceAge</a
        >
        để biết chi tiết
      </td>
    </tr>
  </tbody>
</table>

### FLAC (Free Lossless Audio Codec)

**FLAC** (**Free Lossless Audio Codec**) là một codec âm thanh không mất dữ liệu do [Xiph.org Foundation](https://xiph.org/) phát hành. Nó cung cấp tỷ lệ nén tốt mà không làm mất độ trung thực âm thanh; tức là âm thanh sau khi giải nén giống hệt bản gốc. Vì thuật toán nén được thiết kế riêng cho âm thanh, nó cho kết quả tốt hơn so với việc dùng một thuật toán nén đa dụng.

FLAC là lựa chọn rất tốt cho các tệp hiệu ứng âm thanh nhỏ, nơi cần chất lượng tinh khiết và độ chính xác về âm sắc, cũng như cho mục đích lưu trữ âm nhạc.

<table class="standard-table">
  <tbody>
    <tr>
      <th scope="row">Bitrate được hỗ trợ</th>
      <td>—</td>
    </tr>
    <tr>
      <th scope="row">Hỗ trợ bitrate biến thiên (VBR)</th>
      <td>Không</td>
    </tr>
    <tr>
      <th scope="row">Định dạng mẫu được hỗ trợ</th>
      <td>Số nguyên từ 4-bit đến 24-bit</td>
    </tr>
    <tr>
      <th scope="row">Tốc độ lấy mẫu được hỗ trợ</th>
      <td>
        1 Hz đến 65.535 Hz (theo bước 1 Hz) hoặc 10 Hz đến 655.350 Hz (theo
        bước 10 Hz)
      </td>
    </tr>
    <tr>
      <th scope="row">Bitrate tối thiểu khuyến nghị cho âm stereo</th>
      <td>—</td>
    </tr>
    <tr>
      <th scope="row">Nén</th>
      <td>Không mất dữ liệu; giảm kích thước tới 40-50%</td>
    </tr>
    <tr>
      <th scope="row">Số kênh âm thanh tối đa</th>
      <td>8</td>
    </tr>
    <tr>
      <th scope="row">Băng thông tần số âm thanh</th>
      <td>Toàn dải</td>
    </tr>
    <tr>
      <th scope="row">Độ trễ</th>
      <td>4,3 ms đến 92 ms, với 46,4 ms là mức trung bình điển hình</td>
    </tr>
    <tr>
      <th scope="row">Tương thích trình duyệt</th>
      <td>
        <table class="standard-table">
          <tbody>
            <tr>
              <th scope="row">Tính năng</th>
              <th scope="col">Chrome</th>
              <th scope="col">Edge</th>
              <th scope="col">Firefox</th>
              <th scope="col">Opera</th>
              <th scope="col">Safari</th>
            </tr>
            <tr>
              <th scope="row">Hỗ trợ FLAC</th>
              <td>Có</td>
              <td>Có</td>
              <td>51 (máy tính)<br />58 (di động)</td>
              <td>Có</td>
              <td>11</td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>
    <tr>
      <th scope="row">Hỗ trợ container</th>
      <td>MP4, Ogg, FLAC</td>
    </tr>
    <tr>
      <th scope="row">
        Tương thích với {{Glossary("RTP")}} /
        <a href="/en-US/docs/Web/API/WebRTC_API">WebRTC</a>
      </th>
      <td>Không</td>
    </tr>
    <tr>
      <th scope="row">Cấp phép</th>
      <td>Hoàn toàn mở và không có bất kỳ yêu cầu cấp phép nào</td>
    </tr>
  </tbody>
</table>

### G.711 (Điều chế mã xung của các tần số giọng nói)

Thông số kỹ thuật **G.711**, do Liên minh Viễn thông Quốc tế (ITU) công bố, được ban hành vào năm 1972 để định nghĩa mã hóa âm thanh chuẩn cho các ứng dụng điện thoại. Nó hỗ trợ âm thanh chất lượng giọng nói trong dải tần từ 300 đến 3400 Hz. Nó được dùng rất rộng rãi cho lưu lượng điện thoại và voicemail, và là định dạng mã hóa âm thanh chất lượng cao nhất có thể được truyền qua mạng điện thoại công cộng.

G.711 không phải là codec độ trung thực cao, mà được tối ưu để hỗ trợ một dải rộng các mức giọng nói, từ thì thầm đến hét, đồng thời giữ được mức dễ hiểu cao và độ phức tạp tính toán thấp. G.711 dùng thuật toán companding logarit cung cấp dải động 14 bit trong một mẫu 8 bit. Nó dùng tốc độ lấy mẫu 8000 mẫu/giây, tương ứng bitrate 64000 bps.

Có hai biến thể của G.711 tương ứng với phương trình toán học chính xác của thuật toán: [µ-law](https://en.wikipedia.org/wiki/M-law) (thường dùng ở Bắc Mỹ và Nhật Bản) và [A-law](https://en.wikipedia.org/wiki/A-law) (phổ biến ở phần còn lại của thế giới). Không có khác biệt chất lượng đáng kể giữa hai chuẩn này, và có thể chuyển mã âm thanh từ một chuẩn sang chuẩn kia. Tuy nhiên, điều quan trọng là phải chỉ rõ chuẩn nào đang được dùng trong bất kỳ ứng dụng phát lại hay định dạng tệp nào. Âm thanh A-law sẽ phát lại kém nếu bị giải nén nhầm bằng thuật toán µ-law, và ngược lại.

Codec này bắt buộc phải được tất cả các giải pháp [WebRTC](/en-US/docs/Web/API/WebRTC_API) hỗ trợ vì nó đơn giản, dễ triển khai, được dùng rộng rãi và tương thích tốt trên mọi nền tảng máy tính hiện đại.

<table class="standard-table">
  <tbody>
    <tr>
      <th scope="row">Bitrate được hỗ trợ</th>
      <td>64 kbps</td>
    </tr>
    <tr>
      <th scope="row">Hỗ trợ bitrate biến thiên (VBR)</th>
      <td>Không</td>
    </tr>
    <tr>
      <th scope="row">Định dạng mẫu được hỗ trợ</th>
      <td>âm thanh đã mã hóa là 8 bit mỗi mẫu</td>
    </tr>
    <tr>
      <th scope="row">Tốc độ lấy mẫu được hỗ trợ</th>
      <td>8 kHz</td>
    </tr>
    <tr>
      <th scope="row">Bitrate tối thiểu khuyến nghị cho âm stereo</th>
      <td>128 kbps</td>
    </tr>
    <tr>
      <th scope="row">Nén</th>
      <td>Companding logarit (µ-law hoặc A-law)</td>
    </tr>
    <tr>
      <th scope="row">Số kênh âm thanh tối đa</th>
      <td>2</td>
    </tr>
    <tr>
      <th scope="row">Băng thông tần số âm thanh</th>
      <td>300 Hz – 3400 Hz</td>
    </tr>
    <tr>
      <th scope="row">Độ trễ</th>
      <td>0.125 ms</td>
    </tr>
    <tr>
      <th scope="row">Tương thích trình duyệt</th>
      <td>
        <table class="standard-table">
          <tbody>
            <tr>
              <th scope="row">Tính năng</th>
              <th scope="col">Chrome</th>
              <th scope="col">Edge</th>
              <th scope="col">Firefox</th>
              <th scope="col">Opera</th>
              <th scope="col">Safari</th>
            </tr>
            <tr>
              <th scope="row">Hỗ trợ G.711</th>
              <td>23</td>
              <td>15</td>
              <td>22</td>
              <td>43</td>
              <td>11</td>
            </tr>
          </tbody>
        </table>
        <p>G.711 chỉ được hỗ trợ cho các kết nối WebRTC.</p>
      </td>
    </tr>
    <tr>
      <th scope="row">Hỗ trợ container</th>
      <td>3GP, WAV</td>
    </tr>
    <tr>
      <th scope="row">
        Tương thích với {{Glossary("RTP")}} /
        <a href="/en-US/docs/Web/API/WebRTC_API">WebRTC</a>
      </th>
      <td>Có</td>
    </tr>
    <tr>
      <th scope="row">Cấp phép</th>
      <td>
        Tất cả các bằng sáng chế liên quan đều đã hết hạn, nên G.711 được phép
        sử dụng tự do, không bị hạn chế
      </td>
    </tr>
  </tbody>
</table>

### G.722 (mã hóa âm thanh 64 kbps (7 kHz))

Được Liên minh Viễn thông Quốc tế (ITU) công bố, codec **G.722** được thiết kế riêng cho nén giọng nói. Băng thông mã hóa âm thanh của nó bị giới hạn trong dải 50 Hz đến 7.000 Hz, bao phủ phần lớn dải tần của giọng người điển hình. Điều này khiến nó không phù hợp để xử lý bất kỳ âm thanh nào có thể nằm ngoài dải giọng nói con người, chẳng hạn như nhạc.

Âm thanh G.722 được mã hóa bằng Adaptive Differential Pulse Code Modulation (ADPCM), trong đó mỗi mẫu không được biểu diễn bằng giá trị tuyệt đối, mà bằng giá trị cho biết mẫu mới khác mẫu trước đó bao nhiêu.

G.722 chủ yếu được dùng với các kết nối WebRTC, vì nó là một trong các codec âm thanh bắt buộc theo đặc tả WebRTC.

<table class="standard-table">
  <tbody>
    <tr>
      <th scope="row">Bitrate được hỗ trợ</th>
      <td>
        G.722: 48 kbps, 56 kbps và 64 kbps; tuy nhiên, trên thực tế luôn dùng 64
        kbps<br />G.722 Annex B Super Wide-Band: 64 kbps, 80 kbps và 96 kbps<br />G.722
        Annex D Stereo Wide-Band: 64 kbps và 80 kbps<br />G.722 Annex D Stereo
        Super Wide-Band: 80 kbps, 96 kbps, 112 kbps và 128 kbps
      </td>
    </tr>
    <tr>
      <th scope="row">Hỗ trợ bitrate biến thiên (VBR)</th>
      <td>Không</td>
    </tr>
    <tr>
      <th scope="row">Định dạng mẫu được hỗ trợ</th>
      <td>Số nguyên 14-bit</td>
    </tr>
    <tr>
      <th scope="row">Tốc độ lấy mẫu được hỗ trợ</th>
      <td>
        16 kHz (ADPCM quy định cho phép 8 kHz, 11.025 kHz, 22.05 kHz, 44.1
        kHz, nhưng G.722 dùng 16 kHz)
      </td>
    </tr>
    <tr>
      <th scope="row">Bitrate tối thiểu khuyến nghị cho âm stereo</th>
      <td>128 kbps ở tốc độ lấy mẫu 44.1 kHz</td>
    </tr>
    <tr>
      <th scope="row">Nén</th>
      <td>Mất dữ liệu</td>
    </tr>
    <tr>
      <th scope="row">Số kênh âm thanh tối đa</th>
      <td>2</td>
    </tr>
    <tr>
      <th scope="row">Băng thông tần số âm thanh</th>
      <td>50 Hz - 7 kHz</td>
    </tr>
    <tr>
      <th scope="row">Độ trễ</th>
      <td>4 ms</td>
    </tr>
    <tr>
      <th scope="row">Tương thích trình duyệt</th>
      <td>
        <table class="standard-table">
          <tbody>
            <tr>
              <th scope="row">Tính năng</th>
              <th scope="col">Chrome</th>
              <th scope="col">Edge</th>
              <th scope="col">Firefox</th>
              <th scope="col">Opera</th>
              <th scope="col">Safari</th>
            </tr>
            <tr>
              <th scope="row">Hỗ trợ G.722</th>
              <td>Có</td>
              <td>Có</td>
              <td>Có</td>
              <td>Có</td>
              <td>Có</td>
            </tr>
          </tbody>
        </table>
        <p>Chỉ dành cho WebRTC.</p>
      </td>
    </tr>
    <tr>
      <th scope="row">Hỗ trợ container</th>
      <td>3GP, AMR-WB</td>
    </tr>
    <tr>
      <th scope="row">
        Tương thích với {{Glossary("RTP")}} /
        <a href="/en-US/docs/Web/API/WebRTC_API">WebRTC</a>
      </th>
      <td>Có</td>
    </tr>
    <tr>
      <th scope="row">Cấp phép</th>
      <td>
        Tất cả các bằng sáng chế liên quan đã hết hạn; G.722 được phép sử dụng
        tự do, không bị hạn chế
      </td>
    </tr>
  </tbody>
</table>

### MP3 (MPEG-1 Audio Layer III)

Trong số các định dạng âm thanh được chỉ định bởi các tiêu chuẩn MPEG/MPEG-2,
**MPEG-1 Audio Layer III** - còn được biết đến là **[MP3](https://en.wikipedia.org/wiki/MP3)** - là định dạng được dùng rộng rãi và nổi tiếng nhất. Codec MP3 được định nghĩa bởi [MPEG-1 Part 3](https://www.iso.org/standard/22412.html) và [MPEG-2 Part 3](https://www.iso.org/standard/26797.html), và được giới thiệu vào năm 1991 (hoàn thiện vào năm 1992).

Khi âm thanh định dạng MP3 được lưu bên trong một container MPEG, tệp kết quả cũng thường được gọi đơn giản là "tệp MP3" hoặc "MP3". Những tệp có đuôi `.mp3` phổ biến được lưu trong định dạng tệp âm thanh có lẽ được phân phối rộng rãi nhất thế giới, và đây là một trong những lý do lớn tạo nên cuộc cách mạng âm thanh số vào cuối thập niên 1990 và đầu thập niên 2000.

MP3 theo chuẩn MPEG-1 hỗ trợ bitrate cao hơn cũng như tốc độ lấy mẫu cao hơn so với MP3 trong tệp MPEG-2. MP3 theo định dạng MPEG-1 thường phù hợp nhất cho nhạc hoặc các âm thanh phức tạp khác, trong khi MP3 theo chế độ MPEG-2 chấp nhận được cho lời nói và các âm thanh đơn giản hơn.

Các bằng sáng chế đứng sau MP3 đã hết hạn, loại bỏ phần lớn hoặc toàn bộ các lo ngại về cấp phép khi dùng MP3 trong dự án của bạn. Điều đó khiến nó trở thành lựa chọn tốt cho nhiều dự án.

<table class="standard-table">
  <tbody>
    <tr>
      <th rowspan="2" scope="row">Bitrate được hỗ trợ</th>
      <td>
        <strong>Chế độ MPEG-1:</strong> 32 kbps, 40 kbps, 48 kbps, 56 kbps, 64
        kbps, 80 kbps, 96 kbps, 112 kbps, 128 kbps, 160 kbps, 192 kbps, 224
        kbps, 256 kbps, 320 kbps
      </td>
    </tr>
    <tr>
      <td>
        <strong>Chế độ MPEG-2:</strong> 8 kbps, 16 kbps, 24 kbps, 32 kbps, 40
        kbps, 48 kbps, 56 kbps, 64 kbps, 80 kbps, 96 kbps, 112 kbps, 128 kbps,
        144 kbps, 160 kbps
      </td>
    </tr>
    <tr>
      <th scope="row">Hỗ trợ bitrate biến thiên (VBR)</th>
      <td>Có</td>
    </tr>
    <tr>
      <th scope="row">Định dạng mẫu được hỗ trợ</th>
      <td>Số nguyên 16-bit</td>
    </tr>
    <tr>
      <th rowspan="2" scope="row">Tốc độ lấy mẫu được hỗ trợ</th>
      <td><strong>Chế độ MPEG-1:</strong> 32000 Hz, 44100 Hz, 48000 Hz</td>
    </tr>
    <tr>
      <td>
        <strong>Chế độ MPEG-2:</strong> 16000 Hz, 22050 Hz, 24000 Hz (bằng một
        nửa tần số của các chế độ được MPEG-1 hỗ trợ)
      </td>
    </tr>
    <tr>
      <th scope="row">Bitrate tối thiểu khuyến nghị cho âm stereo</th>
      <td>128 kbps ở tốc độ lấy mẫu 48 kHz</td>
    </tr>
    <tr>
      <th scope="row">Nén</th>
      <td>Mất dữ liệu</td>
    </tr>
    <tr>
      <th rowspan="2" scope="row">Số kênh âm thanh tối đa</th>
      <td><strong>Chế độ MPEG-1:</strong> 2 [2.0]</td>
    </tr>
    <tr>
      <td>
        <strong>Chế độ MPEG-2:</strong> 5 (cộng thêm 1 kênh Low Frequency
        Enhancement tùy chọn) [5.1]
      </td>
    </tr>
    <tr>
      <th scope="row">Băng thông tần số âm thanh</th>
      <td>Thay đổi, tùy bitrate và phân tích âm học tâm lý</td>
    </tr>
    <tr>
      <th scope="row">Độ trễ</th>
      <td>Ít nhất 100 ms</td>
    </tr>
    <tr>
      <th scope="row">Tương thích trình duyệt</th>
      <td>
        <table class="standard-table">
          <tbody>
            <tr>
              <th scope="row">Tính năng</th>
              <th scope="col">Chrome</th>
              <th scope="col">Edge</th>
              <th scope="col">Firefox</th>
              <th scope="col">Opera</th>
              <th scope="col">Safari</th>
            </tr>
            <tr>
              <th scope="row">Hỗ trợ MP3</th>
              <td>Có</td>
              <td>Có</td>
              <td>Có</td>
              <td>Có</td>
              <td>3.1</td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>
    <tr>
      <th scope="row">Hỗ trợ container</th>
      <td>MPEG-1, MPEG-2, MP4, ADTS, 3GP</td>
    </tr>
    <tr>
      <th scope="row">
        Tương thích với {{Glossary("RTP")}} /
        <a href="/en-US/docs/Web/API/WebRTC_API">WebRTC</a>
      </th>
      <td>Không</td>
    </tr>
    <tr>
      <th scope="row">Cấp phép</th>
      <td>
        Không còn bằng sáng chế ở EU từ năm 2012; không còn bằng sáng chế ở Hoa
        Kỳ từ ngày 16 tháng 4 năm 2017; hiện có thể sử dụng tự do
      </td>
    </tr>
  </tbody>
</table>

Vì lý do bằng sáng chế, trước phiên bản 71 Firefox không hỗ trợ MP3 trực tiếp; thay vào đó, các thư viện gốc của nền tảng được dùng để hỗ trợ MP3. Khả năng này được giới thiệu ở các bản phát hành Firefox khác nhau trên từng nền tảng:

<table class="standard-table" style="margin-left: 4em; max-width: 30em">
  <caption>
    Hỗ trợ MP3 bằng thư viện ngoài, theo nền tảng, trong Firefox
  </caption>
  <thead>
    <tr>
      <th scope="row">Nền tảng</th>
      <th scope="col">Phiên bản Firefox đầu tiên<br />có hỗ trợ MP3</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">Windows (Vista trở lên)</th>
      <td>22</td>
    </tr>
    <tr>
      <th scope="row">Android</th>
      <td>20</td>
    </tr>
    <tr>
      <th scope="row">
        Linux (phụ thuộc vào
        <a href="https://gstreamer.freedesktop.org/">GStreamer</a>)
      </th>
      <td>26</td>
    </tr>
    <tr>
      <th scope="row">macOS</th>
      <td>35</td>
    </tr>
  </tbody>
</table>

### Opus

Định dạng âm thanh [Opus](<https://en.wikipedia.org/wiki/Opus_(audio_format)>) được Xiph.org Foundation tạo ra như một định dạng âm thanh hoàn toàn mở; nó đã được [IETF](https://www.ietf.org/) chuẩn hóa thành {{RFC(6716)}}. Đây là một codec âm thanh đa dụng tốt, có thể xử lý hiệu quả cả âm thanh độ phức tạp thấp như lời nói lẫn nhạc và các âm thanh phức tạp hơn.

Opus hỗ trợ nhiều thuật toán nén, và thậm chí có thể dùng nhiều hơn một thuật toán trong cùng một tệp âm thanh, vì bộ mã hóa có thể chọn bitrate, băng thông âm thanh, thuật toán và các chi tiết khác của thiết lập nén cho từng khung âm thanh.

Opus là một codec âm thanh toàn diện rất tốt để dùng trong ứng dụng web của bạn, và có thể được dùng cho mọi tác vụ âm thanh mà bạn nghĩ tới.

<table class="standard-table">
  <tbody>
    <tr>
      <th scope="row">Bitrate được hỗ trợ</th>
      <td>6 kbps - 510 kbps</td>
    </tr>
    <tr>
      <th scope="row">Hỗ trợ bitrate biến thiên (VBR)</th>
      <td>Có</td>
    </tr>
    <tr>
      <th scope="row">Định dạng mẫu được hỗ trợ</th>
      <td>Số nguyên 16-bit và float 32-bit (-1.0 đến 1.0)</td>
    </tr>
    <tr>
      <th scope="row">Tốc độ lấy mẫu được hỗ trợ</th>
      <td>
        <table class="standard-table">
          <tbody>
            <tr>
              <th scope="row">Profile</th>
              <th scope="col">Tốc độ lấy mẫu hiệu dụng</th>
            </tr>
            <tr>
              <th scope="row">Narrowband (NB)</th>
              <td>8 kHz</td>
            </tr>
            <tr>
              <th scope="row">Medium band (MB)</th>
              <td>12 kHz</td>
            </tr>
            <tr>
              <th scope="row">Wideband (WB)</th>
              <td>16 kHz</td>
            </tr>
            <tr>
              <th scope="row">Super Wideband (SWB)</th>
              <td>24 kHz</td>
            </tr>
            <tr>
              <th scope="row">Fullband (FB)</th>
              <td>48 kHz</td>
            </tr>
          </tbody>
        </table>
        <p>
          Các tốc độ lấy mẫu được nêu là <em>tốc độ lấy mẫu hiệu dụng</em>. Opus
          dùng thuật toán dựa trên băng thông âm thanh chứ không phải tốc độ lấy
          mẫu. Xem {{RFC(6716, "", 2)}} để biết chi tiết. Ngoài ra, còn có một
          phần <em>tùy chọn</em> của đặc tả Opus (Opus Custom) cho phép dùng tốc
          độ lấy mẫu không chuẩn, nhưng không khuyến khích dùng tính năng này.
        </p>
      </td>
    </tr>
    <tr>
      <th scope="row">Bitrate tối thiểu khuyến nghị cho âm stereo</th>
      <td>96 kbps ở tốc độ lấy mẫu 48 kHz</td>
    </tr>
    <tr>
      <th scope="row">Nén</th>
      <td>Mất dữ liệu</td>
    </tr>
    <tr>
      <th scope="row">Số kênh âm thanh tối đa</th>
      <td>255 (tối đa 1 kênh LFE)</td>
    </tr>
    <tr>
      <th scope="row">Băng thông tần số âm thanh</th>
      <td>
        <table class="standard-table">
          <thead>
            <tr>
              <th scope="row">Profile</th>
              <th scope="col">Băng thông âm thanh</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <th scope="row">Narrowband (NB)</th>
              <td>4 kHz</td>
            </tr>
            <tr>
              <th scope="row">Medium band (MB)</th>
              <td>6 kHz</td>
            </tr>
            <tr>
              <th scope="row">Wideband (WB)</th>
              <td>8 kHz</td>
            </tr>
            <tr>
              <th scope="row">Super Wideband (SWB)</th>
              <td>12 kHz</td>
            </tr>
            <tr>
              <th scope="row">Fullband (FB)</th>
              <td>20 kHz</td>
            </tr>
          </tbody>
        </table>
        <p>
          Mặc dù
          <a href="https://en.wikipedia.org/wiki/Nyquist–Shannon_sampling_theorem">định lý lấy mẫu Nyquist–Shannon</a>
          cho thấy băng thông âm thanh có thể bằng một nửa tốc độ lấy mẫu,
          Opus không cho phép mã hóa vượt ra ngoài băng tần âm thanh tối đa 20
          kHz, vì tai người vốn dĩ không thể cảm nhận được thứ gì cao hơn điểm
          20 kHz. Điều này giúp tiết kiệm một phần dung lượng trong âm thanh đã
          mã hóa.
        </p>
      </td>
    </tr>
    <tr>
      <th scope="row">Độ trễ</th>
      <td>5 ms đến 66.5 ms</td>
    </tr>
    <tr>
      <th scope="row">Tương thích trình duyệt</th>
      <td>
        <table class="standard-table">
          <tbody>
            <tr>
              <th scope="row">Tính năng</th>
              <th scope="col">Chrome</th>
              <th scope="col">Edge</th>
              <th scope="col">Firefox</th>
              <th scope="col">Opera</th>
              <th scope="col">Safari</th>
            </tr>
            <tr>
              <th scope="row">Hỗ trợ Opus</th>
              <td>33</td>
              <td>14</td>
              <td>15</td>
              <td>20</td>
              <td>11</td>
            </tr>
          </tbody>
        </table>
        <p>
          Thông tin này đề cập đến hỗ trợ Opus trong các phần tử HTML
          {{HTMLElement("audio")}} và {{HTMLElement("video")}}, chứ không phải
          WebRTC.
        </p>
        <p>
          Safari chỉ hỗ trợ Opus trong phần tử {{HTMLElement("audio")}} khi nó
          được đóng gói trong tệp CAF, và chỉ trên macOS High Sierra (10.13)
          hoặc iOS 11.
        </p>
      </td>
    </tr>
    <tr>
      <th scope="row">Container support</th>
      <td>Ogg, WebM, MPEG-TS, MP4</td>
    </tr>
    <tr>
      <th scope="row">
        {{Glossary("RTP")}} /
        <a href="/en-US/docs/Web/API/WebRTC_API">WebRTC</a> compatible
      </th>
      <td>Yes</td>
    </tr>
    <tr>
      <th scope="row">Licensing</th>
      <td>Fully open and free of any licensing requirements</td>
    </tr>
  </tbody>
</table>

### Vorbis

[Vorbis](https://www.xiph.org/vorbis/) is an open format from the [Xiph.org Foundation](https://xiph.org/) which supports a wide range of channel combinations, including monaural, stereo, polyphonic, quadraphonic, 5.1 surround, ambisonic, or up to 255 discrete audio channels. Depending on the quality setting used during encoding, the resulting bit rate can vary from around 45 kbps to 500 kbps. Vorbis inherently uses variable bit rate encoding; the bit rate can vary from one sample to the next as needed during the compression process.

Nói chung, Vorbis hiệu quả hơn MP3 về kích thước và bitrate ở cùng mức chất lượng. Điều này, cùng với giấy phép mở và miễn phí của nó, khiến nó trở thành lựa chọn tốt cho nhiều loại dữ liệu âm thanh miễn là độ trễ cao của nó không phải là vấn đề.

<table class="standard-table">
  <tbody>
    <tr>
      <th scope="row">Supported bit rates</th>
      <td>45 kbps - 500 kbps</td>
    </tr>
    <tr>
      <th scope="row">Variable Bit Rate (VBR) support</th>
      <td>Yes</td>
    </tr>
    <tr>
      <th scope="row">Supported sample formats</th>
      <td>16-bit integer</td>
    </tr>
    <tr>
      <th scope="row">Supported sample rates</th>
      <td>8 kHz - 192 kHz</td>
    </tr>
    <tr>
      <th scope="row">Recommended minimum bit rate for stereo sound</th>
      <td>
        192 kbps at 48 kHz; this is typically accomplished by setting the
        quality level to 6 to 8.
      </td>
    </tr>
    <tr>
      <th scope="row">Nén</th>
      <td>Mất dữ liệu</td>
    </tr>
    <tr>
      <th scope="row">Số kênh âm thanh tối đa</th>
      <td>255</td>
    </tr>
    <tr>
      <th scope="row">Băng thông tần số âm thanh</th>
      <td></td>
    </tr>
    <tr>
      <th scope="row">Độ trễ</th>
      <td>Ít nhất 100 ms</td>
    </tr>
    <tr>
      <th scope="row">Khả năng tương thích trình duyệt</th>
      <td>
        <table class="standard-table">
          <tbody>
            <tr>
              <th scope="row">Tính năng</th>
              <th scope="col">Chrome</th>
              <th scope="col">Edge</th>
              <th scope="col">Firefox</th>
              <th scope="col">Opera</th>
              <th scope="col">Safari</th>
            </tr>
            <tr>
              <th scope="row">Hỗ trợ Vorbis</th>
              <td>4</td>
              <td>17</td>
              <td>3.5</td>
              <td>11.5</td>
              <td>Không</td>
            </tr>
          </tbody>
        </table>
        <p>
          Thông tin này đề cập đến việc hỗ trợ Vorbis trong các phần tử HTML
          {{HTMLElement("audio")}} và {{HTMLElement("video")}}, không phải
          trong WebRTC.
        </p>
      </td>
    </tr>
    <tr>
      <th scope="row">Container support</th>
      <td>Ogg, WebM</td>
    </tr>
    <tr>
      <th scope="row">
        Tương thích với {{Glossary("RTP")}} /
        <a href="/en-US/docs/Web/API/WebRTC_API">WebRTC</a>
      </th>
      <td>Có</td>
    </tr>
    <tr>
      <th scope="row">Licensing</th>
      <td>Hoàn toàn mở và không có bất kỳ yêu cầu cấp phép nào</td>
    </tr>
  </tbody>
</table>

## Chọn codec âm thanh

Thông thường, bất kể bạn dùng codec nào, nó vẫn sẽ làm được việc, dù có thể không phải lựa chọn lý tưởng, miễn là bạn không chọn một codec được thiết kế riêng cho một loại âm thanh nguồn hoàn toàn khác. Ví dụ, chọn một codec chỉ dành cho giọng nói rồi cố dùng nó cho nhạc sẽ không cho ra kết quả hữu dụng.

Tuy vậy, một số codec có thể hạn chế khả năng tương thích, và một số khác có thể phù hợp với nhu cầu của bạn hơn. Ở đây chúng tôi cung cấp hướng dẫn để giúp bạn chọn codec phù hợp cho trường hợp sử dụng của mình.

Khi chọn codec để dùng cho âm thanh của bạn, trước hết hãy cân nhắc các câu hỏi sau:

- Âm thanh đã mã hóa có sẽ được phối lại hoặc nén lại không? Nếu có, hãy tránh nén mất dữ liệu, vì việc nén lại sẽ làm tổn hại thêm; hoặc ít nhất hãy dùng mức nén thấp nhất có thể.
- Nếu âm thanh phải nằm trong một loại tệp cụ thể, hãy ghi nhớ điều đó, vì các container media thường chỉ hỗ trợ một tập con nhất định của các codec sẵn có.
- Codec sẽ xử lý loại nội dung âm thanh nào? Một số codec được thiết kế riêng cho nội dung chỉ có giọng nói (chúng tận dụng dải tần hẹp hơn cần cho lời nói con người). Một số khác có thể có xu hướng hoạt động kém hơn khi mã hóa các thể loại nhạc cụ thể.
- Mỗi codec có những bitrate và thuộc tính cấu hình nào có thể khiến nó trở thành lựa chọn tốt hơn hoặc tệ hơn?
- Độ trễ có quan trọng đến mức nào đối với nhu cầu của bạn? Nếu bạn cần âm thanh có thời điểm rất chính xác, độ trễ càng thấp càng tốt.
- Bạn cần đạt mức nén đến đâu?

Hãy xem một vài tình huống phổ biến để hình dung quá trình ra quyết định.

### Ví dụ: Nhạc để truyền phát

Với nhạc truyền phát, bạn muốn chọn một codec giảm mức sử dụng băng thông tối đa có thể trong khi đưa càng ít artefact vào âm thanh do nén càng tốt. Điều này là cần thiết vì tốc độ tải nhạc xuống phải không vượt quá lượng băng thông sẵn có trên mạng, và lý tưởng là vẫn còn dư địa cho dao động tốc độ mạng cũng như việc các ứng dụng khác dùng chung mạng.

Trừ khi có nhu cầu cụ thể về nén không mất dữ liệu, hoặc băng thông mạng được bảo đảm đủ cao để hỗ trợ nó, thì một lược đồ nén mất dữ liệu là lựa chọn tốt. Codec nào bạn chọn sẽ phụ thuộc vào khả năng tương thích trình duyệt và việc có sẵn các tính năng đặc biệt mà bạn cần codec đó hỗ trợ.

_Thông thường_ độ trễ không quá quan trọng khi truyền phát nhạc. Những ngoại lệ có thể gồm nhạc lặp, nơi bạn cần nhạc phát liên tục không gián đoạn lặp đi lặp lại, hoặc khi bạn cần phát các bài hát liên tiếp mà không có khoảng trống giữa chúng. Điều này có thể đặc biệt quan trọng với nhạc cổ điển, nhạc phim sân khấu, và nhạc nền trong khi chơi game.

Với phát nhạc thông thường, ba ứng viên có khả năng nhất là MP3, AAC và Vorbis.

- AAC trong container MP4 được tất cả các trình duyệt lớn hỗ trợ, nên đây là một lựa chọn rất tốt.
- Vorbis hầu như luôn được dùng trong tệp Ogg, nhưng container Ogg không được hỗ trợ ở mọi nơi. Ngay cả Microsoft Edge, vốn hỗ trợ Vorbis, vẫn chưa hỗ trợ container Ogg.
- MP3 (MPEG-1 Audio Layer III) được tất cả các trình duyệt lớn hỗ trợ. Những tệp này là tệp MPEG-1 chứa một track Audio Layer III.

Nếu bạn cần giảm độ trễ trong khi phát nhạc, nên cân nhắc mạnh mẽ Opus, vì nó có khoảng độ trễ thấp nhất trong số các codec đa dụng (5 ms đến 66,5 ms, so với ít nhất 100 ms ở các codec còn lại).

> [!NOTE]
> Thông tin tương thích được mô tả ở đây nhìn chung là đúng vào thời điểm bài viết này được viết; tuy vậy, vẫn có thể có lưu ý và ngoại lệ. Hãy chắc chắn tham khảo các bảng tương thích trước khi chốt một định dạng media cụ thể.

Dựa trên điều này, AAC có lẽ là lựa chọn tốt nhất nếu bạn chỉ có thể hỗ trợ một định dạng âm thanh. Tất nhiên, nếu bạn có thể cung cấp nhiều định dạng (ví dụ bằng cách dùng phần tử {{HTMLElement("source")}} bên trong các phần tử {{HTMLElement("audio")}} và {{HTMLElement("video")}}), bạn có thể tránh được nhiều hoặc toàn bộ các ngoại lệ đó.

### Ví dụ: Nhạc để tải xuống

Nhạc mà người dùng tải xuống có thể được nén thành tệp lớn hơn nhạc truyền phát, vì (khác với khi truyền phát) việc tốc độ tải xuống chậm hơn tốc độ phát media không phải là vấn đề. Điều đó có nghĩa là bạn có thể cân nhắc dùng nén mất dữ liệu với bitrate cao hơn, tạo ra tệp lớn hơn nhưng mất độ trung thực ít hơn. Hoặc bạn có thể chọn định dạng không mất dữ liệu. Lựa chọn này phần lớn phụ thuộc vào tổ hợp giữa yêu cầu của ứng dụng và sở thích của người dùng.

Với một dịch vụ tải nhạc thực tế, bạn có thể cung cấp các bài hát dưới dạng tệp MP3 128 Kbps, tệp AAC 256 kbps (trong container MP4), hoặc tệp FLAC, tùy theo lựa chọn của người dùng. Nếu bạn chỉ cần chọn một định dạng, hãy chọn định dạng phù hợp với yêu cầu của bạn và loại nội dung âm thanh đang được tải.

Nói chung, MP3 là định dạng phổ biến nhất cho nhạc; nếu có thể, hãy chọn bitrate ít nhất 192 kbps. Ngược lại, iTunes Store phân phối nhạc ở định dạng AAC 256 kbps.

### Ví dụ: Ghi và phát lại giọng nói

Những đặc tính riêng của lời nói con người cho phép các codec dành cho giọng nói nén âm thanh hiệu quả hơn nhiều so với hầu hết các codec đa dụng. Đó là vì dù con người nghe được dải tần từ khoảng 20 Hz đến 20.000 Hz, và âm thanh lời nói con người nằm trong khoảng khoảng 300 Hz đến 18.000 Hz, phần lớn các âm lời nói mà ta cần để hiểu người khác nói gì lại nằm trong dải khoảng 500 Hz đến 3.000 Hz. Điều đó có nghĩa là codec chỉ dành cho giọng nói có thể loại bỏ mọi thứ còn lại.

Tuy nhiên, tất cả các codec chuyên cho giọng nói đều vốn rất mất dữ liệu, và bất kỳ âm thanh nào chứa thông tin đáng kể ở các dải tần ngoài vùng giọng nói được thu sẽ bị mất hoàn toàn. Điều này khiến các codec đó hoàn toàn không phù hợp với bất kỳ thứ gì ngoài lời nói. Ngay cả âm thanh chỉ có giọng người nhưng là hát chứ không phải nói, nhiều khả năng cũng không đạt chất lượng chấp nhận được trong một trong các định dạng này.

Ghi và phát lại giọng nói thường cần độ trễ thấp để đồng bộ với các track video, hoặc để tránh xuyên âm hay các vấn đề khác. May mắn là những đặc tính làm cho codec lời nói hiệu quả về dung lượng cũng khiến chúng thường có độ trễ rất thấp. Nếu bạn làm việc với WebRTC, chẳng hạn, [G.722](#g.722_64_kbps_7_khz_audio_coding) có độ trễ 4 ms (so với hơn 100 ms của MP3), còn độ trễ của [AMR](#amr_adaptive_multi-rate) vào khoảng 25 ms.

> [!NOTE]
> Để biết thêm về WebRTC và các codec mà nó có thể dùng, xem [Codec được WebRTC sử dụng](/en-US/docs/Web/Media/Guides/Formats/WebRTC_codecs).

Các codec thường được dùng trên web cho mã hóa chỉ giọng nói là G.722 và AMR. AMR là codec băng hẹp, chỉ mã hóa các tần số từ 200 Hz đến 3.400 Hz với bitrate thường khoảng 7,4 kbps, trong khi G.722 là codec băng rộng mở rộng băng thông âm thanh lên 50 Hz đến 7.000 Hz với bitrate cao hơn nhiều - thường là 64 kbps.

Nếu bạn có đủ băng thông mạng để làm việc, và khá chắc rằng người dùng của bạn cũng vậy, G.722 là lựa chọn tốt hơn. Để tối đa hóa hiệu quả lưu trữ và mạng trong môi trường hạn chế, hãy chọn AMR.

### Ví dụ: Đoạn âm thanh cho phối trộn chuyên nghiệp

Khi nén âm thanh sẽ được phối trộn hoặc phối trộn lại, bạn thường muốn không mất gì hoặc gần như không mất gì về độ trung thực, điều đó gợi ý rằng một codec không mất dữ liệu có thể phù hợp. Tuy nhiên, vì mã hóa không mất dữ liệu vốn có mức nén thấp hơn nhiều so với mã hóa mất dữ liệu, bạn có thể thấy rằng nếu âm thanh nguồn đủ lớn, bạn vẫn phải chọn một bộ mã hóa mất dữ liệu, đặc biệt trong môi trường web nơi bạn không kiểm soát được tốc độ tải xuống của media.

Giả sử nén không mất dữ liệu là lựa chọn tốt nhất ở đây (điều này thường đúng, miễn là các tệp âm thanh đủ nhỏ), ba ứng viên mạnh nhất xét từ góc độ codec là [FLAC](https://en.wikipedia.org/wiki/FLAC), [Apple Lossless (ALAC)](https://en.wikipedia.org/wiki/Apple_Lossless), và [MPEG-4 ALS](https://en.wikipedia.org/wiki/Audio_Lossless_Coding). Chọn cái nào sẽ phụ thuộc vào hỗ trợ trình duyệt và những định dạng container media nào hỗ trợ chúng.

Vì mục đích của ví dụ này, chúng ta sẽ giả định rằng mọi trình duyệt đều có hỗ trợ codec và container giống Firefox (dù điều này hoàn toàn không đúng). Hãy cân nhắc mức độ hỗ trợ thực tế của các codec khi đưa ra quyết định.

- Firefox hỗ trợ FLAC trong container gốc của FLAC cũng như trong các tệp Ogg và MPEG-4 (MP4).
- Firefox chỉ hỗ trợ Apple Lossless thông qua hỗ trợ QuickTime dành riêng cho nền tảng.
- Firefox không hỗ trợ MP4 ALS.

Trong trường hợp này, có vẻ FLAC nhiều khả năng là codec tốt nhất; ALAC có rất ít hoặc gần như không có hỗ trợ trình duyệt trực tiếp.

## Phần mềm mã hóa âm thanh

Có rất nhiều công cụ để mã hóa âm thanh. Đơn giản nhất là những công cụ dùng để rip CD hoặc nhập tệp âm thanh rồi nhanh chóng và tự động chuyển chúng sang định dạng MP3 hoặc AAC để lưu vào thư viện, chẳng hạn như [iTunes](https://www.apple.com/itunes/). Nhưng khi phát triển ứng dụng web dùng âm thanh như một thành phần của ứng dụng, chẳng hạn như game, bạn sẽ cần kiểm soát nhiều hơn quá trình mã hóa và nhiều tùy chọn hơn xung quanh định dạng được dùng khi mã hóa âm thanh.

Một số lựa chọn phổ biến:

- [FFmpeg](https://ffmpeg.org/)
  - : Có thể nói là bộ công cụ codec nguồn mở nổi tiếng và được đánh giá cao nhất hiện có, FFmpeg hỗ trợ phần lớn các định dạng âm thanh phổ biến nhất và cung cấp công cụ dòng lệnh cùng thư viện để mã hóa, giải mã và chuyển đổi định dạng cho cả âm thanh lẫn video. Có sẵn bản dựng cho macOS, Linux và Windows.
- [Handbrake](https://handbrake.fr/)
  - : Một giao diện nguồn mở rất phổ biến cho FFmpeg, bổ sung giao diện đồ họa giúp việc kiểm soát nhiều tùy chọn mà FFmpeg cung cấp khi mã hóa âm thanh và/hoặc video trở nên dễ dàng hơn nhiều. Có sẵn bản dựng cho macOS, Linux và Windows.
- [Audacity](https://www.audacityteam.org/)
  - : Trình biên tập âm thanh nguồn mở hỗ trợ nạp âm thanh từ nhiều định dạng khác nhau, chỉnh sửa, lọc và điều chỉnh âm thanh, rồi lưu lại ở định dạng gốc hoặc một định dạng mới. Có sẵn cho macOS, Linux và Windows.
- [LAME](https://lame.sourceforge.io/)
  - : Bộ mã hóa MP3 nguồn mở chất lượng cao, hỗ trợ CBR, ABR và VBR cùng nhiều tùy chọn khác. Dự án LAME chỉ phân phối ở dạng mã nguồn, nhưng có thể cài đặt bằng [Homebrew](https://brew.sh/) hoặc các công cụ tương tự.

## Xem thêm

- [Định dạng container media](/en-US/docs/Web/Media/Guides/Formats/Containers)
- Các phần tử {{HTMLElement("audio")}} và {{HTMLElement("video")}}
- [WebRTC API](/en-US/docs/Web/API/WebRTC_API)
- [Hướng dẫn codec video trên web](/en-US/docs/Web/Media/Guides/Formats/Video_codecs)
- [Codec được WebRTC sử dụng](/en-US/docs/Web/Media/Guides/Formats/WebRTC_codecs)
