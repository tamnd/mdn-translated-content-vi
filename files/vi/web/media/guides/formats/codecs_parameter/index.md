---
title: Codec trong các loại media phổ biến
slug: Web/Media/Guides/Formats/codecs_parameter
page-type: guide
sidebar: mediasidebar
---

Ở mức cơ bản, bạn có thể chỉ định kiểu của một tệp media bằng một loại {{Glossary("MIME")}} cơ bản, chẳng hạn `video/mp4` hoặc `audio/mpeg`. Tuy nhiên, nhiều kiểu media - đặc biệt là những kiểu hỗ trợ track video - sẽ được lợi nếu có khả năng mô tả chính xác hơn định dạng của dữ liệu bên trong. Chẳng hạn, chỉ mô tả một video trong tệp [MPEG-4](/en-US/docs/Web/Media/Guides/Formats/Containers#mpeg-4_mp4) bằng MIME type `video/mp4` không nói gì về định dạng thực tế của media bên trong.

Vì lý do đó, có thể thêm tham số `codecs` vào MIME type mô tả nội dung media. Nhờ đó, ta có thể cung cấp thông tin riêng cho container. Thông tin này có thể bao gồm như profile của video codec, kiểu được dùng cho các track âm thanh, và những thứ tương tự.

Hướng dẫn này xem nhanh cú pháp của tham số `codecs` trong media type và cách nó được dùng cùng chuỗi MIME type để cung cấp chi tiết về nội dung của media âm thanh hoặc video, vượt ra ngoài việc chỉ ra kiểu container.

## MIME type của định dạng container

MIME type cho một định dạng container được biểu diễn bằng cách nêu kiểu media (`audio`, `video`, v.v.), sau đó là dấu gạch chéo (`/`), rồi đến định dạng được dùng để chứa media:

- `audio/mpeg`
  - : An audio file using the [MPEG](/en-US/docs/Web/Media/Guides/Formats/Containers#mpegmpeg-2) file type, such as an MP3.
- `video/ogg`
  - : A video file using the [Ogg](/en-US/docs/Web/Media/Guides/Formats/Containers#ogg) file type.
- `video/mp4`
  - : A video file using the [MPEG-4](/en-US/docs/Web/Media/Guides/Formats/Containers#mpeg-4_mp4) file type.
- `video/quicktime`
  - : A video file in Apple's [QuickTime](/en-US/docs/Web/Media/Guides/Formats/Containers#quicktime) format. As noted elsewhere, this format was once commonly used on the web but no longer is, since it required a plugin to use.

Tuy nhiên, mỗi MIME type này đều khá mơ hồ. Tất cả các kiểu tệp này đều hỗ trợ nhiều codec khác nhau, và các codec đó có thể có bất kỳ số lượng profile, level và yếu tố cấu hình nào khác. Vì lý do đó, bạn có thể muốn kèm thêm tham số `codecs` cùng với media type.

## Cú pháp cơ bản

Bạn có thể thêm tham số `codecs` vào media type. Để làm vậy, hãy thêm dấu chấm phẩy (`;`), sau đó là `codecs=` rồi đến chuỗi mô tả định dạng nội dung của tệp. Một số media type chỉ cho phép bạn chỉ định tên các codec sẽ dùng, trong khi những loại khác còn cho phép chỉ định các ràng buộc khác nhau cho các codec đó. Bạn có thể chỉ định nhiều codec bằng cách ngăn cách chúng bằng dấu phẩy.

- `audio/ogg; codecs=vorbis`
  - : Tệp [Ogg](/en-US/docs/Web/Media/Guides/Formats/Containers#ogg) chứa track âm thanh [Vorbis](/en-US/docs/Web/Media/Guides/Formats/Audio_codecs#vorbis).
- `video/webm; codecs="vp8, vorbis"`
  - : Tệp [WebM](/en-US/docs/Web/Media/Guides/Formats/Containers#webm) chứa video [VP8](/en-US/docs/Web/Media/Guides/Formats/Video_codecs#vp8) và/hoặc âm thanh [Vorbis](/en-US/docs/Web/Media/Guides/Formats/Audio_codecs#vorbis).
- `video/mp4; codecs="avc1.4d002a"`
  - : Tệp [MPEG-4](/en-US/docs/Web/Media/Guides/Formats/Containers#mpeg-4_mp4) chứa video [AVC](/en-US/docs/Web/Media/Guides/Formats/Video_codecs#avc_h.264) (H.264), Main Profile, Level 4.2.

Giống như mọi tham số MIME type khác, `codecs` phải được đổi thành `codecs*` (chú ý ký tự dấu sao `*`) nếu bất kỳ thuộc tính nào của codec dùng các ký tự đặc biệt phải được mã hóa phần trăm theo {{RFC(2231, "MIME Parameter Value and Encoded Word Extensions", 4)}}. Bạn có thể dùng hàm JavaScript {{jsxref("Global_Objects/encodeURI", "encodeURI()")}} để mã hóa danh sách tham số; tương tự, bạn có thể dùng {{jsxref("Global_Objects/decodeURI", "decodeURI()")}} để giải mã một danh sách tham số đã được mã hóa trước đó.

> [!NOTE]
> Khi dùng tham số `codecs`, danh sách codec được chỉ định phải bao gồm mọi codec được dùng cho nội dung của tệp. Danh sách cũng có thể chứa các codec không có trong tệp.

## Tùy chọn codec theo container

Các container dưới đây hỗ trợ các tùy chọn codec mở rộng trong tham số `codecs` của chúng:

- [3GP](#iso_base_media_file_format_mp4_quicktime_and_3gp)
- [AV1](#av1)
- [HEVC](#hevc_mp4_quicktime_matroska)
- [ISO BMFF](#iso_base_media_file_format_mp4_quicktime_and_3gp)
- [MPEG-4](#iso_base_media_file_format_mp4_quicktime_and_3gp)
- [QuickTime](#iso_base_media_file_format_mp4_quicktime_and_3gp)
- [WebM](#webm)

Một số liên kết bên trên trỏ tới cùng một phần; đó là vì các media type đó đều dựa trên ISO Base Media File Format (ISO BMFF), nên chúng dùng chung một cú pháp.

### AV1

Cú pháp của tham số `codecs` cho AV1 được định nghĩa trong đặc tả [AV1 Codec ISO Media File Format Binding](https://aomediacodec.github.io/av1-isobmff/), mục 5: [Codecs Parameter String](https://aomediacodec.github.io/av1-isobmff/#codecsparam).

```plain
av01.P.LLT.DD[.M.CCC.cp.tc.mc.F]
```

> [!NOTE]
> Các trình duyệt dựa trên Chromium sẽ chấp nhận bất kỳ tập con nào của các tham số tùy chọn (thay vì tất cả hoặc không có gì, như đặc tả yêu cầu).

Các thành phần của chuỗi tham số codec này được mô tả chi tiết hơn trong bảng dưới đây. Mỗi thành phần có độ dài cố định; nếu giá trị ngắn hơn độ dài đó, nó phải được đệm bằng các số 0 ở đầu.

<table class="standard-table">
  <caption>
    Các thành phần của chuỗi tham số codec AV1
  </caption>
  <thead>
    <tr>
      <th scope="col">Thành phần</th>
      <th scope="col">Chi tiết</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>P</code></td>
      <td>
        <p>Số profile một chữ số:</p>
        <table class="standard-table">
          <caption>
            Số profile của AV1
          </caption>
          <thead>
            <tr>
              <th scope="col">Số profile</th>
              <th scope="col">Mô tả</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>0</td>
              <td>
                Profile "Main"; hỗ trợ luồng bit YUV 4:2:0 hoặc đơn sắc với độ sâu bit 8 hoặc 10 bit mỗi thành phần.
              </td>
            </tr>
            <tr>
              <td>1</td>
              <td>Profile "High" bổ sung hỗ trợ lấy mẫu sắc độ 4:4:4.</td>
            </tr>
            <tr>
              <td>2</td>
              <td>
                Profile "Professional" bổ sung hỗ trợ lấy mẫu sắc độ 4:2:2 và màu 12 bit mỗi thành phần.
              </td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>
    <tr>
      <td><code>LL</code></td>
      <td>
        Số mức hai chữ số, được chuyển sang định dạng mức X.Y, trong đó <code>X = 2 + (LL >> 2)</code> và <code>Y = LL &#x26; 3</code>.
        Xem <a href="https://aomediacodec.github.io/av1-spec/#levels">Phụ lục A, mục 3</a> trong đặc tả AV1 để biết chi tiết.
      </td>
    </tr>
    <tr>
      <td><code>T</code></td>
      <td>
        Ký hiệu tier một ký tự. Với tier Main (<code>seq_tier</code> bằng 0), ký tự này là chữ <code>M</code>.
        Với tier High (<code>seq_tier</code> bằng 1), ký tự này là chữ <code>H</code>.
        Tier High chỉ có ở mức 4.0 trở lên.
      </td>
    </tr>
    <tr>
      <td><code>DD</code></td>
      <td>
        Độ sâu bit của thành phần hai chữ số. Giá trị này phải là một trong 8, 10 hoặc 12; các giá trị hợp lệ thay đổi tùy theo profile và các thuộc tính khác.
      </td>
    </tr>
    <tr>
      <td><code>M</code></td>
      <td>
        Cờ đơn sắc một chữ số; nếu là 0, video bao gồm các plane U và V ngoài plane Y.
        Ngược lại, dữ liệu video hoàn toàn nằm trên plane Y và do đó là đơn sắc.
        Xem <a href="/en-US/docs/Web/Media/Guides/Formats/Video_concepts#yuv">YUV</a> để biết chi tiết cách hệ màu YUV hoạt động.
        Giá trị mặc định là 0 (không đơn sắc).
      </td>
    </tr>
    <tr>
      <td><code>CCC</code></td>
      <td>
        <p>
          <code>CCC</code> biểu thị lấy mẫu sắc độ bằng ba chữ số.
          Chữ số đầu tiên là <code>subsampling_x</code>, chữ số thứ hai là <code>subsampling_y</code>.
          Nếu cả hai đều là 1, chữ số thứ ba là giá trị của <code>chroma_sample_position</code>; ngược lại, chữ số thứ ba luôn là 0.
          Giá trị này, kết hợp với thành phần <code>M</code>, có thể dùng để dựng nên định dạng lấy mẫu sắc độ:
        </p>
        <table class="standard-table">
          <caption>
            Xác định định dạng lấy mẫu sắc độ
          </caption>
          <thead>
            <tr>
              <th scope="col">subsampling_x</th>
              <th scope="col">subsampling_y</th>
              <th scope="col">Cờ đơn sắc</th>
              <th scope="col">Định dạng lấy mẫu sắc độ</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>0</td>
              <td>0</td>
              <td>0</td>
              <td>YUV 4:4:4</td>
            </tr>
            <tr>
              <td>1</td>
              <td>0</td>
              <td>0</td>
              <td>YUV 4:2:2</td>
            </tr>
            <tr>
              <td>1</td>
              <td>1</td>
              <td>0</td>
              <td>YUV 4:2:0</td>
            </tr>
            <tr>
              <td>1</td>
              <td>1</td>
              <td>1</td>
              <td>YUV 4:0:0 (Monochrome)</td>
            </tr>
          </tbody>
        </table>
        <p>
          Chữ số thứ ba trong <code>CCC</code> biểu thị vị trí mẫu sắc độ, với giá trị 0 nghĩa là vị trí chưa biết và phải được cung cấp riêng trong quá trình giải mã; giá trị 1 nghĩa là vị trí mẫu nằm ngang hàng với mẫu luma (0, 0); và giá trị 2 nghĩa là vị trí mẫu trùng với luma tại (0, 0).
        </p>
        <p>Giá trị mặc định là <code>110</code> (lấy mẫu sắc độ 4:2:0).</p>
      </td>
    </tr>
    <tr>
      <td><code>cp</code></td>
      <td>
        Giá trị hai chữ số <code>color_primaries</code> cho biết hệ màu được media sử dụng.
        Ví dụ, màu BT.2020/BT.2100, dùng cho video HDR, là <code>09</code>.
        Thông tin cho mục này và các thành phần còn lại nằm trong <a href="https://aomediacodec.github.io/av1-spec/#color-config-semantics">phần Color config semantics</a> của đặc tả AV1.
        Giá trị mặc định là <code>01</code> (ITU-R BT.709).
      </td>
    </tr>
    <tr>
      <td><code>tc</code></td>
      <td>
        Giá trị hai chữ số <code>transfer_characteristics</code>. Giá trị này định nghĩa hàm dùng để ánh xạ gamma (trong thuật ngữ kỹ thuật gọi rất đẹp là "opto-electronic transfer function") từ nguồn sang màn hình.
        Ví dụ, BT.2020 10-bit là <code>14</code>.
        Giá trị mặc định là <code>01</code> (ITU-R BT.709).
      </td>
    </tr>
    <tr>
      <td><code>mc</code></td>
      <td>
        Hằng số hai chữ số <code>matrix_coefficients</code> chọn các hệ số ma trận dùng để chuyển đổi các kênh đỏ, xanh lam và xanh lục thành tín hiệu luma và chroma.
        Ví dụ, các hệ số chuẩn dùng cho BT.709 được biểu thị bằng giá trị <code>01</code>.
        Giá trị mặc định là <code>01</code> (ITU-R BT.709).
      </td>
    </tr>
    <tr>
      <td><code>F</code></td>
      <td>
        Cờ một chữ số cho biết màu có được phép dùng toàn bộ dải giá trị có thể (<code>1</code>) hay phải bị giới hạn trong các giá trị được coi là hợp lệ cho cấu hình màu đã chỉ định (tức là <strong>studio swing representation</strong>).
        Mặc định là 0 (dùng studio swing representation).
      </td>
    </tr>
  </tbody>
</table>

Tất cả các trường từ `M` (cờ đơn sắc) trở đi đều là tùy chọn; bạn có thể dừng thêm trường ở bất kỳ điểm nào (nhưng không thể bỏ qua các trường một cách tùy tiện). Các giá trị mặc định được liệt kê trong bảng ở trên. Một số chuỗi codec AV1 ví dụ:

- `av01.2.15M.10.0.100.09.16.09.0`
  - : AV1 Professional Profile, mức 5.3, Main tier, 10 bit mỗi thành phần màu, lấy mẫu sắc độ 4:2:2, dùng màu gốc ITU-R BT.2100, đặc tính chuyển đổi và ma trận màu YCbCr. Thể hiện theo studio swing representation.
- `av01.0.15M.10`
  - : AV1 Main Profile, mức 5.3, Main tier, 10 bit mỗi thành phần màu. Các thuộc tính còn lại lấy từ mặc định: lấy mẫu sắc độ 4:2:0, màu gốc BT.709, đặc tính chuyển đổi và hệ số ma trận. Studio swing representation.

### VP9

#### ISO Base Media File Format syntax

Cú pháp của tham số `codecs` cho VP9 được định nghĩa trong đặc tả [VP Codec ISO Media File Format Binding](https://www.webmproject.org/vp9/mp4/), ở mục [Codecs Parameter String](https://www.webmproject.org/vp9/mp4/#codecs-parameter-string).

Trong định dạng này, giá trị của tham số `codecs` bắt đầu bằng một mã bốn ký tự xác định codec được dùng trong container, sau đó là một chuỗi các giá trị hai chữ số được ngăn cách bằng dấu chấm (`.`).

```plain
cccc.PP.LL.DD
cccc.PP.LL.DD.CC.cp.tc.mc.FF
```

Bốn thành phần đầu tiên là bắt buộc; mọi thứ từ `CC` (lấy mẫu sắc độ) trở đi đều là tùy chọn, nhưng phải dùng trọn gói hoặc bỏ hẳn. Mỗi thành phần được mô tả trong bảng sau. Sau bảng là một số ví dụ.

<table class="standard-table">
  <caption>
    WebM codecs parameter components
  </caption>
  <thead>
    <tr>
      <th scope="col">Thành phần</th>
      <th scope="col">Chi tiết</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>cccc</code></td>
      <td>
        <p>
          A four-character code indicating which indicates which of the possible codecs is being described.
          Potential values are:
        </p>
        <table class="standard-table">
          <caption>
            Four-character codes for WebM-supported codecs
          </caption>
          <thead>
            <tr>
              <th scope="col">Four-character code</th>
              <th scope="col">Codec</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><code>vp08</code></td>
              <td>VP8</td>
            </tr>
            <tr>
              <td><code>vp09</code></td>
              <td>VP9</td>
            </tr>
            <tr>
              <td><code>vp10</code></td>
              <td>VP10</td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>
    <tr>
      <td><code>PP</code></td>
      <td>
        <p>
          Số profile hai chữ số, được đệm số 0 ở đầu nếu cần để đủ đúng hai chữ số.
        </p>
        <table class="standard-table">
          <caption>
            WebM profile numbers
          </caption>
          <thead>
            <tr>
              <th scope="col">Profile</th>
              <th scope="col">Mô tả</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><code>00</code></td>
              <td>
                Only 4:2:0 (chroma subsampled both horizontally and vertically).
                Allows only 8 bits per color component.
              </td>
            </tr>
            <tr>
              <td><code>01</code></td>
              <td>
                All chroma subsampling formats are allowed.
                Allows only 8 bits per color component.
              </td>
            </tr>
            <tr>
              <td><code>02</code></td>
              <td>
                Only 4:2:0 (chroma subsampled both horizontally and vertically).
                Supports 8, 10, or 12 bits per color sample component.
              </td>
            </tr>
            <tr>
              <td><code>03</code></td>
              <td>
                All chroma subsampling formats are allowed.
                Supports 8, 10, or 12 bits per color sample component.
              </td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>
    <tr>
      <td><code>LL</code></td>
      <td>
                Số mức hai chữ số.
        Số mức là ký hiệu số cố định, trong đó chữ số đầu là hàng đơn vị và chữ số thứ hai biểu thị phần mười.
        Ví dụ, mức 3 là <code>30</code> và mức 6.1 là <code>61</code>.
      </td>
    </tr>
    <tr>
      <td><code>DD</code></td>
      <td>
        Độ sâu bit của các giá trị luma và thành phần màu; các giá trị được phép là 8, 10 và 12.
      </td>
    </tr>
    <tr>
      <td><code>CC</code></td>
      <td>
        <p>
          A two-digit value indicating which chroma subsampling format to use.
          Bảng sau liệt kê các giá trị được phép; xem <a href="/en-US/docs/Web/Media/Guides/Formats/Video_concepts#chroma_subsampling">Lấy mẫu sắc độ</a> trong hướng dẫn "Khái niệm video số" để biết thêm thông tin về chủ đề này và các chủ đề khác.
        </p>
        <table class="standard-table">
          <caption>
            Các mã định danh lấy mẫu sắc độ của WebM
          </caption>
          <thead>
            <tr>
              <th scope="col">Giá trị</th>
              <th scope="col">Định dạng lấy mẫu sắc độ</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><code>00</code></td>
              <td>
                4:2:0 with the chroma samples sited interstitially between the pixels
              </td>
            </tr>
            <tr>
              <td><code>01</code></td>
              <td>
                4:2:0 chroma subsampling with the samples collocated with luma (0, 0)
              </td>
            </tr>
            <tr>
              <td><code>02</code></td>
              <td>
                4:2:2 chroma subsampling (4 out of each 4 horizontal pixels' luminance are used)
              </td>
            </tr>
            <tr>
              <td><code>03</code></td>
              <td>
                4:4:4 chroma subsampling (every pixel's luminance and chrominance are both retained)
              </td>
            </tr>
            <tr>
              <td><code>04</code></td>
              <td><em>Reserved</em></td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>
    <tr>
      <td><code>cp</code></td>
      <td>
        <p>
          Một số nguyên hai chữ số chỉ định màu cơ bản nào trong Mục 8.1 của
          tiêu chuẩn <a href="https://www.itu.int/rec/T-REC-H.273/en"
            >ISO/IEC 23001-8:2016</a
          > được sử dụng.
          Thành phần này và mọi thành phần phía sau nó đều là tùy chọn.
        </p>
        <p>Các giá trị có thể có của thành phần màu cơ bản là:</p>
        <table class="standard-table">
          <caption>
            Định danh màu cơ bản ISO/IEC
          </caption>
          <thead>
            <tr>
              <th scope="col">Value</th>
              <th scope="col">Details</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><code>00</code></td>
              <td><em>Reserved for future use by ITU or ISO/IEC</em></td>
            </tr>
            <tr>
              <td><code>01</code></td>
              <td>
                BT.709, sRGB, sYCC. BT.709 is the standard for high definition (HD) television; sRGB is the most common color space used for computer displays.
                Broadcast BT.709 uses 8-bit color depth with the legal range being from 16 (black) to 235 (white).
              </td>
            </tr>
            <tr>
              <td><code>02</code></td>
              <td>
                Image characteristics are unknown, or are to be determined by the application
              </td>
            </tr>
            <tr>
              <td><code>03</code></td>
              <td><em>Reserved for future use by ITU or ISO/IEC</em></td>
            </tr>
            <tr>
              <td><code>04</code></td>
              <td>
                BT.470 System M, NTSC (standard definition television in the United States)
              </td>
            </tr>
            <tr>
              <td><code>05</code></td>
              <td>
                BT.470 System B, G; BT.601; BT.1358 625; BT.1700 625 PAL and 625 SECAM
              </td>
            </tr>
            <tr>
              <td><code>06</code></td>
              <td>
                BT.601 525; BT.1358 525 or 625; BT.1700 NTSC; SMPTE 170M.
                <em>Functionally identical to <code>7</code>.</em>
              </td>
            </tr>
            <tr>
              <td><code>70</code></td>
              <td>
                {{Glossary("SMPTE")}} 240M (historical).
                <em>Functionally identical to <code>6</code>.</em>
              </td>
            </tr>
            <tr>
              <td><code>08</code></td>
              <td>Generic film</td>
            </tr>
            <tr>
              <td><code>09</code></td>
              <td>
                BT.2020; BT.2100.
                Used for ultra-high definition (4K) High Dynamic Range (HDR) video, these have a very wide color {{glossary("gamut")}} and support 10-bit and 12-bit color component depths.
              </td>
            </tr>
            <tr>
              <td><code>10</code></td>
              <td>
                SMPTE ST 428 (D-Cinema Distribution Master: Image characteristics).
                Defines the uncompressed image characteristics for DCDM.
              </td>
            </tr>
            <tr>
              <td><code>11</code></td>
              <td>
                SMPTE RP 431 (D-Cinema Quality: Reference projector and environment).
                Describes the reference projector and environment conditions that provide a consistent film presentation experience.
              </td>
            </tr>
            <tr>
              <td><code>12</code></td>
              <td>
                SMPTE EG 432 (Digital Source Processing: Color Processing for D-Cinema).
                Engineering guideline making color signal decoding recommendations for digital movies.
              </td>
            </tr>
            <tr>
              <td><code>13</code> – <code>21</code></td>
              <td><em>Reserved for future use by ITU-T or ISO/IEC</em></td>
            </tr>
            <tr>
              <td><code>22</code></td>
              <td>EBU Tech 3213-E</td>
            </tr>
            <tr>
              <td><code>23</code> – <code>255</code></td>
              <td><em>Reserved for future use by ITU-T or ISO/IEC</em></td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>
    <tr>
      <td><code>tc</code></td>
      <td>
        Một số nguyên hai chữ số cho biết
        <code>transferCharacteristics</code> của video.
        Giá trị này lấy từ Mục 8.2 của
        <a href="https://www.itu.int/rec/T-REC-H.273/en">ISO/IEC 23001-8:2016</a>
        và chỉ ra đặc tính truyền cần dùng khi điều chỉnh màu đã giải mã sang
        mục tiêu hiển thị.
      </td>
    </tr>
    <tr>
      <td><code>mc</code></td>
      <td>
        Giá trị hai chữ số cho thuộc tính <code>matrixCoefficients</code>.
        Giá trị này lấy từ bảng trong Mục 8.3 của đặc tả
        <a href="https://www.itu.int/rec/T-REC-H.273/en">ISO/IEC 23001-8:2016</a>.
        Giá trị này cho biết cần dùng bộ hệ số nào khi ánh xạ từ các màu cơ bản
        đỏ, lam và lục gốc sang tín hiệu luma và chroma.
        Các hệ số này sau đó được dùng với các phương trình được nêu trong cùng
        mục đó.
      </td>
    </tr>
    <tr>
      <td><code>FF</code></td>
      <td>
        Cho biết có giới hạn mức đen và dải màu của từng thành phần màu vào dải
        hợp lệ hay không.
        Với mẫu màu 8 bit, dải hợp lệ là 16-235.
        Giá trị <code>00</code> cho biết các giới hạn này phải được áp dụng,
        trong khi giá trị <code>01</code> cho phép dùng toàn bộ dải giá trị có
        thể có của từng thành phần, ngay cả khi màu kết quả nằm ngoài giới hạn
        của hệ màu.
      </td>
    </tr>
  </tbody>
</table>

#### Examples

- `video/webm;codecs="vp09.02.10.10.01.09.16.09.01,opus"`
  - : Video VP9, profile 2 level 1.0, với nội dung YUV 10 bit dùng chroma subsampling 4:2:0, màu cơ bản BT.2020, ST 2084 EOTF (HDR SMPTE), ma trận màu BT.2020 không độ chói hằng, cùng mã hóa chroma và luma toàn dải. Âm thanh ở định dạng Opus.

### ISO Base Media File Format: MP4, QuickTime, and 3GP

Tất cả các media type dựa trên [ISO Base Media File Format](https://en.wikipedia.org/wiki/ISO_Base_Media_File_Format) (ISO BMFF) đều dùng chung cú pháp cho tham số `codecs`. Những media type này bao gồm [MPEG-4](/en-US/docs/Web/Media/Guides/Formats/Containers#mpeg-4_mp4) (và thực tế là cả định dạng tệp [QuickTime](/en-US/docs/Web/Media/Guides/Formats/Containers#quicktime) mà MPEG-4 dựa trên) cũng như [3GP](/en-US/docs/Web/Media/Guides/Formats/Containers#3gp). Cả track video lẫn audio đều có thể được mô tả bằng tham số `codecs` với các MIME type sau:

| MIME type         | Mô tả                                                                                                                 |
| ----------------- | --------------------------------------------------------------------------------------------------------------------- |
| `audio/3gpp`      | Âm thanh 3GP ({{RFC(3839, "MIME Type Registrations for 3rd generation Partnership Project (3GP) Multimedia files")}}) |
| `video/3gpp`      | Video 3GP ({{RFC(3839, "MIME Type Registrations for 3rd generation Partnership Project (3GP) Multimedia files")}})    |
| `audio/3gp2`      | Âm thanh 3GP2 ({{RFC(4393, "MIME Type Registrations for 3GPP2 Multimedia files")}})                                   |
| `video/3gp2`      | Video 3GP2 ({{RFC(4393, "MIME Type Registrations for 3GPP2 Multimedia files")}})                                      |
| `audio/mp4`       | Âm thanh MP4 ({{RFC(4337, "MIME Type Registration for MPEG-4")}})                                                     |
| `video/mp4`       | Video MP4 ({{RFC(4337, "MIME Type Registration for MPEG-4")}})                                                        |
| `application/mp4` | Media không phải âm thanh hoặc hình ảnh được đóng gói trong MPEG-4                                                    |

Mỗi codec được mô tả bởi tham số `codecs` có thể được chỉ định hoặc bằng tên của container (`3gp`, `mp4`, `quicktime`, v.v.) hoặc bằng tên container cộng với các tham số bổ sung để chỉ rõ codec và cấu hình của nó. Mỗi mục trong danh sách codec có thể chứa một số thành phần, được phân tách bằng dấu chấm (`.`).

Cú pháp của giá trị `codecs` khác nhau tùy codec; tuy nhiên, nó luôn bắt đầu bằng mã định danh bốn ký tự của codec, theo sau là dấu chấm (`.`), rồi đến giá trị Object Type Indication (OTI) cho định dạng dữ liệu cụ thể. Với hầu hết codec, OTI là số thập lục phân hai chữ số; riêng [AVC (H.264)](/en-US/docs/Web/Media/Guides/Formats/Video_codecs#avc_h.264) dùng sáu chữ số thập lục phân.

Vì vậy, cú pháp cho từng codec được hỗ trợ có dạng như sau:

- `cccc[.pp]*` (Generic ISO BMFF)
  - : Trong đó `cccc` là mã ID bốn ký tự của codec và `pp` là nơi chứa không hoặc nhiều giá trị thuộc tính đã mã hóa bằng hai ký tự.
- `mp4a.oo[.A]` (MPEG-4 audio)
  - : Trong đó `oo` là giá trị Object Type Indication mô tả chính xác hơn nội dung của media và `A` là _audio_ OTI một chữ số. Các giá trị có thể có của OTI có trên [trang Object Types](https://mp4ra.org/registered-types/object-types) của MP4 Registration Authority. Ví dụ, âm thanh Opus trong tệp MP4 là `mp4a.ad`. Xem [Âm thanh MPEG-4](#mpeg-4_audio) để biết thêm chi tiết.
- `mp4v.oo[.V]` (MPEG-4 video)
  - : Ở đây, `oo` tiếp tục là OTI mô tả nội dung chính xác hơn, còn `V` là _video_ OTI một chữ số.
- `avc1[.PPCCLL]` (AVC video)
  - : `PPCCLL` là sáu chữ số thập lục phân chỉ định số profile (`PP`), cờ constraint set (`CC`) và level (`LL`). Xem [Các profile AVC](#avc_profiles) để biết các giá trị có thể có của `PP`.

    Byte cờ constraint set gồm các cờ Boolean một bit, trong đó bit có trọng số cao nhất được gọi là cờ 0 (hoặc `constraint_set0_flag` trong một số tài liệu), và mỗi bit tiếp theo tăng số thứ tự thêm một. Hiện tại chỉ dùng các cờ từ 0 đến 2; năm bit còn lại _phải_ bằng 0. Ý nghĩa của các cờ thay đổi tùy profile đang dùng.

    Level là số dấu phẩy cố định, vì vậy giá trị `14` (thập phân 20) nghĩa là level 2.0, còn giá trị `3D` (thập phân 61) nghĩa là level 6.1. Nói chung, số level càng cao thì luồng càng dùng nhiều băng thông và hỗ trợ kích thước video tối đa càng lớn.

- `avc3[.PPCCLL]` (Variable resolution AVC)
  - : Tham số codec `avc3` có cùng cú pháp với tham số codec `avc1`.

#### AVC profiles

Sau đây là các profile AVC cùng số profile tương ứng để dùng trong tham số `codecs`, cũng như giá trị cần chỉ định cho thành phần ràng buộc `CC`.

| Profile                                                                                                                                                                                                                                                                                                                          | Số (Hex) | Byte ràng buộc |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | -------------- |
| **Constrained Baseline Profile (CBP)** CBP chủ yếu là giải pháp cho các tình huống có tài nguyên hạn chế, hoặc cần kiểm soát việc dùng tài nguyên để giảm nguy cơ media hoạt động kém.                                                                                                                                           | `42`     | `40`           |
| **Baseline Profile (BP)** Tương tự CBP nhưng có thêm cơ chế bảo vệ chống mất dữ liệu và phục hồi. Profile này hiện không còn được dùng rộng rãi như trước khi CBP xuất hiện. Mọi luồng CBP cũng được xem là luồng BP.                                                                                                            | `42`     | `00`           |
| **Extended Profile (XP)** Được thiết kế cho truyền phát video qua mạng, với khả năng nén cao và cải thiện thêm về độ bền dữ liệu cũng như chuyển đổi luồng.                                                                                                                                                                      | `58`     | `00`           |
| **Main Profile (MP)** Profile dùng cho truyền hình số độ phân giải chuẩn phát ở định dạng MPEG-4. _Không_ dùng cho truyền hình độ nét cao. Tầm quan trọng của profile này đã giảm đi kể từ khi High Profile ra đời vào năm 2004 để phục vụ HDTV.                                                                                 | `4D`     | `00`           |
| **High Profile (HiP)** Hiện nay, HiP là profile chính được dùng cho video HD phát sóng và phát hành trên đĩa; nó được dùng cho cả truyền hình HD lẫn video Blu-Ray.                                                                                                                                                              | `64`     | `00`           |
| **Progressive High Profile (PHiP)** Về cơ bản là High Profile nhưng không hỗ trợ field coding.                                                                                                                                                                                                                                   | `64`     | `08`           |
| **Constrained High Profile** Là PHiP nhưng không hỗ trợ lát cắt dự đoán hai chiều ("B-slices").                                                                                                                                                                                                                                  | `64`     | `0C`           |
| **High 10 Profile (Hi10P)** High Profile, nhưng hỗ trợ tới 10 bit cho mỗi thành phần màu.                                                                                                                                                                                                                                        | `6E`     | `00`           |
| **High 4:2:2 Profile (Hi422P)** Mở rộng Hi10P bằng cách thêm hỗ trợ chroma subsampling 4:2:2 cùng tối đa 10 bit cho mỗi thành phần màu.                                                                                                                                                                                          | `7A`     | `00`           |
| **High 4:4:4 Predictive Profile (Hi444PP)** Ngoài các khả năng có trong Hi422P, Hi444PP bổ sung hỗ trợ chroma subsampling 4:4:4 (không loại bỏ thông tin màu). Nó cũng hỗ trợ tới 14 bit cho mỗi mẫu màu và mã hóa vùng không mất dữ liệu hiệu quả. Ngoài ra còn có tùy chọn mã hóa mỗi khung thành ba mặt phẳng màu riêng biệt. | `F4`     | `00`           |
| **High 10 Intra Profile** High 10 bị ràng buộc chỉ dùng intra-frame. Chủ yếu dùng cho ứng dụng chuyên nghiệp.                                                                                                                                                                                                                    | `6E`     | `10`           |
| **High 4:2:2 Intra Profile** Hi422 Profile nhưng chỉ dùng all-intra-frame.                                                                                                                                                                                                                                                       | `7A`     | `10`           |
| **High 4:4:4 Intra Profile** High 4:4:4 Profile bị ràng buộc chỉ dùng intra frame.                                                                                                                                                                                                                                               | `F4`     | `10`           |
| **CAVLC 4:4:4 Intra Profile** High 4:4:4 Profile bị ràng buộc dùng all-intra và chỉ dùng mã hóa entropy CAVLC.                                                                                                                                                                                                                   | `44`     | `00`           |
| **Scalable Baseline Profile** Được thiết kế cho hội nghị video, giám sát và các tình huống di động; SVC Baseline Profile dựa trên AVC Constrained Baseline profile. Lớp cơ sở của luồng được cung cấp ở chất lượng cao, cùng một số luồng phụ cho các biến thể khác của cùng video trong môi trường bị ràng buộc.                | `53`     | `00`           |
| **Scalable Constrained Baseline Profile** Chủ yếu dùng cho các ứng dụng giao tiếp thời gian thực. Chưa được WebRTC hỗ trợ, nhưng đang có phần mở rộng của WebRTC API [để cho phép SVC](https://github.com/w3c/webrtc-svc).                                                                                                       | `53`     | `04`           |
| **Scalable High Profile** Chủ yếu dùng trong các ứng dụng phát sóng và streaming. Lớp cơ sở (hoặc chất lượng cao nhất) phải tuân theo AVC High Profile.                                                                                                                                                                          | `56`     | `00`           |
| **Scalable Constrained High Profile** Tập con của Scalable High Profile, được thiết kế chủ yếu cho giao tiếp thời gian thực.                                                                                                                                                                                                     | `56`     | `04`           |
| **Scalable High Intra Profile** Chủ yếu hữu ích cho ứng dụng sản xuất nội dung; profile này chỉ hỗ trợ all-intra.                                                                                                                                                                                                                | `56`     | `20`           |
| **Stereo High Profile** Cung cấp video lập thể bằng hai bản dựng của cùng cảnh (mắt trái và mắt phải). Ngoài ra, nó có cùng các tính năng như High Profile.                                                                                                                                                                      | `80`     | `00`           |
| **Multiview High Profile** Hỗ trợ hai hoặc nhiều góc nhìn bằng cả dự đoán liên khung theo thời gian và dự đoán liên góc nhìn MVC. _Không hỗ trợ_ field picture hoặc mã hóa macroblock-adaptive frame-field.                                                                                                                      | `76`     | `00`           |
| **Multiview Depth High Profile** Dựa trên High Profile, mà luồng con chính phải tuân theo. Các luồng con còn lại phải khớp với Stereo High Profile.                                                                                                                                                                              | `8A`     | `00`           |

#### MPEG-4 audio

Khi giá trị của một mục trong danh sách `codecs` bắt đầu bằng `mp4a`, cú pháp của giá trị đó sẽ là:

```plain
mp4a.oo[.A]
```

Ở đây, `oo` là mã định danh loại đối tượng (Object Type Indication) thập lục phân hai chữ số, dùng để chỉ định lớp codec được dùng cho media. Các OTI do [MP4 Registration Authority](https://mp4ra.org/) cấp, cơ quan này duy trì [danh sách các giá trị OTI có thể có](https://mp4ra.org/registered-types/object-types). Một giá trị đặc biệt là `40`; nó cho biết media là âm thanh MPEG-4 (ISO/IEC 14496 Part 3). Để chỉ rõ hơn nữa, một thành phần thứ ba - Audio Object Type - được thêm vào cho OTI `40` để thu hẹp loại thành một subtype cụ thể của MPEG-4.

Audio Object Type được chỉ định dưới dạng giá trị _thập phân_ một hoặc hai chữ số (khác với hầu hết các giá trị khác trong tham số `codecs`, vốn dùng hệ thập lục phân). Ví dụ, AAC-LC của MPEG-4 có số audio object type là `2`, nên giá trị `codecs` đầy đủ đại diện cho AAC-LC là `mp4a.40.2`.

Vì vậy, ER AAC LC, có Audio Object Type là 17, có thể được biểu diễn bằng giá trị `codecs` đầy đủ là `mp4a.40.17`. Các giá trị một chữ số có thể được ghi dưới dạng một chữ số (đây là lựa chọn tốt hơn vì tương thích rộng nhất) hoặc được đệm thêm số 0 ở đầu để thành hai chữ số, chẳng hạn `mp4a.40.02`.

> [!NOTE]
> Đặc tả ban đầu yêu cầu số Audio Object Type trong thành phần thứ ba chỉ được có một chữ số thập phân. Tuy nhiên, các sửa đổi sau này đã mở rộng phạm vi giá trị này vượt xa một chữ số, vì vậy hiện nay tham số thứ ba có thể là một hoặc hai chữ số. Việc đệm thêm `0` ở đầu cho các giá trị nhỏ hơn 10 là tùy chọn. Dù vậy, các triển khai codec MPEG-4 cũ hơn có thể không hỗ trợ giá trị hai chữ số, nên dùng một chữ số khi có thể sẽ tối đa hóa khả năng tương thích.

Các Audio Object Type được định nghĩa trong ISO/IEC 14496-3 subpart 1, section 1.5.1. Bảng dưới đây cung cấp danh sách cơ bản các Audio Object Type và, với những loại phổ biến hơn, danh sách các profile hỗ trợ nó; nhưng nếu bạn cần biết thêm chi tiết về cách hoạt động bên trong của một loại âm thanh MPEG-4 cụ thể, hãy tham chiếu tới đặc tả.

<table class="standard-table">
  <caption>
    MPEG-4 audio object types
  </caption>
  <thead>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Audio Object Type</th>
      <th scope="col">Profile support</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>0</code></td>
      <td>NULL</td>
      <td></td>
    </tr>
    <tr>
      <td><code>1</code></td>
      <td>AAC Main</td>
      <td>Main</td>
    </tr>
    <tr>
      <td><code>2</code></td>
      <td>AAC LC (Low Complexity)</td>
      <td>Main, Scalable, HQ, LD v2, AAC, HE-AAC, HE-AAC v2</td>
    </tr>
    <tr>
      <td><code>3</code></td>
      <td>AAC SSR (Scalable Sampling Rate)</td>
      <td>Main</td>
    </tr>
    <tr>
      <td><code>4</code></td>
      <td>AAC LTP (Long Term Prediction)</td>
      <td>Main, Scalable, HQ</td>
    </tr>
    <tr>
      <td><code>5</code></td>
      <td>SBR (Spectral Band Replication)</td>
      <td>HE-AAC, HE-AAC v2</td>
    </tr>
    <tr>
      <td><code>6</code></td>
      <td>AAC Scalable</td>
      <td>Main, Scalable, HQ</td>
    </tr>
    <tr>
      <td><code>7</code></td>
      <td>TwinVQ (Coding for ultra-low bit rates)</td>
      <td>Main, Scalable</td>
    </tr>
    <tr>
      <td><code>8</code></td>
      <td>CELP (Code-Excited Linear Prediction)</td>
      <td>Main, Scalable, Speech, HQ, LD</td>
    </tr>
    <tr>
      <td><code>9</code></td>
      <td>HVXC (Harmonic Vector Excitation Coding)</td>
      <td>Main, Scalable, Speech, LD</td>
    </tr>
    <tr>
      <td><code>10</code> – <code>11</code></td>
      <td><em>Reserved</em></td>
      <td></td>
    </tr>
    <tr>
      <td><code>12</code></td>
      <td>TTSI (Text to Speech Interface)</td>
      <td>Main, Scalable, Speech, Synthetic, LD</td>
    </tr>
    <tr>
      <td><code>13</code></td>
      <td>Main Synthetic</td>
      <td>Main, Synthetic</td>
    </tr>
    <tr>
      <td><code>14</code></td>
      <td>Wavetable Synthesis</td>
      <td></td>
    </tr>
    <tr>
      <td><code>15</code></td>
      <td>General MIDI</td>
      <td></td>
    </tr>
    <tr>
      <td><code>16</code></td>
      <td>Algorithmic Synthesis and Audio Effects</td>
      <td></td>
    </tr>
    <tr>
      <td><code>17</code></td>
      <td>ER AAC LC (Error Resilient AAC Low-Complexity)</td>
      <td>HQ, Mobile Internetworking</td>
    </tr>
    <tr>
      <td><code>18</code></td>
      <td><em>Reserved</em></td>
      <td></td>
    </tr>
    <tr>
      <td><code>19</code></td>
      <td>ER AAC LTP (Error Resilient AAC Long Term Prediction)</td>
      <td>HQ</td>
    </tr>
    <tr>
      <td><code>20</code></td>
      <td>ER AAC Scalable (Error Resilient AAC Scalable)</td>
      <td>Mobile Internetworking</td>
    </tr>
    <tr>
      <td><code>21</code></td>
      <td>ER TwinVQ (Error Resilient TwinVQ)</td>
      <td>Mobile Internetworking</td>
    </tr>
    <tr>
      <td><code>22</code></td>
      <td>ER BSAC (Error Resilient Bit-Sliced Arithmetic Coding)</td>
      <td>Mobile Internetworking</td>
    </tr>
    <tr>
      <td><code>23</code></td>
      <td>
        ER AAC LD (Error Resilient AAC Low-Delay; used for two-way
        communication)
      </td>
      <td>LD, Mobile Internetworking</td>
    </tr>
    <tr>
      <td><code>24</code></td>
      <td>ER CELP (Error Resilient Code-Excited Linear Prediction)</td>
      <td>HQ, LD</td>
    </tr>
    <tr>
      <td><code>25</code></td>
      <td>ER HVXC (Error Resilient Harmonic Vector Excitation Coding)</td>
      <td>LD</td>
    </tr>
    <tr>
      <td><code>26</code></td>
      <td>ER HILN (Error Resilient Harmonic and Individual Line plus Noise)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>27</code></td>
      <td>ER Parametric (Error Resilient Parametric)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>28</code></td>
      <td>SSC (Sinusoidal Coding)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>29</code></td>
      <td>PS (Parametric Stereo)</td>
      <td>HE-AAC v2</td>
    </tr>
    <tr>
      <td><code>30</code></td>
      <td>MPEG Surround</td>
      <td></td>
    </tr>
    <tr>
      <td><code>31</code></td>
      <td><em>Escape</em></td>
      <td></td>
    </tr>
    <tr>
      <td><code>32</code></td>
      <td>MPEG-1 Layer-1</td>
      <td></td>
    </tr>
    <tr>
      <td><code>33</code></td>
      <td>MPEG-1 Layer-2 (MP2)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>34</code></td>
      <td>MPEG-1 Layer-3 (MP3)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>35</code></td>
      <td>DST (Direct Stream Transfer)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>36</code></td>
      <td>ALS (Audio Lossless)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>37</code></td>
      <td>SLS (Scalable Lossless)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>38</code></td>
      <td>SLS Non-core (Scalable Lossless Non-core)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>39</code></td>
      <td>ER AAC ELD (Error Resilient AAC Enhanced Low Delay)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>40</code></td>
      <td>SMR Simple (Symbolic Music Representation Simple)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>41</code></td>
      <td>SMR Main (Symbolic Music Representation Main)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>42</code></td>
      <td><em>Reserved</em></td>
      <td></td>
    </tr>
    <tr>
      <td><code>43</code></td>
      <td>
        <p>SAOC (Spatial Audio Object Coding)</p>
        <p>
          Defined in
          <a href="https://www.iso.org/standard/54838.html"
            >ISO/IEC 14496-3:2009/Amd.2:2010(E)</a
          >.
        </p>
      </td>
      <td></td>
    </tr>
    <tr>
      <td><code>44</code></td>
      <td>
        <p>LD MPEG Surround (Low Delay MPEG Surround)</p>
        <p>
          Defined in <a href="https://www.iso.org/standard/54838.html">ISO/IEC 14496-3:2009/Amd.2:2010(E)</a>.
        </p>
      </td>
      <td></td>
    </tr>
    <tr>
      <td><code>45</code> and up</td>
      <td><em>Reserved</em></td>
      <td></td>
    </tr>
  </tbody>
</table>

### HEVC: MP4, Quicktime, Matroska

[Codec High Efficiency Video Coding](/en-US/docs/Web/Media/Guides/Formats/Video_codecs#hevc_h.265), còn được gọi là H.265 và MPEG-H Part 2, có thể được đưa vào các container [MP4](/en-US/docs/Web/Media/Guides/Formats/Containers#mpeg-4_mp4) (`video/mp4`), [Quicktime](/en-US/docs/Web/Media/Guides/Formats/Containers#quicktime) (`video/quicktime`) và [Matroska](https://en.wikipedia.org/wiki/Matroska) (`video/matroska`).

Việc sử dụng HEVC thường được mô tả bằng một MIME type hỗ trợ có gắn thêm tham số `codecs`; ví dụ cú pháp như sau:

```plain
video/mp4;codecs=hvc1.1.6.L186.B0,mp4a.40.2
video/mp4;codecs=hvc1.1.6.L186.B0,opus
video/mp4;codecs=hev1.1.6.L186.B0,mp4a.40.2
video/mp4;codecs=hev1.1.6.L186.B0,opus
```

Cú pháp cho từng codec được hỗ trợ có dạng như sau:

- `hvc1[.A.B.C.D]` (HEVC video)
  - : Giá trị bắt đầu bằng mã định danh bốn ký tự của codec (`hvc1`), theo sau là bốn hoặc nhiều giá trị hơn được phân tách bằng dấu chấm (`.`):
    - `A`
      - : **`general_profile_space`**. Giá trị này được mã hóa thành một hoặc hai ký tự:
        - Ký tự đầu tiên là `A`, `B` hoặc `C`, tương ứng với `general_profile_space` `1`, `2` hoặc `3`, hoặc không có ký tự nào để biểu diễn `general_profile_space` `0`.
        - Ký tự thứ hai là số thập phân biểu diễn `general_profile_idc`.
          > [!NOTE]
          > Trong các ví dụ trên, giá trị `1` nghĩa là `general_profile_space === 0` (không có ký tự) và `general_profile_idc === 1`.
    - `B`
      - : Giá trị 32 bit biểu diễn một hoặc nhiều **general profile compatibility flags** (`general_profile_compatibility_flag`), được mã hóa bằng hệ thập lục phân (có thể bỏ qua số 0 ở đầu) và chỉ định theo thứ tự bit đảo ngược từ quan trọng nhất đến ít quan trọng nhất. Các giá trị có thể từ `31` (quan trọng nhất) đến `0` (ít quan trọng nhất), và được quy định trong [ISO/IEC 23008-2](https://www.iso.org/standard/90502.html).

        > [!NOTE]
        > Trong các ví dụ trên, giá trị `6` nghĩa là `general_profile_compatibility_flag === 6`.

    - `C`
      - : **`general_tier_flag`**, được mã hóa là `L` (`general_tier_flag === 0`) hoặc `H` (`general_tier_flag === 1`), theo sau là **`general_level_idc`**, được mã hóa dưới dạng số thập phân.

        > [!NOTE]
        > Trong các ví dụ trên, giá trị `L186` nghĩa là `general_tier_flag === 0`, theo sau là `general_level_idc === 186`.

    - `D`
      - : Một hoặc nhiều **constraint flags** dài 6 byte. Lưu ý rằng mỗi cờ được mã hóa dưới dạng số thập lục phân và được phân cách bằng một dấu chấm bổ sung; các byte cuối có giá trị 0 có thể được lược bỏ.

        > [!NOTE]
        > Trong các ví dụ trên, chỉ có một constraint flag xuất hiện, là `B0`.

- `hev1[.A.B.C.D]` (Variable resolution HEVC)
  - : Tham số codec `hev1` có cùng cú pháp với tham số codec `hvc1`.

### WebM

Dạng cơ bản của tham số `codecs` cho WebM là liệt kê một hoặc nhiều codec trong bốn codec WebM theo tên, ngăn cách bằng dấu phẩy. Bảng dưới đây cho thấy một số ví dụ:

| MIME type                        | Mô tả                                                  |
| -------------------------------- | ------------------------------------------------------ |
| `video/webm;codecs="vp8"`        | Video WebM có chứa video VP8; không chỉ định âm thanh. |
| `video/webm;codecs="vp9"`        | Video WebM có chứa video VP9.                          |
| `audio/webm;codecs="vorbis"`     | Âm thanh Vorbis trong container WebM.                  |
| `audio/webm;codecs="opus"`       | Âm thanh Opus trong container WebM.                    |
| `video/webm;codecs="vp8,vorbis"` | Container WebM chứa video VP8 và âm thanh Vorbis.      |
| `video/webm;codecs="vp9,opus"`   | Container WebM chứa video VP9 và âm thanh Opus.        |

Các chuỗi `vp8.0` và `vp9.0` cũng hoạt động, nhưng không được khuyến nghị.

## Sử dụng tham số codecs

Bạn có thể dùng tham số `codecs` trong một vài tình huống. Trước hết, bạn có thể dùng nó với phần tử {{HTMLElement("source")}} khi tạo phần tử {{HTMLElement("audio")}} hoặc {{HTMLElement("video")}}, nhằm thiết lập một nhóm tùy chọn để trình duyệt lựa chọn khi xác định định dạng media sẽ trình bày cho người dùng trong phần tử đó.

Bạn cũng có thể dùng tham số `codecs` khi chỉ định MIME media type cho phương thức {{domxref("MediaSource/isTypeSupported_static", "MediaSource.isTypeSupported()")}}; phương thức này trả về giá trị Boolean cho biết media có khả năng hoạt động trên thiết bị hiện tại hay không.

## Xem thêm

- [Các công nghệ media trên web](/en-US/docs/Web/Media)
- Phần tử {{HTMLElement("source")}}, phần tử con của {{HTMLElement("audio")}} và {{HTMLElement("video")}}
- [Hướng dẫn về các loại và định dạng media trên web](/en-US/docs/Web/Media/Guides/Formats)
- [Hướng dẫn về codec âm thanh dùng trên web](/en-US/docs/Web/Media/Guides/Formats/Audio_codecs)
- [Hướng dẫn về codec video dùng trên web](/en-US/docs/Web/Media/Guides/Formats/Video_codecs)
- [Codecs used by WebRTC](/en-US/docs/Web/Media/Guides/Formats/WebRTC_codecs)
- [Getting the correct HTML codecs parameter for an AV1 video](https://jakearchibald.com/2022/html-codecs-parameter-for-av1/)
- [High Efficiency Video Coding](https://en.wikipedia.org/wiki/High_Efficiency_Video_Coding) on Wikipedia
