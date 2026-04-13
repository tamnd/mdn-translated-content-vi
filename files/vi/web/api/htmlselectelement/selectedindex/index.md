---
title: "HTMLSelectElement: thuộc tính selectedIndex"
short-title: selectedIndex
slug: Web/API/HTMLSelectElement/selectedIndex
page-type: web-api-instance-property
browser-compat: api.HTMLSelectElement.selectedIndex
---

{{APIRef("HTML DOM")}}

Thuộc tính **`selectedIndex`** của giao diện {{DOMxRef("HTMLSelectElement")}} là chỉ số số học của phần tử {{HTMLElement("option")}} đầu tiên được chọn trong phần tử {{HTMLElement("select")}}, nếu có, hoặc `−1` nếu không có `<option>` nào được chọn. Đặt thuộc tính này sẽ chọn option ở chỉ số đó và bỏ chọn tất cả các option khác, còn đặt thành `-1` sẽ bỏ chọn mọi option đang được chọn.

## Giá trị

Một số.

## Ví dụ

### HTML

```html
<p id="p">selectedIndex: 0</p>

<select id="select">
  <option selected>Option A</option>
  <option>Option B</option>
  <option>Option C</option>
  <option>Option D</option>
  <option>Option E</option>
</select>
```

### JavaScript

```js
const selectElem = document.getElementById("select");
const pElem = document.getElementById("p");

// When a new <option> is selected
selectElem.addEventListener("change", () => {
  const index = selectElem.selectedIndex;
  // Add that data to the <p>
  pElem.textContent = `selectedIndex: ${index}`;
});
```

{{EmbedLiveSample("Examples", "200px", "120px")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("HTMLSelectElement")}}
- {{DOMxRef("HTMLOptionElement")}}
- {{DOMxRef("HTMLOptionsCollection")}}
