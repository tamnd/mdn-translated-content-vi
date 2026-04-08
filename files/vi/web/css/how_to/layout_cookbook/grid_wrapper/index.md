---
title: Grid wrapper
slug: Web/CSS/How_to/Layout_cookbook/Grid_wrapper
page-type: how-to
sidebar: cssref
---

Mẫu grid wrapper (bộ bao lưới) hữu ích để căn chỉnh nội dung lưới bên trong một wrapper trung tâm, đồng thời cho phép các phần tử thoát ra ngoài và căn chỉnh với cạnh của phần tử chứa hoặc trang.

## Yêu cầu

Các phần tử được đặt trên lưới phải có khả năng căn chỉnh theo wrapper có chiều rộng tối đa nằm giữa theo chiều ngang, hoặc theo các cạnh ngoài cùng của lưới, hoặc cả hai.

## Công thức

Nhấn "Play" trong các khối mã dưới đây để chỉnh sửa ví dụ trong MDN Playground:

```html live-sample___grid-wrapper-example
<div class="grid">
  <div class="wrapper">
    <p>
      This item aligns to a central "wrapper" – columns that have a maximum
      width.
    </p>
  </div>
  <div class="full-width">
    <p>This item aligns to the edge of the grid container.</p>
  </div>
  <div class="left-edge">
    <p>
      This item aligns to the left edge of the grid container and the right edge
      of the wrapper.
    </p>
  </div>
  <div class="right-wrapper">
    <p>This item aligns to the right edge of the "wrapper" columns.</p>
  </div>
</div>
```

```css live-sample___grid-wrapper-example
body {
  font: 1.2em sans-serif;
}
.grid {
  display: grid;
  grid-template-columns: minmax(20px, 1fr) repeat(6, minmax(0, 60px)) minmax(
      20px,
      1fr
    );
  grid-auto-rows: minmax(100px, auto);
  grid-gap: 10px;
}

.grid > * {
  border: 2px solid rgb(95 97 110);
  border-radius: 0.5em;
  padding: 20px;
}

.full-width {
  grid-column: 1 / -1;
}

.wrapper {
  grid-column: 2 / -2;
}

.left-edge {
  grid-column: 1 / -2;
}

.right-wrapper {
  grid-column: 4 / -2;
}
```

{{EmbedLiveSample("grid-wrapper-example", "", "550px")}}

## Các lựa chọn được thực hiện

Công thức này sử dụng hàm CSS grid {{cssxref("minmax()")}} để định nghĩa kích thước các track lưới trong thuộc tính {{cssxref("grid-template-columns")}}. Đối với các cột trung tâm có chiều rộng tối đa, chúng ta có thể đặt giá trị tối thiểu là `0` hoặc lớn hơn, và giá trị tối đa xác định kích thước tối đa mà các track cột có thể tăng lên. Sử dụng các đơn vị {{cssxref("length")}} [tương đối](/en-US/docs/Web/CSS/Reference/Values/length#relative_length_units_based_on_font) hoặc [tuyệt đối](/en-US/docs/Web/CSS/Reference/Values/length#absolute_length_units) (pixel, em, rem) sẽ tạo ra kích thước tối đa cố định cho wrapper trung tâm, trong khi sử dụng giá trị {{cssxref("percentage")}} hoặc [đơn vị viewport](/en-US/docs/Web/CSS/Reference/Values/length#relative_length_units_based_on_viewport) sẽ làm cho wrapper tăng hoặc thu nhỏ tùy theo ngữ cảnh của nó.

Hai cột ngoài cùng có kích thước tối đa là `1fr`, nghĩa là mỗi cột sẽ mở rộng để lấp đầy không gian còn lại trong container lưới.

## Các phương án dự phòng hoặc phương pháp thay thế hữu ích

Để căn giữa lưới theo chiều ngang trên trang, bạn có thể đặt `max-width` cùng với {{cssxref("margin")}} `auto` ở bên trái và phải:

```css
.grid {
  max-width: 96vw; /* Limits the width to 96% of the width of the viewport */
  margin: 0 auto; /* horizontally centers the container */
}
```

## Vấn đề khả năng tiếp cận

Mặc dù CSS grid cho phép định vị các phần tử ở bất cứ đâu (trong giới hạn hợp lý), nhưng việc đảm bảo rằng markup cơ bản tuân theo một thứ tự logic là điều quan trọng (xem [CSS grid layout và khả năng tiếp cận](/en-US/docs/Web/CSS/Guides/Grid_layout/Accessibility) để biết thêm chi tiết).

## Xem thêm

- Thuộc tính {{Cssxref("grid-template-columns")}}
- Module [CSS grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout)
- [CSS grid: More flexibility with `minmax()`](https://css-irl.info/more-flexibility-with-minmax/) (2018)
- [Breaking out with CSS grid](https://rachelandrew.co.uk/archives/2017/06/01/breaking-out-with-css-grid-explained/) (2017)
