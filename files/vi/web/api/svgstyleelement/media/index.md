---
title: "SVGStyleElement: thuộc tính media"
short-title: media
slug: Web/API/SVGStyleElement/media
page-type: web-api-instance-property
browser-compat: api.SVGStyleElement.media
---

{{APIRef("SVG")}}

Thuộc tính **`SVGStyleElement.media`** là một chuỗi truy vấn media tương ứng với thuộc tính [`media`](/en-US/docs/Web/SVG/Reference/Element/style#media) của phần tử SVG style đã cho.

Truy vấn phải khớp để style được áp dụng.

## Giá trị

Một chuỗi định nghĩa danh sách truy vấn media hợp lệ với một hoặc nhiều giá trị được phân cách bằng dấu phẩy.
Ví dụ `"screen, print"`, hoặc `"all"` (mặc định).

Giá trị được khởi tạo với chuỗi được chỉ định trong thuộc tính [`media`](/en-US/docs/Web/SVG/Reference/Element/style#media) của style tương ứng.

## Ví dụ

Ví dụ này minh họa việc lấy và đặt thuộc tính media theo chương trình trên một style được định nghĩa trong định nghĩa SVG.

### HTML

HTML chứa một định nghĩa SVG cho một [`<circle>`](/en-US/docs/Web/SVG/Reference/Element/circle) với một phần tử [`<style>`](/en-US/docs/Web/SVG/Reference/Element/style) có điều kiện theo truy vấn media `"(width >= 600px)"`.
Chúng ta cũng định nghĩa một `button` sẽ được sử dụng để hiển thị style hiện tại và thay đổi style.

```html
<button>Media unknown</button>
<svg
  xmlns="http://www.w3.org/2000/svg"
  xmlns:xlink="http://www.w3.org/1999/xlink">
  <circle cx="60" cy="60" r="50" />
</svg>
```

### JavaScript

Đoạn mã bên dưới lấy phần tử `style` (một `SVGStyleElement`) bằng id của nó.

```js
const svg = document.querySelector("svg");
// Tạo phần tử `style` trong không gian tên SVG
const style = document.createElementNS("http://www.w3.org/2000/svg", "style");
const node = document.createTextNode("circle { fill: red; }");
svg.appendChild(style);
style.appendChild(node);
```

Sau đó chúng ta thêm một hàm để đặt văn bản nút hiển thị giá trị hiện tại của thuộc tính `media` của style cùng với chiều rộng cửa sổ hiện tại.
Hàm này được gọi để đặt văn bản nút ban đầu, và cũng khi cửa sổ thay đổi kích thước hoặc nút được nhấn.
Trình xử lý sự kiện nút cũng đặt giá trị của thuộc tính `media` của style.

```js
const button = document.querySelector("button");

function setButtonText() {
  button.textContent = `Media: ${style.media} (Width: ${window.innerWidth})`;
}
setButtonText();

addEventListener("resize", () => {
  setButtonText();
});

button.addEventListener("click", () => {
  style.media = "(width >= 700px)";
  setButtonText();
});
```

### Kết quả

Kết quả được hiển thị bên dưới.
Văn bản nút hiển thị giá trị của thuộc tính media ban đầu được áp dụng cho style SVG cùng với chiều rộng của khung hiện tại (vì mã được chạy trong một khung).
Thu nhỏ chiều rộng của khung về chiều rộng truy vấn media hiển thị trong nút để xem style được áp dụng.
Nhấn nút để chuyển đổi giá trị của thuộc tính `media` trên style (điều này sẽ được phản ánh trên nút).

{{EmbedLiveSample("Examples")}}

> [!NOTE]
> Thuộc tính `media` có thể được đặt thành bất kỳ chuỗi nào, nhưng sẽ bị bỏ qua nếu chuỗi không phải là truy vấn media hợp lệ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLStyleElement.media")}}
