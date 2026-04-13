---
title: "HTMLOptionElement: thuộc tính disabled"
short-title: disabled
slug: Web/API/HTMLOptionElement/disabled
page-type: web-api-instance-property
browser-compat: api.HTMLOptionElement.disabled
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`disabled`** của {{domxref("HTMLOptionElement")}} là một giá trị boolean cho biết liệu phần tử {{htmlelement("option")}} có bị vô hiệu hóa hay không. Thuộc tính này phản ánh giá trị của thuộc tính HTML [`disabled`](/en-US/docs/Web/HTML/Reference/Elements/option#disabled).

Thuộc tính phản ánh giá trị của thuộc tính `disabled` trên chính phần tử `<option>`. Nếu một tùy chọn bị vô hiệu hóa vì nó là con của phần tử {{HTMLElement("optgroup")}} bị vô hiệu hóa, giá trị `true` của thuộc tính {{domxref("HTMLOptGroupElement.disabled")}} không được kế thừa bởi bản thân tùy chọn đó.

## Giá trị

Một giá trị boolean.

## Ví dụ

### HTML

```html
<label for="drink-options">Lựa chọn đồ uống:</label>
<select id="drink-options">
  <option value="water">Nước</option>
  <option value="lemonade">Nước chanh</option>
  <option value="beer">Bia</option>
  <option value="whisky" disabled>Whisky</option>
</select>
```

### JavaScript

```js
const drinks = document.querySelectorAll("#drink-options option");
console.log(drinks[0].disabled); // false
console.log(drinks[3].disabled); // true
drinks[1].disabled = true; // vô hiệu hóa tùy chọn bia
```

### Kết quả

{{EmbedLiveSample('Examples')}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("option")}}
- {{HTMLElement("select")}}
- {{HTMLElement("optgroup")}}
- {{DOMxRef("HTMLSelectElement.disabled")}}
- {{DOMxRef("HTMLOptGroupElement.disabled")}}
- {{DOMxRef("HTMLOptionElement.selected")}}
- {{DOMxRef("HTMLOptionElement.index")}}
- {{DOMxRef("HTMLOptionsCollection")}}
- {{cssxref(":disabled")}}
