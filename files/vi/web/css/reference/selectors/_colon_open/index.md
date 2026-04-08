---
title: :open
slug: Web/CSS/Reference/Selectors/:open
page-type: css-pseudo-class
browser-compat: css.selectors.open
sidebar: cssref
---

**`:open`** là [lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) [CSS](/en-US/docs/Web/CSS) đại diện cho một phần tử có trạng thái mở và đóng, chỉ khi nó đang ở trạng thái mở.

## Cú pháp

```css
:open {
  /* ... */
}
```

## Mô tả

Lớp giả `:open` chọn bất kỳ phần tử nào hiện đang ở trạng thái mở, bao gồm các phần tử sau:

- Các phần tử {{htmlelement("details")}} và {{htmlelement("dialog")}} đang ở trạng thái mở, tức là chúng có thuộc tính `open` được đặt. Lựa chọn này cũng có thể thực hiện bằng bộ chọn thuộc tính: `details[open]`.
- Các phần tử {{htmlelement("input")}} hiển thị giao diện chọn giá trị cho người dùng (ví dụ [`<input type="color">`](/en-US/docs/Web/HTML/Reference/Elements/input/color)), khi bộ chọn đang được hiển thị.
- Các phần tử {{htmlelement("select")}} hiển thị bộ chọn thả xuống cho người dùng, khi bộ chọn đang được hiển thị. Lưu ý rằng khi triển khai [phần tử select có thể tùy chỉnh](/en-US/docs/Learn_web_development/Extensions/Forms/Customizable_select), bản thân bộ chọn có thể được chọn bằng phần tử giả {{cssxref("::picker()", "::picker(select)")}}.

Lưu ý rằng trạng thái mở và đóng là các trạng thái ngữ nghĩa, và không nhất thiết tương quan với khả năng hiển thị của phần tử. Ví dụ, một phần tử `<details>` được mở rộng để hiển thị nội dung là ở trạng thái mở, và sẽ được chọn bởi bộ chọn `details:open`, ngay cả khi nó bị ẩn với giá trị {{cssxref("visibility")}} là `hidden`.

Các phần tử {{domxref("Popover API", "Popover", "", "nocode")}} (tức là các phần tử có thuộc tính [`popover`](/en-US/docs/Web/HTML/Reference/Global_attributes/popover) được đặt trên chúng) có các trạng thái ngữ nghĩa riêng biệt đại diện cho các popover đang hiển thị hoặc bị ẩn, có thể tồn tại song song với trạng thái mở và đóng. Để nhắm mục tiêu một phần tử popover ở trạng thái đang hiển thị, hãy sử dụng lớp giả {{cssxref(":popover-open")}} thay thế.

## Ví dụ

### Sử dụng `:open` cơ bản

Ví dụ này minh họa một số phần tử HTML có trạng thái mở.

#### CSS

```css
details:open > summary {
  background-color: pink;
}

:is(select, input):open {
  background-color: pink;
}
```

```css hidden
@supports not selector(:open) {
  body::before {
    content: "Your browser doesn't support :open selector.";
    background-color: wheat;
    display: block;
    width: 100%;
    text-align: center;
  }

  body > * {
    display: none;
  }
}
```

#### HTML

```html
<details>
  <summary>Details</summary>
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. In pulvinar dapibus
  lacus, sit amet finibus lectus mollis eu. Nullam quis orci dictum, porta lacus
  et, cursus nunc. Aenean pulvinar imperdiet neque fermentum facilisis. Nulla
  facilisi. Curabitur vitae sapien ut nunc pulvinar semper vitae vitae nisi.
</details>
<hr />

<label for="pet-select">Choose a pet:</label>
<select id="pet-select">
  <option value="dog">Dog</option>
  <option value="cat">Cat</option>
  <option value="hamster">Hamster</option>
</select>
<hr />

<label for="start">Start date:</label>
<input type="date" id="start" />
```

#### Kết quả

{{EmbedLiveSample("Basic `:open` usage", 300, 200)}}

### Tùy chỉnh kiểu `<select>` với `:open`

Trong ví dụ này, chúng ta thêm một số kiểu tùy chỉnh cho phần tử {{htmlelement("select")}} cơ bản. Lớp giả `:open` được dùng để áp dụng cải tiến kiểu dáng cho trạng thái mở của nó — khi menu thả xuống đang được hiển thị.

#### HTML

Bộ chọn trái cây của chúng ta không có gì đặc biệt.

```html
<label>
  Choose your favorite fruit:
  <select name="fruit">
    <option>apple</option>
    <option>banana</option>
    <option>boysenberry</option>
    <option>cranberry</option>
    <option>fig</option>
    <option>grapefruit</option>
    <option>lemon</option>
    <option>orange</option>
    <option>papaya</option>
    <option>pomegranate</option>
    <option>tomato</option>
  </select>
</label>
```

> [!NOTE]
> We are not using a multi-line `<select>` (that is, one with the [`multiple`](/en-US/docs/Web/HTML/Reference/Attributes/multiple) attribute set) — those tend to render as a scrolling list box rather than a drop down menu, so don't have an open state.

#### CSS

Trong CSS, chúng ta đặt giá trị {{cssxref("appearance")}} là `none` trên phần tử `<select>` để loại bỏ kiểu dáng hệ điều hành mặc định khỏi hộp chọn, và cung cấp một số kiểu cơ bản của riêng mình. Đáng chú ý nhất, chúng ta đặt hình nền {{glossary("SVG")}} của mũi tên xuống ở phía bên phải — người dùng thường nhận ra các phần tử `<select>` qua mũi tên xuống, vì vậy đây là ý hay khi bao gồm nó.

Sau đó chúng ta đặt một số {{cssxref("padding")}} trên phần tử {{htmlelement("label")}} bao quanh, và một đường viền trong suốt để giữ bố cục nhất quán khi chúng ta thêm đường viền có màu vào đó sau này.

```css
select {
  appearance: none;
  width: 100%;
  display: block;
  font-family: inherit;
  font-size: 100%;
  padding: 5px;
  border: 1px solid black;
  background: url("data:image/svg+xml,%3Csvg width='20' height='20' viewBox='0 0 20 20' xmlns='http://www.w3.org/2000/svg'%3E%3Cpolygon points='5,5 15,5 10,15'/%3E%3C/svg%3E")
    no-repeat right 3px center / 1em 1em;
}

label {
  font-family: sans-serif;
  max-width: 20em;
  display: block;
  padding: 20px;
  border: 2px solid transparent;
}
```

Khi `<select>` được mở, chúng ta sử dụng lớp giả `:open` để đặt màu nền khác và thay đổi hình nền thành mũi tên lên. Chúng ta cũng đặt màu nền và đường viền khác trên phần tử `<label>` bao quanh bằng cách kết hợp các lớp giả `:open` và {{cssxref(":has()")}} để tạo bộ chọn cha. Về cơ bản chúng ta nói "chọn `<label>`, nhưng chỉ khi `<select>` con của nó đang mở."

```css
select:open {
  background-color: #f8f2dc;
  background-image: url("data:image/svg+xml,%3Csvg width='20' height='20' viewBox='0 0 20 20' xmlns='http://www.w3.org/2000/svg'%3E%3Cpolygon points='5,15 10,5 15,15'/%3E%3C/svg%3E");
}

label:has(select:open) {
  background-color: #81adc8;
  border-color: #cd4631;
}
```

#### Kết quả

Kết quả như sau. Hãy thử mở menu thả xuống `<select>` để xem hiệu ứng lên kiểu dáng:

{{ EmbedLiveSample("Custom `<select>` styling with `:open`", "100%", "100") }}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các phần tử {{htmlelement("details")}}, {{htmlelement("dialog")}}, {{htmlelement("select")}} và {{htmlelement("input")}}
- Lớp giả {{cssxref(":popover-open")}}
- {{Cssxref(":modal")}}
