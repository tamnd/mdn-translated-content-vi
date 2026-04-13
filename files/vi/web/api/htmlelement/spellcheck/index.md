---
title: "HTMLElement: thuộc tính spellcheck"
short-title: spellcheck
slug: Web/API/HTMLElement/spellcheck
page-type: web-api-instance-property
browser-compat: api.HTMLElement.spellcheck
---

{{APIRef("HTML DOM")}}

Thuộc tính **`spellcheck`** của giao diện {{domxref("HTMLElement")}} biểu thị một giá trị boolean kiểm soát gợi ý [kiểm tra chính tả](/en-US/docs/Web/HTML/Reference/Global_attributes/spellcheck). Nó có sẵn trên tất cả các phần tử HTML, mặc dù không ảnh hưởng đến tất cả.

Nó phản ánh giá trị của thuộc tính HTML toàn cục [`spellcheck`](/en-US/docs/Web/HTML/Reference/Global_attributes/spellcheck).

## Giá trị

Một giá trị boolean là `true` nếu chính tả và ngữ pháp của nội dung văn bản trong phần tử có thể được kiểm tra, `false` trong trường hợp còn lại.

## Ví dụ

Ví dụ sau đây cho thấy cách kiểm soát gợi ý [kiểm tra chính tả](/en-US/docs/Web/HTML/Reference/Global_attributes/spellcheck) qua tập lệnh:

```html
<div>
  <span id="sc-label">The spelling and grammar may be checked: </span>
  <span id="sc-element" contenteditable="true" spellcheck="true">test</span>
</div>
<input id="sc-controller" type="checkbox" checked />Enable spelling and grammar
check
```

```js
const label = document.getElementById("sc-label");
const element = document.getElementById("sc-element");
const controller = document.getElementById("sc-controller");

controller.addEventListener("change", (e) => {
  if (controller.checked) {
    element.spellcheck = true;
    label.innerText = "The spelling and grammar may be checked: ";
  } else {
    element.spellcheck = false;
    label.innerText = "The spelling and grammar may not be checked: ";
  }
});
```

{{EmbedLiveSample('Examples', 600, 200)}}

Lưu ý rằng bạn phải bật cài đặt trình duyệt để kiểm tra chính tả và ngữ pháp.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính HTML toàn cục [`spellcheck`](/en-US/docs/Web/HTML/Reference/Global_attributes/spellcheck)
