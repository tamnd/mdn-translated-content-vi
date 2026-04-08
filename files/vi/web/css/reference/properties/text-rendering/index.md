---
title: text-rendering
slug: Web/CSS/Reference/Properties/text-rendering
page-type: css-property
browser-compat: css.properties.text-rendering
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`text-rendering`** cung cấp thông tin cho engine kết xuất về những gì cần tối ưu hóa khi kết xuất văn bản.

Trình duyệt thực hiện sự đánh đổi giữa tốc độ, khả năng đọc và độ chính xác hình học.

> [!NOTE]
> Thuộc tính `text-rendering` là thuộc tính SVG không được định nghĩa trong bất kỳ tiêu chuẩn CSS nào. Tuy nhiên, các trình duyệt Gecko và WebKit cho phép áp dụng thuộc tính này cho nội dung HTML và XML trên Windows, macOS và Linux.

Một hiệu ứng rất rõ ràng là `optimizeLegibility`, cho phép sử dụng ligature (ff, fi, fl, v.v.) trong văn bản nhỏ hơn 20px đối với một số phông chữ (ví dụ: _Calibri_, _Candara_, _Constantia_ và _Corbel_ của Microsoft, hoặc họ phông chữ _DejaVu_).

## Cú pháp

```css
/* Keyword values */
text-rendering: auto;
text-rendering: optimizeSpeed;
text-rendering: optimizeLegibility;
text-rendering: geometricPrecision;

/* Global values */
text-rendering: inherit;
text-rendering: initial;
text-rendering: revert;
text-rendering: revert-layer;
text-rendering: unset;
```

### Giá trị

- `auto`
  - : Trình duyệt đưa ra phán đoán hợp lý về thời điểm tối ưu hóa cho tốc độ, khả năng đọc và độ chính xác hình học khi vẽ văn bản. Để biết sự khác biệt trong cách trình duyệt diễn giải giá trị này, hãy xem bảng tương thích.

    Giá trị `auto` là mặc định tốt để cân bằng chất lượng và hiệu suất, đặc biệt đối với các đoạn văn bản thuần túy dài.

- `optimizeSpeed`
  - : Trình duyệt ưu tiên tốc độ kết xuất hơn khả năng đọc và độ chính xác hình học khi vẽ văn bản. Nó vô hiệu hóa kerning và ligature.

    Giá trị `optimizeSpeed` được ưu tiên trong các tình huống kết xuất bị giới hạn tài nguyên, chẳng hạn như bộ xử lý chậm hoặc pin yếu.

- `optimizeLegibility`
  - : Trình duyệt ưu tiên khả năng đọc hơn tốc độ kết xuất và độ chính xác hình học. Điều này cho phép kerning và ligature tùy chọn.

    Giá trị `optimizeLegibility` được ưu tiên cho các văn bản có kích thước lớn nhưng nội dung ngắn, chẳng hạn như tiêu đề hoặc biểu ngữ, để tăng cường khả năng đọc. Nó cũng có thể được sử dụng cho kiểu chữ chuyên nghiệp chất lượng cao như bài báo xuất bản. Không khuyến nghị sử dụng cho bài viết thông thường do ảnh hưởng tiềm ẩn đến hiệu suất.

- `geometricPrecision`
  - : Trình duyệt ưu tiên độ chính xác hình học hơn tốc độ kết xuất và khả năng đọc. Một số khía cạnh của phông chữ — chẳng hạn như kerning — không thay đổi tuyến tính. Vì vậy giá trị này có thể làm cho văn bản sử dụng các phông chữ đó trông đẹp hơn.

    Trong SVG, khi văn bản được phóng to hoặc thu nhỏ, trình duyệt tính toán kích thước cuối cùng của văn bản (được xác định bởi kích thước phông chữ được chỉ định và tỷ lệ được áp dụng) và yêu cầu một phông chữ có kích thước đã tính toán đó từ hệ thống phông chữ của nền tảng. Nhưng nếu bạn yêu cầu kích thước phông chữ là 9 với tỷ lệ 140%, kích thước phông chữ kết quả là 12.6 không tồn tại rõ ràng trong hệ thống phông chữ, vì vậy trình duyệt làm tròn kích thước phông chữ xuống 12. Điều này dẫn đến việc văn bản được chia tỷ lệ theo bậc thang.

    Nhưng thuộc tính `geometricPrecision` — khi được engine kết xuất hỗ trợ đầy đủ — cho phép bạn chia tỷ lệ văn bản một cách linh hoạt. Đối với các hệ số tỷ lệ lớn, bạn có thể thấy kết xuất văn bản không đẹp lắm, nhưng kích thước là những gì bạn mong đợi — không được làm tròn lên hay xuống đến kích thước phông chữ gần nhất được Windows hoặc Linux hỗ trợ.

    Giá trị `geometricPrecision` không tối ưu hóa khả năng đọc cũng không tối ưu hóa hiệu suất. Nó thường có ý nghĩa trong SVG, nơi bạn muốn đồ họa của mình được chia tỷ lệ trung thực mà không làm biến dạng kích thước văn bản.

    > [!NOTE]
    > WebKit áp dụng chính xác giá trị được chỉ định, nhưng Gecko xử lý giá trị này giống như `optimizeLegibility`.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Tự động áp dụng optimizeLegibility

Ví dụ này minh họa cách `optimizeLegibility` được trình duyệt tự động sử dụng khi `font-size` nhỏ hơn `20px`.

#### HTML

```html
<p class="small">LYoWAT - ff fi fl ffl</p>
<p class="big">LYoWAT - ff fi fl ffl</p>
```

#### CSS

```css
.small {
  font:
    19.9px "Constantia",
    "Times New Roman",
    "Georgia",
    "Palatino",
    serif;
}
.big {
  font:
    20px "Constantia",
    "Times New Roman",
    "Georgia",
    "Palatino",
    serif;
}
```

#### Kết quả

{{ EmbedLiveSample('Automatic_application_of_optimizeLegibility') }}

### optimizeSpeed so với optimizeLegibility

Ví dụ này cho thấy sự khác biệt về hình thức giữa `optimizeSpeed` và `optimizeLegibility` (trong trình duyệt của bạn; các trình duyệt khác có thể khác).

#### HTML

```html
<p class="speed">LYoWAT - ff fi fl ffl</p>
<p class="legibility">LYoWAT - ff fi fl ffl</p>
```

#### CSS

```css
p {
  font:
    1.5em "Constantia",
    "Times New Roman",
    "Georgia",
    "Palatino",
    serif;
}

.speed {
  text-rendering: optimizeSpeed;
}
.legibility {
  text-rendering: optimizeLegibility;
}
```

#### Kết quả

{{ EmbedLiveSample('optimizeSpeed_vs_optimizeLegibility') }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Vẽ văn bản trong `<canvas>`](/en-US/docs/Web/API/Canvas_API/Tutorial/Drawing_text)
- Module CSS [CSS Text Decoration](/en-US/docs/Web/CSS/Guides/Text_decoration)
- Các thuộc tính CSS liên quan
  - {{cssxref("text-decoration")}} (và các thuộc tính viết tắt của nó, chẳng hạn như {{cssxref("text-decoration-line")}}, {{cssxref("text-decoration-style")}} và {{cssxref("text-decoration-thickness")}})
  - {{cssxref("text-emphasis")}} (và các thuộc tính viết tắt của nó, bao gồm {{cssxref("text-emphasis-color")}}, {{cssxref("text-emphasis-position")}} và {{cssxref("text-emphasis-style")}})
  - {{cssxref("text-shadow")}}
  - {{cssxref("text-transform")}}

- Thuộc tính {{SVGAttr("text-rendering")}} của [SVG](/en-US/docs/Web/SVG)
- [SVG và CSS](/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/SVG_and_CSS)
