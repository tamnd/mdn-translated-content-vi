---
title: Stacking context example 3
short-title: Example 3
slug: Web/CSS/Guides/Positioned_layout/Stacking_context/Example_3
page-type: guide
sidebar: cssref
---

## Mô tả

Ví dụ này cho thấy các vấn đề phát sinh khi trộn lẫn nhiều phần tử được định vị trong một phân cấp HTML nhiều cấp và khi các giá trị `z-index` được gán bằng class selector.

Ví dụ có một menu phân cấp ba cấp được tạo từ nhiều phần tử `div` được định vị. Các phần tử `div` cấp hai và cấp ba xuất hiện khi người dùng di chuột qua hoặc nhấp vào phần tử cha của chúng. Thông thường loại menu này được tạo bằng script ở phía client hoặc server, vì vậy các quy tắc style được gán bằng class selector thay vì id selector.

Nếu ba cấp menu chồng lấp nhau một phần, thì việc quản lý stacking có thể trở thành vấn đề.

Menu cấp một được định vị tương đối, tạo ra một stacking context.

Menu cấp hai được định vị tuyệt đối bên trong phần tử cha. Để đặt nó lên trên tất cả menu cấp một, thuộc tính `z-index` được sử dụng. Vấn đề là đối với mỗi menu cấp hai, một stacking context được tạo ra và mỗi menu cấp ba thuộc về context của cha nó.

Vì vậy menu cấp ba sẽ được xếp dưới các menu cấp hai tiếp theo, vì tất cả menu cấp hai đều dùng chung giá trị z-index và các quy tắc stacking mặc định được áp dụng.

Để hiểu rõ hơn tình huống, đây là phân cấp stacking context (ba chấm "..." đại diện cho nhiều lần lặp lại của dòng trước):

- Root stacking context
  - LEVEL #1
    - LEVEL #2 (`z-index`: 1)
      - LEVEL #3
      - …
      - LEVEL #3

    - LEVEL #2 (`z-index`: 1)
    - …
    - LEVEL #2 (`z-index`: 1)

  - LEVEL #1
  - …
  - LEVEL #1

Vấn đề này có thể tránh được bằng cách loại bỏ sự chồng lấp giữa các menu ở các cấp khác nhau, hoặc bằng cách sử dụng các giá trị z-index riêng lẻ (và khác nhau) được gán thông qua id selector thay vì class selector, hoặc bằng cách làm phẳng phân cấp HTML.

> [!NOTE]
> Trong mã nguồn bạn sẽ thấy rằng menu cấp hai và cấp ba được tạo từ nhiều phần tử `div` chứa trong một container được định vị tuyệt đối. Điều này hữu ích để nhóm và định vị tất cả chúng cùng một lúc.

## Ví dụ

### HTML

```html
<div class="lev1">
  LEVEL #1

  <div id="container1">
    <div class="lev2">
      LEVEL #2 <br />z-index: 1;

      <div id="container2">
        <div class="lev3">LEVEL #3</div>
        <div class="lev3">LEVEL #3</div>
        <div class="lev3">LEVEL #3</div>
        <div class="lev3">LEVEL #3</div>
        <div class="lev3">LEVEL #3</div>
        <div class="lev3">LEVEL #3</div>
        <div class="lev3">LEVEL #3</div>
        <div class="lev3">LEVEL #3</div>
        <div class="lev3">LEVEL #3</div>
        <div class="lev3">LEVEL #3</div>
        <div class="lev3">LEVEL #3</div>
      </div>
    </div>

    <div class="lev2">LEVEL #2 <br />z-index: 1;</div>
    <div class="lev2">LEVEL #2 <br />z-index: 1;</div>
    <div class="lev2">LEVEL #2 <br />z-index: 1;</div>
  </div>
</div>

<div class="lev1">LEVEL #1</div>
<div class="lev1">LEVEL #1</div>
<div class="lev1">LEVEL #1</div>
```

### CSS

```css hidden
div {
  font: 12px "Arial";
  font-weight: bold;
  padding-left: 5px;
}
.lev1 {
  border: 2px outset #669966;
  background-color: #ccffcc;
}
.lev2 {
  border: 2px outset #990000;
  background-color: #ffdddd;
}
.lev3 {
  border: 2px outset #000099;
  background-color: #ddddff;
}
```

```css
div {
  opacity: 0.9;
}
.lev1 {
  width: 250px;
  height: 70px;
  position: relative;
}

#container1 {
  z-index: 1;
  position: absolute;
  top: 30px;
  left: 75px;
}

.lev2 {
  width: 200px;
  height: 60px;
  position: relative;
}

#container2 {
  z-index: 1;
  position: absolute;
  top: 20px;
  left: 110px;
}

.lev3 {
  z-index: 10;
  width: 100px;
  position: relative;
}
```

## Kết quả

{{ EmbedLiveSample('Example', '320', '330') }}

## Xem thêm

- [Stacking without the `z-index` property](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_without_z-index): Các quy tắc stacking áp dụng khi không dùng `z-index`.
- [Stacking floating elements](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_floating_elements): Cách các phần tử float được xử lý với stacking.
- [Using z-index](/en-US/docs/Web/CSS/Guides/Positioned_layout/Using_z-index): Cách dùng `z-index` để thay đổi thứ tự stacking mặc định.
- [Stacking context](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context): Ghi chú về stacking context.
- [Stacking context example 1](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context/Example_1): Phân cấp HTML 2 cấp, `z-index` ở cấp cuối
- [Stacking context example 2](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context/Example_2): Phân cấp HTML 2 cấp, `z-index` ở tất cả các cấp
