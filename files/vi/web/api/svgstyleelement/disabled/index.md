---
title: "SVGStyleElement: thuộc tính disabled"
short-title: disabled
slug: Web/API/SVGStyleElement/disabled
page-type: web-api-instance-property
browser-compat: api.SVGStyleElement.disabled
---

{{APIRef("SVG")}}

Thuộc tính **`SVGStyleElement.disabled`** có thể được sử dụng để lấy và đặt xem stylesheet có bị vô hiệu hóa (`true`) hay không (`false`).

Lưu ý rằng không có thuộc tính `disabled` tương ứng trên [phần tử SVG `<style>`](/en-US/docs/Web/SVG/Reference/Element/style).

## Giá trị

Trả về `true` nếu stylesheet bị vô hiệu hóa, hoặc không có stylesheet liên kết; ngược lại là `false`.
Giá trị mặc định là `false` (nếu có stylesheet liên kết).

Thuộc tính có thể được sử dụng để bật hoặc tắt một stylesheet liên kết.
Đặt thuộc tính thành `true` khi không có stylesheet liên kết sẽ không có tác dụng.

## Ví dụ

### Vô hiệu hóa một style được định nghĩa trong SVG

Ví dụ này minh họa việc đặt thuộc tính disabled theo chương trình trên một style được định nghĩa trong định nghĩa HTML SVG.

#### HTML

HTML chứa một định nghĩa SVG cho một [`<circle>`](/en-US/docs/Web/SVG/Reference/Element/circle) với một phần tử [`<style>`](/en-US/docs/Web/SVG/Reference/Element/style), cùng với một nút sẽ được sử dụng để vô hiệu hóa style.

```html
<button>Enable</button>
<svg
  xmlns="http://www.w3.org/2000/svg"
  xmlns:xlink="http://www.w3.org/1999/xlink">
  <style id="circle_style_id">
    circle {
      fill: gold;
      stroke: green;
      stroke-width: 3px;
    }
  </style>
  <circle cx="50" cy="50" r="25" />
</svg>
```

#### JavaScript

Đoạn mã bên dưới lấy phần tử `style` (một `SVGStyleElement`) bằng id của nó, sau đó đặt nó thành disabled.
Style đã tồn tại vì nó được định nghĩa trong SVG, vì vậy điều này sẽ thành công.

```js
const svg = document.querySelector("svg");
const style = svg.getElementById("circle_style_id");
style.disabled = true;
```

Sau đó chúng ta thêm một trình xử lý sự kiện cho nút để chuyển đổi trạng thái disabled và văn bản nút.

```js
const button = document.querySelector("button");

button.addEventListener("click", () => {
  style.disabled = !style.disabled;
  button.textContent = style.disabled ? "Enable" : "Disable";
});
```

#### Kết quả

Kết quả được hiển thị bên dưới.
Nhấn nút để chuyển đổi thuộc tính `disabled` trên style được sử dụng cho hình tròn.

{{EmbedLiveSample("Disabling a style defined in the SVG")}}

### Vô hiệu hóa một style được định nghĩa theo chương trình

Ví dụ này rất giống với ví dụ trên, ngoại trừ style được định nghĩa theo chương trình.

Lưu ý rằng bạn có thể có nhiều style được áp dụng cả trong nguồn SVG và theo chương trình.
Ví dụ này chủ yếu được cung cấp để minh họa cách tạo style từ bên ngoài, và hiển thị tại điểm nào style có thể bị vô hiệu hóa.

#### HTML

HTML tương tự như trường hợp trước, nhưng định nghĩa SVG không bao gồm bất kỳ style mặc định nào.

```html
<button>Enable</button>
<svg
  xmlns="http://www.w3.org/2000/svg"
  xmlns:xlink="http://www.w3.org/1999/xlink">
  <circle cx="50" cy="50" r="25" />
</svg>
```

#### JavaScript

Đầu tiên chúng ta tạo nút style SVG mới.
Điều này được thực hiện bằng cách đầu tiên tạo một phần tử style trong không gian tên SVG bằng [`Document.createElementNS()`](/en-US/docs/Web/API/Document/createElementNS), tạo và thêm một nút văn bản với định nghĩa style, sau đó thêm nút vào SVG được định nghĩa ở trên.

> [!NOTE]
> Bạn phải sử dụng [`Document.createElementNS()`](/en-US/docs/Web/API/Document/createElementNS) chứ không phải [`Document.createElement()`](/en-US/docs/Web/API/Document/createElement) để tạo style, nếu không theo mặc định bạn sẽ tạo phần tử style HTML tương đương.

```js
const svg = document.querySelector("svg");

// Tạo phần tử `style` trong không gian tên SVG
const style = document.createElementNS("http://www.w3.org/2000/svg", "style");
const node = document.createTextNode("circle { fill: red; }");
svg.appendChild(style);
style.appendChild(node);
```

Sau đó chúng ta vô hiệu hóa style.
Lưu ý rằng đây là điểm sớm nhất mà việc đặt thuộc tính thành `true` sẽ thành công.
Trước điểm này SVG không có style liên kết, vì vậy giá trị mặc định là `false`.

```js
// Vô hiệu hóa style
style.disabled = true;
```

Cuối cùng chúng ta thêm một trình xử lý sự kiện cho nút để chuyển đổi trạng thái disabled và văn bản nút (giống như ví dụ trước).

```js
const button = document.querySelector("button");

button.addEventListener("click", () => {
  style.disabled = !style.disabled;
  button.textContent = style.disabled ? "Enable" : "Disable";
});
```

#### Kết quả

Kết quả được hiển thị bên dưới.
Nhấn nút để chuyển đổi trạng thái `disabled` trên style được sử dụng cho hình tròn.

{{EmbedLiveSample("Disabling a programmatically defined style")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLStyleElement.disabled")}}
