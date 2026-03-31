---
title: How to fill a box with an image without distorting it
short-title: Fill a box with an image
slug: Learn_web_development/Howto/Solve_CSS_problems/Fill_a_box_with_an_image
page-type: learn-faq
sidebar: learn-how-to
---

Trong hướng dẫn này, bạn có thể học một kỹ thuật để làm cho hình ảnh HTML lấp đầy hoàn toàn một box.

## Sử dụng object-fit

Khi bạn thêm hình ảnh vào trang bằng phần tử HTML {{htmlelement("img")}}, hình ảnh sẽ duy trì kích thước và {{glossary("aspect ratio")}} của file hình ảnh, hoặc của bất kỳ thuộc tính HTML [`width`](/en-US/docs/Web/HTML/Reference/Elements/img#width) hoặc [`height`](/en-US/docs/Web/HTML/Reference/Elements/img#height) nào. Đôi khi bạn muốn hình ảnh lấp đầy hoàn toàn box mà bạn đã đặt nó vào. Trong trường hợp đó, trước tiên bạn cần quyết định điều gì xảy ra nếu hình ảnh có tỉ lệ khung hình không phù hợp với container.

1. Hình ảnh nên lấp đầy hoàn toàn box, giữ nguyên tỉ lệ khung hình, và cắt bỏ phần thừa ở phía quá lớn để vừa.
2. Hình ảnh nên vừa khít bên trong box, với background hiển thị dưới dạng các thanh ở phía quá nhỏ.
3. Hình ảnh nên lấp đầy box và bị kéo giãn, điều này có thể có nghĩa là nó hiển thị với tỉ lệ khung hình sai.

Thuộc tính {{cssxref("object-fit")}} làm cho mỗi cách tiếp cận này trở nên khả thi. Trong ví dụ dưới đây, bạn có thể thấy cách các giá trị khác nhau của `object-fit` hoạt động khi sử dụng cùng một hình ảnh. Hãy chọn cách tiếp cận phù hợp nhất với thiết kế của bạn.

```html live-sample___object-fit
<div class="wrapper">
  <div class="box box1">
    <img
      alt="a colorful hot air balloon against a clear sky"
      src="https://mdn.github.io/shared-assets/images/examples/balloon.jpg" />
  </div>
  <div class="box box2">
    <img
      alt="a colorful hot air balloon against a clear sky"
      src="https://mdn.github.io/shared-assets/images/examples/balloon.jpg" />
  </div>
  <div class="box box3">
    <img
      alt="a colorful hot air balloon against a clear sky"
      src="https://mdn.github.io/shared-assets/images/examples/balloon.jpg" />
  </div>
</div>
```

```css live-sample___object-fit
.wrapper {
  height: 200px;
  display: flex;
  gap: 20px;
}

.box {
  border: 5px solid black;
}

.box img {
  width: 100%;
  height: 100%;
}

.box1 img {
  object-fit: cover;
}

.box2 img {
  object-fit: contain;
}

.box3 img {
  object-fit: fill;
}
```

{{EmbedLiveSample("object-fit", "", "220px")}}
