---
title: Soạn thảo MathML
short-title: Authoring
slug: Web/MathML/Guides/Authoring
page-type: guide
sidebar: mathmlref
---

Trang này giải thích cách viết biểu thức toán học bằng ngôn ngữ MathML, được mô tả bằng các thẻ và thuộc tính ở dạng văn bản. Cũng giống như với HTML hay SVG, dạng văn bản này có thể trở nên rất dài dòng đối với nội dung phức tạp, vì vậy cần [các công cụ soạn thảo phù hợp](https://www.w3.org/wiki/Math_Tools#Authoring_tools) như bộ chuyển đổi từ [ngôn ngữ đánh dấu gọn nhẹ](https://en.wikipedia.org/wiki/Lightweight_markup_language) hoặc các trình soạn thảo phương trình [WYSIWYG](https://en.wikipedia.org/wiki/WYSIWYG). Có rất nhiều công cụ như vậy và không thể đưa ra một danh sách đầy đủ. Thay vào đó, bài viết này tập trung vào các cách tiếp cận và ví dụ phổ biến.

## Sử dụng MathML

Ngay cả khi các công thức MathML của bạn nhiều khả năng sẽ được tạo ra bởi công cụ soạn thảo, bạn vẫn nên biết một vài mẹo để tích hợp chúng đúng cách vào tài liệu.

### MathML trong các trang HTML

Mỗi phương trình MathML được biểu diễn bởi phần tử gốc [`math`](/en-US/docs/Web/MathML/Reference/Element/math), có thể được nhúng trực tiếp vào các trang HTML. Theo mặc định, công thức sẽ được hiển thị theo kiểu inline, với một số điều chỉnh bổ sung để giảm chiều cao của nó. Hãy dùng thuộc tính `display="block"` để hiển thị các công thức phức tạp theo cách bình thường và trên một đoạn riêng.

```html
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="UTF-8" />
    <title>MathML in HTML</title>
  </head>
  <body>
    <h1>MathML in HTML</h1>

    <p>
      Một chia căn bậc hai của hai (kiểu inline):
      <math>
        <mfrac>
          <mn>1</mn>
          <msqrt>
            <mn>2</mn>
          </msqrt>
        </mfrac>
      </math>
    </p>

    <p>
      Một chia căn bậc hai của hai (kiểu display):
      <math display="block">
        <mfrac>
          <mn>1</mn>
          <msqrt>
            <mn>2</mn>
          </msqrt>
        </mfrac>
      </math>
    </p>
  </body>
</html>
```

> [!NOTE]
> Để dùng MathML trong tài liệu XML (ví dụ: XHTML, EPUB hoặc OpenDocument), hãy đặt thuộc tính `xmlns="http://www.w3.org/1998/Math/MathML"` một cách rõ ràng trên từng phần tử `<math>`.

> [!NOTE]
> Một số ứng dụng email hoặc nhắn tin tức thời có thể gửi và nhận thông điệp ở định dạng HTML. Vì vậy, có thể nhúng công thức toán học vào những thông điệp như vậy, miễn là các thẻ MathML không bị bộ lọc markup loại bỏ.

#### Fallback cho trình duyệt không hỗ trợ MathML

Nên cung cấp cơ chế fallback cho các trình duyệt không hỗ trợ MathML. Nếu tài liệu của bạn chỉ chứa các công thức toán học cơ bản thì một stylesheet [mathml.css](https://github.com/fred-wang/mathml.css) nhỏ có thể đã đủ. Để tải có điều kiện, chỉ cần chèn một dòng vào phần đầu tài liệu:

```html
<script src="https://fred-wang.github.io/mathml.css/mspace.js"></script>
```

Nếu bạn cần các cấu trúc phức tạp hơn, bạn có thể cân nhắc dùng thư viện [MathJax](https://www.mathjax.org/) nặng hơn như một MathML polyfill:

```html
<script src="https://fred-wang.github.io/mathjax.js/mpadded-min.js"></script>
```

Hoặc bạn cũng có thể chỉ hiển thị một cảnh báo ở đầu trang cho các trình duyệt không hỗ trợ MathML tốt và để người dùng chọn một trong các fallback ở trên:

```html
<script src="https://fred-wang.github.io/mathml-warning.js/mpadded-min.js"></script>
```

> [!NOTE]
> Các script nhỏ này thực hiện phát hiện tính năng (đối với các phần tử [mspace](/en-US/docs/Web/MathML/Reference/Element/mspace) hoặc [mpadded](/en-US/docs/Web/MathML/Reference/Element/mpadded)) thay vì [nhận diện trình duyệt](/en-US/docs/Web/HTTP/Guides/Browser_detection_using_the_user_agent), điều này được khuyến nghị hơn. Ngoài ra, chúng được phân phối theo giấy phép mã nguồn mở, nên bạn có thể tự do sao chép chúng lên máy chủ của riêng mình và điều chỉnh theo nhu cầu.

#### Phông chữ toán học

Như đã giải thích trong bài [Phông chữ MathML](/en-US/docs/Web/MathML/Guides/Fonts), phông chữ toán học là yếu tố then chốt để hiển thị nội dung MathML.
Vì vậy, luôn nên chia sẻ [hướng dẫn cài đặt các phông chữ như vậy](/en-US/docs/Web/MathML/Guides/Fonts#installation_instructions) hoặc cung cấp chúng dưới dạng [Web fonts](/en-US/docs/Learn_web_development/Core/Text_styling/Web_fonts).

Trang [MathFonts](https://fred-wang.github.io/MathFonts/) cung cấp các Web font như vậy cùng với stylesheet phù hợp.
Ví dụ, chỉ cần chèn dòng sau vào phần đầu tài liệu để chọn phông Latin Modern với các Web font dự phòng:

```html
<link
  rel="stylesheet"
  href="https://fred-wang.github.io/MathFonts/LatinModern/mathfonts.css" />
```

Có nhiều phông chữ được đề xuất và bạn chỉ cần chọn kiểu khác, chẳng hạn STIX:

```html
<link
  rel="stylesheet"
  href="https://fred-wang.github.io/MathFonts/STIX/mathfonts.css" />
```

[Phông XITS](https://fred-wang.github.io/MathFonts/XITS/mathfonts.css) được khuyến nghị cho các công thức cần được hiển thị từ phải sang trái.
Để biết thêm thông tin, xem thuộc tính toàn cục [`dir`](/en-US/docs/Web/MathML/Reference/Global_attributes/dir).

```html
<link
  rel="stylesheet"
  href="https://fred-wang.github.io/MathFonts/XITS/mathfonts.css" />
```

> [!NOTE]
> Phông chữ và stylesheet từ trang MathFonts đó được phân phối theo giấy phép mã nguồn mở, nên bạn có thể tự do sao chép chúng lên máy chủ của riêng mình và điều chỉnh theo nhu cầu.

## Chuyển đổi từ cú pháp đơn giản

Trong phần này, chúng ta xem xét một số công cụ để chuyển đổi MathML từ một [ngôn ngữ đánh dấu gọn nhẹ](https://en.wikipedia.org/wiki/Lightweight_markup_language) như ngôn ngữ [LaTeX](https://en.wikipedia.org/wiki/LaTeX) phổ biến.

### Chuyển đổi phía client

Với cách tiếp cận này, công thức được viết trực tiếp trong các trang Web và một thư viện JavaScript sẽ lo việc chuyển đổi chúng sang MathML. Đây có lẽ là lựa chọn dễ nhất, nhưng nó cũng có một số vấn đề: phải tải và thực thi thêm mã JavaScript, tác giả phải thoát các ký tự dành riêng, trình thu thập web sẽ không truy cập được đầu ra MathML...

Một [custom element](/en-US/docs/Web/API/Web_components/Using_custom_elements) có thể được dùng để chứa mã nguồn và bảo đảm đầu ra MathML tương ứng được chèn và hiển thị thông qua một [shadow subtree](/en-US/docs/Web/API/Web_components/Using_shadow_DOM). Ví dụ, dùng phần tử [`<la-tex>`](https://fred-wang.github.io/TeXZilla/examples/customElement.html) của [TeXZilla](https://github.com/fred-wang/TeXZilla), ví dụ [MathML ở trên](#mathml_in_html_pages) có thể được viết lại ngắn gọn hơn như sau:

```html
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="UTF-8" />
    <title>MathML in HTML5</title>
    <script src="https://fred-wang.github.io/TeXZilla/TeXZilla-min.js"></script>
    <script src="https://fred-wang.github.io/TeXZilla/examples/customElement.js"></script>
  </head>
  <body>
    <h1>MathML in HTML5</h1>

    <p>
      Một chia căn bậc hai của hai (kiểu inline):
      <la-tex>\frac{1}{\sqrt{2}}</la-tex>
    </p>

    <p>
      Một chia căn bậc hai của hai (kiểu display):
      <la-tex display="block">\frac{1}{\sqrt{2}}</la-tex>
    </p>
  </body>
</html>
```

Với những tác giả chưa quen với LaTeX, còn có các phương thức nhập thay thế như cú pháp [ASCIIMath](https://asciimath.org/#syntax) hoặc [jqMath](https://mathscribe.com/author/jqmath.html). Hãy bảo đảm tải các thư viện JavaScript và dùng đúng dấu phân cách:

```html
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width" />
    <title>ASCII MathML</title>
    …
    <!-- ASCIIMathML.js -->
    <script src="/path/to/ASCIIMathML.js"></script>
    …
    <!-- jqMath -->
    <script src="https://mathscribe.com/mathscribe/jquery-1.4.3.min.js"></script>
    <script src="https://mathscribe.com/mathscribe/jqmath-etc-0.4.6.min.js"></script>
    …
  </head>
  <body>
    …
    <p>Một chia căn bậc hai của hai (kiểu inline, ASCIIMath): `1/(sqrt 2)`</p>
    …
    <p>Một chia căn bậc hai của hai (kiểu inline, jqMath): $1/√2$</p>
    …
    <p>Một chia căn bậc hai của hai (kiểu display, jqMath): $$1/√2$$</p>
    …
  </body>
</html>
```

### Chương trình dòng lệnh

Thay vì sinh biểu thức MathML khi trang tải, bạn có thể dựa vào các công cụ dòng lệnh. Cách này sẽ tạo ra các trang có nội dung MathML tĩnh và tải nhanh hơn. Hãy xét lại trang `input.html` với nội dung từ phần [chuyển đổi phía client](#client-side_conversion):

```html
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="UTF-8" />
    <title>MathML in HTML5</title>
  </head>
  <body>
    <h1>MathML in HTML5</h1>
    <p>Một chia căn bậc hai của hai (kiểu inline): $\frac{1}{\sqrt{2}}$</p>
    <p>Một chia căn bậc hai của hai (kiểu display): $$\frac{1}{\sqrt{2}}$$</p>
  </body>
</html>
```

Trang đó không chứa thẻ [`script`](/en-US/docs/Web/HTML/Reference/Elements/script) nào. Thay vào đó, việc chuyển đổi được thực hiện qua dòng lệnh sau bằng [Node.js](https://nodejs.org/) và [TeXZilla](https://github.com/fred-wang/TeXZilla/wiki/Using-TeXZilla#usage-from-the-command-line):

```bash
cat input.html | node TeXZilla.js streamfilter > output.html
```

Sau khi chạy lệnh đó, một tệp `output.html` chứa đầu ra HTML sau sẽ được tạo ra. Các công thức được phân cách bằng dấu đô la đã được chuyển thành MathML:

```html-nolint
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="UTF-8" />
    <title>MathML in HTML5</title>
  </head>
  <body>
    <h1>MathML in HTML5</h1>

    <p>
      Một chia căn bậc hai của hai (kiểu inline):
      <math><semantics><mfrac><mn>1</mn><msqrt><mn>2</mn></msqrt></mfrac><annotation encoding="TeX">\frac{1}{\sqrt{2}}</annotation></semantics></math>
    </p>

    <p>
      Một chia căn bậc hai của hai (kiểu display):
      <math display="block"><semantics><mfrac><mn>1</mn><msqrt><mn>2</mn></msqrt></mfrac><annotation encoding="TeX">\frac{1}{\sqrt{2}}</annotation></semantics></math>
    </p>
  </body>
</html>
```

Có những công cụ tinh vi hơn nhằm chuyển đổi một tài liệu LaTeX bất kỳ thành tài liệu có nội dung MathML. Ví dụ, dùng [LaTeXML](https://math.nist.gov/~BMiller/LaTeXML/) thì các lệnh sau sẽ chuyển `foo.tex` thành tài liệu HTML hoặc EPUB:

```bash
latexmlc --dest foo.html foo.tex # Tạo một tài liệu HTML foo.html
latexmlc --dest foo.epub foo.tex # Tạo một tài liệu EPUB foo.epub
```

`latexmlc` chấp nhận tham số `--javascript` mà bạn có thể dùng để bao gồm một trong các [script fallback](#fallback_for_browsers_without_mathml_support) đã nhắc ở trên:

```bash
latexmlc --dest foo.html --javascript=https://fred-wang.github.io/mathml.css/mspace.js foo.tex  # Thêm fallback CSS
latexmlc --dest foo.html --javascript=https://fred-wang.github.io/mathjax.js/mpadded-min.js foo.tex # Thêm fallback MathJax
```

> [!NOTE]
> Các công cụ dòng lệnh cũng có thể dùng ở phía máy chủ, ví dụ [MediaWiki](https://www.mediawiki.org/wiki/MediaWiki) thực hiện chuyển đổi LaTeX sang MathML qua [Mathoid](https://github.com/wikimedia/mediawiki-services-mathoid).

## Giao diện đồ họa

Trong phần này, chúng ta xem xét một vài công cụ biên tập cung cấp giao diện đồ họa.

### Hộp nhập

Một cách tiếp cận đơn giản là tích hợp [các bộ chuyển đổi từ cú pháp đơn giản](#conversion_from_a_simple_syntax) thành những hộp nhập đơn giản cho toán học. Ví dụ, [Thunderbird](https://www.thunderbird.net/en-US/) và [SeaMonkey](https://www.seamonkey-project.org/) cung cấp lệnh **Insert > Math** mở một cửa sổ bật lên, với một ô nhập chuyển LaTeX sang MathML và bản xem trước MathML trực tiếp:

![Hộp nhập LaTeX trong Thunderbird](thunderbird.png)

> [!NOTE]
> Bạn cũng có thể dùng lệnh **Insert > HTML** để dán bất kỳ nội dung MathML nào.

[Trình soạn thảo công thức](https://www.libreoffice.org/) của LibreOffice (File → New → Formula) cho thấy một khả năng nâng cao: ô nhập cho cú pháp _StartMath_ của nó cung cấp thêm các bảng công thức để chèn những cấu trúc toán học đã được định nghĩa sẵn.

![Hộp nhập StarMath trong LibreOffice](libreoffice.png)

> [!NOTE]
> Để lấy mã MathML của libreoffice, hãy lưu tài liệu dưới dạng `mml` rồi mở nó bằng trình soạn thảo văn bản bạn thích.

### Trình biên tập WYSIWYG

Một số trình biên tập khác cung cấp tính năng soạn thảo toán học được tích hợp trực tiếp trong giao diện WYSIWYG của chúng. Các ảnh chụp màn hình sau được lấy từ [LyX](https://www.lyx.org/) và [TeXmacs](https://www.texmacs.org/tmweb/home/welcome.en.html), cả hai đều hỗ trợ xuất HTML:

![Ví dụ LyX](lyx.png)

![Ví dụ TeXmacs](texmacs.png)

> [!NOTE]
> Theo mặc định, LyX và TeXmacs sẽ dùng ảnh công thức trong đầu ra HTML của chúng. Để chọn MathML thay vì ảnh, hãy [làm theo các hướng dẫn này](https://github.com/brucemiller/LaTeXML/wiki/Integrating-LaTeXML-into-TeX-editors#lyx) cho LyX và chọn `User preference > Convert > Export mathematical formulas as MathML` cho TeXmacs.

### Nhận diện ký tự quang học và chữ viết tay

Một tùy chọn cuối cùng để nhập toán học là dựa vào giao diện người dùng của các công cụ [nhận diện ký tự quang học](https://en.wikipedia.org/wiki/Optical_character_recognition) hoặc [nhận diện chữ viết tay](https://en.wikipedia.org/wiki/Handwriting_recognition). Một số công cụ này hỗ trợ công thức toán học và có thể xuất chúng dưới dạng MathML. Ảnh chụp màn hình sau cho thấy [bản demo từ MyScript](https://webdemo.myscript.com/views/math/index.html):

![MyScript](myscript.png)
