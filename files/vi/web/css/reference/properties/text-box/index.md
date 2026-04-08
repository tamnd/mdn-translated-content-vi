---
title: text-box
slug: Web/CSS/Reference/Properties/text-box
page-type: css-shorthand-property
browser-compat: css.properties.text-box
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`text-box`** là thuộc tính viết tắt tương ứng với các thuộc tính {{cssxref("text-box-trim")}} và {{cssxref("text-box-edge")}}, cùng nhau chỉ định lượng khoảng cách cần cắt bỏ khỏi cạnh block-start và cạnh block-end của vùng chứa khối của một phần tử văn bản.

## Các thuộc tính thành phần

Thuộc tính này là viết tắt của các thuộc tính CSS sau:

- {{cssxref("text-box-trim")}}
- {{cssxref("text-box-edge")}}

## Cú pháp

```css
/* Từ khóa đơn */
text-box: normal;

/* Một từ khóa text-box-edge */
text-box: trim-start text;
text-box: trim-both text;

/* Hai từ khóa text-box-edge */
text-box: trim-start cap alphabetic;
text-box: trim-both ex text;

/* Giá trị toàn cục */
text-box: inherit;
text-box: initial;
text-box: revert;
text-box: revert-layer;
text-box: unset;
```

### Giá trị

Giá trị của `text-box` có thể bao gồm một giá trị {{cssxref("text-box-trim")}} và một giá trị {{cssxref("text-box-edge")}} được phân tách bằng dấu cách. Xem các trang đó để biết mô tả về các giá trị.

Thuộc tính `text-box` cũng có thể nhận từ khóa `normal`, tương đương với `text-box: none auto;`.

Nếu bỏ qua `text-box-trim`, giá trị được đặt là `trim-both`. Nếu bỏ qua `text-box-edge`, giá trị được đặt là `auto`.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Mô tả

Chiều cao của nội dung chỉ có văn bản tương đối so với chiều cao của phông chữ. Trong các tệp phông chữ kỹ thuật số, chiều cao bao gồm tất cả các ký tự, bao gồm chữ in hoa, nét lên, nét xuống, v.v. Các phông chữ khác nhau có chiều cao dòng cơ sở khác nhau, nghĩa là các dòng văn bản có cùng `font-size` sẽ tạo ra các hộp dòng có chiều cao khác nhau, ảnh hưởng đến khoảng cách giữa các dòng.

Các thuộc tính `text-box` cho phép cắt bỏ khoảng cách thừa ở cạnh block-start và block-end của vùng chứa khối của một phần tử văn bản. Điều này có thể bao gồm phần {{glossary("leading")}} ở các cạnh block-start và block-end của văn bản, cũng như khoảng cách được xác định bên trong phông chữ (như mô tả ở trên). Điều này giúp kiểm soát khoảng cách văn bản theo hướng khối dễ dàng hơn nhiều.

## Ví dụ

### Sử dụng `text-box` cơ bản

Trong ví dụ sau, chúng ta có hai phần tử `<p>` với các lớp `one` và `two`.

Chúng ta áp dụng giá trị `text-box` là `trim-end cap alphabetic` cho đoạn văn đầu tiên. Giá trị {{cssxref("text-box-edge")}} `cap alphabetic` chỉ định cắt cạnh trên đến phần đỉnh của các chữ in hoa và cạnh dưới bằng phẳng với đường cơ sở văn bản. Do giá trị {{cssxref("text-box-trim")}} được đặt là `trim-end`, chỉ có cạnh dưới của đoạn văn được cắt.

Chúng ta áp dụng giá trị `text-box` là `trim-both ex alphabetic` cho đoạn văn thứ hai. Giá trị {{cssxref("text-box-edge")}} `ex alphabetic` chỉ định cắt cạnh trên đến chiều cao x của phông chữ (cạnh trên của các chữ thường ngắn) và cạnh dưới bằng phẳng với đường cơ sở văn bản. Do giá trị {{cssxref("text-box-trim")}} được đặt là `trim-both`, cả cạnh trên _và_ dưới của đoạn văn đều được cắt.

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
.one {
  text-box: trim-end cap alphabetic;
}

.two {
  text-box: trim-both ex alphabetic;
}

p {
  border-top: 5px solid magenta;
  border-bottom: 5px solid magenta;
}
```

#### Kết quả

Kết quả hiển thị như sau. Lưu ý rằng chúng ta đã thêm đường viền trên và dưới cho mỗi đoạn văn để bạn có thể thấy khoảng cách đã được cắt trong từng trường hợp.

{{EmbedLiveSample("Basic `text-box` usage","100%","360")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("text-box-edge")}}, {{cssxref("text-box-trim")}}
- Kiểu dữ liệu {{cssxref("&lt;text-edge&gt;")}}
- Mô-đun [CSS inline layout](/en-US/docs/Web/CSS/Guides/Inline_layout)
- [CSS text-box-edge](https://developer.chrome.com/blog/css-text-box-trim) trên developer.chrome.com (2025)
