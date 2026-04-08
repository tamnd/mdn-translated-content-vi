---
title: text-box-edge
slug: Web/CSS/Reference/Properties/text-box-edge
page-type: css-property
browser-compat: css.properties.text-box-edge
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`text-box-edge`** chỉ định lượng khoảng cách cần cắt bỏ khỏi vùng chứa khối của một phần tử văn bản.

Khoảng cách dọc khác nhau giữa các phông chữ, khiến việc sắp chữ nhất quán trên web luôn là thách thức. Thuộc tính `text-box-edge` cùng với thuộc tính đối ứng {{cssxref("text-box-trim")}} (chỉ định cạnh nào cần cắt khoảng cách) giúp đạt được việc sắp chữ nhất quán dễ dàng hơn. Thuộc tính `text-box-edge` không có tác dụng nếu `text-box-trim` không được đặt hoặc được đặt là `none`.

> [!NOTE]
> Thuộc tính viết tắt {{cssxref("text-box")}} có thể dùng để chỉ định các giá trị `text-box-edge` và `text-box-trim` trong một khai báo duy nhất.

## Cú pháp

```css
/* Từ khóa đơn */
text-box-edge: auto;
text-box-edge: text;

/* Hai giá trị <text-edge> */
text-box-edge: text text;
text-box-edge: text alphabetic;
text-box-edge: cap alphabetic;
text-box-edge: ex text;

/* Giá trị toàn cục */
text-box-edge: inherit;
text-box-edge: initial;
text-box-edge: revert;
text-box-edge: revert-layer;
text-box-edge: unset;
```

### Giá trị

Giá trị của thuộc tính `text-box-edge` được chỉ định là `auto` hoặc một giá trị {{cssxref("&lt;text-edge&gt;")}}:

- `auto`
  - : Giá trị mặc định. Tương đương với giá trị `text-edge` là `text`.
- {{cssxref("&lt;text-edge&gt;")}}
  - : Một hoặc hai từ khóa riêng biệt đại diện cho vị trí cạnh trên và cạnh dưới để cắt vùng chứa khối của phần tử văn bản.
    - Nếu chỉ định hai giá trị, giá trị đầu tiên chỉ định hành vi cắt áp dụng cho cạnh block-start (trên) của văn bản, và giá trị thứ hai chỉ định hành vi cắt áp dụng cho cạnh block-end (dưới) của văn bản.
      - Các giá trị hợp lệ để cắt cạnh trên: `text`, `cap` và `ex`.
      - Các giá trị hợp lệ để cắt cạnh dưới: `text` và `alphabetic`.
    - Nếu chỉ định một giá trị, nó chỉ định hành vi cắt cả cạnh trên _và_ cạnh dưới. Tại thời điểm viết tài liệu này, giá trị đơn hợp lệ duy nhất là `text`.

## Mô tả

Chiều cao của nội dung chỉ có văn bản tương đối so với chiều cao của phông chữ. Trong các tệp phông chữ kỹ thuật số, chiều cao bao gồm tất cả các ký tự, bao gồm chữ in hoa, nét lên, nét xuống, v.v. Các phông chữ khác nhau có chiều cao dòng cơ sở khác nhau, nghĩa là các dòng văn bản có cùng `font-size` sẽ tạo ra các hộp dòng có chiều cao khác nhau, ảnh hưởng đến khoảng cách giữa các dòng.

Thuộc tính `text-box-edge` cho phép cắt khoảng cách ở cạnh bắt đầu và/hoặc kết thúc của vùng chứa khối văn bản. Điều này có thể bao gồm phần {{glossary("leading")}} ở các cạnh block-start và block-end của văn bản, cũng như khoảng cách được xác định bên trong phông chữ (như mô tả ở trên). Thuộc tính này thực hiện điều đó bằng cách chỉ định một giá trị {{cssxref("&lt;text-edge&gt;")}} để chỉ ra cạnh trên và cạnh dưới cần cắt khoảng cách đến.

Cạnh nào cần cắt khoảng cách được chỉ định bằng thuộc tính {{cssxref("text-box-trim")}}. Ví dụ, bạn có thể chọn cắt khoảng cách ở cạnh trên hoặc cạnh dưới của vùng chứa khối văn bản, hoặc cả hai.

Các thuộc tính này giúp kiểm soát khoảng cách văn bản theo hướng khối dễ dàng hơn nhiều.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Sử dụng `text-box-edge` cơ bản

Các giá trị `text-box-edge` phổ biến nhất bạn sẽ dùng cho các ngôn ngữ có {{cssxref("writing-mode")}} ngang như tiếng Anh hoặc tiếng Ả Rập là `cap alphabetic` và `ex alphabetic`. Giá trị `cap` cắt cạnh trên của vùng chứa khối phần tử văn bản đến đỉnh của các chữ in hoa, trong khi `ex` cắt cạnh trên đến chiều cao x của phông chữ (cạnh trên của các chữ thường ngắn). Trong cả hai trường hợp, `alphabetic` cắt cạnh dưới bằng phẳng với đường cơ sở văn bản.

Trong ví dụ này, chúng ta minh họa tác dụng của cả hai giá trị phổ biến này trên hai phần tử {{htmlelement("p")}}. Ngoài ra, giá trị {{cssxref("text-box-trim")}} là `trim-both` được đặt trên cả hai, do đó cả cạnh bắt đầu _và_ kết thúc đều được cắt.

```html hidden
<p class="one">This is .one</p>

<p class="two">This is .two</p>
```

```css hidden
html {
  font-family: sans-serif;
  height: 100%;
}

body {
  height: inherit;
  display: flex;
  flex-direction: column;
  justify-content: center;
  gap: 100px;
}

p {
  margin: 0;
  font-size: 6rem;
  font-weight: bold;
}
```

```css
p {
  text-box-trim: trim-both;
  border-top: 5px solid magenta;
  border-bottom: 5px solid magenta;
}

.one {
  text-box-edge: cap alphabetic;
}

.two {
  text-box-edge: ex alphabetic;
}
```

#### Kết quả

Kết quả hiển thị như sau. Lưu ý rằng chúng ta đã thêm đường viền trên và dưới cho mỗi đoạn văn để bạn có thể thấy khoảng cách đã được cắt trong từng trường hợp.

{{EmbedLiveSample("Basic `text-box-edge` usage","100%","360")}}

### So sánh giá trị `text-box-edge` tương tác

Để xem ví dụ `text-box-edge` tương tác đầy đủ, hãy xem [trang `text-box-trim`](/en-US/docs/Web/CSS/Reference/Properties/text-box-trim#interactive_text-box-trim_and_text-box-edge_value_comparison).

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("text-box")}}, {{cssxref("text-box-trim")}}
- Kiểu dữ liệu {{cssxref("&lt;text-edge&gt;")}}
- Mô-đun [CSS inline layout](/en-US/docs/Web/CSS/Guides/Inline_layout)
- [CSS text-box-edge](https://developer.chrome.com/blog/css-text-box-trim) trên developer.chrome.com (2025)
