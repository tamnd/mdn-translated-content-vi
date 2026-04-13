---
title: "HTMLStyleElement: thuộc tính disabled"
short-title: disabled
slug: Web/API/HTMLStyleElement/disabled
page-type: web-api-instance-property
browser-compat: api.HTMLStyleElement.disabled
---

{{APIRef("HTML DOM")}}

Thuộc tính **`HTMLStyleElement.disabled`** có thể được sử dụng để lấy và đặt xem stylesheet có bị tắt (`true`) hay không (`false`).

Lưu ý rằng không có thuộc tính `disabled` tương ứng trên [phần tử HTML `<style>`](/en-US/docs/Web/HTML/Reference/Elements/style).

## Giá trị

Trả về `true` nếu stylesheet bị tắt, hoặc không có stylesheet liên quan; ngược lại là `false`.
Giá trị mặc định là `false` (nếu có stylesheet liên quan).

Thuộc tính có thể được sử dụng để bật hoặc tắt một stylesheet liên quan.
Đặt thuộc tính thành `true` khi không có stylesheet liên quan sẽ không có hiệu lực.

## Ví dụ

### Tắt kiểu nội tuyến

Ví dụ này trình bày cách đặt thuộc tính disabled theo chương trình trên một kiểu được định nghĩa trong HTML bằng cách sử dụng [phần tử HTML `<style>`](/en-US/docs/Web/HTML/Reference/Elements/style).
Lưu ý rằng bạn cũng có thể truy cập tất cả các stylesheet trong tài liệu bằng cách sử dụng [`Document.styleSheets`](/en-US/docs/Web/API/Document/styleSheets).

#### HTML

HTML chứa một phần tử HTML [`<style>`](/en-US/docs/Web/HTML/Reference/Elements/style) làm cho các phần tử đoạn văn có màu xanh, một phần tử đoạn văn và một nút sẽ được dùng để bật và tắt kiểu.

```html
<button>Enable</button>
<style id="InlineStyle">
  p {
    color: blue;
  }
</style>
<p>Text is black when style is disabled; blue when enabled.</p>
<p></p>
```

#### JavaScript

Đoạn code bên dưới lấy phần tử `style` bằng id của nó, sau đó đặt nó là disabled.
Vì kiểu đã tồn tại, do được định nghĩa trong SVG, điều này sẽ thành công.

```js
const style = document.getElementById("InlineStyle");
style.disabled = true;
```

Sau đó chúng ta thêm trình xử lý sự kiện cho nút để bật/tắt giá trị `disabled` và văn bản nút.

```js
const button = document.querySelector("button");

button.addEventListener("click", () => {
  style.disabled = !style.disabled;
  const buttonText = style.disabled ? "Enable" : "Disable";
  button.innerText = buttonText;
});
```

#### Kết quả

Kết quả được hiển thị bên dưới.
Nhấn nút để chuyển đổi giá trị thuộc tính `disabled` trên kiểu được sử dụng cho văn bản đoạn văn.

{{EmbedLiveSample("Disabling a style defined in the SVG")}}

### Tắt kiểu được định nghĩa theo chương trình

Ví dụ này rất giống ví dụ trên, ngoại trừ kiểu được định nghĩa theo chương trình.

#### HTML

HTML tương tự trường hợp trước, nhưng không bao gồm kiểu dáng mặc định.

```html
<button>Enable</button>
<p>Text is black when style is disabled; blue when enabled.</p>
<p></p>
```

#### JavaScript

Đầu tiên chúng ta tạo phần tử style mới trên HTML.
Điều này được thực hiện bằng cách tạo một phần tử style bằng [`Document.createElement()`](/en-US/docs/Web/API/Document/createElement), tạo và thêm một text node với định nghĩa kiểu, sau đó thêm phần tử style vào body của tài liệu.

```js
// Tạo phần tử `style`
const style = document.createElement("style");
const node = document.createTextNode("p { color: blue; }");
style.appendChild(node);
document.body.appendChild(style);
```

Sau đó chúng ta có thể tắt kiểu như hiển thị bên dưới.
Lưu ý rằng đây là thời điểm sớm nhất mà việc đặt thuộc tính thành `true` sẽ thành công.
Trước thời điểm này, tài liệu không có kiểu liên quan, vì vậy giá trị mặc định là `false`.

```js
// Tắt kiểu
style.disabled = true;
```

Cuối cùng chúng ta thêm trình xử lý sự kiện cho nút để bật/tắt trạng thái disabled và văn bản nút (giống ví dụ trước).

```js
const button = document.querySelector("button");

button.addEventListener("click", () => {
  style.disabled = !style.disabled;
  const buttonText = style.disabled ? "Enable" : "Disable";
  button.innerText = buttonText;
});
```

#### Kết quả

Kết quả được hiển thị bên dưới.
Nhấn nút để chuyển đổi trạng thái `disabled` trên kiểu được sử dụng cho văn bản.

{{EmbedLiveSample("Disabling a programmatically defined style")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGStyleElement.disabled")}}
