---
title: Intrinsic size
slug: Glossary/Intrinsic_Size
page-type: glossary-definition
sidebar: glossarysidebar
---

Trong CSS, **kích thước nội tại** (intrinsic size) của một phần tử là kích thước mà nó sẽ có dựa hoàn toàn vào nội dung của nó, không tính đến ảnh hưởng của ngữ cảnh bố cục mà nó xuất hiện. Đây là trái ngược với {{glossary("extrinsic size","kích thước ngoại tại")}} của phần tử, được xác định bởi các ràng buộc bên ngoài như kích thước container. Kích thước nội tại của phần tử được biểu thị bằng các kích thước {{cssxref("min-content")}} và {{cssxref("max-content")}}.

Các phần tử inline được định kích thước theo kiểu nội tại. Các thuộc tính của [mô hình hộp](/en-US/docs/Learn_web_development/Core/Styling_basics/Box_model) CSS như {{cssxref("height")}}, {{cssxref("width")}}, {{cssxref("block-size")}}, {{cssxref("inline-size")}}, {{cssxref("padding-block")}}, và {{cssxref("margin-block")}} không ảnh hưởng đến bố cục của chúng (mặc dù {{cssxref("margin-inline")}} và {{cssxref("padding-inline")}} ảnh hưởng đến khoảng cách trong một dòng).

Ví dụ, kích thước nội tại tối thiểu của phần tử inline {{htmlelement("span")}} là kích thước nhỏ nhất mà nó sẽ có nếu được float (không áp dụng thuộc tính hộp CSS nào khác) trong một container có `inline-size: 0`. Kích thước nội tại tối đa là ngược lại; đó là kích thước mà `<span>` tương tự sẽ có khi được đặt trong một container có `inline-size` vô hạn.

Kích thước nội tại có ý nghĩa tương tự cho hình ảnh như đối với văn bản — kích thước mà hình ảnh được hiển thị nếu không có CSS nào được áp dụng để thay đổi cách hiển thị.

Mật độ pixel và độ phân giải ảnh hưởng đến kích thước nội tại. Theo mặc định, hình ảnh được giả định có mật độ pixel "1x" (1 pixel thiết bị = 1 pixel CSS), trong trường hợp đó kích thước nội tại đơn giản là chiều cao và chiều rộng pixel. Kích thước nội tại và độ phân giải của hình ảnh có thể được chỉ định rõ ràng trong dữ liệu {{Glossary("EXIF")}} của nó. Mật độ pixel của hình ảnh cũng có thể được đặt bằng thuộc tính [`srcset`](/en-US/docs/Web/HTML/Reference/Elements/img#srcset). Lưu ý nếu cả hai cơ chế đều được sử dụng, giá trị `srcset` được áp dụng "đè lên" giá trị EXIF.

Kích thước nội tại và cách tính chúng được định nghĩa trong module [CSS box sizing](/en-US/docs/Web/CSS/Guides/Box_sizing).

## Kích thước nội tại tối thiểu

Để đặt kích thước phần tử theo kích thước nội tại tối thiểu, đặt {{cssxref("inline-size")}} (hoặc {{cssxref("width")}} trong chế độ viết ngang, như tiếng Anh và tiếng Hebrew) thành {{cssxref("min-content")}}. Điều này đặt phần tử về kích thước mà văn bản sẽ được bọc nhỏ nhất có thể theo chiều inline mà không gây tràn, với việc bọc mềm nhiều nhất có thể. Với một hộp chứa chuỗi văn bản, kích thước nội tại tối thiểu sẽ được xác định bởi từ dài nhất.

```html hidden
<p>Text wraps, making the element only as wide as its longest word.</p>
```

```css
p {
  inline-size: min-content;
  background-color: palegoldenrod;
}
```

{{EmbedLiveSample('minimum intrinsic size', '100%', '220')}}

## Kích thước nội tại tối đa

Kích thước nội tại tối đa là ngược lại. Đó là kích thước của phần tử nếu `inline-size` của container là vô hạn. Nội dung văn bản sẽ hiển thị rộng nhất có thể, không có bọc mềm, ngay cả khi nó tràn ra ngoài container. Giá trị từ khóa {{cssxref("max-content")}} thiết lập hành vi này.

```html hidden
<p>Element grows as text doesn't wrap.</p>
<p>
  This paragraph may be wider than the width of the entire page and yet it won't
  wrap because <code>width: max-content</code> is set. It therefore may overflow
  its container.
</p>
```

```css
p {
  width: max-content;
  background-color: palegoldenrod;
}
```

{{EmbedLiveSample('maximum intrinsic size', '100%', '200')}}

## Xem thêm

- Các thuật ngữ liên quan:
  - {{glossary("Extrinsic size")}}
- Các từ khóa kích thước CSS {{cssxref("min-content")}}, {{cssxref("max-content")}}, và {{cssxref("fit-content")}}
- {{cssxref("interpolate-size")}}
- {{cssxref("aspect-ratio")}}
- {{cssxref("calc-size()")}}
- Module [CSS box sizing](/en-US/docs/Web/CSS/Guides/Box_sizing)
- Đặc tả [CSS Box Sizing Module Level 3](https://drafts.csswg.org/css-sizing-3/#intrinsic-sizes)
