---
title: Using z-index
slug: Web/CSS/Guides/Positioned_layout/Using_z-index
page-type: guide
sidebar: cssref
---

Bài viết đầu tiên trong hướng dẫn này, [Xếp chồng không dùng thuộc tính `z-index`](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_without_z-index), giải thích cách xếp chồng được sắp xếp theo mặc định. Nếu bạn muốn tạo thứ tự xếp chồng tùy chỉnh, bạn có thể dùng thuộc tính {{cssxref("z-index")}} trên một phần tử [được định vị](/en-US/docs/Web/CSS/Reference/Properties/position#types_of_positioning).

Thuộc tính `z-index` có thể được chỉ định bằng một giá trị số nguyên (dương, âm, hoặc không), đại diện cho vị trí của phần tử dọc theo một trục z ảo. Nếu bạn chưa quen với thuật ngữ "trục z", hãy tưởng tượng trang là một chồng các lớp, mỗi lớp có một số. Các lớp được hiển thị theo thứ tự số, với số lớn hơn ở trên số nhỏ hơn (_X_ đại diện cho một số nguyên dương bất kỳ):

| Lớp           | Mô tả                              |
| ------------- | ---------------------------------- |
| Lớp dưới cùng | Xa nhất so với người xem           |
| Lớp -X        | Các lớp có giá trị `z-index` âm    |
| Lớp 0         | Lớp hiển thị mặc định              |
| Lớp X         | Các lớp có giá trị `z-index` dương |
| Lớp trên cùng | Gần nhất so với người xem          |

> [!NOTE]
>
> - Khi không có thuộc tính `z-index` nào được chỉ định, các phần tử được hiển thị trên lớp mặc định (Lớp 0).
> - Nếu nhiều phần tử có cùng giá trị `z-index` (tức là chúng được đặt trên cùng một lớp), các quy tắc xếp chồng được giải thích trong phần [Xếp chồng không dùng thuộc tính `z-index`](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_without_z-index) sẽ được áp dụng.

## Ví dụ

Trong ví dụ này, thứ tự xếp chồng của các lớp được sắp xếp lại bằng `z-index`. `z-index` của DIV #5 không có tác dụng vì nó không phải là phần tử được định vị.

### HTML

```html
<div id="abs1">
  <strong>DIV #1</strong>
  <br />position: absolute; <br />z-index: 5;
</div>

<div id="rel1">
  <strong>DIV #2</strong>
  <br />position: relative; <br />z-index: 3;
</div>

<div id="rel2">
  <strong>DIV #3</strong>
  <br />position: relative; <br />z-index: 2;
</div>

<div id="abs2">
  <strong>DIV #4</strong>
  <br />position: absolute; <br />z-index: 1;
</div>

<div id="sta1">
  <strong>DIV #5</strong>
  <br />no positioning <br />z-index: 8;
</div>
```

### CSS

```css
div {
  padding: 10px;
  opacity: 0.7;
  text-align: center;
}

strong {
  font-family: sans-serif;
}

#abs1 {
  z-index: 5;
  position: absolute;
  width: 150px;
  height: 350px;
  top: 10px;
  left: 10px;
  border: 1px dashed #990000;
  background-color: #ffdddd;
}

#rel1 {
  z-index: 3;
  height: 100px;
  position: relative;
  top: 30px;
  border: 1px dashed #669966;
  background-color: #ccffcc;
  margin: 0px 50px;
}

#rel2 {
  z-index: 2;
  height: 100px;
  position: relative;
  top: 15px;
  left: 20px;
  border: 1px dashed #669966;
  background-color: #ccffcc;
  margin: 0px 50px;
}

#abs2 {
  z-index: 1;
  position: absolute;
  width: 150px;
  height: 350px;
  top: 10px;
  right: 10px;
  border: 1px dashed #990000;
  background-color: #ffdddd;
}

#sta1 {
  z-index: 8;
  height: 70px;
  border: 1px dashed #999966;
  background-color: #ffffcc;
  margin: 0px 50px;
}
```

## Kết quả

{{EmbedLiveSample("Example", 600, 400)}}

## Xem thêm

- [Tìm hiểu về z-index](/en-US/docs/Web/CSS/Guides/Positioned_layout/Understanding_z-index)
- [Stacking context](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context)
- [Xếp chồng phần tử float](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_floating_elements)
- [Xếp chồng không dùng `z-index`](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_without_z-index)
- [CSS positioned layout](/en-US/docs/Web/CSS/Guides/Positioned_layout) module
