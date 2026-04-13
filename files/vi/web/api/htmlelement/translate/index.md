---
title: "HTMLElement: thuộc tính translate"
short-title: translate
slug: Web/API/HTMLElement/translate
page-type: web-api-instance-property
browser-compat: api.HTMLElement.translate
---

{{APIRef("HTML DOM")}}

Thuộc tính **`translate`** của giao diện {{domxref("HTMLElement")}} cho biết liệu các giá trị thuộc tính và giá trị của các nút {{domxref("Text")}} con của phần tử có được dịch khi trang được bản địa hóa hay không, hay nên giữ nguyên.

Nó phản ánh giá trị của thuộc tính HTML toàn cục [`translate`](/en-US/docs/Web/HTML/Reference/Global_attributes/translate).

## Giá trị

Một giá trị boolean là `true` nếu các giá trị thuộc tính và giá trị của các nút {{domxref("Text")}} con của phần tử sẽ được dịch khi trang được bản địa hóa, `false` trong trường hợp còn lại.

## Ví dụ

Ví dụ sau đây cho thấy cách bật hoặc tắt dịch thuật qua tập lệnh:

```html
<div>
  <span>The content may always be translated: </span>
  <span translate="yes">El contenido será traducido</span>
</div>
<div>
  <span id="translate-label">The content may be translated:</span>
  <span id="translate-element" translate="no">
    El contenido puede ser traducido.
  </span>
</div>
<input id="translate-controller" type="checkbox" /> Enable translation
```

```js
const label = document.getElementById("translate-label");
const element = document.getElementById("translate-element");
const controller = document.getElementById("translate-controller");

controller.addEventListener("change", (e) => {
  if (controller.checked) {
    element.translate = true;
    label.innerText = "The content may be translated:";
  } else {
    element.translate = false;
    label.innerText = "The content may not be translated:";
  }
});
```

{{EmbedLiveSample('Examples', 600, 200)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính HTML toàn cục [`translate`](/en-US/docs/Web/HTML/Reference/Global_attributes/translate)
