---
title: "HTMLFormControlsCollection: phương thức namedItem()"
short-title: namedItem()
slug: Web/API/HTMLFormControlsCollection/namedItem
page-type: web-api-instance-method
browser-compat: api.HTMLFormControlsCollection.namedItem
---

{{APIRef("HTML DOM")}}

Phương thức **`HTMLFormControlsCollection.namedItem()`** trả về {{domxref("RadioNodeList")}} hoặc {{domxref("Element")}} trong bộ sưu tập có `name` hoặc `id` khớp với tên được chỉ định, hoặc `null` nếu không có nút nào khớp.

Lưu ý rằng phiên bản `namedItem()` này ẩn phiên bản kế thừa từ {{domxref("HTMLCollection")}}. Giống như phiên bản đó, trong JavaScript, sử dụng cú pháp dấu ngoặc mảng với {{jsxref("String")}}, ví dụ `collection["value"]` tương đương với `collection.namedItem("value")`.

## Cú pháp

```js-nolint
namedItem(name)
[name]
```

### Tham số

- `name`
  - : Chuỗi sẽ được sử dụng để khớp với các thuộc tính `name` hoặc `id` của các điều khiển trong đối tượng `HTMLFormControlsCollection` này.

### Giá trị trả về

- {{domxref("RadioNodeList")}} nếu có nhiều phần tử với `name` hoặc `id` đã cho,
- {{domxref("Element")}} nếu có đúng một phần tử với `name` hoặc `id` đã cho, hoặc
- [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) nếu không có phần tử nào có `name` hoặc `id` đã cho.

> [!NOTE]
> {{domxref("RadioNodeList")}} trả về là live, nghĩa là nội dung của nó tự động cập nhật nếu các phần tử khớp với tên được cho được thêm vào hoặc xóa khỏi bộ sưu tập. Hơn nữa, nó có thể chứa các phần tử input không phải radio mặc dù tên của bộ sưu tập.

## Ví dụ

### Sử dụng namedItem()

#### HTML

```html
<form>
  <label for="yes">Yes</label>
  <input id="yes" name="my-radio" type="radio" />
  <label for="no">No</label>
  <input id="no" name="my-radio" type="radio" />
  <label for="maybe">Maybe</label>
  <input id="maybe" name="my-radio" type="radio" />
  <br />
  <label for="text1">Text input 1</label>
  <input id="text1" name="my-form-control" type="text" />
</form>

<div id="output"></div>
```

```css hidden
div {
  margin: 1rem 0;
}
```

#### JavaScript

```js
const form = document.querySelector("form");
const items = form.elements.namedItem("my-radio");

const output = document.querySelector("#output");
const itemIDs = Array.from(items)
  .map((item) => `"${item.id}"`)
  .join(", ");

const item2 = form.elements.namedItem("my-form-control");
output.textContent = `My items: ${itemIDs}
My single item: "${item2.id}"`;
```

#### Kết quả

{{EmbedLiveSample("Using namedItem()")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLCollection.namedItem")}} mà nó thay thế
