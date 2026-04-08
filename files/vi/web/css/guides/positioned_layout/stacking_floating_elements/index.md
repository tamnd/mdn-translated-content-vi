---
title: Stacking floating elements
slug: Web/CSS/Guides/Positioned_layout/Stacking_floating_elements
page-type: guide
sidebar: cssref
---

Đối với các phần tử float, thứ tự stacking có phần khác. Các phần tử float được đặt giữa các phần tử không được định vị và các phần tử được định vị:

1. Background và border của phần tử gốc.
2. Các phần tử con không được định vị, theo thứ tự xuất hiện trong HTML.
3. _Các phần tử float_.
4. Các phần tử con được định vị, theo thứ tự xuất hiện trong HTML.

Xem [types of positioning](/en-US/docs/Web/CSS/Reference/Properties/position#types_of_positioning) để hiểu giải thích về các phần tử được định vị và không được định vị.

> [!NOTE]
> Nếu giá trị `opacity` được áp dụng cho một phần tử không được định vị (tức là DIV #4 trong ví dụ dưới đây), điều kỳ lạ sẽ xảy ra: background và border của khối đó xuất hiện trên các khối float và các khối được định vị. Điều này là do một phần đặc thù của đặc tả: áp dụng giá trị `opacity` tạo ra một stacking context mới (xem [What No One Told You About Z-Index](https://philipwalton.com/articles/what-no-one-told-you-about-z-index/)).

## Ví dụ

Bạn có thể thấy trong ví dụ này rằng background và border của phần tử không được định vị (DIV #4) hoàn toàn không bị ảnh hưởng bởi các phần tử float, nhưng nội dung thì bị ảnh hưởng. Điều này xảy ra theo hành vi float tiêu chuẩn có thể được hiển thị với một quy tắc thêm vào danh sách trên:

1. Background và border của phần tử gốc.
2. Các phần tử con không được định vị, theo thứ tự xuất hiện trong HTML.
3. Các phần tử float.
4. _Các phần tử inline không được định vị là con_.
5. Các phần tử con được định vị, theo thứ tự xuất hiện trong HTML.

### HTML

```html
<div id="abs1"><strong>DIV #1</strong><br />position: absolute;</div>

<div id="flo1"><strong>DIV #2</strong><br />float: left;</div>

<div id="flo2"><strong>DIV #3</strong><br />float: right;</div>

<br />

<div id="sta1"><strong>DIV #4</strong><br />no positioning</div>

<div id="abs2"><strong>DIV #5</strong><br />position: absolute;</div>

<div id="rel1"><strong>DIV #6</strong><br />position: relative;</div>
```

### CSS

```css
div {
  padding: 10px;
  text-align: center;
}

strong {
  font-family: sans-serif;
}

#abs1 {
  position: absolute;
  width: 150px;
  height: 200px;
  top: 10px;
  right: 140px;
  border: 1px dashed #990000;
  background-color: #ffdddd;
}

#sta1 {
  height: 100px;
  border: 1px dashed #999966;
  background-color: #ffffcc;
  margin: 0px 10px;
  text-align: left;
}

#flo1 {
  margin: 0px 10px 0px 20px;
  float: left;
  width: 150px;
  height: 200px;
  border: 1px dashed #009900;
  background-color: #ccffcc;
}

#flo2 {
  margin: 0px 20px 0px 10px;
  float: right;
  width: 150px;
  height: 200px;
  border: 1px dashed #009900;
  background-color: #ccffcc;
}

#abs2 {
  position: absolute;
  width: 150px;
  height: 100px;
  top: 80px;
  left: 100px;
  border: 1px dashed #999900;
  background-color: #ffdddd;
}

#rel1 {
  position: relative;
  border: 1px dashed #999966;
  background-color: #ccffff;
  margin: 0px 10px;
  text-align: left;
}
```

## Kết quả

{{EmbedLiveSample("Example", 600, 250)}}

## Xem thêm

- [Understanding z-index](/en-US/docs/Web/CSS/Guides/Positioned_layout/Understanding_z-index)
- [Stacking without the `z-index` property](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_without_z-index)
- [Using z-index](/en-US/docs/Web/CSS/Guides/Positioned_layout/Using_z-index)
- [Stacking context](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context)
- Module [CSS positioned layout](/en-US/docs/Web/CSS/Guides/Positioned_layout)
