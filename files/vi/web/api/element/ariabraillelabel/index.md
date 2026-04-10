---
title: "Element: thuộc tính ariaBrailleLabel"
short-title: ariaBrailleLabel
slug: Web/API/Element/ariaBrailleLabel
page-type: web-api-instance-property
browser-compat: api.Element.ariaBrailleLabel
---

{{APIRef("DOM")}}

Thuộc tính **`ariaBrailleLabel`** của giao diện {{domxref("Element")}} phản chiếu giá trị của thuộc tính [`aria-braillelabel`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-braillelabel), định nghĩa nhãn braille ARIA của phần tử.

Nhãn phần tử này có thể được sử dụng bởi các công nghệ hỗ trợ có thể trình bày nội dung dưới dạng chữ braille, nhưng chỉ nên thiết lập nếu nhãn dành riêng cho chữ braille sẽ cải thiện trải nghiệm người dùng. Thuộc tính [`aria-braillelabel`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-braillelabel) chứa thêm thông tin về thời điểm nên thiết lập property này.

## Giá trị

- `<string>`
  - : Giá trị là một chuỗi, một kiểu giá trị không ràng buộc, được dự định chuyển đổi thành chữ braille.

## Ví dụ

### Lấy và thiết lập ariaBrailleLabel

Ví dụ này cho thấy cách lấy và thiết lập property `ariaBrailleLabel`.

#### HTML

Đầu tiên chúng ta định nghĩa một nút bấm với văn bản nhãn "3 out of 5 stars" và thuộc tính `aria-braillelabel` với giá trị `"\*\*\*"`. Điều này cho phép màn hình braille hiển thị "btn \*\*\*" dưới dạng chữ braille thay vì "btn gra 3 out of 5 stars" dài dòng hơn.

```html
<button id="button" aria-braillelabel="\*\*\*">3 out of 5 stars</button>
```

```html hidden
<pre id="log"></pre>
```

```css hidden
#log {
  height: 100px;
  overflow: scroll;
  padding: 0.5rem;
  border: 1px solid black;
}
```

#### JavaScript

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

Đoạn mã sau đó sử dụng property `ariaBrailleLabel` của nút bấm để trước tiên lấy và ghi lại nhãn braille. Sau đó thiết lập nhãn braille thành "3\*" và ghi lại giá trị một lần nữa.

```js
const button = document.getElementById("button");
log(button.ariaBrailleLabel);
button.ariaBrailleLabel = "3*";
log(button.ariaBrailleLabel);
```

#### Kết quả

{{EmbedLiveSample("Getting and setting ariaBrailleLabel")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
