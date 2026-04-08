---
title: "<link>: The External Resource Link element"
slug: Web/HTML/Reference/Elements/link
page-type: html-element
browser-compat: html.elements.link
sidebar: htmlsidebar
---

Phần tử **`<link>`** [HTML](/en-US/docs/Web/HTML) chỉ định mối quan hệ giữa tài liệu hiện tại và tài nguyên bên ngoài.
Phần tử này thường được sử dụng để liên kết đến {{Glossary("CSS", "stylesheets")}}, nhưng cũng được sử dụng để thiết lập biểu tượng trang web (cả biểu tượng kiểu "favicon" và biểu tượng cho màn hình chính và ứng dụng trên thiết bị di động) và nhiều thứ khác.

{{InteractiveExample("HTML Demo: &lt;link&gt;", "tabbed-shorter")}}

```html interactive-example
<link href="/shared-assets/misc/link-element-example.css" rel="stylesheet" />

<p>This text will be red as defined in the external stylesheet.</p>
<p style="color: blue">
  The <code>style</code> attribute can override it, though.
</p>
```

Để liên kết một stylesheet bên ngoài, bạn cần bao gồm phần tử `<link>` bên trong {{HTMLElement("head")}} như thế này:

```html
<link href="main.css" rel="stylesheet" />
```

Ví dụ này cung cấp đường dẫn đến stylesheet bên trong thuộc tính `href` và thuộc tính [`rel`](/en-US/docs/Web/HTML/Reference/Attributes/rel) với giá trị `stylesheet`. `rel` viết tắt của "relationship" (mối quan hệ), và là một trong những tính năng chính của phần tử `<link>` — giá trị biểu thị mục được liên kết liên quan đến tài liệu chứa như thế nào.

Có một số loại phổ biến khác bạn sẽ gặp. Ví dụ: liên kết đến favicon của trang:

```html
<link rel="icon" href="favicon.ico" />
```

Có một số giá trị `rel` biểu tượng khác, chủ yếu được sử dụng để chỉ ra các kiểu biểu tượng đặc biệt để sử dụng trên các nền tảng di động khác nhau, ví dụ:

```html
<link
  rel="apple-touch-icon"
  sizes="114x114"
  href="apple-icon-114.png"
  type="image/png" />
```

Thuộc tính `sizes` cho biết kích thước biểu tượng, trong khi `type` chứa MIME type của tài nguyên được liên kết.
Những điều này cung cấp gợi ý hữu ích để cho phép trình duyệt chọn biểu tượng phù hợp nhất.

Bạn cũng có thể cung cấp kiểu media hoặc truy vấn bên trong thuộc tính `media`; tài nguyên này sẽ chỉ được tải nếu điều kiện media là đúng. Ví dụ:

```html
<link href="print.css" rel="stylesheet" media="print" />
<link href="mobile.css" rel="stylesheet" media="screen and (width <= 600px)" />
```

Một số tính năng hiệu suất và bảo mật thú vị đã được thêm vào phần tử `<link>`. Hãy xem ví dụ này:

```html
<link
  rel="preload"
  href="myFont.woff2"
  as="font"
  type="font/woff2"
  crossorigin="anonymous" />
```

Giá trị `rel` là `preload` cho biết rằng trình duyệt nên tải trước tài nguyên này (xem [`rel="preload"`](/en-US/docs/Web/HTML/Reference/Attributes/rel/preload) để biết thêm chi tiết), với thuộc tính `as` cho biết lớp nội dung cụ thể đang được tải về.
Thuộc tính `crossorigin` cho biết liệu tài nguyên có nên được tải về bằng yêu cầu {{Glossary("CORS")}} hay không.

Các ghi chú sử dụng khác:

- Phần tử `<link>` có thể xuất hiện trong phần tử {{HTMLElement("head")}} hoặc {{HTMLElement("body")}}, tùy thuộc vào việc nó có [kiểu liên kết](https://html.spec.whatwg.org/multipage/links.html#body-ok) là **body-ok** không.
  Ví dụ: kiểu liên kết `stylesheet` là body-ok, và do đó `<link rel="stylesheet">` được phép trong body.
  Tuy nhiên, đây không phải là thực hành tốt để tuân theo; có ý nghĩa hơn khi tách các phần tử `<link>` của bạn khỏi nội dung body, đặt chúng trong `<head>`.
- Khi sử dụng `<link>` để thiết lập favicon cho trang web, và trang web của bạn sử dụng Content Security Policy (CSP) để tăng cường bảo mật, chính sách áp dụng cho favicon.
  Nếu bạn gặp vấn đề với favicon không tải, hãy xác minh rằng chỉ thị [`img-src`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/img-src) của tiêu đề {{HTTPHeader("Content-Security-Policy")}} không ngăn truy cập vào nó.
- Các đặc tả HTML và XHTML xác định các trình xử lý sự kiện cho phần tử `<link>`, nhưng không rõ cách chúng sẽ được sử dụng.
- Theo XHTML 1.0, {{glossary("void element", "void elements")}} như `<link>` yêu cầu dấu gạch chéo cuối: `<link />`.
- WebTV hỗ trợ sử dụng giá trị `next` cho `rel` để tải trước trang tiếp theo trong một chuỗi tài liệu.

## Thuộc tính

Phần tử này bao gồm các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

- `as`
  - : Thuộc tính này được yêu cầu khi [`rel="preload"`](/en-US/docs/Web/HTML/Reference/Attributes/rel/preload) đã được đặt trên phần tử `<link>`, tùy chọn khi [`rel="modulepreload"`](/en-US/docs/Web/HTML/Reference/Attributes/rel/modulepreload) đã được đặt, và nếu không thì không nên sử dụng.
    Nó chỉ định kiểu nội dung đang được tải bởi `<link>`, điều này cần thiết để khớp yêu cầu, áp dụng [content security policy](/en-US/docs/Web/HTTP/Guides/CSP) chính xác, và đặt tiêu đề yêu cầu {{HTTPHeader("Accept")}} chính xác.

    Hơn nữa, `rel="preload"` sử dụng điều này như một tín hiệu cho việc ưu tiên yêu cầu.
    Bảng dưới đây liệt kê các giá trị hợp lệ cho thuộc tính này và các phần tử hoặc tài nguyên chúng áp dụng.

    <table class="standard-table">
      <thead>
        <tr>
          <th scope="col">Giá trị</th>
          <th scope="col">Áp dụng cho</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>audio</td>
          <td>Các phần tử <code>&#x3C;audio></code></td>
        </tr>
        <tr>
          <td>document</td>
          <td>Các phần tử <code>&#x3C;iframe></code> và <code>&#x3C;frame></code></td>
        </tr>
        <tr>
          <td>embed</td>
          <td>Các phần tử <code>&#x3C;embed></code></td>
        </tr>
        <tr>
          <td>fetch</td>
          <td>
            <p>fetch, XHR</p>
            <div class="notecard note">
              <p>
                <strong>Lưu ý:</strong> Giá trị này cũng yêu cầu
                <code>&#x3C;link></code> chứa thuộc tính crossorigin, xem <a href="/en-US/docs/Web/HTML/Reference/Attributes/rel/preload#cors-enabled_fetches">CORS-enabled fetches</a>.
              </p>
            </div>
          </td>
        </tr>
        <tr>
          <td>font</td>
          <td>
            <p>CSS @font-face</p>
            <div class="notecard note">
              <p>
                <strong>Lưu ý:</strong> Giá trị này cũng yêu cầu
                <code>&#x3C;link></code> chứa thuộc tính crossorigin, xem <a href="/en-US/docs/Web/HTML/Reference/Attributes/rel/preload#cors-enabled_fetches">CORS-enabled fetches</a>.
              </p>
            </div>
          </td>
        </tr>
        <tr>
          <td>image</td>
          <td>
            Các phần tử <code>&#x3C;img></code> và <code>&#x3C;picture></code> với
            thuộc tính srcset hoặc imageset, các phần tử SVG <code>&#x3C;image></code>,
            các quy tắc CSS <code>*-image</code>
          </td>
        </tr>
        <tr>
          <td>json</td>
          <td>
            Đích <code>modulepreload</code>.
          </td>
        </tr>
        <tr>
          <td>object</td>
          <td>Các phần tử <code>&#x3C;object></code></td>
        </tr>
        <tr>
          <td>script</td>
          <td>
            Các phần tử <code>&#x3C;script></code>, Worker <code>importScripts</code>, và đích <code>modulepreload</code>.
          </td>
        </tr>
        <tr>
          <td>style</td>
          <td>
            Các phần tử <code>&#x3C;link rel=stylesheet></code>, CSS
            <code>@import</code> và đích <code>modulepreload</code>.
          </td>
        </tr>
        <tr>
          <td>track</td>
          <td>Các phần tử <code>&#x3C;track></code></td>
        </tr>
        <tr>
          <td>video</td>
          <td>Các phần tử <code>&#x3C;video></code></td>
        </tr>
        <tr>
          <td>worker</td>
          <td>Worker, SharedWorker</td>
        </tr>
      </tbody>
    </table>

- `blocking`
  - : Thuộc tính này chỉ định rõ ràng rằng một số hoạt động nhất định nên bị chặn cho đến khi đáp ứng các điều kiện cụ thể. Nó chỉ được sử dụng khi thuộc tính `rel` chứa các từ khóa `expect` hoặc `stylesheet`. Với [`rel="expect"`](/en-US/docs/Web/HTML/Reference/Attributes/rel#expect), nó cho biết rằng các hoạt động nên bị chặn cho đến khi một nút DOM cụ thể đã được phân tích cú pháp. Với [`rel="stylesheet"`](/en-US/docs/Web/HTML/Reference/Attributes/rel#stylesheet), nó cho biết rằng các hoạt động nên bị chặn cho đến khi stylesheet bên ngoài và các tài nguyên con quan trọng của nó đã được tải về và áp dụng cho tài liệu. Các hoạt động cần bị chặn phải là danh sách token chặn được phân tách bằng dấu cách được liệt kê dưới đây. Hiện tại chỉ có một token:
    - `render`: Việc hiển thị nội dung trên màn hình bị chặn.

    > [!NOTE]
    > Chỉ các phần tử `link` trong `<head>` của tài liệu mới có thể chặn rendering. Theo mặc định, phần tử `link` với `rel="stylesheet"` trong `<head>` chặn rendering khi trình duyệt phát hiện nó trong quá trình phân tích cú pháp. Nếu phần tử `link` như vậy được thêm vào một cách động qua script, bạn phải thêm `blocking = "render"` để nó chặn rendering.

- [`crossorigin`](/en-US/docs/Web/HTML/Reference/Attributes/crossorigin)
  - : Thuộc tính [liệt kê](/en-US/docs/Glossary/Enumerated) này cho biết liệu {{Glossary("CORS")}} có phải được sử dụng khi tải tài nguyên hay không.
    [Hình ảnh được bật CORS](/en-US/docs/Web/HTML/How_to/CORS_enabled_image) có thể được tái sử dụng trong phần tử {{HTMLElement("canvas")}} mà không bị _nhiễm_.
    Các giá trị được phép là:
    - `anonymous`
      - : Một yêu cầu cross-origin (tức là với tiêu đề HTTP {{HTTPHeader("Origin")}}) được thực hiện, nhưng không có thông tin xác thực nào được gửi (tức là không có cookie, chứng chỉ X.509, hoặc xác thực HTTP Basic).
        Nếu máy chủ không cung cấp thông tin xác thực cho trang web nguồn gốc (bằng cách không đặt tiêu đề HTTP {{HTTPHeader("Access-Control-Allow-Origin")}}), tài nguyên sẽ bị nhiễm và việc sử dụng của nó bị hạn chế.
    - `use-credentials`
      - : Một yêu cầu cross-origin (tức là với tiêu đề HTTP `Origin`) được thực hiện cùng với thông tin xác thực được gửi (tức là cookie, chứng chỉ và/hoặc xác thực HTTP Basic được thực hiện).
        Nếu máy chủ không cung cấp thông tin xác thực cho trang web nguồn gốc (thông qua tiêu đề HTTP {{HTTPHeader("Access-Control-Allow-Credentials")}}), tài nguyên sẽ bị _nhiễm_ và việc sử dụng của nó bị hạn chế.

    Nếu thuộc tính không có mặt, tài nguyên được tải về mà không có yêu cầu {{Glossary("CORS")}} (tức là không gửi tiêu đề HTTP `Origin`), ngăn việc sử dụng không nhiễm. Nếu không hợp lệ, nó được xử lý như thể từ khóa liệt kê **anonymous** được sử dụng.
    Xem [Thuộc tính cài đặt CORS](/en-US/docs/Web/HTML/Reference/Attributes/crossorigin) để biết thêm thông tin.

- `disabled`
  - : Chỉ dành cho `rel="stylesheet"`, thuộc tính Boolean `disabled` cho biết liệu stylesheet được mô tả có nên được tải và áp dụng cho tài liệu hay không.
    Nếu `disabled` được chỉ định trong HTML khi nó được tải, stylesheet sẽ không được tải trong quá trình tải trang.
    Thay vào đó, stylesheet sẽ được tải theo yêu cầu, nếu và khi thuộc tính `disabled` được thay đổi thành `false` hoặc bị xóa.

    Đặt thuộc tính `disabled` trong DOM khiến stylesheet bị xóa khỏi danh sách {{domxref("Document.styleSheets")}} của tài liệu.

- [`fetchpriority`](/en-US/docs/Web/HTML/Reference/Attributes/fetchpriority)
  - : Cung cấp gợi ý về độ ưu tiên tương đối khi tải tài nguyên của một loại cụ thể. Các giá trị được phép:
    - `high`
      - : Tải tài nguyên ở độ ưu tiên cao so với các tài nguyên khác cùng loại.
    - `low`
      - : Tải tài nguyên ở độ ưu tiên thấp so với các tài nguyên khác cùng loại.
    - `auto`
      - : Không đặt ưu tiên tải.
        Đây là mặc định.
        Được sử dụng nếu không có giá trị hoặc giá trị không hợp lệ được đặt.
- `href`
  - : Thuộc tính này chỉ định {{glossary("URL")}} của tài nguyên được liên kết. URL có thể là tuyệt đối hoặc tương đối.
- `hreflang`
  - : Thuộc tính này cho biết ngôn ngữ của tài nguyên được liên kết.
    Nó chỉ là tư vấn.
    Các giá trị phải là {{glossary("BCP 47 language tag", "thẻ ngôn ngữ BCP 47")}} hợp lệ.
    Chỉ sử dụng thuộc tính này nếu thuộc tính [`href`](/en-US/docs/Web/HTML/Reference/Elements/a#href) có mặt.
- `imagesizes`
  - : Chỉ dành cho `rel="preload"` và `as="image"`, thuộc tính `imagesizes` có cú pháp và ngữ nghĩa tương tự như thuộc tính [`sizes`](/en-US/docs/Web/HTML/Reference/Elements/img#sizes) cho biết tải trước tài nguyên thích hợp được sử dụng bởi phần tử `img` với các giá trị tương ứng cho các thuộc tính `srcset` và `sizes` của nó.
- `imagesrcset`
  - : Chỉ dành cho `rel="preload"` và `as="image"`, thuộc tính `imagesrcset` có cú pháp và ngữ nghĩa tương tự như thuộc tính [`srcset`](/en-US/docs/Web/HTML/Reference/Elements/img#srcset) cho biết tải trước tài nguyên thích hợp được sử dụng bởi phần tử `img` với các giá trị tương ứng cho các thuộc tính `srcset` và `sizes` của nó.
- `integrity`
  - : Chứa metadata nội tuyến — hash mật mã được mã hóa base64 của tài nguyên (tệp) bạn đang yêu cầu trình duyệt tải về.
    Trình duyệt có thể sử dụng điều này để xác minh rằng tài nguyên được tải về đã được phân phối mà không bị thao túng bất ngờ.
    Thuộc tính chỉ được chỉ định khi thuộc tính `rel` được chỉ định là `stylesheet`, `preload`, hoặc `modulepreload`.
    Xem [Subresource Integrity](/en-US/docs/Web/Security/Defenses/Subresource_Integrity).
- `media`
  - : Thuộc tính này chỉ định media mà tài nguyên được liên kết áp dụng cho. Giá trị của nó phải là kiểu media / [media query](/en-US/docs/Web/CSS/Guides/Media_queries).
    Thuộc tính này chủ yếu hữu ích khi liên kết đến các stylesheet bên ngoài — nó cho phép user agent chọn stylesheet phù hợp nhất với thiết bị nó chạy trên.

- `referrerpolicy`
  - : Chuỗi cho biết referrer nào sẽ sử dụng khi tải tài nguyên. Để biết giải thích và ví dụ chi tiết của từng chính sách, xem tài liệu tiêu đề {{HTTPHeader("Referrer-Policy")}}.
    - `no-referrer` có nghĩa là tiêu đề {{HTTPHeader("Referer")}} sẽ không được gửi.
    - `no-referrer-when-downgrade` có nghĩa là không có tiêu đề {{HTTPHeader("Referer")}} nào sẽ được gửi khi điều hướng đến origin không có TLS (HTTPS).
      Đây là hành vi mặc định của user agent, nếu không có chính sách nào khác được chỉ định.
    - `origin` có nghĩa là referrer sẽ là origin của trang, tức là khoảng scheme, host và port.
    - `origin-when-cross-origin` có nghĩa là điều hướng đến các origin khác sẽ bị giới hạn ở scheme, host và port, trong khi điều hướng trên cùng origin sẽ bao gồm path của referrer.
    - `same-origin` có nghĩa là referrer (origin, path và chuỗi truy vấn) được gửi cho các yêu cầu same-origin, nhưng không có referrer nào được gửi cho các yêu cầu cross-origin.
    - `strict-origin` có nghĩa là chỉ origin được gửi khi mức độ bảo mật giao thức không thay đổi (HTTPS→HTTPS). Không có referrer nào được gửi đến các đích kém an toàn hơn (HTTPS→HTTP).
    - `strict-origin-when-cross-origin` có nghĩa là referrer đầy đủ được gửi cho các yêu cầu same-origin. Đối với các yêu cầu cross-origin, chỉ origin được gửi khi giao thức không thay đổi (HTTPS→HTTPS), và không có referrer nào được gửi khi hạ cấp xuống HTTP. Đây là giá trị mặc định.
    - `unsafe-url` có nghĩa là referrer sẽ bao gồm origin và path (nhưng không phải fragment, mật khẩu hoặc tên người dùng).

- [`rel`](/en-US/docs/Web/HTML/Reference/Attributes/rel)
  - : Thuộc tính này đặt tên mối quan hệ của tài liệu được liên kết với tài liệu hiện tại. Thuộc tính phải là danh sách được phân tách bằng dấu cách của [giá trị kiểu liên kết](/en-US/docs/Web/HTML/Reference/Attributes/rel).
- `sizes`
  - : Thuộc tính này xác định kích thước của biểu tượng cho phương tiện trực quan có trong tài nguyên.
    Nó chỉ phải có mặt nếu [`rel`](#rel) chứa giá trị `icon` hoặc kiểu không chuẩn như `apple-touch-icon` của Apple.
    Nó có thể có các giá trị sau:
    - `any`, có nghĩa là biểu tượng có thể được thu phóng đến bất kỳ kích thước nào vì nó ở định dạng vector, như `image/svg+xml`.
    - Danh sách các kích thước được phân tách bằng khoảng trắng, mỗi kích thước theo định dạng `<chiều rộng tính bằng pixel>x<chiều cao tính bằng pixel>` hoặc `<chiều rộng tính bằng pixel>X<chiều cao tính bằng pixel>`. Mỗi kích thước này phải có trong tài nguyên.

    > [!NOTE]
    > Hầu hết các định dạng biểu tượng chỉ có thể lưu trữ một biểu tượng duy nhất; do đó, hầu hết thời gian, thuộc tính [`sizes`](#sizes) chỉ chứa một mục.
    > ICO của Microsoft và ICNS của Apple có thể lưu trữ nhiều kích thước biểu tượng trong một tệp. ICO có hỗ trợ trình duyệt tốt hơn, vì vậy bạn nên sử dụng định dạng này nếu hỗ trợ đa trình duyệt là một mối quan tâm.

- `title`
  - : Thuộc tính `title` có ngữ nghĩa đặc biệt trên phần tử `<link>`.
    Khi được sử dụng trên `<link rel="stylesheet">`, nó xác định [stylesheet mặc định hoặc thay thế](/en-US/docs/Web/HTML/Reference/Attributes/rel/alternate_stylesheet).
- `type`
  - : Thuộc tính này được sử dụng để xác định kiểu nội dung được liên kết.
    Giá trị của thuộc tính phải là MIME type như **text/html**, **text/css**, v.v.
    Việc sử dụng phổ biến của thuộc tính này là xác định loại stylesheet đang được tham chiếu (như **text/css**), nhưng vì CSS là ngôn ngữ stylesheet duy nhất được sử dụng trên web, không chỉ có thể bỏ qua thuộc tính `type`, mà thực tế đây bây giờ là thực hành được khuyến nghị.
    Nó cũng được sử dụng trên các kiểu liên kết `rel="preload"`, để đảm bảo trình duyệt chỉ tải xuống các kiểu tệp mà nó hỗ trợ.

### Thuộc tính không chuẩn

- `target` {{Deprecated_Inline}}
  - : Xác định tên frame hoặc cửa sổ xác định mối quan hệ liên kết hoặc sẽ hiển thị việc hiển thị bất kỳ tài nguyên được liên kết nào.

### Thuộc tính lỗi thời

- `charset` {{deprecated_inline}}
  - : Thuộc tính này xác định mã hóa ký tự của tài nguyên được liên kết.
    Giá trị là danh sách các bộ ký tự được phân tách bằng dấu cách và/hoặc dấu phẩy như được định nghĩa trong {{rfc(2045)}}.
    Giá trị mặc định là `iso-8859-1`.

    > [!NOTE]
    > Để tạo ra hiệu ứng tương tự như thuộc tính lỗi thời này, hãy sử dụng tiêu đề HTTP {{HTTPHeader("Content-Type")}} trên tài nguyên được liên kết.

- `rev` {{deprecated_inline}}
  - : Giá trị của thuộc tính này cho thấy mối quan hệ của tài liệu hiện tại với tài liệu được liên kết, như được xác định bởi thuộc tính [`href`](#href).
    Thuộc tính do đó xác định mối quan hệ ngược so với giá trị của thuộc tính `rel`.
    [Giá trị kiểu liên kết](/en-US/docs/Web/HTML/Reference/Attributes/rel) cho thuộc tính tương tự như các giá trị có thể có cho [`rel`](#rel).

    > [!NOTE]
    > Thay vì `rev`, bạn nên sử dụng thuộc tính [`rel`](#rel) với [giá trị kiểu liên kết](/en-US/docs/Web/HTML/Reference/Attributes/rel) ngược lại.
    > Ví dụ, để thiết lập liên kết ngược cho `made`, hãy chỉ định `author`. Ngoài ra, thuộc tính này không viết tắt "revision" và không được sử dụng với số phiên bản, mặc dù nhiều trang web sử dụng sai cách này.

## Ví dụ

### Bao gồm stylesheet

Để bao gồm stylesheet trong trang, hãy sử dụng cú pháp sau:

```html
<link href="style.css" rel="stylesheet" />
```

### Cung cấp stylesheet thay thế

Bạn cũng có thể chỉ định [các stylesheet thay thế](/en-US/docs/Web/HTML/Reference/Attributes/rel/alternate_stylesheet).

Người dùng có thể chọn stylesheet nào sử dụng bằng cách chọn nó từ menu **View > Page Style**.
Điều này cung cấp cách cho người dùng xem nhiều phiên bản của một trang.

```html
<link href="default.css" rel="stylesheet" title="Default Style" />
<link href="fancy.css" rel="alternate stylesheet" title="Fancy" />
<link href="basic.css" rel="alternate stylesheet" title="Basic" />
```

### Cung cấp biểu tượng cho các ngữ cảnh sử dụng khác nhau

Bạn có thể bao gồm liên kết đến nhiều biểu tượng trên cùng một trang, và trình duyệt sẽ chọn cái nào hoạt động tốt nhất cho ngữ cảnh cụ thể của nó bằng cách sử dụng các giá trị `rel` và `sizes` làm gợi ý.

```html
<!-- iPad Pro với màn hình Retina độ phân giải cao: -->
<link
  rel="apple-touch-icon"
  sizes="167x167"
  href="/apple-touch-icon-167x167.png" />
<!-- iPhone 3x: -->
<link
  rel="apple-touch-icon"
  sizes="180x180"
  href="/apple-touch-icon-180x180.png" />
<!-- iPad không Retina, iPad mini, v.v.: -->
<link
  rel="apple-touch-icon"
  sizes="152x152"
  href="/apple-touch-icon-152x152.png" />
<!-- iPhone 2x và các thiết bị khác: -->
<link rel="apple-touch-icon" href="/apple-touch-icon-120x120.png" />
<!-- favicon cơ bản -->
<link rel="icon" href="/favicon.ico" />
```

Để biết thông tin về kích thước `sizes` nào cần chọn cho biểu tượng Apple, xem [Tài liệu Apple về cấu hình ứng dụng web](https://developer.apple.com/library/archive/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html#//apple_ref/doc/uid/TP40002051-CH3-SW4) và [hướng dẫn giao diện người dùng của Apple](https://developer.apple.com/design/human-interface-guidelines/app-icons#App-icon-sizes) được tham chiếu. Thông thường, chỉ cần cung cấp một hình ảnh lớn, như 192x192, và để trình duyệt thu nhỏ khi cần thiết, nhưng bạn có thể muốn cung cấp hình ảnh với các mức độ chi tiết khác nhau cho các kích thước khác nhau. Cung cấp biểu tượng nhỏ hơn cho độ phân giải thấp hơn cũng tiết kiệm băng thông.

Có thể không cần cung cấp các phần tử `<link>` nào cả. Ví dụ: trình duyệt tự động yêu cầu `/favicon.ico` từ gốc của trang web, và Apple cũng tự động yêu cầu `/apple-touch-icon-[size].png`, `/apple-touch-icon.png`, v.v. Tuy nhiên, cung cấp các liên kết rõ ràng bảo vệ bạn khỏi những thay đổi đối với các quy ước này.

### Tải tài nguyên có điều kiện với media queries

Bạn có thể cung cấp kiểu media hoặc truy vấn bên trong thuộc tính `media`;
tài nguyên này sẽ chỉ được tải nếu điều kiện media là đúng. Ví dụ:

```html
<link href="print.css" rel="stylesheet" media="print" />
<link href="mobile.css" rel="stylesheet" media="all" />
<link href="desktop.css" rel="stylesheet" media="screen and (width >= 600px)" />
<link
  href="highres.css"
  rel="stylesheet"
  media="screen and (resolution >= 300dpi)" />
```

### Sự kiện tải stylesheet

Bạn có thể xác định khi nào stylesheet đã được tải bằng cách theo dõi sự kiện `load` để kích hoạt trên nó; tương tự, bạn có thể phát hiện nếu xảy ra lỗi trong khi xử lý stylesheet bằng cách theo dõi sự kiện `error`:

```html
<link rel="stylesheet" href="mystylesheet.css" id="my-stylesheet" />
```

```js
const stylesheet = document.getElementById("my-stylesheet");

stylesheet.onload = () => {
  // Do something interesting; the sheet has been loaded
};

stylesheet.onerror = () => {
  console.log("An error occurred loading the stylesheet!");
};
```

> [!NOTE]
> Sự kiện `load` kích hoạt sau khi stylesheet và tất cả nội dung nhập của nó đã được tải và phân tích cú pháp, và ngay trước khi các kiểu bắt đầu được áp dụng cho nội dung.

### Ví dụ preload

Bạn có thể tìm thấy một số ví dụ `<link rel="preload">` trong [Tải trước nội dung với `rel="preload"`](/en-US/docs/Web/HTML/Reference/Attributes/rel/preload).

### Chặn rendering cho đến khi tài nguyên được tải về

Bạn có thể bao gồm token `render` bên trong thuộc tính `blocking`;
việc rendering trang sẽ bị chặn cho đến khi tài nguyên và các tài nguyên con quan trọng của nó được tải về và áp dụng cho tài liệu. Ví dụ:

```html
<link blocking="render" rel="stylesheet" href="example.css" crossorigin />
```

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories">Danh mục nội dung</a>
      </th>
      <td>
        Nội dung metadata.
        Nếu <code><a href="/en-US/docs/Web/HTML/Reference/Global_attributes/itemprop">itemprop</a></code> có mặt:
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content">Nội dung luồng</a> và
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content">nội dung cụm từ</a>.
      </td>
    </tr>
    <tr>
      <th>Nội dung được phép</th>
      <td>Không có; đây là {{Glossary("void element")}}.</td>
    </tr>
    <tr>
      <th>Bỏ qua thẻ</th>
      <td>Phải có thẻ mở và không được có thẻ đóng.</td>
    </tr>
    <tr>
      <th>Cha được phép</th>
      <td>
        Bất kỳ phần tử nào chấp nhận các phần tử metadata.
        Nếu <a href="/en-US/docs/Web/HTML/Reference/Global_attributes/itemprop">itemprop</a> có mặt: bất kỳ phần tử nào chấp nhận
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content">nội dung cụm từ</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ẩn</th>
      <td><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/link_role"><code>link</code></a> với thuộc tính <code>href</code></td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td>Không có <code>role</code> được phép</td>
    </tr>
    <tr>
      <th>Giao diện DOM</th>
      <td>{{DOMxRef("HTMLLinkElement")}}</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Tiêu đề HTTP {{HTTPHeader("Link")}}
- Tiêu đề HTTP {{HTTPHeader("Referrer-Policy")}}
