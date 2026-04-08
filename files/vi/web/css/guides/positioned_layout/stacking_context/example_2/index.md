---
title: Stacking context example 2
short-title: Example 2
slug: Web/CSS/Guides/Positioned_layout/Stacking_context/Example_2
page-type: guide
sidebar: cssref
---

## Mô tả

Đây là ví dụ cơ bản, nhưng là chìa khóa để hiểu khái niệm _stacking context_. Có bốn DIV giống như ví dụ trước, nhưng bây giờ thuộc tính `z-index` được gán ở cả hai cấp của phân cấp.

Bạn có thể thấy rằng DIV #2 (`z-index`: 2) nằm trên DIV #3 (`z-index`: 1), vì cả hai đều thuộc cùng stacking context (context gốc), do đó các giá trị z-index quyết định cách các phần tử được xếp chồng.

Điều có thể được xem là lạ là DIV #2 (`z-index`: 2) nằm trên DIV #4 (`z-index`: 10), mặc dù các giá trị z-index của chúng. Lý do là chúng không thuộc cùng stacking context. DIV #4 thuộc stacking context được tạo bởi DIV #3, và như đã giải thích trước đó DIV #3 (và tất cả nội dung của nó) nằm dưới DIV #2.

Để hiểu rõ hơn tình huống, đây là phân cấp stacking context:

- Root stacking context
  - DIV #2 (`z-index`: 2)
  - DIV #3 (`z-index`: 1)
    - DIV #4 (`z-index`: 10)

> [!NOTE]
> Cần nhớ rằng phân cấp HTML khác với phân cấp stacking context. Trong phân cấp stacking context, các phần tử không tạo stacking context được gộp vào cha của chúng.

## Ví dụ

### HTML

```html
<div id="div1">
  <br />
  <span class="bold">DIV #1</span><br />
  position: relative;
  <div id="div2">
    <br />
    <span class="bold">DIV #2</span><br />
    position: absolute;<br />
    z-index: 2;
  </div>
</div>

<br />

<div id="div3">
  <br />
  <span class="bold">DIV #3</span><br />
  position: relative;<br />
  z-index: 1;
  <div id="div4">
    <br />
    <span class="bold">DIV #4</span><br />
    position: absolute;<br />
    z-index: 10;
  </div>
</div>
```

### CSS

```css
div {
  font: 12px "Arial";
}

span.bold {
  font-weight: bold;
}

#div2 {
  z-index: 2;
}
#div3 {
  z-index: 1;
}
#div4 {
  z-index: 10;
}

#div1,
#div3 {
  height: 80px;
  position: relative;
  border: 1px dashed #669966;
  background-color: #ccffcc;
  padding-left: 5px;
}

#div2 {
  opacity: 0.8;
  position: absolute;
  width: 150px;
  height: 200px;
  top: 20px;
  left: 170px;
  border: 1px dashed #990000;
  background-color: #ffdddd;
  text-align: center;
}

#div4 {
  opacity: 0.8;
  position: absolute;
  width: 200px;
  height: 70px;
  top: 65px;
  left: 50px;
  border: 1px dashed #000099;
  background-color: #ddddff;
  text-align: left;
  padding-left: 10px;
}
```

## Kết quả

{{ EmbedLiveSample('Example', '352', '270') }}

## Xem thêm

- [Ví dụ: phân cấp HTML 1 cấp, `z-index` ở cấp cuối](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context/Example_1)
- [Ví dụ: phân cấp HTML 3 cấp, `z-index` ở cấp thứ hai](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context/Example_3)
- [Stacking context](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context)
- Module [CSS positioned layout](/en-US/docs/Web/CSS/Guides/Positioned_layout)
