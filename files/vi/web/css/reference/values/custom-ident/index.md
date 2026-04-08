---
title: <custom-ident>
slug: Web/CSS/Reference/Values/custom-ident
page-type: css-type
spec-urls:
  - https://drafts.csswg.org/css-values/#custom-idents
  - https://drafts.csswg.org/css-will-change/#valdef-will-change-custom-ident
  - https://drafts.csswg.org/css-counter-styles/#typedef-counter-style-name
  - https://drafts.csswg.org/css-lists/#counter-properties
sidebar: cssref
---

Kiểu dữ liệu **`<custom-ident>`** trong [CSS](/vi/docs/Web/CSS) là một [kiểu dữ liệu](/vi/docs/Web/CSS/Reference/Values/Data_types) biểu thị một chuỗi tùy ý do người dùng định nghĩa, được dùng như một {{glossary("identifier", "định danh")}}. Kiểu này phân biệt chữ hoa và chữ thường, và một số giá trị nhất định bị cấm trong các ngữ cảnh khác nhau để tránh nhập nhằng.

## Cú pháp

Cú pháp của `<custom-ident>` tương tự như các định danh CSS (chẳng hạn như tên thuộc tính), ngoại trừ việc nó [phân biệt chữ hoa/thường](https://en.wikipedia.org/wiki/Case_sensitivity). Nó bao gồm một hoặc nhiều ký tự, trong đó ký tự có thể là bất kỳ ký tự nào sau đây:

- bất kỳ ký tự chữ cái nào (`A` đến `Z`, hoặc `a` đến `z`),
- bất kỳ chữ số thập phân nào (`0` đến `9`),
- dấu gạch ngang (`-`),
- dấu gạch dưới (`_`),
- một [ký tự thoát](#escaping_characters) (được đứng trước bởi dấu gạch chéo ngược, `\`),
- một ký tự [Unicode](https://en.wikipedia.org/wiki/Unicode) (theo định dạng dấu gạch chéo ngược `\`, theo sau là một đến sáu chữ số thập lục phân, đại diện cho điểm mã Unicode của ký tự đó)

Lưu ý rằng `id1`, `Id1`, `iD1` và `ID1` là các định danh khác nhau vì chúng [phân biệt chữ hoa/thường](https://en.wikipedia.org/wiki/Case_sensitivity).

### Ký tự thoát

Bất kỳ điểm mã Unicode nào cũng có thể được đưa vào trong `<custom-ident>` hoặc {{cssxref("string")}} được trích dẫn bằng cách thoát nó.

Trong CSS, có một số cách để thoát ký tự. Chuỗi thoát bắt đầu bằng dấu gạch chéo ngược (`\`), và tiếp theo là:

- Một đến sáu chữ số hex (`ABCDEF0123456789`). Các chữ số hex có thể tùy chọn được theo sau bởi khoảng trắng. Chuỗi thoát hex được thay thế bằng điểm mã Unicode có giá trị được cho bởi các chữ số đó. Khoảng trắng cho phép các chuỗi được theo sau bởi các chữ số hex thực tế (so với các chữ số đã được thay thế).
- Bất kỳ điểm mã Unicode nào không phải là chữ số hex hoặc ký tự xuống dòng.

Ví dụ:

- "&B" có thể được viết thành `\26 B` hoặc `\000026B`.
- "hi.there" có thể được viết thành `hi\.there` hoặc `hi\002Ethere`.
- "toto?" có thể được viết thành `toto\?`, `toto\3F`, hoặc `toto\00003F`.

Để bao gồm khoảng trắng thực tế sau một chuỗi thoát, hãy thêm hai khoảng trắng trong chuỗi thoát.

### Giá trị bị cấm

`<custom-ident>` không được đặt trong dấu nháy đơn hoặc nháy kép vì như vậy sẽ tương đương với {{CSSxRef("&lt;string&gt;")}}. Hơn nữa, ký tự đầu tiên không được là chữ số thập phân, cũng không được là dấu gạch ngang (`-`) theo sau là chữ số thập phân.

Để tránh nhập nhằng, mỗi thuộc tính sử dụng `<custom-ident>` đều cấm sử dụng các giá trị cụ thể:

- {{CSSxRef("animation-name")}}
  - : Cấm các giá trị CSS toàn cục (`unset`, `initial`, và `inherit`), cũng như `none`.
- {{CSSxRef("counter-reset")}}, {{CSSxRef("counter-increment")}}
  - : Cấm các giá trị CSS toàn cục (`unset`, `initial`, và `inherit`), cũng như `none`.
- {{CSSxRef("@counter-style")}}, {{CSSxRef("list-style-type")}}
  - : Cấm các giá trị CSS toàn cục (`unset`, `initial`, và `inherit`), cũng như các giá trị:
    - `none`
    - `inline`
    - `outside`

    Ngoài ra, một số giá trị được định nghĩa trước được triển khai bởi các trình duyệt khác nhau:
    - `disc`
    - `circle`
    - `square`
    - `decimal`
    - `cjk-decimal`
    - `decimal-leading-zero`
    - `lower-roman`
    - `upper-roman`
    - `lower-greek`
    - `lower-alpha`
    - `lower-latin`
    - `upper-alpha`
    - `upper-latin`
    - `arabic-indic`
    - `armenian`
    - `bengali`
    - `cambodian`
    - `cjk-earthly-branch`
    - `cjk-heavenly-stem`
    - `cjk-ideographic`
    - `devanagari`
    - `ethiopic-numeric`
    - `georgian`
    - `gujarati`
    - `gurmukhi`
    - `hebrew`
    - `hiragana`
    - `hiragana-iroha`
    - `japanese-formal`
    - `japanese-informal`
    - `kannada`
    - `katakana`
    - `katakana-iroha`
    - `khmer`
    - `korean-hangul-formal`
    - `korean-hanja-formal`
    - `korean-hanja-informal`
    - `lao`
    - `lower-armenian`
    - `malayalam`
    - `mongolian`
    - `myanmar`
    - `oriya`
    - `persian`
    - `simp-chinese-formal`
    - `simp-chinese-informal`
    - `tamil`
    - `telugu`
    - `thai`
    - `tibetan`
    - `trad-chinese-formal`
    - `trad-chinese-informal`
    - `upper-armenian`
    - `disclosure-open`
    - `disclosure-close`

- {{CSSxRef("grid-row-start")}}, {{CSSxRef("grid-row-end")}}, {{CSSxRef("grid-column-start")}}, {{CSSxRef("grid-column-end")}}, {{CSSxRef("grid-template-rows")}}, {{CSSxRef("grid-template-columns")}}
  - : Cấm các giá trị `span` và `auto`.
- {{CSSxRef("view-transition-name")}}
  - : Cấm các giá trị CSS toàn cục (`unset`, `initial`, và `inherit`), cũng như `none`.
- {{CSSxRef("will-change")}}
  - : Cấm các giá trị CSS toàn cục (`unset`, `initial`, và `inherit`), cũng như các giá trị `will-change`, `auto`, `scroll-position`, và `contents`.

## Ví dụ

### Định danh hợp lệ

```plain example-good
nono79            Kết hợp ký tự chữ và số
ground-level      Kết hợp ký tự chữ và dấu gạch ngang
-test             Dấu gạch ngang theo sau bởi ký tự chữ và số
_internal         Dấu gạch dưới theo sau bởi ký tự chữ và số
\22 toto          Ký tự Unicode theo sau bởi chuỗi ký tự chữ và số
scooby\.doo       Dấu chấm được thoát đúng cách
```

### Định danh không hợp lệ

```plain example-bad
34rem             Không được bắt đầu bằng chữ số thập phân.
-12rad            Không được bắt đầu bằng dấu gạch ngang theo sau là chữ số thập phân.
scooby.doo        Chỉ có ký tự chữ và số, _, và - mới không cần thoát.
'scoobyDoo'       Đây sẽ là một <string>.
"scoobyDoo"       Đây sẽ là một <string>.
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

_Vì kiểu này không phải là kiểu thực sự mà chỉ là kiểu tiện ích dùng để đơn giản hóa mô tả các giá trị được phép, nên không có thông tin khả năng tương thích trình duyệt._

## Xem thêm

- [&lt;ident&gt;](/vi/docs/Web/CSS/Reference/Values/ident)
- [&lt;dashed-ident&gt;](/vi/docs/Web/CSS/Reference/Values/dashed-ident)
