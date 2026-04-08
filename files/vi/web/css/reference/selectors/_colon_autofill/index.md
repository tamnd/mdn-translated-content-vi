---
title: :autofill
slug: Web/CSS/Reference/Selectors/:autofill
page-type: css-pseudo-class
browser-compat: css.selectors.autofill
sidebar: cssref
---

**`:autofill`** là [lớp giả](/vi/docs/Web/CSS/Reference/Selectors/Pseudo-classes) [CSS](/vi/docs/Web/CSS) khớp khi một phần tử {{HTMLElement("input")}} có giá trị được điền tự động bởi trình duyệt. Lớp giả sẽ ngừng khớp nếu người dùng chỉnh sửa trường đó.

{{InteractiveExample("CSS Demo: :autofill", "tabbed-shorter")}}

```css interactive-example
input {
  border: 3px solid black;
}
input:autofill {
  outline: 5px solid magenta;
  border: 3px dashed yellow;
}
```

```html interactive-example
<form>
  <p>Click on the text box and choose any option suggested by your browser.</p>
  <p>
    <label for="name">Name</label>
    <input id="name" name="name" type="text" autocomplete="given-name" />
  </p>
  <p>
    <label for="email">Email Address</label>
    <input id="email" name="email" type="email" autocomplete="email" />
  </p>
  <p>
    <label for="country">Country</label>
    <input
      id="country"
      name="country"
      type="text"
      autocomplete="country-name" />
  </p>
</form>
```

## Mô tả

Lớp giả `:autofill` chọn các phần tử {{htmlelement("input")}} chứa nội dung chưa được chỉnh sửa được điền tự động bởi user-agent. Tự động hoàn thành có thể xảy ra khi cài đặt trình duyệt được đặt để bật tính năng tự động hoàn thành hoặc khi thuộc tính [`autocomplete`](/en-US/docs/Web/HTML/Reference/Attributes/autocomplete) được đặt trên chính phần tử đó.

Khi người dùng sử dụng tính năng tự động hoàn thành của trình duyệt để điền tự động vào một điều khiển biểu mẫu, tất cả các điều khiển biểu mẫu có thể được điền tự động dựa trên lựa chọn đó đều sẽ được điền vào. Tất cả chúng sẽ khớp với trạng thái UI `:autofill`. Nếu người dùng chỉnh sửa một điều khiển, điều khiển đó sẽ không còn khớp với `:autofill`, ngay cả khi giá trị giống với giá trị đã điền tự động.

Thông số kỹ thuật bao gồm lớp giả có tiền tố nhà cung cấp `:-webkit-autofill` như một bí danh. Lớp giả này cũng khớp với các phần tử input được điền tự động bởi user agent, và không còn khớp nếu người dùng chỉnh sửa trường đã điền tự động.

Lưu ý rằng style sheet của user agent trong nhiều trình duyệt sử dụng `!important` trong các khai báo kiểu của chúng, khiến một số kiểu không thể ghi đè. Ví dụ, Chrome có nội dung sau trong style sheet nội bộ:

```css-nolint
input:-internal-autofill-selected {
  appearance: menulist-button;
  background-image: none !important;
  background-color:
    light-dark(rgb(232, 240, 254), rgba(70, 90, 126, 0.4)) !important;
  color: fieldtext !important;
}
```

Điều này có nghĩa là bạn không thể ghi đè các giá trị mặc định {{cssxref('background-color')}}, {{cssxref('background-image')}}, hoặc {{cssxref('color')}} trên các phần tử input được điền tự động đã chọn trong các quy tắc của riêng bạn, nhưng bạn có thể ghi đè {{cssxref('appearance')}}, và bạn có thể ghi đè các thuộc tính này cho các phần tử được điền tự động mà hiện không được đặt tiêu điểm.

## Cú pháp

```css
:autofill {
  /* ... */
}
```

## Ví dụ

Ví dụ sau đây minh họa việc sử dụng lớp giả `:autofill` để thay đổi viền của trường văn bản đã được trình duyệt tự động hoàn thành.

### HTML

Chúng ta bao gồm ba phần tử HTML `<input>`, mỗi phần tử có {{htmlelement("label")}} liên kết. Trường `name` và `email` có thể tự động hoàn thành và khớp với `:autofill`, trong khi giá trị `pet` thì không.

```html
<form method="post" action="">
  <p>
    <label for="name">Name: </label>
    <input name="n" id="name" autocomplete="given-name" />
  </p>
  <p>
    <label for="email">Email: </label>
    <input type="email" name="email" id="email" autocomplete="email" />
  </p>
  <p>
    <label for="pet">Your pet's name: </label>
    <input name="pet" id="pet" />
  </p>
</form>
```

### CSS

Chúng ta áp dụng {{cssxref("border-radius")}}, {{cssxref("outline")}}, và {{cssxref("border-color")}} cho các phần tử `<input>` khi chúng khớp với trạng thái `:autofill`.

```css
input {
  border-radius: 0px;
}

input:autofill {
  border-radius: 0.5lh;
  outline: 5px dashed magenta;
  border-color: yellow;
}
```

```css hidden
@supports not selector(:autofill) {
  body::before {
    content: "Your browser doesn't support the :autofill selector.";
    background-color: wheat;
    display: block;
    width: 100%;
    text-align: center;
    padding: 5px;
  }
}
```

### Kết quả

{{EmbedLiveSample('Examples')}}

Nếu bạn cho phép `name` tự động hoàn thành, cả `name` và `email` sẽ có viền bo tròn và đường viền màu tím hồng, mặc dù viền có thể sẽ không thay đổi do cờ `!important` được đặt trong style sheet của user agent. Hãy thử chỉnh sửa một trong các trường: chú ý rằng sau khi bạn chỉnh sửa giá trị, ngay cả khi bạn đặt lại về giá trị tự động hoàn thành, các kiểu `:autofill` sẽ không còn được áp dụng nữa.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Các lớp giả của `<input>`](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes#input_pseudo-classes)
- Module [bộ chọn CSS](/en-US/docs/Web/CSS/Guides/Selectors)
