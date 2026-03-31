---
title: Media types (MIME types)
short-title: Media types
slug: Web/HTTP/Guides/MIME_types
page-type: guide
sidebar: http
---

**Kiểu phương tiện** (trước đây được gọi là **Multipurpose Internet Mail Extensions hay kiểu MIME**) cho biết bản chất và định dạng của một tài liệu, tệp, hoặc tập hợp các byte.
Các kiểu MIME được định nghĩa và tiêu chuẩn hóa trong {{RFC(6838)}} của IETF.

[Cơ quan Phân bổ Số Internet (IANA)](https://www.iana.org/) chịu trách nhiệm về tất cả các kiểu MIME chính thức, và bạn có thể tìm thấy danh sách đầy đủ và cập nhật nhất tại trang [Kiểu phương tiện](https://www.iana.org/assignments/media-types/media-types.xhtml) của họ.

> [!WARNING]
> Trình duyệt sử dụng kiểu MIME, _không phải phần mở rộng tệp_, để xác định cách xử lý URL,
> vì vậy điều quan trọng là máy chủ web phải gửi kiểu MIME chính xác trong tiêu đề {{HTTPHeader("Content-Type")}} của phản hồi.
> Nếu điều này không được cấu hình đúng, trình duyệt có khả năng hiểu sai nội dung của tệp, các trang web sẽ không hoạt động đúng, và các tệp được tải xuống có thể bị xử lý không đúng.

## Cấu trúc của kiểu MIME

Kiểu MIME thường bao gồm hai phần: _loại_ và _kiểu con_, được phân tách bằng dấu gạch chéo (`/`) — không có khoảng trắng ở giữa:

```plain
type/subtype
```

**_Loại_** đại diện cho danh mục chung mà kiểu dữ liệu thuộc về, chẳng hạn như `video` hoặc `text`.

**_Kiểu con_** xác định loại dữ liệu chính xác của loại đã chỉ định mà kiểu MIME đại diện.
Ví dụ, đối với kiểu MIME `text`, kiểu con có thể là `plain` (văn bản thuần), `html` (mã nguồn {{Glossary("HTML")}}), hoặc `calendar` (cho tệp iCalendar/`.ics`).

Mỗi loại có tập hợp các kiểu con có thể có của riêng nó. Kiểu MIME luôn có cả loại và kiểu con, không bao giờ chỉ một trong hai.

Một **tham số** tùy chọn có thể được thêm để cung cấp thêm chi tiết:

```plain
type/subtype;parameter=value
```

Ví dụ, đối với bất kỳ kiểu MIME nào có loại chính là `text`, bạn có thể thêm tham số `charset` tùy chọn để chỉ định bộ ký tự được sử dụng cho
các ký tự trong dữ liệu.
Nếu không có `charset` nào được chỉ định, mặc định là {{Glossary("ASCII")}} (`US-ASCII`) trừ khi bị ghi đè bởi cài đặt của {{Glossary("user agent", "user agent")}}.
Để chỉ định tệp văn bản UTF-8, kiểu MIME `text/plain;charset=UTF-8` được sử dụng.

Các kiểu MIME không phân biệt chữ hoa chữ thường nhưng theo truyền thống được viết bằng chữ thường. Các giá trị tham số có thể phân biệt chữ hoa chữ thường.

### Các loại

Có hai lớp loại: **rời rạc** và **nhiều phần**.
Các loại rời rạc là các loại đại diện cho một tệp hoặc phương tiện đơn, chẳng hạn như một tệp văn bản hoặc nhạc đơn, hoặc một video đơn.
Loại nhiều phần đại diện cho một tài liệu bao gồm nhiều thành phần, mỗi thành phần có thể có kiểu MIME riêng; hoặc, loại nhiều phần có thể đóng gói nhiều tệp được gửi cùng nhau trong một giao dịch.
Ví dụ, các kiểu MIME nhiều phần được sử dụng khi đính kèm nhiều tệp vào email.

#### Các loại rời rạc

Các loại rời rạc hiện đang được đăng ký với IANA là:

- `application`
  - : Bất kỳ loại dữ liệu nhị phân nào không thuộc rõ ràng vào một trong các loại khác;
    dữ liệu sẽ được thực thi hoặc diễn giải theo một cách nào đó hoặc dữ liệu nhị phân yêu cầu một ứng dụng cụ thể hoặc danh mục ứng dụng để sử dụng.
    Dữ liệu nhị phân chung (hoặc dữ liệu nhị phân không xác định loại thực sự) là `application/octet-stream`.
    Các ví dụ phổ biến khác bao gồm `application/pdf`, `application/pkcs8`, và `application/zip`.
    [(Xem đăng ký loại application tại IANA)](https://www.iana.org/assignments/media-types/media-types.xhtml#application)
- `audio`
  - : Dữ liệu âm thanh hoặc nhạc. Ví dụ bao gồm `audio/mpeg`,
    `audio/vorbis`.
    [(Xem đăng ký loại audio tại IANA)](https://www.iana.org/assignments/media-types/media-types.xhtml#audio)
- `example`
  - : Được dành riêng để sử dụng như một chỗ giữ chỗ trong các ví dụ minh họa cách sử dụng kiểu MIME.
    Những kiểu này không bao giờ nên được sử dụng bên ngoài danh sách mã mẫu và tài liệu.
    `example` cũng có thể được sử dụng như kiểu con;
    ví dụ, trong một ví dụ liên quan đến làm việc với âm thanh trên web, kiểu MIME `audio/example` có thể được sử dụng để chỉ ra rằng loại là chỗ giữ chỗ và nên được thay thế bằng loại phù hợp khi sử dụng mã trong thế giới thực.
- `font`
  - : Dữ liệu phông chữ/typeface. Các ví dụ phổ biến bao gồm `font/woff`, `font/ttf`, và `font/otf`.
    [(Xem đăng ký loại font tại IANA)](https://www.iana.org/assignments/media-types/media-types.xhtml#font)
- `image`
  - : Dữ liệu hình ảnh hoặc đồ họa bao gồm cả hình ảnh bitmap và vector tĩnh cũng như
    các phiên bản động của các định dạng hình ảnh tĩnh như {{Glossary("GIF")}} động hoặc APNG.
    Các ví dụ phổ biến là `image/jpeg`, `image/png`, và `image/svg+xml`.
    [(Xem đăng ký loại image tại IANA)](https://www.iana.org/assignments/media-types/media-types.xhtml#image)
- `model`
  - : Dữ liệu mô hình cho đối tượng hoặc cảnh 3D. Ví dụ bao gồm `model/3mf` và `model/vrml`.
    [(Xem đăng ký loại model tại IANA)](https://www.iana.org/assignments/media-types/media-types.xhtml#model)
- `text`
  - : Dữ liệu chỉ văn bản bao gồm bất kỳ nội dung con người có thể đọc được, mã nguồn, hoặc dữ liệu văn bản như dữ liệu định dạng giá trị phân tách bằng dấu phẩy (CSV).
    Ví dụ bao gồm: `text/plain`, `text/csv`, và `text/html`.
    [(Xem đăng ký loại text tại IANA)](https://www.iana.org/assignments/media-types/media-types.xhtml#text)
- `video`
  - : Dữ liệu hoặc tệp video, chẳng hạn như phim MP4 (`video/mp4`).
    [(Xem đăng ký loại video tại IANA)](https://www.iana.org/assignments/media-types/media-types.xhtml#video)

Đối với các tài liệu văn bản không có kiểu con cụ thể, nên sử dụng `text/plain`.
Tương tự, đối với các tài liệu nhị phân không có kiểu con cụ thể hoặc đã biết, nên sử dụng `application/octet-stream`.

#### Các loại nhiều phần

Các loại **nhiều phần** chỉ ra một danh mục tài liệu được chia thành
các phần, thường với các kiểu MIME khác nhau; chúng cũng có thể được sử dụng — đặc biệt trong
các tình huống email — để đại diện cho nhiều tệp riêng biệt là một phần của cùng một
giao dịch. Chúng đại diện cho một **tài liệu hợp thành**.

Ngoại trừ `multipart/form-data`, được sử dụng trong phương thức {{HTTPMethod("POST")}} của [HTML Forms](/en-US/docs/Learn_web_development/Extensions/Forms), và `multipart/byteranges`, được sử dụng với {{HTTPStatus("206")}} `Partial Content` để gửi một phần của tài liệu, HTTP không xử lý các tài liệu nhiều phần theo cách đặc biệt: thông điệp được truyền đến trình duyệt (trình duyệt có thể sẽ hiển thị hộp thoại "Save As" nếu không biết cách hiển thị tài liệu).

Có hai loại nhiều phần:

- `message`
  - : Một thông điệp đóng gói các thông điệp khác. Ví dụ, điều này có thể được sử dụng để đại diện cho một email bao gồm một thông điệp được chuyển tiếp như một phần dữ liệu của nó,
    hoặc để cho phép gửi các thông điệp rất lớn theo từng phần như thể đó là nhiều thông điệp.
    Ví dụ bao gồm `message/rfc822` (để trích dẫn thông điệp được chuyển tiếp hoặc trả lời) và `message/partial` để cho phép tự động chia một thông điệp lớn thành các thông điệp nhỏ hơn để người nhận tái hợp.
    [(Xem đăng ký loại message tại IANA)](https://www.iana.org/assignments/media-types/media-types.xhtml#message)
- `multipart`
  - : Dữ liệu bao gồm nhiều thành phần có thể có kiểu MIME khác nhau.
    Ví dụ bao gồm `multipart/form-data` (cho dữ liệu được tạo ra bằng API {{domxref("FormData")}}) và `multipart/byteranges` (được định nghĩa trong {{RFC(7233, "", "5.4.1")}} và được sử dụng với phản hồi {{HTTPStatus(206)}} `Partial Content` của {{Glossary("HTTP")}} được trả về khi dữ liệu được lấy chỉ là một phần của nội dung, chẳng hạn như được gửi bằng tiêu đề {{HTTPHeader("Range")}}).
    [(Xem đăng ký loại multipart tại IANA)](https://www.iana.org/assignments/media-types/media-types.xhtml#multipart)

## Các kiểu MIME quan trọng cho nhà phát triển Web

### application/octet-stream

Đây là mặc định cho các tệp nhị phân. Vì nó có nghĩa là _tệp nhị phân không xác định_, trình duyệt thường không thực thi nó, hoặc thậm chí hỏi xem nó có nên được thực thi hay không. Họ coi nó như thể tiêu đề {{HTTPHeader("Content-Disposition")}} được đặt thành `attachment`, và đề xuất hộp thoại "Save As".

### text/plain

Đây là mặc định cho các tệp văn bản. Ngay cả khi nó thực sự có nghĩa là "tệp văn bản không xác định", trình duyệt giả sử họ có thể hiển thị nó.

> [!NOTE]
> `text/plain` không có nghĩa là "bất kỳ loại dữ liệu văn bản nào".
> Nếu họ mong đợi một loại dữ liệu văn bản cụ thể, họ có thể sẽ không coi đây là phù hợp.
> Cụ thể, nếu họ tải xuống tệp `text/plain` từ phần tử {{HTMLElement("link")}} khai báo tệp CSS, họ sẽ không nhận ra nó là tệp CSS hợp lệ nếu được trình bày với `text/plain`.
> Kiểu MIME CSS `text/css` phải được sử dụng.

### text/css

Các tệp CSS được sử dụng để tạo kiểu cho trang Web **phải** được gửi với `text/css`.
Nếu máy chủ không nhận ra hậu tố `.css` cho các tệp CSS, nó có thể gửi chúng với kiểu MIME `text/plain` hoặc `application/octet-stream`.
Nếu vậy, chúng sẽ không được nhận ra là CSS bởi hầu hết các trình duyệt và sẽ bị bỏ qua.

### text/html

Tất cả nội dung HTML nên được phục vụ với loại này. Các kiểu MIME thay thế cho XHTML (như `application/xhtml+xml`) hầu như không còn hữu ích ngày nay.

> [!NOTE]
> Sử dụng `application/xml` hoặc `application/xhtml+xml` nếu bạn muốn các quy tắc phân tích cú pháp nghiêm ngặt của XML, các phần [`<![CDATA[…]]>`](/en-US/docs/Web/API/CDATASection), hoặc các phần tử không thuộc không gian tên HTML/SVG/MathML.

### text/javascript

Nội dung JavaScript phải luôn được phục vụ với kiểu MIME `text/javascript`.
Vì lý do lịch sử, các trình duyệt có thể hỗ trợ một số [kiểu MIME JavaScript cũ](#kiểu_mime_javascript_cũ) được liệt kê bên dưới, nhưng bạn không nên giả định rằng các script được phục vụ với bất kỳ kiểu MIME nào khác ngoài `text/javascript` sẽ luôn tải hoặc chạy.

Lưu ý rằng trong HTML, thuộc tính [`type`](/en-US/docs/Web/HTML/Reference/Elements/script/type) cho các phần tử {{htmlelement("script")}} chỉ có thể chứa **bản chất kiểu MIME JavaScript**: `text/javascript` hoặc một trong các từ khóa `module` (cho các module ES) hoặc `importmap`.
Bao gồm bất kỳ tham số nào trong thuộc tính `type`, chẳng hạn như `charset=utf-8`, giống như đặt `type` thành [một giá trị không được nhận ra](/en-US/docs/Web/HTML/Reference/Elements/script/type#any_other_value): nội dung script được coi là khối dữ liệu và không được thực thi như JavaScript.
Lưu ý rằng việc đặt `type="text/javascript"` không còn cần thiết nữa; đây là mặc định cho các phần tử `<script>`, vì vậy bạn có thể bỏ qua hoàn toàn thuộc tính `type` trong trường hợp này.
Ngược lại, khi sử dụng tiêu đề HTTP {{httpheader("Content-Type")}}, bạn có thể tùy chọn chỉ định tham số `charset` như thường lệ.

Để biết thêm thông tin xem: [Đăng ký kiểu phương tiện IANA](https://www.iana.org/assignments/media-types/media-types.xhtml#text), [RFC 9239](https://www.rfc-editor.org/rfc/rfc9239.html), và [đặc tả HTML](https://html.spec.whatwg.org/multipage/scripting.html#scriptingLanguages:text/javascript).

#### Kiểu MIME JavaScript cũ

Ngoài kiểu MIME `text/javascript`, vì lý do lịch sử, [Chuẩn MIME Sniffing](https://mimesniff.spec.whatwg.org/)
(định nghĩa cách trình duyệt nên giải thích các kiểu MIME và tìm ra
cách xử lý nội dung không có kiểu MIME hợp lệ) cũng cho phép JavaScript được phục vụ bằng bất kỳ kiểu MIME JavaScript cũ nào sau đây:

- `application/javascript` {{deprecated_inline}}
- `application/ecmascript` {{deprecated_inline}}
- `application/x-ecmascript` {{Non-standard_Inline}}
- `application/x-javascript` {{Non-standard_Inline}}
- `text/ecmascript` {{deprecated_inline}}
- `text/javascript1.0` {{Non-standard_Inline}}
- `text/javascript1.1` {{Non-standard_Inline}}
- `text/javascript1.2` {{Non-standard_Inline}}
- `text/javascript1.3` {{Non-standard_Inline}}
- `text/javascript1.4` {{Non-standard_Inline}}
- `text/javascript1.5` {{Non-standard_Inline}}
- `text/jscript` {{Non-standard_Inline}}
- `text/livescript` {{Non-standard_Inline}}
- `text/x-ecmascript` {{Non-standard_Inline}}
- `text/x-javascript` {{Non-standard_Inline}}

> [!NOTE]
> Mặc dù bất kỳ {{Glossary("user agent")}} nào cũng có thể hỗ trợ bất kỳ hoặc tất cả các kiểu này, bạn chỉ nên sử dụng `text/javascript`.
> Đây là kiểu MIME duy nhất đảm bảo hoạt động ngay bây giờ và trong tương lai.

### application/json

{{glossary("JSON","JavaScript Object Notation (JSON)")}} là định dạng văn bản chuẩn để đại diện cho dữ liệu có cấu trúc dựa trên cú pháp đối tượng JavaScript.
Nó thường được sử dụng để truyền dữ liệu trong các ứng dụng web.

### Các loại hình ảnh

Các tệp có kiểu MIME là `image` chứa dữ liệu hình ảnh.
Kiểu con chỉ định định dạng tệp hình ảnh cụ thể mà dữ liệu đại diện.

Các loại hình ảnh sau được sử dụng phổ biến đủ để được coi là _an toàn_ để sử dụng trên các trang web:

- [`image/apng`](/en-US/docs/Web/Media/Guides/Formats/Image_types#apng_animated_portable_network_graphics): Animated Portable Network Graphics (APNG)
- [`image/avif`](/en-US/docs/Web/Media/Guides/Formats/Image_types#avif_image): AV1 Image File Format (AVIF)
- [`image/gif`](/en-US/docs/Web/Media/Guides/Formats/Image_types#gif_graphics_interchange_format): Graphics Interchange Format (GIF)
- [`image/jpeg`](/en-US/docs/Web/Media/Guides/Formats/Image_types#jpeg_joint_photographic_experts_group_image): Joint Photographic Expert Group image (JPEG)
- [`image/png`](/en-US/docs/Web/Media/Guides/Formats/Image_types#png_portable_network_graphics): Portable Network Graphics (PNG)
- [`image/svg+xml`](/en-US/docs/Web/Media/Guides/Formats/Image_types#svg_scalable_vector_graphics): Scalable Vector Graphics (SVG)
- [`image/webp`](/en-US/docs/Web/Media/Guides/Formats/Image_types#webp_image): Web Picture format (WEBP)

[Hướng dẫn về loại và định dạng tệp hình ảnh](/en-US/docs/Web/Media/Guides/Formats/Image_types#common_image_file_types) cung cấp thông tin và khuyến nghị về khi nào nên sử dụng các định dạng hình ảnh khác nhau.

### Các loại âm thanh và video

Như với hình ảnh, HTML không bắt buộc các trình duyệt web phải hỗ trợ bất kỳ loại tệp và codec cụ thể nào cho các phần tử {{HTMLElement("audio")}} và {{HTMLElement("video")}}, vì vậy điều quan trọng là phải xem xét đối tượng mục tiêu của bạn và phạm vi các trình duyệt (và phiên bản của các trình duyệt đó) họ có thể đang sử dụng khi chọn loại tệp và codec để sử dụng cho phương tiện.

[Hướng dẫn về định dạng container phương tiện](/en-US/docs/Web/Media/Guides/Formats/Containers) cung cấp danh sách các loại tệp thường được các trình duyệt web hỗ trợ,
bao gồm thông tin về các trường hợp sử dụng đặc biệt của chúng, bất kỳ nhược điểm nào họ có, và thông tin tương thích, cùng với các chi tiết khác.

[Hướng dẫn codec âm thanh](/en-US/docs/Web/Media/Guides/Formats/Audio_codecs) và [codec video](/en-US/docs/Web/Media/Guides/Formats/Video_codecs) liệt kê các codec khác nhau mà các trình duyệt web thường hỗ trợ, cung cấp chi tiết tương thích cùng với thông tin kỹ thuật như họ hỗ trợ bao nhiêu kênh âm thanh, loại nén được sử dụng, và tốc độ bit nào và vân vân họ hữu ích.
[Hướng dẫn codec được sử dụng bởi WebRTC](/en-US/docs/Web/Media/Guides/Formats/WebRTC_codecs) mở rộng điều này bằng cách cụ thể bao gồm các codec được hỗ trợ bởi các trình duyệt web chính, vì vậy bạn có thể chọn các codec bao phủ tốt nhất phạm vi trình duyệt bạn muốn hỗ trợ.

Về các kiểu MIME của tệp âm thanh hoặc video, chúng thường chỉ định định dạng container (loại tệp).
Tham số [codecs](/en-US/docs/Web/Media/Guides/Formats/codecs_parameter) tùy chọn có thể được thêm vào kiểu MIME để chỉ định thêm codec nào sẽ sử dụng và các tùy chọn nào được sử dụng để mã hóa phương tiện, chẳng hạn như profile codec, cấp độ, hoặc thông tin như vậy khác.

Để biết thêm thông tin về các kiểu phương tiện phổ biến, xem trang [Kiểu MIME phổ biến](/en-US/docs/Web/HTTP/Guides/MIME_types/Common_types).

### multipart/form-data

Loại `multipart/form-data` có thể được sử dụng khi gửi các giá trị của [HTML Form](/en-US/docs/Learn_web_development/Extensions/Forms) đã hoàn thành từ trình duyệt đến máy chủ.

Là định dạng tài liệu nhiều phần, nó bao gồm các phần khác nhau, được phân cách bằng ranh giới (một chuỗi bắt đầu bằng dấu gạch ngang kép `--`).
Mỗi phần là thực thể riêng của nó với các tiêu đề HTTP riêng, {{HTTPHeader("Content-Disposition")}}, và {{HTTPHeader("Content-Type")}} cho các trường tải lên tệp.

```http
Content-Type: multipart/form-data; boundary=boundaryString
(other headers associated with the multipart document as a whole)

--boundaryString
Content-Disposition: form-data; name="myFile"; filename="img.jpg"
Content-Type: image/jpeg

(data)
--boundaryString
Content-Disposition: form-data; name="myField"

(data)
--boundaryString
(more subparts)
--boundaryString--
```

`<form>` sau đây:

```html
<form
  action="http://localhost:8000/"
  method="post"
  enctype="multipart/form-data">
  <label>Name: <input name="myTextField" value="Test" /></label>
  <label><input type="checkbox" name="myCheckBox" /> Check</label>
  <label>
    Upload file: <input type="file" name="myFile" value="test.txt" />
  </label>
  <button>Send the file</button>
</form>
```

sẽ gửi thông điệp này:

```http
POST / HTTP/1.1
Host: localhost:8000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:50.0) Gecko/20100101 Firefox/50.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate
Connection: keep-alive
Upgrade-Insecure-Requests: 1
Content-Type: multipart/form-data; boundary=---------------------------8721656041911415653955004498
Content-Length: 465

-----------------------------8721656041911415653955004498
Content-Disposition: form-data; name="myTextField"

Test
-----------------------------8721656041911415653955004498
Content-Disposition: form-data; name="myCheckBox"

on
-----------------------------8721656041911415653955004498
Content-Disposition: form-data; name="myFile"; filename="test.txt"
Content-Type: text/plain

Simple file.
-----------------------------8721656041911415653955004498--
```

### multipart/byteranges

Kiểu MIME `multipart/byteranges` được sử dụng để gửi các phản hồi một phần cho trình duyệt.

Khi mã trạng thái {{HTTPStatus("206", "206 Partial Content")}} được gửi, kiểu MIME này cho biết rằng tài liệu bao gồm nhiều phần, mỗi phần cho một trong các
phạm vi được yêu cầu. Giống như các loại nhiều phần khác, {{HTTPHeader("Content-Type")}} sử dụng `boundary` để phân tách các phần.
Mỗi phần có tiêu đề {{HTTPHeader("Content-Type")}} với loại thực tế của nó và {{HTTPHeader("Content-Range")}} của phạm vi nó đại diện.

```http
HTTP/1.1 206 Partial Content
Accept-Ranges: bytes
Content-Type: multipart/byteranges; boundary=3d6b6a416f9b5
Content-Length: 385

--3d6b6a416f9b5
Content-Type: text/html
Content-Range: bytes 100-200/1270

eta http-equiv="Content-type" content="text/html; charset=utf-8" />
    <meta name="viewport" content
--3d6b6a416f9b5
Content-Type: text/html
Content-Range: bytes 300-400/1270

-color: #f0f0f2;
        margin: 0;
        padding: 0;
        font-family: "Open Sans", "Helvetica
--3d6b6a416f9b5--
```

## Tầm quan trọng của việc đặt kiểu MIME đúng

Một số cấu hình máy chủ có thể sử dụng kiểu MIME liên kết để thực hiện các tối ưu hóa, chẳng hạn như ghép tệp, nén, hoặc lưu vào bộ nhớ đệm. Xem [h5bp/server-configs-apache](https://github.com/h5bp/server-configs-apache/blob/main/h5bp/web_performance/compression.conf) để biết ví dụ về cấu hình Apache nén các tệp của các kiểu MIME nhất định.

Hầu hết các máy chủ web gửi các tài nguyên không được nhận dạng dưới dạng kiểu MIME `application/octet-stream`.
Vì lý do bảo mật, hầu hết các trình duyệt không cho phép đặt hành động tùy chỉnh mặc định (như "Mở trong Word") cho các tài nguyên như vậy, buộc người dùng phải lưu nó vào đĩa để sử dụng.

Một số cấu hình máy chủ sai phổ biến:

- Tệp nén RAR.
  Trong trường hợp này, lý tưởng là loại thực sự của các tệp gốc; điều này thường không thể vì tệp .RAR có thể chứa một số tài nguyên thuộc các loại khác nhau.
  Trong trường hợp này, hãy cấu hình máy chủ để gửi `application/x-rar-compressed`.
- Âm thanh và video.
  Chỉ các tài nguyên có Kiểu MIME đúng mới được phát trong các phần tử {{HTMLElement("video")}} hoặc {{HTMLElement("audio")}}.
  Hãy đảm bảo chỉ định [kiểu phương tiện đúng cho âm thanh và video](/en-US/docs/Web/Media/Guides/Formats).
- Các loại tệp độc quyền.
  Một loại cụ thể như `application/vnd.mspowerpoint` cho phép người dùng mở các tệp như vậy tự động trong phần mềm trình bày của họ.

## MIME sniffing

Trong trường hợp không có kiểu MIME, hoặc trong một số trường hợp nhất định khi trình duyệt tin rằng chúng không chính xác, trình duyệt có thể thực hiện _MIME sniffing_ — đoán kiểu MIME đúng bằng cách xem các byte của tài nguyên.

Mỗi trình duyệt thực hiện MIME sniffing khác nhau và trong các trường hợp khác nhau.
(Ví dụ, Safari sẽ xem phần mở rộng tệp trong URL nếu kiểu MIME được gửi không phù hợp.)
Có những mối quan ngại bảo mật vì một số kiểu MIME đại diện cho nội dung thực thi.
Các máy chủ có thể ngăn MIME sniffing bằng cách gửi tiêu đề {{HTTPHeader("X-Content-Type-Options")}}.

## Các phương pháp khác để truyền đạt loại tài liệu

Các kiểu MIME không phải là cách duy nhất để truyền đạt thông tin loại tài liệu:

- Hậu tố tên tệp đôi khi được sử dụng, đặc biệt trên Microsoft Windows.
  Không phải tất cả các hệ điều hành đều coi các hậu tố này có ý nghĩa (như Linux và macOS), và không có gì đảm bảo chúng là chính xác.
- Số ma thuật. Cú pháp của các định dạng khác nhau cho phép suy luận loại tệp bằng cách xem cấu trúc byte của chúng.
  Ví dụ, các tệp GIF bắt đầu bằng giá trị thập lục phân `47 49 46 38 39` (`GIF89`), và các tệp PNG với `89 50 4E 47` (`.PNG`).
  Không phải tất cả các loại tệp đều có số ma thuật, vì vậy điều này cũng không đáng tin cậy 100%.

## Xem thêm

- [Công nghệ phương tiện Web](/en-US/docs/Web/Media)
- [Hướng dẫn về các kiểu phương tiện được sử dụng trên web](/en-US/docs/Web/Media/Guides/Formats)
- [Cấu hình đúng kiểu MIME máy chủ](/en-US/docs/Learn_web_development/Extensions/Server-side/Configuring_server_MIME_types)
