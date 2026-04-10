---
title: "CSS: phương thức tĩnh registerProperty()"
short-title: registerProperty()
slug: Web/API/CSS/registerProperty_static
page-type: web-api-static-method
browser-compat: api.CSS.registerProperty_static
---

{{APIRef("CSSOM")}}

Phương thức tĩnh **`CSS.registerProperty()`** đăng ký [thuộc tính tùy chỉnh](/en-US/docs/Web/CSS/Reference/Properties/--*), cho phép kiểm tra kiểu thuộc tính, giá trị mặc định, và các thuộc tính có hoặc không kế thừa giá trị của chúng.

Việc đăng ký một thuộc tính tùy chỉnh cho phép bạn cho trình duyệt biết thuộc tính đó nên hoạt động như thế nào; những kiểu nào được chấp nhận, thuộc tính có kế thừa giá trị hay không, và giá trị mặc định của thuộc tính là gì.

## Cú pháp

```js-nolint
CSS.registerProperty(propertyDefinition)
```

### Tham số

- `propertyDefinition`
  - : Một đối tượng chứa các thuộc tính sau:
    - `name`
      - : Một chuỗi biểu diễn tên {{cssxref("dashed-ident")}} của thuộc tính đang được định nghĩa.
    - `syntax` {{optional_inline}}
      - : Một chuỗi biểu diễn cú pháp mong đợi của thuộc tính được định nghĩa. Mặc định là `"*"`. Xem {{cssxref("@property/syntax", "syntax")}}.
    - `inherits`
      - : Giá trị boolean xác định thuộc tính được định nghĩa có nên được kế thừa (`true`) hay không (`false`). Mặc định là `false`.
    - `initialValue` {{optional_inline}}
      - : Một chuỗi biểu diễn giá trị ban đầu của thuộc tính được định nghĩa.

### Giá trị trả về

`undefined`.

### Ngoại lệ

- `InvalidModificationError` {{domxref("DOMException")}}
  - : `name` đã cho đã được đăng ký từ trước.
- `SyntaxError` {{domxref("DOMException")}}
  - : `name` đã cho không phải là tên thuộc tính tùy chỉnh hợp lệ (bắt đầu bằng hai dấu gạch ngang, ví dụ `--foo`).
- {{jsxref("TypeError")}}
  - : Thành phần bắt buộc `name` và/hoặc `inherits` của dictionary không được cung cấp.

## Ví dụ

Ví dụ sau sẽ đăng ký một [thuộc tính tùy chỉnh](/en-US/docs/Web/CSS/Reference/Properties/--*), `--my-color`, bằng `registerProperty()`, định nghĩa nó là một màu, cung cấp giá trị mặc định, và không cho nó kế thừa giá trị:

```js
window.CSS.registerProperty({
  name: "--my-color",
  syntax: "<color>",
  inherits: false,
  initialValue: "#c0ffee",
});
```

Trong ví dụ này, thuộc tính tùy chỉnh `--my-color` đã được đăng ký với cú pháp `<color>`. Giờ đây chúng ta có thể dùng thuộc tính đó để tạo chuyển tiếp cho một dải màu khi hover hoặc focus. Lưu ý rằng với thuộc tính đã đăng ký, hiệu ứng chuyển tiếp hoạt động, nhưng với thuộc tính chưa đăng ký thì không.

```css
.registered {
  --my-color: #c0ffee;
  background-image: linear-gradient(to right, white, var(--my-color));
  transition: --my-color 1s ease-in-out;
}

.registered:hover,
.registered:focus {
  --my-color: #b4d455;
}

.unregistered {
  --unregistered: #c0ffee;
  background-image: linear-gradient(to right, white, var(--unregistered));
  transition: --unregistered 1s ease-in-out;
}

.unregistered:hover,
.unregistered:focus {
  --unregistered: #b4d455;
}
button {
  font-size: 3vw;
}
```

Chúng ta có thể thêm các kiểu này vào một vài nút:

```html
<button class="registered">Background Registered</button>
<button class="unregistered">Background Not Registered</button>
```

{{EmbedLiveSample("Examples", 320, 320)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng CSS properties and values API](/en-US/docs/Web/API/CSS_Properties_and_Values_API/guide)
- {{DOMxRef("CSS")}}
- {{DOMxRef("CSS/supports_static", "CSS.supports()")}}
- {{DOMxRef("CSS/escape_static", "CSS.escape()")}}
- [Các hàm factory của CSS](/en-US/docs/Web/API/CSS/factory_functions_static)
- CSS {{cssxref("@property")}}
