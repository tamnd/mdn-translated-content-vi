---
title: "Document: phương thức elementFromPoint()"
short-title: elementFromPoint()
slug: Web/API/Document/elementFromPoint
page-type: web-api-instance-method
browser-compat: api.Document.elementFromPoint
---

{{APIRef("DOM")}}

Phương thức **`elementFromPoint()`**, khả dụng trên đối tượng {{domxref("Document")}}, trả về {{domxref("Element")}} nằm trên cùng tại các tọa độ được chỉ định (so với viewport).

Nếu phần tử tại điểm được chỉ định thuộc về một tài liệu khác (ví dụ: tài liệu của {{HTMLElement("iframe")}}), thì phần tử cha của tài liệu đó sẽ được trả về (chính là `<iframe>`). Nếu phần tử tại điểm đã cho là nội dung ẩn danh hoặc được tạo bởi XBL, chẳng hạn như thanh cuộn của textbox, thì phần tử tổ tiên không ẩn danh đầu tiên (ví dụ: textbox) sẽ được trả về.

Các phần tử có {{cssxref("pointer-events")}} được đặt thành `none` sẽ bị bỏ qua và phần tử bên dưới nó sẽ được trả về.

Nếu phương thức được chạy trên một tài liệu khác (như subdocument của `<iframe>`), thì các tọa độ sẽ tương đối với tài liệu nơi phương thức đang được gọi.

Nếu điểm được chỉ định nằm ngoài giới hạn hiển thị của tài liệu hoặc một trong hai tọa độ là âm, kết quả sẽ là `null`.

Nếu bạn cần tìm vị trí cụ thể bên trong phần tử, hãy sử dụng {{domxref("Document.caretPositionFromPoint()")}}.

## Cú pháp

```js-nolint
elementFromPoint(x, y)
```

### Tham số

- `x`
  - : Tọa độ ngang của một điểm, tương đối với cạnh trái của {{Glossary("viewport")}} hiện tại.
- `y`
  - : Tọa độ dọc của một điểm, tương đối với cạnh trên của viewport hiện tại.

### Giá trị trả về

Đối tượng {{domxref("Element")}} nằm trên cùng tại các tọa độ được chỉ định.

## Ví dụ

Ví dụ này tạo hai nút bấm cho phép bạn đặt màu hiện tại của phần tử đoạn văn nằm dưới tọa độ `(2, 2)`.

### HTML

```html
<p id="para1">Some text here</p>
<button>Blue</button>
<button>Red</button>
```

HTML cung cấp đoạn văn bản sẽ bị ảnh hưởng màu sắc, cùng với hai nút bấm: một nút đổi màu thành xanh dương và một nút đổi màu thành đỏ.

### JavaScript

```js
function changeColor(newColor) {
  const elem = document.elementFromPoint(2, 2);
  elem.style.color = newColor;
}

document.querySelectorAll("button").forEach((button) => {
  button.addEventListener("click", (event) => {
    changeColor(event.target.textContent.toLowerCase());
  });
});
```

Phương thức `changeColor()` lấy phần tử nằm tại tọa độ được chỉ định, sau đó đặt thuộc tính {{cssxref("color")}} foreground hiện tại của phần tử đó thành màu được chỉ định bởi tham số `newColor`.

### Kết quả

{{EmbedLiveSample('Examples', 400, 120)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document.elementsFromPoint()")}}
