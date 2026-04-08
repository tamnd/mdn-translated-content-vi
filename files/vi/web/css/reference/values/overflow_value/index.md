---
title: <overflow>
slug: Web/CSS/Reference/Values/overflow_value
page-type: css-type
browser-compat: css.types.overflow
sidebar: cssref
---

Kiểu giá trị {{glossary("enumerated")}} **`<overflow>`** đại diện cho các giá trị từ khóa dành cho các thuộc tính dài {{cssxref("overflow-block")}}, {{cssxref("overflow-inline")}}, {{cssxref("overflow-x")}}, và {{cssxref("overflow-y")}}, cũng như thuộc tính viết tắt {{cssxref("overflow")}}. Các thuộc tính này áp dụng cho các vùng chứa khối, vùng chứa flex, và vùng chứa lưới.

## Cú pháp

```plain
<overflow> = visible | hidden | clip | scroll | auto
```

## Giá trị

Kiểu giá trị liệt kê `<overflow>` được chỉ định bằng một trong các giá trị sau đây.

- `visible`
  - : Nội dung tràn không bị cắt và có thể hiển thị bên ngoài hộp padding của phần tử. Hộp phần tử không phải là {{glossary("scroll container")}}. Đây là giá trị mặc định cho tất cả các thuộc tính có kiểu giá trị liệt kê `<overflow>`.
- `hidden`
  - : Nội dung tràn bị cắt tại hộp padding của phần tử. Không có thanh cuộn và nội dung bị cắt không hiển thị (tức là nội dung bị cắt bị ẩn), nhưng nội dung vẫn tồn tại. Các tác nhân người dùng không thêm thanh cuộn và cũng không cho phép người dùng xem nội dung bên ngoài vùng bị cắt bằng các thao tác như kéo trên màn hình cảm ứng hay sử dụng con lăn chuột. Nội dung _có thể_ được cuộn theo chương trình (ví dụ: bằng cách đặt giá trị của thuộc tính {{domxref("Element.scrollLeft", "scrollLeft")}} hoặc phương thức {{domxref("Element.scrollTo", "scrollTo()")}}). Nội dung cũng có thể được cuộn qua tương tác bàn phím; các mũi tên cho phép cuộn qua nội dung và điều hướng đến một phần tử có thể tập trung trong nội dung ẩn sẽ cuộn phần tử được tập trung vào khung nhìn. Hộp phần tử được đặt giá trị này là một scroll container.
- `clip`
  - : Nội dung tràn bị cắt tại _cạnh clip tràn_ của phần tử được xác định bằng thuộc tính {{cssxref("overflow-clip-margin")}}. Do đó, nội dung tràn ra khỏi hộp padding của phần tử theo giá trị {{cssxref("&lt;length&gt;")}} của `overflow-clip-margin` hoặc `0px` nếu không được đặt. Nội dung tràn bên ngoài vùng bị cắt không hiển thị, tác nhân người dùng không thêm thanh cuộn, và cuộn theo chương trình cũng không được hỗ trợ. Không có [bối cảnh định dạng](/vi/docs/Web/CSS/Guides/Display/Block_formatting_context) mới nào được tạo ra.
- `scroll`
  - : Nội dung tràn bị cắt tại hộp padding của phần tử và nội dung tràn có thể được cuộn vào khung nhìn bằng thanh cuộn. Các tác nhân người dùng hiển thị thanh cuộn ở cả hai hướng ngang và dọc nếu chỉ một giá trị được đặt, bất kể có nội dung nào bị tràn hay cắt hay không. Việc sử dụng giá trị từ khóa này do đó có thể ngăn các thanh cuộn xuất hiện và biến mất khi nội dung thay đổi. Máy in vẫn có thể in nội dung tràn. Hộp phần tử được đặt giá trị này là một scroll container.
- `auto`
  - : Nội dung tràn bị cắt tại hộp padding của phần tử và nội dung tràn có thể được cuộn vào khung nhìn. Không giống như `scroll`, tác nhân người dùng chỉ hiển thị thanh cuộn _khi_ nội dung bị tràn và ẩn thanh cuộn theo mặc định. Nếu nội dung vừa bên trong hộp padding của phần tử, nó trông giống như với `visible` nhưng vẫn tạo ra một bối cảnh định dạng mới. Hộp phần tử được đặt giá trị này là một scroll container.

> [!NOTE]
> Giá trị từ khóa `overlay` là một bí danh giá trị kế thừa cho `auto`. Với `overlay`, các thanh cuộn được vẽ trên nội dung thay vì chiếm không gian.

## Ví dụ

Ví dụ này trình diễn tất cả các giá trị liệt kê `<overflow>` cho thuộc tính {{cssxref("overflow")}}.

### HTML

HTML trong ví dụ này chứa một số lời bài hát trong phần tử {{HTMLELement("pre")}}. HTML cũng chứa văn bản liên kết để kiểm tra hiệu ứng của tiêu điểm bàn phím trên các hành vi tràn và cuộn. Cùng một đoạn mã HTML được lặp lại nhiều lần để hiển thị hiệu ứng của mỗi giá trị liệt kê `<overflow>`.

```html
<pre>&nbsp;
Oh, Rubber Duckie, you're the one
You make bath time lots of fun
Rubber Duckie, I'm awfully fond of you

Rubber Duckie, joy of joys
When I squeeze you, you make noise
Rubber Duckie, you're my very best friend, it's true

Oh, every day when I make my way to the tubby
I find a little fella who's cute and yellow and chubby
Rub-a-dub-dubby

<a href="#">Rubber Duckie</a>, you're so fine
And I'm lucky that you're mine
Rubber Duckie, I'm awfully fond of you
</pre>
```

```html hidden
<pre>&nbsp;
Oh, Rubber Duckie, you're the one
You make bath time lots of fun
Rubber Duckie, I'm awfully fond of you

Rubber Duckie, joy of joys
When I squeeze you, you make noise
Rubber Duckie, you're my very best friend, it's true

Oh, every day when I make my way to the tubby
I find a little fella who's cute and yellow and chubby
Rub-a-dub-dubby

<a href="#">Rubber Duckie</a>, you're so fine
And I'm lucky that you're mine
Rubber Duckie, I'm awfully fond of you
</pre>

<pre>&nbsp;
Oh, Rubber Duckie, you're the one
You make bath time lots of fun
Rubber Duckie, I'm awfully fond of you

Rubber Duckie, joy of joys
When I squeeze you, you make noise
Rubber Duckie, you're my very best friend, it's true

Oh, every day when I make my way to the tubby
I find a little fella who's cute and yellow and chubby
Rub-a-dub-dubby

<a href="#">Rubber Duckie</a>, you're so fine
And I'm lucky that you're mine
Rubber Duckie, I'm awfully fond of you
</pre>

<pre>&nbsp;
Oh, Rubber Duckie, you're the one
You make bath time lots of fun
Rubber Duckie, I'm awfully fond of you

Rubber Duckie, joy of joys
When I squeeze you, you make noise
Rubber Duckie, you're my very best friend, it's true

Oh, every day when I make my way to the tubby
I find a little fella who's cute and yellow and chubby
Rub-a-dub-dubby

<a href="#">Rubber Duckie</a>, you're so fine
And I'm lucky that you're mine
Rubber Duckie, I'm awfully fond of you
</pre>

<pre>&nbsp;
Oh, Rubber Duckie, you're the one
You make bath time lots of fun
Rubber Duckie, I'm awfully fond of you

Rubber Duckie, joy of joys
When I squeeze you, you make noise
Rubber Duckie, you're my very best friend, it's true

Oh, every day when I make my way to the tubby
I find a little fella who's cute and yellow and chubby
Rub-a-dub-dubby

<a href="#">Rubber Duckie</a>, you're so fine
And I'm lucky that you're mine
Rubber Duckie, I'm awfully fond of you
</pre>

<pre>&nbsp;
Oh, Rubber Duckie, you're the one
You make bath time lots of fun
Rubber Duckie, I'm awfully fond of you

Rubber Duckie, joy of joys
When I squeeze you, you make noise
Rubber Duckie, you're my very best friend, it's true

Oh, every day when I make my way to the tubby
I find a little fella who's cute and yellow and chubby
Rub-a-dub-dubby

<a href="#">Rubber Duckie</a>, you're so fine
And I'm lucky that you're mine
Rubber Duckie, I'm awfully fond of you
</pre>
```

### CSS

Vì mục đích trình diễn, kích thước của hộp phần tử `<pre>` đã được định nghĩa để đảm bảo nội dung tràn ra khỏi vùng chứa theo cả chiều inline và chiều block. Một giá trị `<overflow>` khác nhau được đặt cho mỗi phần tử `<pre>` lặp lại. Đối với trình diễn giá trị `clip`, một {{CSSXref("overflow-clip-margin")}} đã được thêm vào.

```css hidden
pre {
  border: 2px dashed red;
  margin-bottom: 3em;
}

::before {
  font-weight: bold;
  color: white;
  background: crimson;
  display: inline-block;
  width: 100%;
  padding: 3px 5px;
  box-sizing: border-box;
}
```

```css
pre {
  block-size: 100px;
  inline-size: 295px;
}

pre:nth-of-type(1) {
  overflow: hidden;
}
pre:nth-of-type(1)::before {
  content: "hidden: ";
}

pre:nth-of-type(2) {
  overflow: clip;
  overflow-clip-margin: 1em;
}
pre:nth-of-type(2)::before {
  content: "clip: ";
}

pre:nth-of-type(3) {
  overflow: scroll;
}
pre:nth-of-type(3)::before {
  content: "scroll: ";
}

pre:nth-of-type(4) {
  overflow: auto;
}
pre:nth-of-type(4)::before {
  content: "auto: ";
}

pre:nth-of-type(5) {
  overflow: clip;
  overflow: overlay;
  overflow-clip-margin: 3em;
}
pre:nth-of-type(5)::before {
  content: "overlay (or clip if not supported): ";
}

pre:nth-of-type(6) {
  overflow: visible;
}
pre:nth-of-type(6)::before {
  content: "visible: ";
}
```

### Kết quả

{{EmbedLiveSample("Examples", "500", "800")}}

Để thấy hiệu ứng của tiêu điểm bàn phím trên các hành vi tràn và cuộn, hãy thử dùng phím Tab để điều hướng qua tất cả các liên kết trong ví dụ. Lưu ý rằng hộp `clip` không tạo ra scroll container và liên kết không hiện vào khung nhìn khi liên kết được tập trung. Giá trị `visible`, luôn có liên kết trong khung nhìn, cũng không phải là scroll container.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính sử dụng kiểu dữ liệu này: {{cssxref("overflow-x")}}, {{cssxref("overflow-y")}}, {{cssxref("overflow-inline")}}, {{cssxref("overflow-block")}} và {{cssxref("overflow")}}
- [Module tràn CSS](/vi/docs/Web/CSS/Guides/Overflow)
