---
title: src
slug: Web/CSS/Reference/At-rules/@font-face/src
page-type: css-at-rule-descriptor
browser-compat: css.at-rules.font-face.src
sidebar: cssref
---

Descriptor **`src`** trong [CSS](/en-US/docs/Web/CSS) cho quy tắc at-rule {{cssxref("@font-face")}} chỉ định tài nguyên chứa dữ liệu phông chữ. Đây là bắt buộc để quy tắc `@font-face` hợp lệ.

## Cú pháp

```css
/* Giá trị <url> */
src: url("https://example.com/path/to/font.woff"); /* URL tuyệt đối */
src: url("path/to/font.woff"); /* URL tương đối */
src: url("path/to/svgFont.svg#example"); /* Fragment xác định phông chữ */

/* Giá trị <font-face-name> */
src: local(font); /* Tên không có dấu ngoặc kép */
src: local(some font); /* Tên chứa khoảng trắng */
src: local("font"); /* Tên có dấu ngoặc kép */
src: local("some font"); /* Tên có dấu ngoặc kép chứa khoảng trắng */

/* Giá trị <tech(<font-tech>)> */
src: url("path/to/fontCOLRv1.otf") tech(color-COLRv1);
src: url("path/to/fontCOLR-svg.otf") tech(color-SVG);

/* Giá trị <format(<font-format>)> */
src: url("path/to/font.woff") format("woff");
src: url("path/to/font.otf") format("opentype");

/* Nhiều tài nguyên */
src:
  url("path/to/font.woff") format("woff"),
  url("path/to/font.otf") format("opentype");

/* Nhiều tài nguyên với định dạng và công nghệ phông chữ */
src:
  url("trickster-COLRv1.otf") format(opentype) tech(color-COLRv1),
  url("trickster-outline.otf") format(opentype);
```

### Giá trị

- `url()`
  - : Chỉ định một tham chiếu bên ngoài bao gồm một {{cssxref("url_value", "&lt;url&gt;")}}, theo sau là các gợi ý tùy chọn sử dụng các giá trị thành phần `format()` và `tech()` chỉ định định dạng và công nghệ phông chữ của tài nguyên được tham chiếu bởi URL. Các thành phần `format()` và `tech()` là danh sách các chuỗi phân cách bằng dấu phẩy của [định dạng phông chữ](#font_formats) và công nghệ đã biết. Nếu trình duyệt không hỗ trợ công nghệ hoặc định dạng phông chữ, nó sẽ bỏ qua việc tải tài nguyên phông chữ. Nếu không có gợi ý định dạng hoặc công nghệ nào được cung cấp, tài nguyên phông chữ luôn được tải xuống.

- `format()`
  - : Một khai báo tùy chọn theo sau giá trị `url()` cung cấp gợi ý cho trình duyệt về định dạng phông chữ.
    Nếu giá trị không được hỗ trợ hoặc không hợp lệ, trình duyệt có thể không tải xuống tài nguyên, tiết kiệm băng thông.
    Nếu bỏ qua, trình duyệt sẽ tải xuống tài nguyên và sau đó phát hiện định dạng.
    Nếu bao gồm nguồn phông chữ cho khả năng tương thích ngược không có trong danh sách [từ khóa được định nghĩa](#formal_syntax), hãy đặt chuỗi định dạng trong dấu ngoặc kép.
    Các giá trị có thể được mô tả trong phần [Định dạng phông chữ](#font_formats) bên dưới.
- `tech()`
  - : Một khai báo tùy chọn theo sau giá trị `url()` cung cấp gợi ý cho trình duyệt về công nghệ phông chữ.
    Giá trị cho `tech()` có thể là một trong các từ khóa được mô tả trong [Công nghệ phông chữ](#font_technologies).
- `local(<font-face-name>)`
  - : Chỉ định tên phông chữ nếu phông chữ đó có sẵn trên thiết bị của người dùng.
    Việc đặt tên phông chữ trong dấu ngoặc kép là tùy chọn.

    > [!NOTE]
    > Với phông chữ OpenType và TrueType, `<font-face-name>` được dùng để khớp tên Postscript hoặc tên đầy đủ trong bảng tên của phông chữ có sẵn cục bộ. Loại tên được dùng tùy theo nền tảng và phông chữ, vì vậy bạn nên bao gồm cả hai tên này để đảm bảo khớp đúng trên các nền tảng. Không nên sử dụng các thay thế nền tảng cho tên phông chữ đã cho.

    > [!NOTE]
    > Phông chữ có sẵn cục bộ có thể đã được cài đặt sẵn trên thiết bị của người dùng, hoặc có thể đã được người dùng cài đặt chủ động.
    >
    > Trong khi tập hợp phông chữ được cài đặt sẵn có thể giống nhau cho tất cả người dùng của một thiết bị cụ thể, tập hợp phông chữ do người dùng cài đặt thì không. Bằng cách khám phá tập hợp phông chữ do người dùng cài đặt, một trang web có thể xây dựng {{glossary("fingerprinting", "dấu vân tay")}} cho thiết bị, giúp trang web theo dõi người dùng trên web.
    >
    > Để ngăn chặn điều này, trình duyệt có thể bỏ qua phông chữ do người dùng cài đặt khi sử dụng `local()`.

- `<font-face-name>`
  - : Chỉ định tên đầy đủ hoặc tên postscript của một font face được cài đặt cục bộ sử dụng giá trị thành phần `local()`, xác định duy nhất một font face trong một họ lớn hơn.
    Tên có thể được đặt trong dấu ngoặc kép tùy chọn. Tên font face [không phân biệt chữ hoa/thường](https://drafts.csswg.org/css-fonts-3/#font-family-casing).

> [!NOTE]
> {{domxref("Local Font Access API", "Local Font Access API", "", "nocode")}} có thể được dùng để truy cập dữ liệu phông chữ được cài đặt cục bộ của người dùng, bao gồm các chi tiết cấp cao hơn như tên, kiểu dáng, và họ phông chữ, cũng như các byte thô của tệp phông chữ bên dưới.

## Mô tả

Giá trị của descriptor này là danh sách ưu tiên, phân cách bằng dấu phẩy, gồm các tham chiếu bên ngoài hoặc tên font face được cài đặt cục bộ, trong đó mỗi tài nguyên được chỉ định sử dụng `url()` hoặc `local()`. Khi cần phông chữ, {{glossary("user agent")}} lặp qua tập hợp các tham chiếu được liệt kê, sử dụng tham chiếu đầu tiên mà nó có thể kích hoạt thành công. Phông chữ chứa dữ liệu không hợp lệ hoặc font face cục bộ không được tìm thấy sẽ bị bỏ qua và trình duyệt sẽ tải phông chữ tiếp theo trong danh sách.

Nếu nhiều descriptor `src` được đặt, chỉ quy tắc được khai báo cuối cùng có thể tải một tài nguyên mới được áp dụng. Nếu descriptor `src` cuối cùng có thể tải một tài nguyên và không bao gồm phông chữ `local()`, trình duyệt có thể tải xuống các tệp phông chữ bên ngoài và bỏ qua phiên bản cục bộ ngay cả khi có sẵn trên thiết bị.

> [!NOTE]
> Các giá trị trong các descriptor mà trình duyệt coi là không hợp lệ sẽ bị bỏ qua. Một số trình duyệt sẽ bỏ qua toàn bộ descriptor nếu có bất kỳ mục nào không hợp lệ, ngay cả khi chỉ có một mục không hợp lệ. Điều này có thể ảnh hưởng đến thiết kế fallback. Xem [Tương thích trình duyệt](#browser_compatibility) để biết thêm thông tin.

Như với các URL khác trong CSS, URL có thể là tương đối, trong trường hợp đó nó được giải quyết tương đối so với vị trí của stylesheet chứa quy tắc `@font-face`. Trong trường hợp phông chữ SVG, URL trỏ đến một phần tử trong tài liệu chứa các định nghĩa phông chữ SVG. Nếu tham chiếu phần tử bị bỏ qua, một tham chiếu đến phông chữ được định nghĩa đầu tiên được ngụ ý. Tương tự, các định dạng container phông chữ có thể chứa nhiều phông chữ chỉ tải một trong các phông chữ cho quy tắc `@font-face` đã cho. Các fragment identifier được dùng để chỉ ra phông chữ nào cần tải. Nếu định dạng container thiếu scheme fragment identifier được định nghĩa, một scheme đánh số dựa trên 1 (ví dụ: "font-collection#1" cho phông chữ đầu tiên, "font-collection#2" cho phông chữ thứ hai, v.v.) được sử dụng.

Nếu tệp phông chữ là container cho nhiều phông chữ, một fragment identifier được bao gồm để chỉ ra sub-font nào nên được sử dụng, như được hiển thị bên dưới:

```css
/* WhichFont là tên PostScript của phông chữ trong tệp phông chữ */
src: url("collection.otc#WhichFont");
/* WhichFont là id phần tử của phông chữ trong tệp SVG Font */
src: url("fonts.svg#WhichFont");
```

### Định dạng phông chữ

Bảng dưới đây cho thấy các từ khóa phông chữ hợp lệ và các định dạng phông chữ tương ứng. Để kiểm tra xem một định dạng phông chữ có được trình duyệt hỗ trợ trong CSS không, hãy sử dụng quy tắc {{cssxref("@supports", "@supports")}}.

| Từ khóa             | Định dạng phông chữ   | Phần mở rộng thông thường |
| ------------------- | --------------------- | ------------------------- |
| `collection`        | OpenType Collection   | .otc, .ttc                |
| `embedded-opentype` | Embedded OpenType     | .eot                      |
| `opentype`          | OpenType              | .otf, .ttf                |
| `svg`               | SVG Font (deprecated) | .svg, .svgz               |
| `truetype`          | TrueType              | .ttf                      |
| `woff`              | WOFF 1.0              | .woff                     |
| `woff2`             | WOFF 2.0              | .woff2                    |

> [!NOTE]
>
> - `format(svg)` đại diện cho [phông chữ SVG](/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Using_fonts), và `tech(color-SVG)` đại diện cho [phông chữ OpenType với bảng SVG](https://learn.microsoft.com/en-us/typography/opentype/spec/svg) (còn gọi là phông chữ màu OpenType-SVG), chúng hoàn toàn khác nhau.
> - Các giá trị `opentype` và `truetype` tương đương nhau cho dù tệp phông chữ sử dụng đường cong bezier bậc ba (trong bảng CFF/CFF2) hay đường cong bezier bậc hai (trong bảng glyph).

Các giá trị `format()` cũ không được chuẩn hóa có cú pháp tương đương sau; được cung cấp dưới dạng chuỗi trong dấu ngoặc kép để đảm bảo khả năng tương thích ngược:

| Cú pháp cũ                      | Cú pháp tương đương                 |
| ------------------------------- | ----------------------------------- |
| `format("woff2-variations")`    | `format(woff2) tech(variations)`    |
| `format("woff-variations")`     | `format(woff) tech(variations)`     |
| `format("opentype-variations")` | `format(opentype) tech(variations)` |
| `format("truetype-variations")` | `format(truetype) tech(variations)` |

### Công nghệ phông chữ

Bảng dưới đây cho thấy các giá trị hợp lệ cho descriptor `tech()` và các công nghệ phông chữ tương ứng. Để kiểm tra xem một công nghệ phông chữ có được trình duyệt hỗ trợ trong CSS không, hãy sử dụng quy tắc at-rule {{cssxref("@supports", "@supports")}}.

| Từ khóa             | Mô tả                                                                                          |
| :------------------ | :--------------------------------------------------------------------------------------------- |
| `color-cbdt`        | Bảng dữ liệu bitmap màu                                                                        |
| `color-colrv0`      | Glyph nhiều màu qua bảng COLR phiên bản 0                                                      |
| `color-colrv1`      | Glyph nhiều màu qua bảng COLR phiên bản 1                                                      |
| `color-sbix`        | Bảng đồ họa bitmap chuẩn                                                                       |
| `color-svg`         | Bảng SVG nhiều màu                                                                             |
| `features-aat`      | Bảng TrueType `morx` và `kerx`                                                                 |
| `features-graphite` | Tính năng Graphite, cụ thể là các bảng `Silf`, `Glat`, `Gloc`, `Feat`, và `Sill`               |
| `features-opentype` | Bảng OpenType `GSUB` và `GPOS`                                                                 |
| `incremental`       | Tải phông chữ tăng dần                                                                         |
| `palettes`          | Bảng màu phông chữ thông qua `font-palette` để chọn một trong nhiều bảng màu trong phông chữ   |
| `variations`        | Biến thể phông chữ trong TrueType và OpenType để kiểm soát trục, độ đậm, glyph phông chữ, v.v. |

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{CSSSyntax}}

{{CSSSyntaxRaw(`<font-src>`)}}

## Ví dụ

### Chỉ định tài nguyên phông chữ sử dụng url() và local()

Ví dụ dưới đây cho thấy cách định nghĩa hai font face với cùng họ phông chữ. `font-family` được đặt tên là `MainText`. Font face đầu tiên có phông chữ thường, và font face thứ hai là phiên bản đậm của cùng họ phông chữ.

```css
/* Định nghĩa font face thường */
@font-face {
  font-family: "MainText";
  src:
    local("Futura-Medium"),
    url("FuturaMedium.woff") format("woff"),
    url("FuturaMedium.otf") format("opentype");
}

/* Định nghĩa font face đậm khác nhau cho cùng họ */
@font-face {
  font-family: "MainText";
  src:
    local("Gill Sans Bold") /* tên đầy đủ */,
    local("GillSans-Bold") /* tên postscript */,
    url("GillSansBold.woff") format("woff"),
    url("GillSansBold.otf") format("opentype"),
    url("GillSansBold.svg#MyFontBold"); /* Tham chiếu fragment phông chữ SVG theo id */
  font-weight: bold;
}

/* Sử dụng font face thường */
p {
  font-family: "MainText", sans-serif;
}

/* Font-family được kế thừa, nhưng phông chữ đậm được sử dụng */
p.bold {
  font-weight: bold;
}
```

### Chỉ định tài nguyên phông chữ sử dụng giá trị tech() và format()

Ví dụ dưới đây cho thấy cách sử dụng giá trị `tech()` và `format()` để chỉ định tài nguyên phông chữ. Một phông chữ sử dụng công nghệ `color-colrv1` và định dạng `opentype` được chỉ định sử dụng giá trị `tech()` và `format()`. Phông chữ màu sẽ được kích hoạt nếu trình duyệt hỗ trợ, và một phông chữ `opentype` không màu được cung cấp làm fallback.

```css
@font-face {
  font-family: "Trickster";
  src:
    url("trickster-COLRv1.otf") format(opentype) tech(color-COLRv1),
    url("trickster-outline.otf") format(opentype);
}

/* Sử dụng font face */
p {
  font-family: "Trickster", fantasy;
}
```

### Chỉ định fallback cho trình duyệt cũ hơn

Trình duyệt nên sử dụng `@font-face` với một descriptor `src` duy nhất liệt kê các nguồn có thể cho phông chữ. Vì trình duyệt sẽ sử dụng tài nguyên đầu tiên mà nó có thể tải, các mục nên được chỉ định theo thứ tự ưu tiên sử dụng của bạn.

Nhìn chung, điều này có nghĩa là các tệp cục bộ nên xuất hiện trước các tệp từ xa và các tài nguyên có ràng buộc `format()` hoặc `tech()` nên xuất hiện trước các tài nguyên không có chúng (nếu không, phiên bản ít ràng buộc hơn sẽ luôn được chọn). Ví dụ:

```css
@font-face {
  font-family: "MgOpenModernaBold";
  src:
    url("MgOpenModernaBoldIncr.otf") format("opentype") tech(incremental),
    url("MgOpenModernaBold.otf") format(opentype);
}
```

Trình duyệt không hỗ trợ `tech()` ở trên nên bỏ qua mục đầu tiên và thử tải tài nguyên thứ hai.

Một số trình duyệt chưa [bỏ qua các mục không hợp lệ](#browser_compatibility), thay vào đó sẽ báo lỗi cho toàn bộ descriptor `src` nếu có bất kỳ giá trị nào không hợp lệ. Khi làm việc với các trình duyệt này, bạn có thể chỉ định nhiều descriptor `src` làm fallback. Lưu ý rằng nhiều descriptor `src` được thử theo thứ tự ngược lại, vì vậy cuối cùng chúng ta có descriptor bình thường với tất cả các mục.

```css
@font-face {
  font-family: "MgOpenModernaBold";
  src: url("MgOpenModernaBold.otf") format(opentype);
  src: url("MgOpenModernaBoldIncr.otf") format("opentype") tech(incremental);
  src:
    url("MgOpenModernaBoldIncr.otf") format("opentype") tech(incremental),
    url("MgOpenModernaBold.otf") format(opentype);
}
```

### Kiểm tra xem trình duyệt có hỗ trợ phông chữ không

Ví dụ dưới đây cho thấy cách kiểm tra xem trình duyệt có hỗ trợ công nghệ phông chữ bằng quy tắc {{cssxref("@supports")}} không. Khối CSS trong `@supports` sẽ được áp dụng nếu trình duyệt hỗ trợ công nghệ `color-COLRv1`.

```css
@supports font-tech(color-COLRv1) {
  @font-face {
    font-family: "Trickster";
    src: url("trickster-COLRv1.otf") format(opentype) tech(color-COLRv1);
  }

  .colored_text {
    font-family: "Trickster", fantasy;
  }
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("@font-face", "@font-face")}}
- {{cssxref("@supports", "@supports")}}
- {{cssxref("@font-face/font-display", "font-display")}}
- {{cssxref("@font-face/font-family", "font-family")}}
- {{cssxref("@font-face/font-stretch", "font-stretch")}}
- {{cssxref("@font-face/font-style", "font-style")}}
- {{cssxref("@font-face/font-weight", "font-weight")}}
- {{cssxref("font-feature-settings", "font-feature-settings")}}
- {{cssxref("@font-face/font-variation-settings", "font-variation-settings")}}
- {{cssxref("@font-face/unicode-range", "unicode-range")}}
