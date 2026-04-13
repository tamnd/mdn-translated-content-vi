---
title: "ElementInternals: ariaBrailleLabel property"
short-title: ariaBrailleLabel
slug: Web/API/ElementInternals/ariaBrailleLabel
page-type: web-api-instance-property
browser-compat: api.ElementInternals.ariaBrailleLabel
---

{{APIRef("Web Components")}}

Thuộc tính **`ariaBrailleLabel`** của giao diện {{domxref("ElementInternals")}} phản ánh giá trị của thuộc tính [`aria-braillelabel`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-braillelabel), xác định nhãn ARIA chữ nổi của phần tử.

Nhãn phần tử này có thể được sử dụng bởi các công nghệ hỗ trợ có thể trình bày nội dung bằng chữ nổi, nhưng chỉ nên được đặt nếu nhãn dành riêng cho chữ nổi sẽ cải thiện trải nghiệm người dùng.
Thuộc tính [`aria-braillelabel`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-braillelabel) chứa thông tin bổ sung về thời điểm nên đặt thuộc tính này.

## Giá trị

Một chuỗi được dùng để chuyển đổi thành chữ nổi.

## Ví dụ

Ví dụ này cho thấy cách lấy và đặt thuộc tính `ariaBrailleLabel`.

Giả sử chúng ta đã định nghĩa một phần tử tùy chỉnh gọi là `<star-rating>`, trong đó nhãn chữ nổi nội bộ của phần tử được đặt làm giá trị của thuộc tính `aria-braillelabel` của phần tử:

```js
class StarRating extends HTMLElement {
  constructor() {
    super();
    this._internals = this.attachInternals();
    this._internals.ariaRole = "slider";
    this._internals.ariaBrailleLabel = this.ariaBrailleLabel;
  }

  // …
}

customElements.define("star-rating", StarRating);
```

Và chúng ta thêm phần tử tùy chỉnh với văn bản nhãn "3 out of 5 stars" và thuộc tính `aria-braillelabel` có giá trị là `"3"`.
Điều này cho phép màn hình chữ nổi hiển thị "slider 3" trong chữ nổi thay vì cụm từ dài hơn "slider gra 3 out of 5 stars".

```html
<star-rating id="rate" aria-braillelabel="3">3 out of 5 stars</star-rating>
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

```js hidden
const logInternals = document.querySelector("#log");
function log(text) {
  logInternals.innerText = `${logInternals.innerText}${text}\n`;
  logInternals.scrollTop = logInternals.scrollHeight;
}
```

Mã sử dụng thuộc tính `ariaBrailleLabel` để lấy và đặt nhãn chữ nổi.

```js
const el = document.querySelector("star-rating");
log(el._internals.ariaBrailleLabel);
el._internals.ariaBrailleLabel += "*";
log(el._internals.ariaBrailleLabel);
```

{{EmbedLiveSample("Examples")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("ElementInternals.ariaBrailleRoleDescription")}}
