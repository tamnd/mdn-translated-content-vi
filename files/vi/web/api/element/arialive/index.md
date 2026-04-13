---
title: "Element: thuộc tính ariaLive"
short-title: ariaLive
slug: Web/API/Element/ariaLive
page-type: web-api-instance-property
browser-compat: api.Element.ariaLive
---

{{APIRef("DOM")}}

Thuộc tính **`ariaLive`** của giao diện {{domxref("Element")}} phản chiếu giá trị của thuộc tính [`aria-live`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-live), cho biết một phần tử sẽ được cập nhật và mô tả các loại cập nhật mà user agent, công nghệ hỗ trợ và người dùng có thể mong đợi từ [vùng trực tiếp](/en-US/docs/Web/Accessibility/ARIA/Guides/Live_regions).

## Giá trị

Một chuỗi với một trong các giá trị sau:

- `"assertive"`
  - : Cho biết các cập nhật cho vùng có mức ưu tiên cao nhất và nên được trình bày cho người dùng ngay lập tức.
- `"off"`
  - : Cho biết các cập nhật cho vùng không nên được trình bày cho người dùng trừ khi người dùng hiện đang tập trung vào vùng đó.
- `"polite"`
  - : Cho biết các cập nhật cho vùng nên được trình bày tại cơ hội thuận lợi tiếp theo, chẳng hạn như ở cuối câu đang nói hoặc khi người dùng tạm dừng nhập.

## Ví dụ

Trong ví dụ này, thuộc tính [`aria-live`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-live) trên phần tử có ID `planetInfo` được đặt thành `"polite"`. Sau đó chúng ta cập nhật giá trị thành `"assertive"`.

```html
<div role="region" id="planetInfo" aria-live="polite">
  <h2 id="planetTitle">No planet selected</h2>
  <p id="planetDescription">Select a planet to view its description</p>
</div>
```

```js
let el = document.getElementById("planetInfo");
console.log(el.ariaLive); // "polite"
el.ariaLive = "assertive";
console.log(el.ariaLive); // "assertive"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
