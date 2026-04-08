---
title: Stacking without the z-index property
short-title: Stacking without z-index
slug: Web/CSS/Guides/Positioned_layout/Stacking_without_z-index
page-type: guide
sidebar: cssref
---

Khi thuộc tính {{cssxref("z-index")}} không được chỉ định trên bất kỳ phần tử nào, các phần tử được xếp chồng theo thứ tự sau (từ dưới lên trên):

1. Background và border của phần tử gốc.
2. Các phần tử con không được định vị, theo thứ tự xuất hiện trong HTML.
3. Các phần tử con được định vị, theo thứ tự xuất hiện trong HTML.

Xem [types of positioning](/en-US/docs/Web/CSS/Reference/Properties/position#types_of_positioning) để hiểu giải thích về các phần tử được định vị và không được định vị.

Cần lưu ý rằng khi thuộc tính {{cssxref("order")}} thay đổi thứ tự hiển thị so với _thứ tự xuất hiện trong HTML_ trong các container {{cssxref("flex")}}, nó cũng ảnh hưởng tương tự đến thứ tự cho stacking context.

## Ví dụ

Trong ví dụ này, DIV #1 đến DIV #4 là các phần tử được định vị. DIV #5 là static, do đó được vẽ bên dưới bốn phần tử kia, mặc dù nó xuất hiện sau trong markup HTML.

### HTML

```html
<div id="abs1" class="absolute">
  <strong>DIV #1</strong><br />position: absolute;
</div>
<div id="rel1" class="relative">
  <strong>DIV #2</strong><br />position: relative;
</div>
<div id="rel2" class="relative">
  <strong>DIV #3</strong><br />position: relative;
</div>
<div id="abs2" class="absolute">
  <strong>DIV #4</strong><br />position: absolute;
</div>
<div id="sta1" class="static">
  <strong>DIV #5</strong><br />position: static;
</div>
```

### CSS

```css
strong {
  font-family: sans-serif;
}

div {
  padding: 10px;
  border: 1px dashed;
  text-align: center;
}

.static {
  position: static;
  height: 80px;
  background-color: #ffffcc;
  border-color: #999966;
}

.absolute {
  position: absolute;
  width: 150px;
  height: 350px;
  background-color: #ffdddd;
  border-color: #990000;
  opacity: 0.7;
}

.relative {
  position: relative;
  height: 80px;
  background-color: #ccffcc;
  border-color: #669966;
  opacity: 0.7;
}

#abs1 {
  top: 10px;
  left: 10px;
}

#rel1 {
  top: 30px;
  margin: 0px 50px;
}

#rel2 {
  top: 15px;
  left: 20px;
  margin: 0px 50px;
}

#abs2 {
  top: 10px;
  right: 10px;
}

#sta1 {
  background-color: #ffffcc;
  margin: 0px 50px;
}
```

## Kết quả

{{EmbedLiveSample("Example", 600, 400)}}

## Xem thêm

- [Understanding z-index](/en-US/docs/Web/CSS/Guides/Positioned_layout/Understanding_z-index)
- [Using z-index](/en-US/docs/Web/CSS/Guides/Positioned_layout/Using_z-index)
- [Stacking context](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context)
- [Stacking floating elements](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_floating_elements)
- Module [CSS positioned layout](/en-US/docs/Web/CSS/Guides/Positioned_layout)
