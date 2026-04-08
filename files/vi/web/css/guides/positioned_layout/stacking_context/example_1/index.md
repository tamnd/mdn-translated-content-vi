---
title: Stacking context example 1
short-title: Example 1
slug: Web/CSS/Guides/Positioned_layout/Stacking_context/Example_1
page-type: guide
sidebar: cssref
---

## Mô tả

Hãy bắt đầu với một ví dụ cơ bản. Trong stacking context gốc, có hai phần tử `<div>` được định vị tương đối (DIV #1 và DIV #3) không có thuộc tính `z-index`. Bên trong DIV #1 có một DIV #2 được định vị tuyệt đối, trong khi trong DIV #3 có một DIV #4 được định vị tuyệt đối, cả hai đều không có thuộc tính `z-index`.

Stacking context duy nhất là context gốc. Không có giá trị `z-index`, các phần tử được xếp chồng theo thứ tự xuất hiện.

![Stacking context example 1](understanding_zindex_05a.png)

Nếu DIV #2 được gán giá trị z-index dương (khác không và khác auto), nó sẽ được hiển thị trên tất cả các DIV khác.

![Stacking context example 1](understanding_zindex_05b.png)

Sau đó nếu DIV #4 cũng được gán giá trị z-index dương lớn hơn z-index của DIV #2, nó sẽ được hiển thị trên tất cả các DIV khác kể cả DIV #2.

![Stacking context example 1](understanding_zindex_05c.png)

Trong ví dụ cuối này bạn có thể thấy rằng DIV #2 và DIV #4 không phải là anh em, vì chúng thuộc về các cha khác nhau trong phân cấp phần tử HTML. Dù vậy, việc xếp chồng của DIV #4 so với DIV #2 có thể được kiểm soát thông qua `z-index`. Điều xảy ra là, vì DIV #1 và DIV #3 không được gán bất kỳ giá trị `z-index` nào, hoặc bất kỳ [tính năng nào tạo stacking context](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context#features_creating_stacking_contexts), chúng không tạo ra stacking context. Điều này có nghĩa là tất cả nội dung của chúng, bao gồm DIV #2 và DIV #4, đều thuộc về cùng stacking context gốc.

Về mặt stacking context, DIV #1 và DIV #3 được đồng hóa vào phần tử gốc, và phân cấp kết quả như sau:

- Root stacking context
  - DIV #2 (`z-index`: 1)
  - DIV #4 (`z-index`: 2)

> [!NOTE]
> DIV #1 và DIV #3 không trong suốt. Điều quan trọng cần nhớ là việc gán giá trị opacity nhỏ hơn `1` cho một phần tử sẽ ngầm tạo một stacking context, cũng như việc thêm giá trị `z-index` vào một phần tử được định vị. Ví dụ này cũng cho thấy điều gì xảy ra khi một phần tử cha không tạo stacking context.

## Ví dụ

### HTML

```html
<div id="div1">
  <br /><span class="bold">DIV #1</span> <br />position: relative;
  <div id="div2">
    <br /><span class="bold">DIV #2</span> <br />position: absolute;
    <br />z-index: 1;
  </div>
</div>

<br />

<div id="div3">
  <br /><span class="bold">DIV #3</span> <br />position: relative;
  <div id="div4">
    <br /><span class="bold">DIV #4</span> <br />position: absolute;
    <br />z-index: 2;
  </div>
</div>
```

### CSS

```css
.bold {
  font-family: "Arial";
  font-size: 12px;
  font-weight: bold;
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
  z-index: 1;
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
  z-index: 2;
  position: absolute;
  width: 200px;
  height: 80px;
  top: 65px;
  left: 50px;
  border: 1px dashed #000099;
  background-color: #ddddff;
  text-align: left;
  padding-left: 10px;
}
```

## Kết quả

{{ EmbedLiveSample('Example', '', '300') }}

## Xem thêm

- [Ví dụ: phân cấp HTML 2 cấp, `z-index` ở tất cả các cấp](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context/Example_2)
- [Ví dụ: phân cấp HTML 3 cấp, `z-index` ở cấp thứ hai](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context/Example_3)
- [Stacking context](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context)
- Module [CSS positioned layout](/en-US/docs/Web/CSS/Guides/Positioned_layout)
